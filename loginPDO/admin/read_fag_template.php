<?php
    // display the table if the number of users retrieved was greater than zero
    if($num>0){
     
        echo "<table class='table table-hover table-responsive table-bordered'>";
     
        // table headers
        echo "<tr>";
            echo "<th>Fag nr.</th>";
            echo "<th>Titel</th>";
            echo "<th>Start dato</th>";
            echo "<th>End dato</th>";            
        echo "</tr>";
     
        // loop through the user records
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            extract($row);
     
            // display user details
            echo "<tr>";
                echo "<td>{$fag_uid}</td>";
                echo "<td>{$fag_title}</td>";
                echo "<td>{$startdato}</td>";
                echo "<td>{$enddato}</td>";                
            echo "</tr>";
            }
     
        echo "</table>";
     
        $page_url="read_fag.php?";
        $total_rows = $fag->countAll();
     
        // actual paging buttons
        include_once 'paging.php';
    }
     
    // tell the user there are no selfies
    else{
        echo "<div class='alert alert-danger'>
            <strong>No users found.</strong>
        </div>";
    }
?>