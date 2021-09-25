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
  LDA #$00
  JSR _pad_state
  AND #_RIGHT_BUTTON_MASK
  BEQ :+
  JMP move_right_func
:
ReadLeft:  
  LDA #$00
  JSR _pad_state
  AND #_LEFT_BUTTON_MASK
  BEQ :+
  JMP move_left_func
:
ReadUp:  
  LDA #$00
  JSR _pad_state
  AND #_UP_BUTTON_MASK
  BEQ :+
  JMP move_up_func
:
ReadDown:  
  LDA #$00
  JSR _pad_state
  AND #_DOWN_BUTTON_MASK
  BEQ :+
  JMP move_down_func
:
  RTS
.endproc
