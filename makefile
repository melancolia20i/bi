#  ______     __   
# /\  == \   /\ \  
# \ \  __<   \ \ \ 
#  \ \_____\  \ \_\
#   \/_____/   \/_/
#
# Aug 22 2025
# melancolia20i
# listening to: otra aporia - noiseferatu

objs = bi.o
flags =
std =
exe = bi

all: $(exe)

$(exe): $(objs)
	ld	-o $(exe) $(objs)
%.o: %.asm
	as	-c $< -o $@ $(flags) $(std)
clean:
	rm	-rf $(objs) $(exe)
