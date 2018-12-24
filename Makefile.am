
if WANT_JANSSON
JANSSON_INCLUDES= -I$(top_srcdir)/compat/jansson
else
JANSSON_INCLUDES=
endif

EXTRA_DIST	= example-cfg.json nomacro.pl

SUBDIRS		= compat

ALL_INCLUDES	= @PTHREAD_FLAGS@ -fno-strict-aliasing $(JANSSON_INCLUDES) -I.

bin_PROGRAMS	= toasterminer

dist_man_MANS	= toasterminer.1

toasterminer_SOURCES = \
  toaster-miner.c util.c \
  api.c sysinfos.c \
  uint256.cpp \
  crypto/oaes_lib.c \
  crypto/c_keccak.c \
  crypto/c_groestl.c \
  crypto/c_blake256.c \
  crypto/c_jh.c \
  crypto/c_skein.c \
  crypto/hash.c \
  crypto/aesb.c \
  algo/blake.c \
  algo/blake2.c \
  algo/cryptonight.c \
  algo/cryptoupx.c \
  algo/groestl.c \
  algo/keccak.c \
  algo/sha2.c \
  algo/skein.c \
  algo/skein2.c

disable_flags =

if USE_ASM
if ARCH_x86
   toasterminer_SOURCES += asm/sha2-x86.S asm/aesb-x86.S
endif
if ARCH_x86_64
   toasterminer_SOURCES += asm/sha2-x64.S asm/aesb-x64.S
endif
if ARCH_ARM
   toasterminer_SOURCES += asm/sha2-arm.S
endif
else
   disable_flags += -DNOASM
endif

if HAVE_WINDOWS
   toasterminer_SOURCES += compat/winansi.c
endif

toasterminer_LDFLAGS	= @LDFLAGS@
toasterminer_LDADD	= @LIBCURL@ @JANSSON_LIBS@ @PTHREAD_LIBS@ @WS2_LIBS@
toasterminer_CPPFLAGS = @LIBCURL_CPPFLAGS@ $(ALL_INCLUDES)
toasterminer_CFLAGS   = -Wno-pointer-sign -Wno-pointer-to-int-cast $(disable_flags)

if HAVE_WINDOWS
toasterminer_CFLAGS += -Wl,--stack,10485760
toasterminer_LDADD += -lcrypt32 -lgdi32 -lgcc -lgcc_eh
endif

if HAVE_WINDOWS
# use to profile an object
# gprof_cflags = -pg -g3
# toasterminer_LDFLAGS += -pg
# toasterminer_CFLAGS += -fno-inline-functions -static

# copy/paste from generated Makefile
common_ccflags = $(DEFS) $(ALL_INCLUDES) $(toasterminer_CPPFLAGS) $(CPPFLAGS) $(toasterminer_CFLAGS) $(CFLAGS)



endif
