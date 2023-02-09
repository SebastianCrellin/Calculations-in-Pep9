;Create a program which prints out the prompt ?Enter a decimal
;number: ? and then takes in a decimal number as input. The program must then
;output the entered value, followed by a count down (or count up if the value is
;negative) from that value to zero.

         BR      input       
num1:    .WORD   2           
num2:    .WORD   2           

input:   STRO    in,d 
         ;Load Value Of 1 Into Num2       
         LDWA    0x0001,i    
         STWA    num2,d
         ;Take A User Input Of Num1      
         DECI    num1,d          
         LDWA    num1,d      
         BR      calc        

;Decides Where to Branch To
calc:    BRLT    lessthan    
         BRGT    morethan 
         ;When equal to zero branch to equalto   
         BREQ    equalto     

lessthan:DECO    num1,d      
         LDWA    num1,d      
;num 2 is 1 so add num2 to num1
         ADDA    num2,d      
         STWA    num1,d 
         STRO    newln,d            
         BR      calc        

morethan:DECO    num1,d      
         LDWA    num1,d      
;num 2 is 1 so take num2 from num1
         SUBA    num2,d      
         STWA    num1,d
         STRO    newln,d            
         BR      calc        

equalto:DECO    num1,d   
        STOP                

in:      .ASCII  "Enter a decimal number: \x00"



newln:   .ASCII  "\n"        




         .END                  
