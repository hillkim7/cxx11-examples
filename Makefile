# for cross compilation:
# run like following:
# CROSS_COMPILE=arm-linux-gnueabihf- make

CXX = $(CROSS_COMPILE)g++
CC = $(CROSS_COMPILE)gcc

CFLAGS = -Wall
CXXFLAGS = -Wall -std=c++11
LIBS = -lboost_system -lboost_thread

SRCS := $(wildcard *.cpp)
OBJS := $(subst .cpp,.o,$(SRCS))
TARGETS := $(subst .o,,$(OBJS))

all: $(TARGETS)

$(TARGETS): $(OBJS)
	$(CXX) -o $@ $@.o $(LDFLAGS) $(LIBS)

%.o: %.cpp
	@echo ">> %.o: $@ , $< <<"
	$(CXX) $(CXXFLAGS) $(INCPATH) -o $@ -c $<

%.o: %.c
	@echo ">> %.o: $@ , $< <<"
	$(CC) $(CFLAGS) $(INCPATH) -o $@ -c $<

clean:
	rm -rf $(TARGETS) $(OBJS)
