_joy1=$4016
_joy2=$4017

_A_BUTTON_MASK      = %10000000
_B_BUTTON_MASK      = %01000000
_SELECT_BUTTON_MASK = %00100000
_START_BUTTON_MASK  = %00010000
_UP_BUTTON_MASK     = %00001000
_DOWN_BUTTON_MASK   = %00000100
_LEFT_BUTTON_MASK   = %00000010
_RIGHT_BUTTON_MASK  = %00000001

.macro __polling_joy joy_reg, pad
    LDX #$08
:  
    LDA joy_reg
    LSR A
    ROL pad
    DEX
    BNE :-
.endmacro

.macro __read val, mask
    LDA val
    AND mask
.endmacro

.segment "ZEROPAGE"
_controls:        .res 2 ; xxxxxxxxyyyyyyyy x:joy1, y:joy2 one bit per button

.segment "CODE"
; =======================================
; Exposed API
; =======================================
.export init_cont_drv
.export read_joy1_right
.export read_joy1_left
.export read_joy1_up
.export read_joy1_down
.export read_joy1_A
.export read_joy1_B
.export read_joy1_select
.export read_joy1_start
.export read_joy2_right
.export read_joy2_left
.export read_joy2_up
.export read_joy2_down
.export read_joy2_A
.export read_joy2_B
.export read_joy2_select
.export read_joy2_start

.proc init_cont_drv
    LDA #$01
    STA _joy1
    LDA #$00
    STA _joy1
    
    __polling_joy _joy1,_controls+0
    __polling_joy _joy2,_controls+1
    RTS
.endproc
; =======================================
; Exposed API Functions
; =======================================
.proc read_joy1_right
    __read _controls+0, #_RIGHT_BUTTON_MASK
    RTS
.endproc

.proc read_joy1_left
    __read _controls+0, #_LEFT_BUTTON_MASK
    RTS
.endproc

.proc read_joy1_up
    __read _controls+0, #_UP_BUTTON_MASK
    RTS
.endproc

.proc read_joy1_down
    __read _controls+0, #_DOWN_BUTTON_MASK
    RTS
.endproc

.proc read_joy1_A
    __read _controls+0, #_A_BUTTON_MASK
    RTS
.endproc

.proc read_joy1_B
    __read _controls+0, #_B_BUTTON_MASK
    RTS
.endproc

.proc read_joy1_select
    __read _controls+0, #_SELECT_BUTTON_MASK
    RTS
.endproc

.proc read_joy1_start
    __read _controls+0, #_START_BUTTON_MASK
    RTS
.endproc

.proc read_joy2_right
    __read _controls+1, #_RIGHT_BUTTON_MASK
    RTS
.endproc

.proc read_joy2_left
    __read _controls+1, #_LEFT_BUTTON_MASK
    RTS
.endproc

.proc read_joy2_up
    __read _controls+1, #_UP_BUTTON_MASK
    RTS
.endproc

.proc read_joy2_down
    __read _controls+1, #_DOWN_BUTTON_MASK
    RTS
.endproc

.proc read_joy2_A
    __read _controls+1, #_A_BUTTON_MASK
    RTS
.endproc

.proc read_joy2_B
    __read _controls+1, #_B_BUTTON_MASK
    RTS
.endproc

.proc read_joy2_select
    __read _controls+1, #_SELECT_BUTTON_MASK
    RTS
.endproc

.proc read_joy2_start
    __read _controls+1, #_START_BUTTON_MASK
    RTS
.endproc