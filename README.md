# 计算机设计与实践

实验指导网站：https://hitsz-cslab.gitee.io/organ/



由于种种原因，单周期的一个工程和流水线的两个工程在一些地方存在差异，具体差异如下：

|            工程版本            | 是否有 debug 信号<br>（用于 trace 比对） | IROM 和 DRAM <br>是否在 cpu 模块外部 | 是否有拨码开关<br>和 led 灯的外设 | 是否有七段数码管外设 |                功能                |
| :----------------------------: | :--------------------------------------: | :----------------------------------: | :-------------------------------: | :------------------: | :--------------------------------: |
|  single_cycle<br>top-testCPU   |                    Y                     |                  Y                   |                 N                 |          N           |             trace 比对             |
| single_cycle<br/>board-miniCPU |                    N                     |                  N                   |                 Y                 |          Y           |             上板跑外设             |
|            pipeline            |                Y (注释中)                |                  Y                   |                 Y                 |          N           | 上板跑外设<br>trace 比对（注释中） |
|         pipelineboard          |                    N                     |                  Y                   |                 N                 |          Y           |          上板跑老师的测试          |



# assembly

汇编代码和十六进制机器码

- pipe1：测试流水线的各种冒险，用于仿真看波形
- test：测试 R 型指令和 B 型指令，用于仿真
- wen：流动彩灯，用于上板接外设

 

# single_cycle



## trace比对用

- top
  - testCPU
    - PC
    - SEXT
    - RF
    - ALU
    - NPC
    - Control
  - imem
  - dmem
- top_sim



## 上板用

由于历史原因，IROM 和 DRAM 在 cpu 下。

- board
  - miniCPU
    - PC
    - SEXT
    - RF
    - ALU
    - NPC
    - Control
    - IROM
    - DRAM
  - display
  - miniCPU_sim



# pipeline

未注释内容：用于上板测试外设（拨码开关和 led 灯）

注释内容（top 的 debug 信号、rst 反相、dmem、imem）：用于过虚拟机上的 trace

- top
  - miniCPU
    - hzDetect
    - Adder1
    - Adder2
    - PC
    - NPC
    - SEXT
    - RF
    - Control
    - auxControl
    - ALU
    - MUX1
    - MUX2
    - pr_IF_ID
    - pr_ID_EX
    - pr_EX_MEM
    - pr_MEM_WB
  - IROM
  - DRAM



# pipelineboard

用于过老师给的上板验证程序，测试最高主频（实测 100M HZ）

- top
  - miniCPU
    - hzDetect
    - Adder1
    - Adder2
    - PC
    - NPC
    - SEXT
    - RF
    - Control
    - auxControl
    - ALU
    - MUX1
    - MUX2
    - pr_IF_ID
    - pr_ID_EX
    - pr_EX_MEM
    - pr_MEM_WB
  - IROM
  - DRAM
  - divider
  - display