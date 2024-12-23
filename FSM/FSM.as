// FSM (Finite State Machine) template
// 8 inputs bits and 8 output bits

IoPin@ clk = component.getPin("Clk");
IoPort@ inputPort = component.getPort("Inputs");
IoPort@ outputPort = component.getPort("Outputs");

array<uint8> input = {0, 0, 0, 0, 0, 0, 0, 0};
array<uint8> output = {0, 0, 0, 0, 0, 0, 0, 0};

uint8 state;

void get_inputs()
{
	uint8 port = inputPort.getInpState();
	for(uint8 n=0; n<8; n++)
		input[n] = (port & (0x01<<n))>>n;
}

void set_outputs()
{
	uint8 port = 0x00;
	for(uint8 n=0; n<8; n++)
		port |= (output[n] & 0x01)<<n;
	outputPort.setOutState(port);
}

void setup() // Executed at setScript()
{
    print("FSM setup()"); 
}

//==================================================//
//                FSM CONFIGURATION                 //
//==================================================//

enum state_names
{
	DONE,
	INIT,
	COMP,
	SHIFT,
	ADD,
	WAIT_1,
	WAIT_2,
}

enum input_names
{
    LSB_A,
    Z,
	Start,
}

enum output_names
{
    Init_regs,
    SH_AB,
    LD_C,
	End,
}

void reset() // Executed at Simulation start
{ 
    print("FSM reset()"); 
    
    clk.setPinMode( 1 );		// Input
    inputPort.setPinMode( 1 );	// Inputs
    outputPort.setPinMode( 3 );	// Outputs

    outputPort.setOutState(0);	// all outputs in 0

	clk.changeCallBack( element, true );		// clock callback function enabled	
	
	state = DONE;		//====== INITIAL STATE ======//		
	print("Initial state = " + state);
}

void voltChanged()	// clock signal change
{	
	if( clk.getInpState() )	// if rising edge
	{	
		print("state = " + state);
		get_inputs();
		switch( state )		// select state
		{
			case DONE:
				output[Init_regs] = 0;	// Output Logic
				output[SH_AB] = 0;
				output[LD_C] = 0;
				output[End] = 1;
				if(input[Start] == 1)	// Next State Logic
					state = INIT;
				else
					state = DONE;
				break;
			case INIT:
				output[Init_regs] = 1;	// Output Logic
				output[SH_AB] = 0;
				output[LD_C] = 0;
				output[End] = 0;	
				state = WAIT_1;			// Next State Logic
				break;
			case WAIT_1:
				output[Init_regs] = 0;	// Output Logic
				output[SH_AB] = 0;
				output[LD_C] = 0;
				output[End] = 0;	
				state = COMP;			// Next State Logic
				break;
			case COMP:
				output[Init_regs] = 0;	// Output Logic
				output[SH_AB] = 0;
				output[LD_C] = 0;
				output[End] = 0;
				if(input[Z] == 1)	// Next State Logic
					state = DONE;
				else if(input[LSB_A] == 1)
					state = ADD;
				else
					state = SHIFT;
				break;
			case ADD:
				output[Init_regs] = 0;	// Output Logic
				output[SH_AB] = 0;
				output[LD_C] = 1;
				output[End] = 0;	
				state = SHIFT;			// Next State Logic
				break;
			case SHIFT:
				output[Init_regs] = 0;	// Output Logic
				output[SH_AB] = 1;
				output[LD_C] = 0;
				output[End] = 0;	
				state = WAIT_2;			// Next State Logic
				break;
			case WAIT_2:
				output[Init_regs] = 0;	// Output Logic
				output[SH_AB] = 0;
				output[LD_C] = 0;
				output[End] = 0;	
				state = COMP;			// Next State Logic
				break;
			default:
				state = DONE;	
				break;
		}
		set_outputs();
	}
}

//==================================================//


