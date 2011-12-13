/*
 *	Copyright 1996, University Corporation for Atmospheric Research
 *      See netcdf/COPYRIGHT file for copying and redistribution conditions.
 */
/* $Id: libvers.c,v 2.12 2008/04/04 18:47:58 dmh Exp $ */

#include <config.h>
#include <string.h>

#if defined(USE_DAP)
#include <netcdf3l.h>
#include <nc3local.h>
#elif defined(USE_RENAMEV3)
#include <netcdf3.h>
#include <nc3convert.h>
#else
#include <netcdf.h>
#endif

/*
 * A version string. This whole function is not needed in netCDF-4,
 * which has it's own version of this function.
 */
#ifndef USE_NETCDF4
#define SKIP_LEADING_GARBAGE 33	/* # of chars prior to the actual version */
#define XSTRING(x)	#x
#define STRING(x)	XSTRING(x)
static const char nc_libvers[] =
	"\044Id: \100(#) netcdf library version " STRING(VERSION) " of "__DATE__" "__TIME__" $";

const char *
nc_inq_libvers(void)
{
	return &nc_libvers[SKIP_LEADING_GARBAGE];
}

//ALEX
static const char nc_libversion[] =
	"Netcdf library version " STRING(VERSION) " of "__DATE__" "__TIME__" built with MS Visual C++ 2008 Express";
int CALLCONVENTION nc_inq_libversion(int lenMessage, char* message)
{
	strncpy(message , nc_libversion, lenMessage-1);
	message[lenMessage-1] = '\0';
	return 0;
}
//FIN ALEX

#endif /* USE_NETCDF4*/
