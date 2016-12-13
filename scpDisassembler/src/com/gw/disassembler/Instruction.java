package com.gw.disassembler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <dl>
 * <dt><b>Created:</b>
 * <dd>2013/03/24</dd>
 * </dt>
 * </dl>
 *
 * @author Gordon Wallace - gwallace@lakeheadu.ca
 * @version 1.0
 */
public class Instruction
{
    InstructionFormat format;
    String binary;
    String mnemonic;
    String ra;
    String rb;
    String brx;
    String ea_imm = "0";
    int opcode;

    static List<String> mnemonics = new ArrayList<String>();
    static
    {
        mnemonics.add( "NOP" );
        mnemonics.add( "ADD" );
        mnemonics.add( "SUB" );
        mnemonics.add( "NAND" );
        mnemonics.add( "SHL" );
        mnemonics.add( "SHR" );
        mnemonics.add( "OUT" );
        mnemonics.add( "IN" );
        mnemonics.add( "MOV" );
        mnemonics.add( "BR" );
        mnemonics.add( "BR." );
        mnemonics.add( "BR.SUB" );
        mnemonics.add( "RETURN" );
        mnemonics.add( "LOAD" );
        mnemonics.add( "STORE" );
        mnemonics.add( "LOADIMM" );
    }

    static Map<String,String> registers = new HashMap<String,String>();
    static
    {
        registers.put( "00", "R0" );
        registers.put( "01", "R1" );
        registers.put( "10", "R2" );
        registers.put( "11", "R3" );
    }

    public Instruction( String highByte, String lowByte )
    {
        this.binary = highByte + lowByte;
        opcode = Integer.parseInt( binary.substring( 8, 12 ), 2 );

        format = InstructionFormat.getFormat( opcode );
        mnemonic = mnemonics.get( opcode );
        if ( format == InstructionFormat.A )
        {
            ra = binary.substring( 12, 14 );
            rb = binary.substring( 14, 16 );
        }
        else if ( format == InstructionFormat.B )
        {
            ea_imm = binary.substring( 0, 8 );
            brx = binary.substring( 12, 13 );
            if ( opcode == 10 )
            {
                if ( brx.equals( "0" ) )
                {
                    brx = "Z";
                }
                else
                {
                    brx = "N";
                }
            }
            else
            {
                brx = "";
            }
        }
        else if ( format == InstructionFormat.L )
        {
            ea_imm = binary.substring( 0, 8 );
            ra = binary.substring( 12, 14 );
        }

        int i = Integer.parseInt( ea_imm, 2 );
        ea_imm = Integer.toHexString( i ).toUpperCase();
    }

    public String getAssembly()
    {
        StringBuilder assembly = new StringBuilder( mnemonic );

        if ( format == InstructionFormat.A )
        {
            if ( opcode == 0 )
            {
                // nop!
            }
            else if ( opcode < 4 )
            {
                assembly.append( ' ' );
                assembly.append( registers.get( ra ) );
                assembly.append( ", " );
                assembly.append( registers.get( rb ) );
            }
            else if ( opcode < 8 )
            {
                assembly.append( ' ' );
                assembly.append( registers.get( ra ) );
            }
            else
            {
                assembly.append( ' ' );
                assembly.append( registers.get( ra  ) );
                assembly.append( ", " );
                assembly.append( registers.get( rb ) );
            }
        }
        else if ( format == InstructionFormat.B )
        {
            assembly.append( brx );
            assembly.append( " " );
            assembly.append( ea_imm );
        }
        else if ( format == InstructionFormat.L )
        {
            if ( opcode < 15 )
            {
                assembly.append( ' ' );
                assembly.append( registers.get( ra  ) );
                assembly.append( ", " );
                assembly.append( "M[" );
                assembly.append( ea_imm );
                assembly.append( "]" );
            }
            else
            {
                assembly.append( ' ' );
                assembly.append( registers.get( ra  ) );
                assembly.append( ", " );
                assembly.append( ea_imm );
            }
        }

        return assembly.toString();
    }

    public int getOpcode()
    {
        return opcode;
    }

    public String getHexString()
    {
        String hex = Integer.toHexString( Integer.parseInt( binary, 2 ) );
        while ( hex.length() < 4)
        {
            hex = "0" + hex;
        }
        return hex;
    }
}
