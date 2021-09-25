;----------------------------------------------------------------------
; Controller Driver for the Nintendo Entertainment System (NES)
;----------------------------------------------------------------------

;----------------------------------------------------------------------
; MMIO registers
;----------------------------------------------------------------------
_joy1_mmio=$4016
_joy2_mmio=$4017

;----------------------------------------------------------------------
; Read MMIO register
;----------------------------------------------------------------------
.macro _read_mmio_reg mmio_reg, pad
    LDX #$08
:   
    LDA mmio_reg
    LSR A
    ROL pad
    DEX
    BNE :-
.endmacro

.segment "ZEROPAGE"
_pad1:      .res 1
_pad2:      .res 1

.segment "CODE"
.export _pad_trigger
.export _pad_state

;----------------------------------------------------------------------
; Pad Trigger:
; This is the function that polls the controller.
; It is called from the main loop.
; * A: 0=joy1, 1=joy2
; * bit:       7     6     5     4     3     2     1     0
; * button:    A     B   select start  up   down  left right
;----------------------------------------------------------------------
.proc _pad_trigger
    PHA
    LDA #$01
    STA _joy1_mmio
    LDA #$00
    STA _joy1_mmio
    
    PLA
    CMP #$00
    BEQ @pad1
    JMP @pad2
@pad1:   
    _read_mmio_reg _joy1_mmio, _pad1
    JMP @done
@pad2:   
    _read_mmio_reg _joy2_mmio, _pad2
@done:
    RTS
.endproc

;----------------------------------------------------------------------
; Pad State:
; This is the function that returns the current state of the pad.
; * A: 0=joy1, 1=joy2
;----------------------------------------------------------------------
.proc _pad_state
    CMP #$00
    BEQ :+
    JMP :++
:   
    LDA _pad1
    JMP @done
:   
    LDA _pad2
@done:
    RTS
.endproc