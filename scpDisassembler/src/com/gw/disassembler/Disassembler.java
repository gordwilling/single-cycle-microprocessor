package com.gw.disassembler;

import java.io.*;
import java.text.NumberFormat;

/**
 * <dl>
 * <dt><b>Created:</b>
 * <dd>2013/03/24</dd>
 * </dt>
 * <dt><b>Description:</b>
 * <dd>
 *   Quick and dirty disassembler for debugging 
 *   microprocessor implementation
 * </dd>
 * </dt>
 * </dl>
 *
 * @author Gordon Wallace - gwallace@lakeheadu.ca
 * @version 1.0
 */
public class Disassembler
{
    public static void main( String... args )
    {
        System.out.println( "PC Inst Assembly" );
        System.out.println( "-- ---- ---------------" );
        try
        {
            BufferedReader in = new BufferedReader( new FileReader(
                    "D:\\Projects\\School\\scpDisassembler\\test\\lights.bin" ) );

            String lowByte = in.readLine();
            String highByte;
            int line = 0;

            while( lowByte != null )
            {
                highByte = in.readLine();
                Instruction instr = new Instruction( highByte, lowByte );

                String imemAddress = Integer.toHexString( line );
                while( imemAddress.length() < 2 )
                {
                    imemAddress = "0" + imemAddress;
                }
                line += 2;
                System.out.println( imemAddress + " " +  instr.getHexString() + " " + instr.getAssembly() );

                lowByte = in.readLine();
            }
        }
        catch( IOException e )
        {
            e.printStackTrace();
        }
    }
}
