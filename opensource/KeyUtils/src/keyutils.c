/* keyutils.c: key utility library
 *
 * Copyright (C) 2005 Red Hat, Inc. All Rights Reserved.
 * Written by David Howells (dhowells@redhat.com)
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version
 * 2 of the License, or (at your option) any later version.
 */

// change@wtl.ksingh - ecryptfs enable
#ifdef ECRYPTFS_ENABLED

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdarg.h>
#include <string.h>
#include <unistd.h>
#include <dlfcn.h>
#include <errno.h>
#include <asm/unistd.h>
#include <sys/syscall.h>
#include "keyutils.h"

#ifdef NO_GLIBC_KEYERR
static int error_inited;
static void (*libc_perror)(const char *msg);
static char *(*libc_strerror_r)(int errnum, char *buf, size_t n);
//static int (*libc_xpg_strerror_r)(int errnum, char *buf, size_t n);
#define RTLD_NEXT      ((void *) -1L)
#endif

#define __weak __attribute__((weak))

key_serial_t __weak add_key(const char *type,
			    const char *description,
			    const void *payload,
			    size_t plen,
			    key_serial_t ringid)
{
	return syscall(__NR_add_key,
		       type, description, payload, plen, ringid);
}

static inline long __keyctl(int cmd,
			    unsigned long arg2,
			    unsigned long arg3,
			    unsigned long arg4,
			    unsigned long arg5)
{
	return syscall(__NR_keyctl,
		       cmd, arg2, arg3, arg4, arg5);
}

long __weak keyctl(int cmd, ...)
{
	va_list va;
	unsigned long arg2, arg3, arg4, arg5;

	va_start(va, cmd);
	arg2 = va_arg(va, unsigned long);
	arg3 = va_arg(va, unsigned long);
	arg4 = va_arg(va, unsigned long);
	arg5 = va_arg(va, unsigned long);
	va_end(va);

	return __keyctl(cmd, arg2, arg3, arg4, arg5);
}

long keyctl_search(key_serial_t ringid,
		   const char *type,
		   const char *description,
		   key_serial_t destringid)
{
	return keyctl(KEYCTL_SEARCH, ringid, type, description, destringid);
}

#endif // change@wtl.ksingh - ecryptfs enable
