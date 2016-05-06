LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

# required because recent ndks turn on a warning-as-error option for
# printf format strings
LOCAL_CFLAGS := -w

OPENSSL_LIB_PATH := $(LOCAL_PATH)/../openssl/arm/lib

PYTHON_SRC_PATH := $(LOCAL_PATH)/../python-src
LOCAL_C_INCLUDES := $(PYTHON_SRC_PATH) $(PYTHON_SRC_PATH)/Include
LOCAL_PATH := $(PYTHON_SRC_PATH)
LOCAL_SRC_FILES := \
		Parser/acceler.c \
		Parser/grammar1.c \
		Parser/listnode.c \
		Parser/node.c \
		Parser/parser.c \
		Parser/parsetok.c \
		Parser/bitset.c \
		Parser/metagrammar.c \
		Parser/firstsets.c \
		Parser/grammar.c \
		Parser/pgen.c \
		Parser/myreadline.c \
		Parser/tokenizer.c \
		Python/thread.c \
		Python/_warnings.c \
		Python/Python-ast.c \
		Python/asdl.c \
		Python/ast.c \
		Python/bltinmodule.c \
		Python/ceval.c \
		Python/compile.c \
		Python/codecs.c \
		Python/dynload_shlib.c \
		Python/errors.c \
		Python/frozen.c \
		Python/frozenmain.c \
		Python/future.c \
		Python/getargs.c \
		Python/getcompiler.c \
		Python/getcopyright.c \
		Python/getmtime.c \
		Python/getplatform.c \
		Python/getversion.c \
		Python/graminit.c \
		Python/import.c \
		Python/importdl.c \
		Python/marshal.c \
		Python/modsupport.c \
		Python/mystrtoul.c \
		Python/mysnprintf.c \
		Python/peephole.c \
		Python/pyarena.c \
		Python/pyfpe.c \
		Python/pymath.c \
		Python/pystate.c \
		Python/pythonrun.c \
		Python/structmember.c \
		Python/symtable.c \
		Python/sysmodule.c \
		Python/traceback.c \
		Python/getopt.c \
		Python/pystrcmp.c \
		Python/pystrtod.c \
		Python/formatter_unicode.c \
		Python/formatter_string.c \
		Objects/abstract.c \
		Objects/boolobject.c \
		Objects/bufferobject.c \
		Objects/bytes_methods.c \
		Objects/bytearrayobject.c \
		Objects/cellobject.c \
		Objects/classobject.c \
		Objects/cobject.c \
		Objects/codeobject.c \
		Objects/complexobject.c \
		Objects/descrobject.c \
		Objects/enumobject.c \
		Objects/exceptions.c \
		Objects/genobject.c \
		Objects/fileobject.c \
		Objects/floatobject.c \
		Objects/frameobject.c \
		Objects/funcobject.c \
		Objects/intobject.c \
		Objects/iterobject.c \
		Objects/listobject.c \
		Objects/longobject.c \
		Objects/dictobject.c \
		Objects/methodobject.c \
		Objects/moduleobject.c \
		Objects/object.c \
		Objects/obmalloc.c \
		Objects/rangeobject.c \
		Objects/setobject.c \
		Objects/sliceobject.c \
		Objects/stringobject.c \
		Objects/structseq.c \
		Objects/tupleobject.c \
		Objects/typeobject.c \
		Objects/weakrefobject.c \
		Objects/unicodeobject.c \
		Objects/unicodectype.c \
		Modules/threadmodule.c \
		Modules/signalmodule.c \
		Modules/posixmodule.c  \
		Modules/errnomodule.c  \
		Modules/pwdmodule.c \
		Modules/_sre.c  \
		Modules/_codecsmodule.c  \
		Modules/_weakref.c  \
		Modules/zipimport.c  \
		Modules/symtablemodule.c  \
		Modules/xxsubtype.c \
		Modules/config.c \
		Modules/getpath.c \
		Modules/main.c \
		Modules/gcmodule.c \
		Modules/getbuildinfo.c

LOCAL_MODULE := python2.6
#LOCAL_MODULE_FILENAME := 
LOCAL_STATIC_LIBRARIES := thread signal posix errno pwd _sre _codecs zipimport \
	_symtable array cmath math _struct time operator _weakref _testcapi \
	_random _collections itertools strop _functools _elementtree datetime \
	_bisect unicodedata _locale xxsubtype _ctypes future_builtins _heapq \
	_fileio _bytesio _json _hotshot _lsprof fcntl select parser \
	cStringIO cPickle mmap syslog audioop imageop _csv _socket \
	_sha _md5 _sha256 _sha512 termios resource binascii _multibytecodec \
	_codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022 \
	_multiprocessing \
	_sqlite3 zlib bz2 crypt pyexpat \
	_ssl

# order is important when libs are specified this way.  Also, this generates a build warning 
# (supposed to use LOCAL_STATIC_LIBRARIES) but these libs are removed by ndk-build if I put them in there.
# also note that if these libs are stripped, this will fail with undefined symbol errors
LOCAL_LDLIBS := $(OPENSSL_LIB_PATH)/libssl.a $(OPENSSL_LIB_PATH)/libcrypto.a 

$(call __ndk_info, Building libpython2.6)
$(call __ndk_info, PATH: $(LOCAL_PATH))
$(call __ndk_info, MODULE: $(LOCAL_MODULE))
$(call __ndk_info, FILENAME: $(LOCAL_MODULE_FILENAME))
$(call __ndk_info, SRC: $(LOCAL_SRC_FILES))
$(call __ndk_info, LOCAL_SHARED_LIBRARIES: $(LOCAL_SHARED_LIBRARIES))
$(call __ndk_info, INCLUDES: $(LOCAL_C_INCLUDES))
$(call __ndk_info, EXPORT: $(LOCAL_EXPORT_C_INCLUDES))

include $(BUILD_SHARED_LIBRARY)

