;----------------------------------------------------------------------
; Controller Driver for the Nintendo Entertainment System (NES)       ;
;----------------------------------------------------------------------

;----------------------------------------------------------------------
; MMIO Address Map                                                    ;
;----------------------------------------------------------------------
_joy1_mmio=$4016
_joy2_mmio=$4017

;----------------------------------------------------------------------
; Read MMIO address                                                   ;
;----------------------------------------------------------------------
.macro _read_mmio_addr addr, pad
    LDX #$08
:   
    LDA addr
    LSR A
    ROL pad
    DEX
    BNE :-
.endmacro

.segment "ZEROPAGE"
_pad:   .res 2

.segment "CODE"
.export _pad_trigger
.export _pad_state

;----------------------------------------------------------------------
; unsigned char __fastcall__ pad_trigger(unsigned char pad);          ;
; This is the function that polls the controller.                     ;
; It is called from the main loop.                                    ;
; * A: 0=joy1, 1=joy2                                                 ;
; * bit:       7     6     5     4     3     2     1     0            ;
; * button:    A     B   select start  up   down  left right          ;
;----------------------------------------------------------------------
.proc _pad_trigger
    TAY
    LDA #$01
    STA _joy1_mmio
    LDA #$00
    STA _joy1_mmio
    
    TYA
    CMP #$00
    BEQ @pad1
    JMP @pad2
@pad1:   
    _read_mmio_addr _joy1_mmio, _pad+0
    JMP @done
@pad2:   
    _read_mmio_addr _joy2_mmio, _pad+1
@done:
    LDA _pad,Y
    RTS
.endproc

;----------------------------------------------------------------------
; unsigned char __fastcall__ pad_state(unsigned char pad);            ;
; This is the function that returns the previous state of the pad.    ;
; * A: 0=joy1, 1=joy2                                                 ;
;----------------------------------------------------------------------
.proc _pad_state
    TAX
    LDA _pad,X
    RTS
.endproc