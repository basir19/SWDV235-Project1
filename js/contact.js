"use strict";

/*
   
   Author: Basir Qurbani
   Date:   03/05/2019

*/

/*runs validation and submit functions when window loads */
window.addEventListener("load", function(){
                              document.getElementById("subButton").onclick = runSubmit;
                              document.getElementById("fname").oninput = validateName;
                              document.getElementById("lname").oninput = validatelastName;
                              document.getElementById("country").onchange = validateCountry;
});

/*runs validation functions when submite button is selected */
function runSubmit(){
                     validatefName();
                     validatelastName();
                     validateCountry();

}

/* validates first name */
function validatefName(){
            var fName = document.getElementById("fname");
            
            if(fName.validity.valueMissing) {
                  fName.setCustomValidity("Please Enter your First Name");
                  } else {
                  fName.setCustomValidity("");
                  }
}


/* validates first name */
function validatelastName(){
               var lName = document.getElementById("lname");

               if(lName.validity.valueMissing) {
                     lName.setCustomValidity("Please Enter your Last Name");
                     } else {
                     lName.setCustomValidity("");
                     }
               }

/* validates if the country is selected from the dropdown list */
function validateCountry(){
               var country = document.getElementById("country");

               if(country.selectedIndex === 0){
                  country.setCustomValidity("Please Select your country");
               } else {
                  country.setCustomValidity("");
               }
}

