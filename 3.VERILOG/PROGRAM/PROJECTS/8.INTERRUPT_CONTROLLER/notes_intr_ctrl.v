signal names

PCLK_I = input to the interrupt controller.
		 it is the clock in which the interrupt controller is working

PRST_I = input to the interrupt controller.
		 it is to reset the all the output of the interrupt controller
PADDR_I = input to the interrupt controller .
		  it gives the addr of the peripheral for which the read and write should happen.
PWDATA_I = input to the interrupt controller from processor.
	       it is the data from the processor which is write into to priority register of the interrupt controller
PRDATA_O = output of the interrupt controller to processor.
			it is filled with the data on the PADDR_I of the priority register and given to the processor
PWRITE_I = input to the interrupt controller
			it tells the interrupt controller whether to do rad or write 
			read is happen if it is 0.
			write is happen if it is 1.
PENABLE_I = input to the interrupt controller from processor
			it is the first step of hand shaking. the processor is telling i want to do some operation. and wait for the interrupt controller reply.
PREADY_O = output of the interrupt controller to processor.
		   second stage of hand shaking. replying to  the processor that am ready too.
PERROR_O = output of the interrupt controller to processor
			it becomes high when there error is happening while read or write operation is going on.
INTR_TO_SRVC_O = output of the interrupt controller to processor
				 it gives the adders of the peripheral to which the processor need to service.
INTR_VALID_O = output of the interrupt controller to processor
			   it tells whether the given data that means the INTR_TO_SRVC_O is a valid data.
INTR_SERVICED_I = input to the interrupt controller from processor 
				  it is the reply from the processor that the service for  the given interrupt is done.
INTR_ACTIVE_I = input to the interrupt controller from processor
				it tells that what are the pheripherals which has raised interrupt service.
INTR_WITH_HIGH_PRIORITY = it is the internal signal of the interrupt controller tells the procesor which interruptted pheripherals has the highest priority among all other pheripherial for which the proccessor to give service first.




