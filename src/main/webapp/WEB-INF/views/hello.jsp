<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Students</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
</head>
<body onload="load();">
 
        <input type="hidden" id="id">
        Name: <input type="text" id="name" required="required" name="name"><br>
        Email: <input type="email" id="email" required="required" name="email"><br>
        <button onclick="submit();">Submit</button>
     
     
 
        <table id="table" border=1>
            <tr> <th> Name </th> <th> Email </th> <th> Edit </th> <th> Delete </th> </tr>
         
        </table>
             
     
    <script type="text/javascript">
    data = "";
    submit = function(){
          
            $.ajax({
                url:'update',
                type:'POST',
                data:{id:$("#id").val(),user_name:$('#name').val(),email:$('#email').val()},
                success: function(response){
                        alert(response.message);
                        load();     
                }               
            });         
    }
     
    delete_ = function(id){      
         $.ajax({
            url:'delete',
            type:'POST',
            data:{id:id},
            success: function(response){
                    alert(response.message);
                    load();
            }               
        });
}
     
 
    edit = function (index){
        $("#id").val(data[index].id);
        $("#name").val(data[index].name);
        $("#email").val(data[index].email);
         
    }
     
     
    load = function(){  
        $.ajax({
            url:'list',
            type:'POST',
            success: function(response){
                    data = response.data;
                    $('.tr').remove();
                    for(i=0; i<response.data.length; i++){                   
                        $("#table").append("<tr class='tr'> <td> "+response.data[i].name+" </td> <td> "+response.data[i].email+" </td> <td> <a href='#' onclick= edit("+i+");> Edit </a>  </td> </td> <td> <a href='#' onclick='delete_("+response.data[i].id+");'> Delete </a>  </td> </tr>");
                    }           
            }               
        });
         
    }
         
    </script>
     
</body>
</html>