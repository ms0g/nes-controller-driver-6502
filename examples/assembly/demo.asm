_A_BUTTON_MASK      = %10000000
_B_BUTTON_MASK      = %01000000
_SELECT_BUTTON_MASK = %00100000
_START_BUTTON_MASK  = %00010000
_UP_BUTTON_MASK     = %00001000
_DOWN_BUTTON_MASK   = %00000100
_LEFT_BUTTON_MASK   = %00000010
_RIGHT_BUTTON_MASK  = %00000001

.segment "CODE"
.import _pad_trigger
.imoprt _pad_state

.proc main
gameloop:
  LDA #$00
  JSR _pad_trigger
  JSR readController
  JMP gameloop
.endproc

.proc readController
  AND #_RIGHT_BUTTON_MASK
  BEQ :+
  JMP move_right_func
:
ReadLeft:  
  AND #_LEFT_BUTTON_MASK
  BEQ :+
  JMP move_left_func
:
ReadUp:  
  AND #_UP_BUTTON_MASK
  BEQ :+
  JMP move_up_func
:
ReadDown: 
  AND #_DOWN_BUTTON_MASK
  BEQ :+
  JMP move_down_func
:
  RTS
.endproc
