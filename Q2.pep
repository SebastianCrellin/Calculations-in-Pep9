         BR      input       
numa:    .BLOCK  0x0000      
numacon: .BLOCK  0x0000      
countera:.BLOCK  0x0000      

numb:    .BLOCK  0x0000      
numbcon: .BLOCK  0x0000      
counterb:.BLOCK  0x0000      

numc:    .BLOCK  0x0000      

numn:    .BLOCK  0x0000      
numncon: .BLOCK  0x0000      
numnsq:  .BLOCK  0x0000      
countern:.BLOCK  0x0000      

nsqd:    .BLOCK  0x0000      
ansqd:   .BLOCK  0x0000      
btimesn: .BLOCK  0x0000  

zero: .BLOCK 0 

;INPUTS FOR A B C N
input:   STRO    ina,d       
         DECI    countera,d     
         LDWA    countera,d       
         STWA    numa,d  
         LDWA    numa,d      
         STWA    numacon,d   

         STRO    inb,d       
         DECI    numb,d      
         LDWA    numb,d      
         STWA    counterb,d  
         LDWA    numb,d      
         STWA    numbcon,d   

;C doesn't need a counter for a loop
         STRO    inc,d       
         DECI    numc,d      

         STRO    inn,d       
         DECI    numn,d      
         LDWA    numn,d      
         STWA    countern,d  
         LDWA    numn,d      
         STWA    numncon,d   

         BR      nsquared    

;add to end and then loop for each iteration and combine all the values at the end

;THIS IS SQUARING THE VALUE
nsquared:LDWA    countern,d  
;Is counter equal to zero, if so branch
         BREQ    numsqs      
;Loading and adding the value to itself
         LDWA    numn,d      
         ADDA    numncon,d   
         STWA    numn,d  
    
         LDWA    0,i
;Counter for the number of times to loop. IT THINKS ITS 10 not 5
         LDWA    countern,d    
         SUBA    1,i         
         STWA    countern,d  
         LDWA    countern,d  
;Loop unless counter is equal to zero
         BR      nsquared    

numsqs:  LDWA    numn,d      
         STWA    numnsq,d    
         DECO    numnsq,d    
         BR      ansqrd      

ansqrd:  LDWA    countera,d  
         BREQ    sansqd      
         LDWA    numnsq,d    
         ADDA    numacon,d   
         STWA    numnsq,d    
         LDWA    countera,d  
         SUBA    1,i         
         STWA    countera,d  
         BR      ansqrd      

;SAVNING a x n^2 as a value
sansqd:  LDWA    numnsq,d    
         STWA    ansqd,d     
         DECO    ansqd,d     
         BR      btimen      

btimen:  LDWA    counterb,d  
         BREQ    alladdc     
         LDWA    numncon,d   
         ADDA    numbcon,d   
         STWA    numb,d      
         LDWA    countera,d  
         SUBA    1,i         
         STWA    countera,d  
         BR      ansqrd   
   
;SAVNING b x n as a value
sbtimesn:LDWA    numb,d    
         STWA    btimesn,d     
         DECO    ansqd,d     
         BR      alladdc  

;COMBINING ALL OF THE VALUES
alladdc: LDWA   ansqd,d 
         ADDA   numc,d
         ADDA   btimesn,d

         BR      finished    


finished:STOP                

ina:     .ASCII  "Enter a decimal value for a: \x00"





inb:     .ASCII  "Enter a decimal value for b: \x00"





inc:     .ASCII  "Enter a decimal value for c: \x00"





inn:     .ASCII  "Enter a decimal value for n: \x00"





nsq:     .ASCII  "N squared is: \x00 "





newln:   .ASCII  "\n"        








         .END                  
