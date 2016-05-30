# So that we is silent
MAKEFLAGS += -s

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m'

DEBUG_FLAG="-g"

CXX_FLAGS="-Wall -Werror -Wextra"
CXX_STATIC_LIBRARY_FLAGS="-c"
CXX_SHARED_LIBRARY_FLAGS="-fpic -c"
CXX_VERSION="-std=c++11"

C_FLAGS="-Wall -Werror -Wextra"
C_STATIC_LIBRARY_FLAGS="-c"
C_SHARED_LIBRARY_FLAGS="-fpic -c"

FORTRAN_FLAGS=""
FORTAN_STATIC_LIBRARY_FLAGS="-c"
FORTRAN_SHARED_LIBRARY_FLAGS="-xcode=pic32 -c"


# Initial Make Targets
default:
	make math_release
	@echo ${WHITE}[*] ${GREEN}Successfully Compiled ML! Run it with ./ML${NC}
debug:
	make math_debug
	@echo ${WHITE}[*] ${GREEN}Successfully Compiled ML! Run it with ./ML${NC}

clean:
	rm -rf temp/release/*
	rm -rf temp/debug/*
	rm -rf build/release/*
	rm -rf build/debug/*
	rm -rf lib/release/*
	rm -rf lib/debug/*
	rm -rf bin/release/*
	rm -rf bin/debug/*

math_release:
	@echo  ${WHITE}[*] ${GREEN}Compiling Library 'Math'${NC}
	g++ ${CXX_STATIC_LIBRARY_FLAGS} ./src/cpp/utils/math/math.cpp -Wall -Werror -Wextra ${CXX_VERSION} -o ./temp/math.o
	@echo g++ ${CXX_STATIC_LIBRARY_FLAGS} ./src/cpp/utils/math/math.cpp -Wall -Werror -Wextra ${CXX_VERSION} -o ./temp/math.o
	g++ ${CXX_STATIC_LIBRARY_FLAGS} src/cpp/utils/math/statistics.cpp -Wall -Werror -Wextra -Ltemp/math.o  ${CXX_VERSION} -o temp/math_stats.o
	@echo g++ ${CXX_STATIC_LIBRARY_FLAGS} src/cpp/utils/math/statistics.cpp -Wall -Werror -Wextra -Ltemp/math.o  ${CXX_VERSION} -o temp/math_stats.o
	@echo  ${WHITE}[*] ${GREEN}Archiving Static Library 'Math'${NC}
	ar rcs lib/release/math.a temp/math.o temp/math_stats.o
	@echo ar rcs lib/release/math.a temp/math.o temp/math_stats.o
	@echo ${WHITE}[*] ${GREEN}Cleaning Up ${NC}
	@rm temp/math.o
	@rm temp/math_stats.o
	@echo  ${WHITE}[*] ${GREEN}Compiled 'Math' ${NC}

math_debug:	
	@echo  ${WHITE}[*] ${GREEN}Compiling Library 'Math Debug'${NC}
	g++ ${CXX_STATIC_LIBRARY_FLAGS} ${DEBUG_FLAG} ./src/cpp/utils/math/math.cpp -Wall -Werror -Wextra ${CXX_VERSION} -o ./temp/mathd.o
	@echo g++ ${CXX_STATIC_LIBRARY_FLAGS} ./src/cpp/utils/math/math.cpp -Wall -Werror -Wextra ${CXX_VERSION} -o ./temp/mathd.o
	g++ ${CXX_STATIC_LIBRARY_FLAGS} ${DEBUG_FLAG} src/cpp/utils/math/statistics.cpp -Ltemp/mathd.o -Wall -Werror -Wextra ${CXX_VERSION} -o temp/math_statsd.o
	@echo  ${WHITE}[*] ${GREEN}Archiving Static Library 'Math Debug'${NC}
	@echo ar rcs lib/debug/mathd.a temp/mathd.o temp/math_statsd.o
	@ar rcs lib/debug/mathd.a temp/mathd.o temp/math_statsd.o
	@echo ${WHITE}[*] ${GREEN}Cleaning Up ${NC}
	@rm temp/mathd.o
	@rm temp/math_statsd.o
	@echo  ${WHITE}[*] ${GREEN}Compiled 'Math Debug' ${NC}
	
