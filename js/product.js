"use strict";

/*
   
   
   Author: Basir Qurbani
   Date:   03/04/2019
   
   
*/

/*runs validation and submit functions when window loads */
window.addEventListener("load", function(){
                                 document.getElementById("subButton").onclick = runSubmit;
                                 document.getElementById("fname").oninput = validatefName;
                                 document.getElementById("eMail").oninput = validateEmail;
   
});

/*runs validation functions when submite button is selected */
function runSubmit(){
                     validatefName();
                     validateEmail();
}

/* validates name */
function validatefName(){
                  var name = document.getElementById("name");

                  if(name.validity.valueMissing) {
                        name.setCustomValidity("Please Enter your full name");
                        } else {
                        name.setCustomValidity("");
                        }
}

/* validates email address with proper email pattern */
function validateEmail(){
                  var emailAdd = document.getElementById("eMail");
                  
                  if(emailAdd.validity.valueMissing){
                     emailAdd.setCustomValidity("Please Enter your email address");
                  } else if(/^[a-z.]{4,15}\d?\w+\@[a-z.]+\w{2,3}$/ig.test(emailAdd.value)===false){
                     emailAdd.setCustomValidity("Please enter a valid Email address");
                  } else {
                     emailAdd.setCustomValidity("");
                  }
}

