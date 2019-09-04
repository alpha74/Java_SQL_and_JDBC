// JDBC program 
// select implementation of SQL

import java.sql.* ;
import java.util.* ;

public class select
{
	public static void main( String args[] ) throws Exception
	{
		// Loading Driver
		Class.forName( "com.mysql.jdbc.Driver" ) ;
		Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost/dbmsproj", "root", "" ) ;
		
		Statement st = conn.createStatement() ;
		
		int argsLen = args.length ;
		
		// SQL variables 
		String relationname1 ;
		String relationname2 ;
		
		String condition ;
		String query = " " ;			// Will be defined of type separately
		
		// Checking the commandline input 
		if( argsLen < 2 )						// checking min keywords
		{
			System.out.println( "\n Usage1> java select from <relationname> " ) ;
			System.out.println( " Usage2> java select from <relationname> where \"<condition>\" " ) ;
			System.out.println( " Usage3> java select from <relationname1> <relationname2> " ) ;
			System.exit(1) ;
			
		}
		else if( argsLen > 4 )					// checking for max keywords
		{
			System.out.println( "\n Error> <keywords> are more than maximum allowed" ) ;
			System.exit(1) ;
		}	
		else if( !args[ 0 ].equals( "from" ) )	// finding 'from' clause
		{
			System.out.println( "\n Use> 'from' keyword" ) ;
			System.exit(1) ;
		}	
		else									
		{
			System.out.println( "\n >Success input" ) ;	
			
			// Finding correct select type:
			/*
					select from relationname 						argsLen = 2
					select from relationname where "condition"		argsLen = 4
					select from relationname1 relationname2			argsLen = 3
			*/
			
			
			if( argsLen == 3 )	// type3
			{
				// Extracting information
				relationname1 = args[ 1 ] ;
				relationname2 = args[ 2 ] ;
				
				// select from relationname1 relationname2
				query = "SELECT * FROM ( " + relationname1 + " NATURAL JOIN " + relationname2 + " ) ; " ;
				
			}
			else if( argsLen == 4 )  // type2
			{
				// Extracting information
				relationname1 = args[ 1 ] ;
				condition = args[ 3 ] ;
				
				// select from relationname where "condition"
				query = "SELECT * FROM " + relationname1 + " WHERE " + condition ;
			}
			else //(argsLen == 2 )  // type1
			{
				// Extracting information
				relationname1 = args[ 1 ] ;
				
				// select from relationname
				query = "SELECT * FROM " + relationname1 ;
			}
			
		}
		
		System.out.println( "\n >Query Generated: " + query + "\n" ) ;
		
		
		try
		{
			int largeCol = -1 ;
			
			// Executing Query
			ResultSet rs = st.executeQuery( query ) ;
				
			ResultSetMetaData rsmd = rs.getMetaData();

			int colNum = rsmd.getColumnCount();

			for( int i = 1 ; i <= colNum ; i++ )
			{
				//System.out.print( "  " + rsmd.getColumnName(i) + "\t" ) ;
				if( (rsmd.getColumnName(i)).equals( "title")  )	// for column "title"
				{
					System.out.format( "  %26s", rsmd.getColumnName(i) ) ;
					largeCol = i ;
				}
				else
				{
					System.out.format( "  %10s", rsmd.getColumnName(i) ) ;
				}
			}
				
			System.out.print( "\n\n" ) ;	
				
			while( rs.next() )
			{
				for( int i = 1 ; i <= colNum ; i++ )
				{
					//System.out.print( "  " + rs.getString(i) + "\t" ) ; // + rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4) ) ;
					
					String outp = rs.getString(i) ;
					
					// Checking for "null" and replacing it with " "
					/*if( outp.equals( "null" ) || outp.equals( "Null" ) || outp.equals( "NULL" ) )
						outp = "null" ;
					*/
					
					if( i == largeCol )	// for column "title"
					{											
						System.out.format( "  %26s", outp ) ;
					}
					else
					{												
						System.out.format( "  %10s", outp ) ;
					}
				}
				System.out.print( "\n" ) ;
			}
			
			System.out.println( "\n >Query Success" ) ;
			
			rs.close() ;
		}
		catch( Exception e )
		{
			System.out.print( "\n ERROR> query/input \n ERROR> " + e + "\n" ) ;
		}
			
		st.close() ;
		conn.close() ;
	}
}
