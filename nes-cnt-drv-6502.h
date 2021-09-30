// poll controller, input is pad number (0 or 1)
unsigned char __fastcall__ pad_trigger(unsigned char pad);

// get previous pad state, input is pad number (0 or 1)
unsigned char __fastcall__ pad_state(unsigned char pad);

#define A_BUTTON_MASK			0x80
#define B_BUTTON_MASK			0x40
#define SELECT_BUTTON_MASK		0x20
#define START_BUTTON_MASK		0x10
#define UP_BUTTON_MASK			0x08
#define DOWN_BUTTON_MASK		0x04
#define LEFT_BUTTON_MASK		0x02
#define RIGHT_BUTTON_MASK		0x01

#define PAD1 0
#define PAD2 1

