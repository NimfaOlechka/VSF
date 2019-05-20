<?php

/**
 * Fag
 */
class Fag 
{
	// database connection and table name
    private $conn;
    private $table_name = "fag";
    //object properties
    //public $id;
	public $fag_uid;	
	public $fag_title;
	public $startdato;
	public $enddato;
	public $created;
	
	//TODO: insert uddannelse som array...?
	//public $uddannelse;

	public function __construct($db){
        $this->conn = $db;
    }

    //function to show errors if action over object is not succeed
	public function showError($stmt){
	    echo "<pre>";
	        print_r($stmt->errorInfo());
	    echo "</pre>";
	}

    public function create()
    {
    	//insert query
    	$query = "INSERT INTO
	                " . $this->table_name . "
	            SET
	                fag_uid = :fag_uid,
	                fag_title = :fag_title,	                
	                startdato = :startdato,
	                enddato = :enddato";
	              
	    // prepare the query
	    $stmt = $this->conn->prepare($query);

	    // sanitize
	    $this->faguid=htmlspecialchars(strip_tags($this->fag_uid));
	    $this->fagtitle=htmlspecialchars(strip_tags($this->fag_title));
	    $this->startdato=htmlspecialchars(strip_tags($this->startdato));
	    $this->enddato=htmlspecialchars(strip_tags($this->enddato));
	    //TODO: change this
	    //$this->uddannelse=htmlspecialchars(strip_tags($this->uddannelse));

	    // bind the values
	    $stmt->bindParam(':faguid', $this->fag_uid);
	    $stmt->bindParam(':fagtitle', $this->fag_title);
	    $stmt->bindParam(':startdato', $this->startdato);
	    $stmt->bindParam(':enddato', $this->enddato);
	    //TODO: change this
	    //$stmt->bindParam(':uddannelse', $this->uddannelse);

	    // execute the query, also check if query was successful
	    if($stmt->execute()){
	        return true;
	    }else{
	        $this->showError($stmt);
	        return false;
	    }	
	 

    }

    public function readAll($from_record_num, $records_per_page)
    {
    	//query to read all fag records
    	$query = "SELECT
	                fag_uid,
	                fag_title,
	                startdato,
	                enddato
	            FROM " . $this->table_name . "
	            ORDER BY startdato DESC
	            LIMIT ?, ?";
		
		// prepare the query
	    $stmt = $this->conn->prepare($query);

	    // bind the values
	   $stmt->bindParam(1, $from_record_num, PDO::PARAM_INT);
	   $stmt->bindParam(2, $records_per_page, PDO::PARAM_INT);

	   // execute query
	    $stmt->execute();
	 
	   // return values
	   return $stmt;

    }

    public function update()
    {
    	# code...
    }

    // used for paging users
	public function countAll(){
	 
	    // query to select all user records
	    $query = "SELECT fag_uid FROM " . $this->table_name . "";
	 
	    // prepare query statement
	    $stmt = $this->conn->prepare($query);
	 
	    // execute query
	    $stmt->execute();
	 
	    // get number of rows
	    $num = $stmt->rowCount();
	 
	    // return row count
	    return $num;
	}
}
?>