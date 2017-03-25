  
  
  

      	 function myFunction() {
      	 	
      	 	   var intercept= document.getElementById("intercept").value;

     	 	 input2=input2+1;
    var distribution_chosen = document.getElementById("selectdistribution").value;
      	 	 Shiny.onInputChange("simulation", input2);  
         Shiny.onInputChange("intercept", intercept);  
	 	  Shiny.onInputChange("slope", slope);  
	 	 Shiny.onInputChange("distribution_chosen", distribution_chosen);  
        Shiny.onInputChange("sample_size", sample_size);  
        Shiny.onInputChange("sdev", sdev);  
        Shiny.onInputChange("degf", degf);  
        Shiny.onInputChange("interv", interv);  
        Shiny.onInputChange("lambda", lambda);  
        Shiny.onInputChange("omittedvar", omittedvar);  
        Shiny.onInputChange("simulation2", input3);    

if(distribution_chosen!="omittedvar"){
if(slope>0){  
document.getElementById("regressiondef").innerHTML = "y = "+intercept+"+"+slope+"x"+" + &#949";}

if(slope<0){  
document.getElementById("regressiondef").innerHTML = "y ="+ intercept+slope+" x"+" + &#949";}
};
if(distribution_chosen=="omittedvar"){
if(slope>0){  
document.getElementById("regressiondef").innerHTML = "y = "+intercept+"+"+slope+" x "+omittedvar+"z"+" + &#986";}

if(slope<0){  
document.getElementById("regressiondef").innerHTML = "y ="+ intercept+slope+" x"+omittedvar+" z "+" + &#986";}
};
                    }
                    ;
                    
                    

                     function choosedist() {
    var x = document.getElementById("selectdistribution").value;
    var z = document.getElementById("normalparam");
    var z2 = document.getElementById("tdistparam");
    var z3 = document.getElementById("expparam");
    var z4 = document.getElementById("uniformparam");
    var z5 = document.getElementById("omittedvarparameter");
     
    if (x === 'normal') {
        z.style.display = 'block';
    } else {
        z.style.display = 'none';}

    if (x === 'tdistribution') {
        z2.style.display = 'block';
    } else {
        z2.style.display = 'none';}
        
            if (x === 'exponential') {
        z3.style.display = 'block';
    } else {
        z3.style.display = 'none';}

            if (x === 'uniform') {
        z4.style.display = 'block';
    } else {
        z4.style.display = 'none';}        
            if (x === 'omittedvar') {
        z5.style.display = 'block';
    } else {
        z5.style.display = 'none';}        
        } ;    

 	 function runregressions() {
     	 	 input3=1;
      	 	 Shiny.onInputChange("simulation2", input3);  
  input3=null;
                    };
                    
                    function displayinfo2() {
    var x = document.getElementById('info2');
    if (x.style.display === 'none') {
        x.style.display = 'block';
    } else {
        x.style.display = 'none';
    }
};


