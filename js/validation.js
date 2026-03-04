function validate(){

let user=document.getElementById("username").value;
let pass=document.getElementById("password").value;

if(user=="" || pass=="")
{
document.getElementById("error").innerHTML="All fields required";
return false;
}

alert("Login Successful");

return true;

}
