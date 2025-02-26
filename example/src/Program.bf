using System;
using System.Diagnostics;
using static iniparserBeef.iniparser;

namespace example;

class Program
{
	[CLink] static extern void* __acrt_iob_func(uint32);

	public static int Main(String[] args)
	{
		let stdout = __acrt_iob_func(1);

		dictionary* ini;
		char8* ini_name;

		ini_name = "twisted.ini";

		ini = iniparser_load(ini_name);

		iniparser_dump(ini, (void**)stdout);

		iniparser_freedict(ini);

		return 0;
	}
}