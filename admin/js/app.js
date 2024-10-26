$(document).ready(function () {
   
    // Reload The Function
    cNum();
    // Sending Request On api
    function cNum()
    {
    $.ajax({
        type: "POST",
        url: "dashboard_api.php",
        data: {'action':'cNumber'},
        dataType: "json",
        success: function (response) {
            $("#totalCandidates").html(response.message);
            // $("#cNumProg").css("width",`width:3%`);
        }
    });
}
setInterval(1000,cNum);


// Voters
    // Reload The Function
    vNum();
    // Sending Request On api
    function vNum()
    {
    $.ajax({
        type: "POST",
        url: "dashboard_api.php",
        data: {'action':'vNumber'},
        dataType: "json",
        success: function (response) {
            if(response.status=="success")
            {
            $("#totalOfVoters").html(response.message);
          
            // $("#cNumProg").css("width",`width:3%`);
            }
            else if(response.status == "error")
            {
                console.log(response.message);
            }
        }
    });
}
setInterval(1000,vNum);


// MaleVoters
    // Reload The Function
    malevNum();
    // Sending Request On api
    function malevNum()
    {
    $.ajax({
        type: "POST",
        url: "dashboard_api.php",
        data: {'action':'malevNumber'},
        dataType: "json",
        success: function (response) {
            if(response.status=="success")
            {
            $("#MaleV").html(response.messageMale);
            let totalVOter = $("#totalOfVoters").html();
            // console.log(totalVOter);
          $("#pMale").html( `${response.messageMale / totalVOter  * 100}%`);
          $("#maleProgressBar").css("width",`${response.messageMale / totalVOter  * 100}%`);
            // $("#cNumProg").css("width",`width:3%`);
            
            // $("#cNumProg").css("width",`width:3%`);
            }
            else if(response.status == "error")
            {
                console.log(response.message);
                $("#errorMale").html(response.message);
                let totalVOter = $("#totalOfVoters").html();
                // console.log(totalVOter);
              $("#pMale").html( `${response.Number / totalVOter  * 100}%`);
              $("#maleProgressBar").css("width",`${response.Number / totalVOter  * 100}%`);
            }
        }
    });
}
setInterval(1000,malevNum);


// femaleVoters
    // Reload The Function
    femalevNum();
    // Sending Request On api
    function femalevNum()
    {
    $.ajax({
        type: "POST",
        url: "dashboard_api.php",
        data: {'action':'FemalevNumber'},
        dataType: "json",
        success: function (response) {
            if(response.status=="success")
            {
            $("#FemaleV").html(response.messageFemale);
            let totalVOter = $("#totalOfVoters").html();
            // console.log(totalVOter);
          $("#pFemale").html( `${response.messageFemale / totalVOter  * 100}%`);
          $("#femaleProgressBar").css("width",`${response.messageFemale / totalVOter  * 100}%`);

            // $("#cNumProg").css("width",`width:3%`);
            }
            else if(response.status == "error")
            {
                console.log(response.message);
                $("#errorFemale").html(response.message);
                let totalVOter = $("#totalOfVoters").html();
                // console.log(totalVOter);
              $("#pFemale").html( `${response.Number / totalVOter  * 100}%`);
              $("#femaleProgressBar").css("width",`${response.Number / totalVOter  * 100}%`);
            }
        }
    });
}
setInterval(1000,femalevNum);



// Full Time Voters
    // Reload The Function
    FullTimevNum();
    // Sending Request On api
    function FullTimevNum()
    {
    $.ajax({
        type: "POST",
        url: "dashboard_api.php",
        data: {'action':'FullTimevNumber'},
        dataType: "json",
        success: function (response) {
            if(response.status=="success")
            {
            $("#totalOfFulltime").html(response.messageFullTime);
            let totalVOter = $("#totalOfVoters").html();
            // console.log(totalVOter);
          $("#pFullTime").html( `${response.messageFullTime / totalVOter  * 100}%`);
          $("#fullTimeProgressBar").css("width",`${response.messageFullTime / totalVOter  * 100}%`);

            // $("#cNumProg").css("width",`width:3%`);
            }
            else if(response.status == "error")
            {
                console.log(response.message);
                $("#errorFullTime").html(response.message);
                let totalVOter = $("#totalOfVoters").html();
                // console.log(totalVOter);
              $("#pFullTime").html( `${response.Number / totalVOter  * 100}%`);
              $("#fullTimeProgressBar").css("width",`${response.Number / totalVOter  * 100}%`);
            }
        }
    });
}
setInterval(1000,FullTimevNum);

// Part Time Voters
    // Reload The Function
    PartTimevNum();
    // Sending Request On api
    function PartTimevNum()
    {
    $.ajax({
        type: "POST",
        url: "dashboard_api.php",
        data: {'action':'PartTimevNumber'},
        dataType: "json",
        success: function (response) {
            if(response.status=="success")
            {
            $("#totalOfParttime").html(response.messagePartTime);
            let totalVOter = $("#totalOfVoters").html();
            // console.log(totalVOter);
          $("#pPartTime").html( `${response.messagePartTime / totalVOter  * 100}%`);
          $("#PartTimeProgressBar").css("width",`${response.messagePartTime / totalVOter  * 100}%`);

            // $("#cNumProg").css("width",`width:3%`);
            }
            else if(response.status == "error")
            {
                console.log(response.message);
                $("#errorPartTime").html(response.message);
                let totalVOter = $("#totalOfVoters").html();
                // console.log(totalVOter);
              $("#pPartTime").html( `${response.Number / totalVOter  * 100}%`);
              $("#PartTimeProgressBar").css("width",`${response.Number / totalVOter  * 100}%`);
            }
        }
    });
}
setInterval(1000,FullTimevNum);




});