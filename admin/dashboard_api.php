<?php
header('Content-Type: application/json');

include("conn.php");

//Action
if(isset($_POST['action']))
{
    $action = $_POST['action'];
    if(function_exists($action))
    {
        $action($conn);
    }
    else
    {
        echo json_encode(['status'=>'error','message'=>'Invalid action']);
    }
}
else
{
    echo json_encode(['status'=>'error','message'=>'Action Is Required']);

}

// Dashboard
// Candidates
function cNumber($conn)
{
$select = mysqli_query($conn , "SELECT * FROM candidates");
if($select && mysqli_num_rows($select )> 0)
{
$row = mysqli_num_rows($select);
echo  json_encode(['status'=>'success','message'=>mysqli_num_rows($select)]);
}
else
{
    echo json_encode(['status'=>'error','message'=>'No Candidate Found Now']);
}
}
// Voters
function vNumber($conn)
{
$select = mysqli_query($conn , "SELECT * FROM voters");
if($select && mysqli_num_rows($select )> 0)
{
    echo  json_encode( ['status'=>'success','message'=>mysqli_num_rows($select)]);
}
else
{
    echo json_encode(['status'=>'error','message'=>'No Voters Found Now']);
}
}
// Male Voter
function malevNumber($conn)
{ 
    $selectMale = mysqli_query($conn , "SELECT * FROM voters where student_sex ='Male'");
    if($selectMale && mysqli_num_rows($selectMale)>0)
    {
        
echo  json_encode(['status'=>'success','messageMale'=>mysqli_num_rows($selectMale)]);
    }
else
{
    echo json_encode(['status'=>'error','message'=>'No Male Voter Found Now','Number'=>0]);
}
}

// Female Voter
function FemalevNumber($conn)
{ 
    $selectFemale = mysqli_query($conn , "SELECT * FROM voters where student_sex ='Female'");
    if($selectFemale && mysqli_num_rows($selectFemale)>0)
    {
        
echo  json_encode(['status'=>'success','messageFemale'=>mysqli_num_rows($selectFemale)]);
    }
else
{
    echo json_encode(['status'=>'error','message'=>'No Female Voter Found Now','Number'=>0]);
}
}

// PartTime Voter
function PartTimevNumber($conn)
{ 
    $selectPartTime = mysqli_query($conn , "SELECT * FROM voters where student_shift ='Part Time'");
    if($selectPartTime && mysqli_num_rows($selectPartTime)>0)
    {
        
echo  json_encode(['status'=>'success','messagePartTime'=>mysqli_num_rows($selectPartTime)]);
    }
else
{
    echo json_encode(['status'=>'error','message'=>'No Part Time Voter Found Now','Number'=>0]);
}
}

// FullTime Voter
function FullTimevNumber($conn)
{ 
    $selectFullTime = mysqli_query($conn , "SELECT * FROM voters where student_shift ='Full Time'");
    if($selectFullTime && mysqli_num_rows($selectFullTime)>0)
    {
        
echo  json_encode(['status'=>'success','messageFullTime'=>mysqli_num_rows($selectFullTime)]);
    }
else
{
    echo json_encode(['status'=>'error','message'=>'No Full Time Voter Found Now','Number'=>0]);
}
}
?>