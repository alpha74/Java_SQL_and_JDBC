// JDBC program 
// insert implementation of SQL
// USAGE: insert into relationname value1 value2 value3
// set classpath=mysql-connector.jar;.

// Author: alpha74

import java.sql.* ;
import java.util.* ;

public class insert
{
	public static void main( String args[] ) throws Exception
	{
		// Loading Driver
		Class.forName( "com.mysql.jdbc.Driver" ) ;
		Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost/dbmsproj", "root", "" ) ;
		
		Statement st = conn.createStatement() ;
		
		int argsLen = args.length ;
		
		// SQL variables 
		String relationname ;
		String[] values = new String[ 8 ] ;
		int numValues = 0 ;
		
		// Checking the commandline input 
		if( argsLen < 2 )						// checking min keywords
		{
			System.out.println( "\n Usage> java insert into <relationname> <value1> <value2> .. <value n> " ) ;
			System.exit(1) ;
			
		}
		else if( argsLen > 9 )					// checking for max keywords
		{
			System.out.println( "\n Error> <values> are more than maximum allowed" ) ;
			System.exit(1) ;
		}	
		else if( !args[ 0 ].equals( "into" ) )	// finding 'into' clause
		{
			System.out.println( "\n Use> 'into' keyword" ) ;
			System.exit(1) ;
		}
		else									
		{
			System.out.println( "\n >Success input" ) ;	
		}
		
		// Extracting information from args
		System.out.println( "\n ---- Fetched Values--- " ) ;
			
		// Setting relationname as args[1]
		relationname = args[ 1 ] ;		
		System.out.println( "\n Relation: " + relationname ) ;
		
		System.out.println( " Values: ") ;
		// Extracting data values
		for( int i = 2 ; i < argsLen ; i++ )
		{
			values[ numValues ] = args[ i ] ;
			System.out.println( " " + values[ numValues ] ) ;
			
			numValues = numValues + 1 ;
		}
		
		System.out.println( " ---------------------- " ) ;
		
	
		// Defining query
		String query = "INSERT INTO " + relationname + " VALUES ( '" + values[ 0 ] + "'" ;
		
		// Adding values in the query from value[1]
		for( int i = 1 ; i < numValues ; i++ )
		{
			query = query + ", '" + values[ i ] + "'" ;			
		}
		query = query + " ) ; " ;
		
		System.out.println( "\n >Query Generated: " + query ) ;
		
		
		
		// Executing Query
		try
		{
			int rwf = st.executeUpdate( query ) ;
			
			/*(while( rs.next() )
			{
				System.out.println( rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4) ) ;
			}*/
			
			System.out.println( "\n >Query Success: " + rwf + " row/s affected" ) ;
		}
		catch( Exception e )
		{
			System.out.print( "\n ERROR> query/input \n ERROR> " + e + "\n" ) ;
		}
			
		//rs.close() ;
		st.close() ;
		conn.close() ;
	}
}
