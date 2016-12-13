package com.gw.disassembler;

/**
 * <dl>
 * <dt><b>Created:</b>
 * <dd>2013/03/24</dd>
 * </dt>
 * <dt><b>Description:</b>
 * <dd>
 * <p/>
 * </dd>
 * </dt>
 * </dl>
 *
 * @author Gordon Wallace - gwallace@lakeheadu.ca
 * @version 1.0
 */
public enum InstructionFormat
{
    A,
    B,
    L;

    public static InstructionFormat getFormat( int opcode )
    {
        if ( opcode < 9 )
        {
            return A;
        }
        else if ( opcode < 13 )
        {
            return B;
        }
        else
        {
            return L;
        }
    }
}
