// JDBC program 
// search implementation of SQL

import java.sql.* ;
import java.util.* ;

public class search
{
	public static void main( String args[] ) throws Exception
	{
		// Loading Driver
		Class.forName( "com.mysql.jdbc.Driver" ) ;
		Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost/dbmsproj", "root", "" ) ;
		
		Statement st = conn.createStatement() ;
		
		int argsLen = args.length ;
		
		// SQL variables 
		String keyword = " " ;	
	
		String[] relation = new String[ 15 ] ;
		int relLen = 0 ;
		int flag1 = 1 ;
		
		// Setting relation name
		relation[ 0 ] = "advisor" ;
		relation[ 1 ] = "classroom" ;
		relation[ 2 ] = "course" ;
		relation[ 3 ] = "department" ;
		relation[ 4 ] = "faculty" ;
		relation[ 5 ] = "instructor" ;
		relation[ 6 ] = "prereq" ;
		relation[ 7 ] = "section" ;
		relation[ 8 ] = "student" ;
		relation[ 9 ] = "takes" ;
		relation[ 10 ] = "teaches" ;
		relation[ 11 ] = "time_slot" ;
		
		// Phase 0 : Getting list of realations
		try
		{
			// Get list of all relations
			String queryAllRel = "SHOW TABLES;" ;
			
			ResultSet lst = st.executeQuery( queryAllRel ) ;
			
			while( lst.next() )
			{
				relation[ relLen ] = lst.getString(1) ;
				relLen = relLen + 1 ;
			}
			
			System.out.println( "\n >Fetched " + (relLen-1) + " relations from DB" ) ;
		}
		catch( Exception e )
		{
			System.out.print( "\n ERROR> query/input \n ERROR> " + e + "\n" ) ;
			System.exit( 1 ) ;
		}		
		
		// Checking the commandline input 
		if( argsLen < 1 )						// checking min keywords
		{
			System.out.println( "\n Usage1> java search <keyword> " ) ;
			System.exit(1) ;
			
		}
		else if( argsLen > 1 )					// checking for max keywords
		{
			System.out.println( "\n Error> <keywords> are more than maximum allowed" ) ;
			System.exit(1) ;
		}	
		else									
		{
			System.out.println( "\n >Success input" ) ;	
			
			keyword = args[ 0 ] ;
		}
		
		System.out.println( "\n >Keyword: " + keyword + "\n" ) ;
		
		for( int r = 0 ; r < relLen ; r++ )
		{
			// Phase 1 : Getting names of columns of that relation
			
			// To get 1 tuple from relation
			try
			{
				String queryGetColName = "SELECT * FROM " + relation[ r ] + " LIMIT 1 " ;
				
				ResultSet rs = st.executeQuery( queryGetColName ) ;
				ResultSetMetaData rsmd = rs.getMetaData();
			
				int colNum = rsmd.getColumnCount() ;
				
				// Phase 2 : Drop previous View and Creating new 
				try
				{
					// Drop view if already made
					String queryDropView = "DROP VIEW IF EXISTS search ;" ;
					
					// DEBUG
					//System.out.println( "\n >Executing: " + queryDropView ) ;
					
					int rwf = st.executeUpdate( queryDropView ) ;
				}
				catch( Exception e )
				{
					System.out.print( "\n ERROR> query/input \n ERROR> " + e + "\n" ) ;
					System.exit( 1 ) ;
				}				
				
				
				// To create view by combining columns
				// CREATE VIEW search AS ( SELECT CONCAT(ID," ",name, " ", dept_name, " ",tot_cred) AS txt From student ) ;
				String queryMakeView = "CREATE VIEW search AS ( SELECT CONCAT( " + rsmd.getColumnName(1) ;
				
				for( int i = 2 ; i <= colNum ; i++ )
				{
					queryMakeView += ", '|', " + rsmd.getColumnName(i) ;
				} 
				
				queryMakeView += ") AS txt FROM " + relation[ r ] + ") ; " ;
				
				// DEBUG
				//System.out.println( " >Executing: " + queryMakeView ) ;
				
				try
				{
					int rwf = st.executeUpdate( queryMakeView ) ;
					
					// DEBUG
					//System.out.println( "\n >Query Success: " + rwf + " row/s affected" ) ;
				}
				catch( Exception e )
				{
					System.out.print( "\n ERROR> query/input \n ERROR> " + e + "\n" ) ;
					System.exit( 1 ) ;
				}
					
				// Phase 3 : Searching the keyword in the relation and Printing tuple	
				try
				{
					// To match keyword
					String querySearch = "SELECT * FROM search WHERE txt LIKE '%" + keyword + "%' ; " ;
					
					// DEBUG
					//System.out.println( "\n >Executing: " + querySearch ) ;
					
					ResultSet rs2 = st.executeQuery( querySearch ) ;
					ResultSetMetaData rsmd2 = rs2.getMetaData();
					
					int tupNum = rsmd2.getColumnCount();
					
					// To show which relations are the tuples
					//System.out.println( "\t relation: " + relation[ r ] ) ;
					while( rs2.next() )
					{
						if( flag1 == 1 )
							flag1 = 0 ;
						for( int i = 1 ; i <= tupNum ; i++ )
						{
							System.out.print( "\t" + rs2.getString(i) ) ;
						}
						System.out.print( "\n" ) ;
					}
					
				}
				catch( Exception e )
				{
					System.out.print( "\n ERROR> query/input \n ERROR> " + e + "\n" ) ;
					System.exit( 1 ) ;
				}
				
			}
			catch( Exception e )
			{
				System.out.print( "\n ERROR> query/input \n ERROR> " + e + "\n" ) ;
				System.exit( 1 ) ;
			}
			
		}
		
		if( flag1 == 1 )
		{
			System.out.println( "\n >0 row/s output" ) ;
		}
		
		System.out.println( "\n >Success " ) ;
			
		st.close() ;
		conn.close() ;
	}
}
