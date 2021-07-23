	#【使用说明】激活SW21启动模式1，激活SW22启动模式2，激活SW23启动模式3。模式3中使用SW[5:0]指定亮灯位数
	
	#已用寄存器：s0,s1（SW21,模式1）,s2（SW22,模式2）,s3（SW23,模式3）,s4(temp),s5(temp2),s6(cnt1)，s8(last state),s11（输出）
	lui   s0,0xFFFFF
	li s11,0
Check:
	sw s11,0x60(s0)   #输出
	add s4,zero,s11
	srli s4,s4,16
	sw s4,0x62(s0)
	
	li s6,0           #等待半秒
Wait:                     #等待半秒
	addi s6,s6,1      #等待半秒
	li   s4,1000000#模拟10，上板1000000      等待半秒
	bne  s6,s4,Wait   #等待半秒
	
	lw   s4,0x72(s0)  #获取SW的高8位
	#li s4,0x80
	andi s3,s4,0x80   #将SW[23:21]分别写入s3/s2/s1
	andi s2,s4,0x40
	andi s1,s4,0x20
	bne  s1,zero,Mod1 #根据SW的值，进行模式跳转
	bne  s2,zero,Mod2
	bne  s3,zero,Mod3
	li   s11,0        #未选择任何模式，则输出0，并重新检查输入
	li   s8,0
	j    Check         
	
Mod1:	#模式1
	#已用寄存器：s7（灯亮状态）,s9（低位部分）,s10（高位部分）
	li  s4,1
	beq s8,s4,Norst1
	li  s8,1
	#模式已改变，进行复位
	li s7,0
	li s9,0
	li s10,0
Norst1: #模式未改变，无需复位
	#由灯亮状态标记确定灯亮状态
	li s4,12
	bge s7,s4,Dark1
Light1:
	#更新灯状态,使亮的灯更多
	add  s11,s9,s10
	slli s9,s9,1
	addi  s9,s9,1
	li s4,0x800000
	srli s10,s10,1
	add s10,s10,s4
	j Update1
Dark1:	
	#更新灯状态,使亮的灯更少
	add s11,s9,s10
	srli s9,s9,1
	li s4,0x800000
	sub s10,s10,s4
	slli s10,s10,1
Update1:
	addi s7,s7,1      #更新灯亮状态标记s7
	li s4,25
	bne  s7,s4,Check
	li s7,1
	li s9,1
	li s10,0x800000
	j Check           #继续判断
Mod2:   #模式2
	#已用寄存器：s7（灯亮状态）
	li s4,2
	beq s8,s4,Norst2
	li s8,2
	#模式已改变，进行复位
	li s7,1
	li s11,0x800000
Norst2:#模式未改变，无需复位
	li s4,24
	bge s7,s4,Dark2
Light2:#更新灯状态,使亮的灯更多
	srli s11,s11,1
	li s4,0x800000
	add s11,s11,s4
	j Update2
Dark2:#更新灯状态,使亮的灯更少
	srli s11,s11,1
Update2:
	addi s7,s7,1      #更新灯亮状态标记s7
	li s4,48
	bne  s7,s4,Check
	li s7,1
	li s11,0x800000
	j Check           #继续判断
Mod3:   #模式3
	#已用寄存器：t0（亮灯数）,s9（上周期亮灯数）
	li s4,3
	bne s8,s4,Rst3
	lw   t0,0x70(s0)#取SW的低6位，作为输入 
	bne t0,s9,Rst3
	j Norst3
Rst3:#模式/亮灯数已改变，进行复位
	lw   t0,0x70(s0)#取SW的低6位，作为输入 
	add s9,t0,zero
	li s11,0
	li s5,0
	li s8,3
LoadNum:#根据读取的拨码开关输入，设置初始亮灯参数
	beq t0,zero,Norst3
	slli s11,s11,1
	addi s11,s11,1
	addi s5,s5,1
	bne s5,t0,LoadNum
Norst3:#模式未改变，无需复位
	andi s4,s11,1
	slli s4,s4,23
	srli s11,s11,1
	add s11,s11,s4
	j Check           #继续判断
