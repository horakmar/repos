/*
 * Commandline parameter parsing
 */

using System;
using System.Text;
using System.Collections.Generic;

public class Example
{
    public static void Main(string[] args)
    {
        // GetParam -------------------------------
        var parms = new List<string>();
        int verbose = 1;
        string configFile = "";
        try
        {
            for (int i = 0; i < args.Length; i++)
            {
                if (args[i].StartsWith("-"))
                {
                    foreach (char c in args[i].Substring(1))
                    {
                        switch (c)
                        {
                            case 'v':
                                verbose++;
                                break;
                            case 'q':
                                verbose--;
                                break;
                            case 'c':
                                i++;
                                configFile = args[i];
                                break;
                        }
                    }
                }
                else
                {
                    parms.Add(args[i]);
                }
            }
        }
        catch (IndexOutOfRangeException)
        {
            Console.WriteLine("Parameter read error.");
            return;
        }

        // Getparam end ----------------------------

        Console.WriteLine("Verbose: {0}\nConfig: {1}", verbose, configFile);
        if (parms.Count > 0)
        {
            Console.Write("Parameters: ");
            foreach (string p in parms)
            {
                Console.Write(p + " ");
            }
        }
        return;
    }
}
