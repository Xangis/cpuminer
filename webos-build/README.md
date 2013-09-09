WebOS Build of Pooler's CPUMiner
--------------------------------

To install, just copy the minerd file in this folder to your HP touchpad
(i.e. in USB drive mode).

You'll need to connect to your device to run minerd and you'll also have to
chmod the file to be executable (chmod +x). Novaterm from the Palm SDK is
probably the best way to do this. The command line is the same as with the
desktop build - no code has been changed.

To build, you'll also have to have the Palm PDK installed. Building cpuminer
wasn't that tough, since it already supports ARM devices. Extra steps boil
down to:

0. Run autogen.sh in the root directory to generate the configure script.

1. Removing the check for curl from the Makefile.in file. The ./configure
just couldn't figure out the right curl, so we'll handle that later. There
is a modified Makefile.in in this folder that you can use, but this step
is optional if you just run webos-build.sh.

2. Setting environment variables to point to your SDK items before running
./configure. That's what the webos-build.sh shell script does.

3. When the app tries to build you'll get error output like this:

/opt/PalmPDK/arm-gcc/bin/arm-none-linux-gnueabi-gcc -std=gnu99 -DHAVE_CONFIG_H 
-I. -pthread -fno-strict-aliasing -I./compat/jansson @LIBCURL_CPPFLAGS@   
-I/opt/PalmPDK/include/ -MT minerd-cpu-miner.o -MD -MP -MF 
.deps/minerd-cpu-miner.Tpo -c -o minerd-cpu-miner.o `test -f 'cpu-miner.c' || 
echo './'`cpu-miner.c 
arm-none-linux-gnueabi-gcc: @LIBCURL_CPPFLAGS@: No such file or directory

See that @LIBCURL_CPPFLAGS@ bit? That's not right. Edit the Makefile and
search for it.  There will be a line that looks like:

minerd_CPPFLAGS = @LIBCURL_CPPFLAGS@

Delete the symbol so it just says:

minerd_CPPFLAGS = 

4. Run make and let cpuminer compile until it hits the linker stage and dies.

4. Running webos-link.sh to link the object files together. It has the
right settings for library flags, curl, etc.

This has only been tested on 64-bit Ubuntu 13.04, but should work about
the same on any version of Linux.

Since installing the SDK is a hassle (no longer available from HP's website)
and cross-compiling is also a hassle, you might as well just use the pre-
compiled minerd. Your call.

A stock HP Touchpad gets about 1500 hashes/second with the screen on, and
with the screen off it gets about 750. The compiler and linker flags could
probably be optimized a bit to improve that slightly.

Enjoy,
Jason (http://github.com/Xangis/)
