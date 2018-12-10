#!/bin/bash

# remove existing .o files
rm -rf ./obj

# create .o files directory
mkdir ./obj

# compile swig generated C/C++ files
gcc -c -fPIC -fno-asynchronous-unwind-tables -fno-omit-frame-pointer -ffreestanding -Os -fno-stack-protector -ffunction-sections -fdata-sections -fno-reorder-functions -fno-defer-pop -fno-strict-overflow -I"$JAVA_HOME/include/" -I"$JAVA_HOME/include/linux/" -I../.. -I../../include/ -I../../port/ -I../../port/linux/ -I../../util/ -I../../deps/tinycbor/src/ -Wall -Wextra -Werror -pedantic -D__OC_RANDOM -DOC_CLIENT -DOC_SERVER -DOC_IPV4 -DOC_DYNAMIC_ALLOCATION -DOC_DEBUG -DOC_SECURITY -g -O0 -Wno-unused-parameter -Wno-strict-aliasing -Wno-unused-function -Wno-sign-compare -Wno-address oc_api_wrap.c -o ./obj/oc_api_wrap.o

gcc -c -fPIC -fno-asynchronous-unwind-tables -fno-omit-frame-pointer -ffreestanding -Os -fno-stack-protector -ffunction-sections -fdata-sections -fno-reorder-functions -fno-defer-pop -fno-strict-overflow -I"$JAVA_HOME/include/" -I"$JAVA_HOME/include/linux/" -I../../port/ -I../../port/linux -Wall -Wextra -Werror -pedantic -D__OC_RANDOM -DOC_CLIENT -DOC_SERVER -DOC_IPV4 -DOC_DYNAMIC_ALLOCATION -DOC_DEBUG -DOC_SECURITY -g -O0 -Wno-unused-parameter oc_storage_wrap.c  -o ./obj/oc_storage_wrap.o

gcc -c -fPIC -fno-asynchronous-unwind-tables -fno-omit-frame-pointer -ffreestanding -Os -fno-stack-protector -ffunction-sections -fdata-sections -fno-reorder-functions -fno-defer-pop -fno-strict-overflow -I"$JAVA_HOME/include/" -I"$JAVA_HOME/include/linux/" -I../../port/ -I../../port/linux -Wall -Wextra -Werror -pedantic -D__OC_RANDOM -DOC_CLIENT -DOC_SERVER -DOC_IPV4 -DOC_DYNAMIC_ALLOCATION -DOC_DEBUG -DOC_SECURITY -g -O0 -Wno-unused-parameter -Wno-strict-aliasing oc_clock_wrap.c  -o ./obj/oc_clock_wrap.o

gcc -c -fPIC -fno-asynchronous-unwind-tables -fno-omit-frame-pointer -ffreestanding -Os -fno-stack-protector -ffunction-sections -fdata-sections -fno-reorder-functions -fno-defer-pop -fno-strict-overflow -I"$JAVA_HOME/include/" -I"$JAVA_HOME/include/linux/" -I../.. -I../../include/ -I../../port/ -I../../port/linux/ -I../../util/ -I../../deps/tinycbor/src/ -Wall -Wextra -Werror -pedantic -D__OC_RANDOM -DOC_CLIENT -DOC_SERVER -DOC_IPV4 -DOC_DYNAMIC_ALLOCATION -DOC_DEBUG -DOC_SECURITY -g -O0 -Wno-unused-parameter -Wno-strict-aliasing -Wno-unused-function -Wno-sign-compare -Wno-address oc_obt_wrap.c -o ./obj/oc_obt_wrap.o

gcc -c -fPIC -fno-asynchronous-unwind-tables -fno-omit-frame-pointer -ffreestanding -Os -fno-stack-protector -ffunction-sections -fdata-sections -fno-reorder-functions -fno-defer-pop -fno-strict-overflow -I"$JAVA_HOME/include/" -I"$JAVA_HOME/include/linux/" -I../.. -I../../include/ -I../../port/ -I../../port/linux/ -I../../util/ -I../../deps/tinycbor/src/ -Wall -Wextra -Werror -pedantic -D__OC_RANDOM -DOC_CLIENT -DOC_SERVER -DOC_IPV4 -DOC_DYNAMIC_ALLOCATION -DOC_DEBUG -DOC_SECURITY -g -O0 -Wno-unused-parameter -Wno-strict-aliasing -Wno-unused-function -Wno-sign-compare -Wno-address -Wno-unused-variable oc_uuid_wrap.c -o ./obj/oc_uuid_wrap.o

# create shared library
gcc -shared ./obj/*.o ../../port/linux/obj/*.o ../../port/linux/obj/client_server/*.o  -lm -lpthread -lrt -o libiotivity-lite-jni.so
