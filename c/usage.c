/*
 * Commandline parameter parsing
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int Usage(char *progname){
	const char help[] = "\n"
"Pouziti:\n"
"    %s [-h] [-tvq]\n"
"\n"
"Program cte SI cipy a odesila data na server do aplikace Gorgon\n"
"\n"
"Parametry:\n"
"    -h  ... help - tato napoveda\n"
"    -v  ... verbose - vypisovat vice informaci\n"
"    -q  ... quiet - vypisovat mene informaci\n"
"    -s <server> ... Gorgon <server> [localhost]\n"
"    -r <zavod>  ... Gorgon <zavod> [test]\n"
"\n"
"Chyby:\n"
"\n";
	printf(help, progname);
	return 0;
}


int main(int argc, char* argv[])
{
	Usage(argv[0]);
	return 0;
}

