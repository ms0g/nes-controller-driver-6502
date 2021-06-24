.segment "CODE"
.import init_cont_drv
.import read_joy1_right
.import read_joy1_up
.import read_joy1_down
.import read_joy1_left
.import read_joy1_A

.proc main
gameloop:
  JSR init_cont_drv
  JSR readController
  JMP gameloop
.endproc

.proc readController
  JSR read_joy1_right
  BEQ :+
  JMP move_right
:
ReadLeft:  
  JSR read_joy1_left
  BEQ :+
  JMP move_left
:
ReadUp:  
  JSR read_joy1_up
  BEQ :+
  JMP move_up
:
ReadDown:  
  JSR read_joy1_down
  BEQ :+
  JMP move_down
:
  RTS
.endproc
