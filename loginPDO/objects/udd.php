<?php
/**
 * Uddannelse
 */
class Uddannelse 
{
	
	// database connection and table name
    private $conn;
    private $table_name = "uddannelse";
 
    // object properties
    public $udd_uid;
    public $udd_title;
    public $created;
    public $modified;
 
    // constructor
    public function __construct($db){
        $this->conn = $db;
    }

    public function read(){
    	// query to read all user records, with limit clause for pagination
	    $query = "SELECT
	                udd_uid,
	                udd_title,
	                created,
	                modified	                
	            FROM " . $this->table_name . "
	            ORDER BY udd_uid DESC";
	 
	    // prepare query statement
	    $stmt = $this->conn->prepare( $query );	   
	 
	    // execute query
	    $stmt->execute();
	 
	    // return values
	    return $stmt;
    }
}
?>