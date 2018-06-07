window.onscroll = function() {myFunction()};
function myFunction() {
    var navbar = document.getElementById("myNavbar");
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        navbar.className = "w3-bar" + " w3-card" + " w3-animate-top" + " w3-white" ;
        dropdown.className = "dropbtn" + " w3-text-black";
        document.getElementById('dropDown').style.visibility = 'hidden';
    } else {
        navbar.className = navbar.className.replace(" w3-card w3-animate-top w3-white", "");
        navbar.className = "w3-bar w3-text-white";
        document.getElementById('dropDown').style.visibility = 'visable';
    }
}