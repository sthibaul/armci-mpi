CC      = mpicc
CFLAGS  = -g -O0 -I.
CFLAGS += -Wall

### For timing runs when you don't care about safety:
# CFLAGS += -DNO_SEATBELTS

OBJ    = util.o           	\
         malloc.o         	\
         mem_region.o           \
         onesided.o       	\
         mutex.o          	\
         onesided_nb.o    	\
         armci_msg.o            \
         strided.o              \
         vector.o               \
         debug.o                \
         groups.o               \
         value_ops.o            \
         rmw.o                  \
         topology.o             \
         mutex_grp_notify.o     \
         #mutex_grp_spin.o       \
         # end

libarmci.a: $(OBJ)
	ar rcs $@ $+
	ranlib $@

.PHONY: clean
clean:
	rm -f *.o test libarmci.a
