// 1.constraint to generate unique numbers between 99 to 100.

 /* class unique_99_100;
  
     rand int a;
     real re_num;
    
    constraint a1 { a inside {[990:1000]};}
	
    function void post_randomize();
      re_num = a/10.0;
      $display(" the rela num %2f",re_num);              
    endfunction 
  endclass


module factorial(); 
  initial 
    begin
      unique_99_100 p1=new;
      repeat(10) 
        begin
          assert(p1.randomize());
          $display("\t rand a value is %d", p1.a);
        end 
    end
endmodule */


//2.constraint divisible by 5
/*
class divisible_5;
    rand bit [5:0] a;
	rand bit [5:0] b;
	
    constraint c1 {b == a/5;}	
	 
endclass

module testbench;

  divisible_5 cls=new();
  
   initial
     begin
	  repeat(5)
	   begin
	     assert(cls.randomize());
		 
		 $display("a=%d",cls.a);
		 $display("b=%f",cls.b);
         
		 
	   end
	 end


endmodule */



// 3.write a constraint for 4bit dynamic array the size of the array 
// should be in between 15 to 20.there should be even number in odd locations 
// and odd number in even locations.

/* class even;
  rand bit [4:0] data [];

 constraint arr_size {data.size() inside {[15:20]};}
 
 
 function display();
    $display("data=%p",data);
 endfunction
 
 
 
 /*constraint even_odd {foreach(data[i])
					   { 
					     if(data[i]%2 == 0)
							 data[i] == 0;
						   else
						      data[i] == 1;						
					   }
					  }
					  
	function display2();
	  begin
	  foreach(data[i])
	   begin
	     if(data[i]%2 == 0)
	       begin
		     data[i] = 0;
		     $display("index=%0d,data=%0p",i,data[i]);
		   end
		else
		  begin
		    data[i] = 1;
             $display("index=%0d,data=%0p",i,data[i]);			
		  end
	   end
	  
	  
	  
	  end
	
	
    endfunction	
					  
					  
					  
  
endclass

program tb;
  even tb_even;
  
  initial 
   begin 
     tb_even=new();
	 repeat(2)
	  begin
	    tb_even.randomize();
		tb_even.display();
		tb_even.display2();			
	 end	
    end
endprogram */



//4.write a constraint for two random variables such that
// one variable should not match the other and the total number of bits toggled 
// in one variable should be 5 w.r.t the other. 

/*

class two_random;
  rand int  addr;
  rand int data;
  
  constraint c { addr != data ; }
  
  constraint c1 { $countones(addr) == 5;}
  //constraint c2 { $countones(data) == 5;}
  
  
  
  
  
  function display();
    begin
	
	 $display("addr=%0b",addr);
	 $display("data=%0b",data);
	end 
  endfunction
  
endclass


module tb;

two_random cls;
  initial
    begin
	  cls= new();
	  repeat(5)
	   begin
	    cls.randomize();
	    cls.display();
	   end	
	end


endmodule */




// 5.write a constraint such that when rand  bit [3:0] a is 
// randomized the value of "a" should not 
// be same as 5 previous occurrences of the value of "a".
/*

class occ_5;
  rand bit [4:0] a;
  int queue[$:7];
  
  constraint c {!(a inside {queue});}
  
  function void post_randomize();
     begin
	 $display("a=%0d",a);
	   queue.push_front(a);
	   $display("a=%0d",a);
	    if(queue.size == 6)
		   begin
		     queue.pop_back();
		     $display("queue=%p",queue);
		   end  
	 end
  endfunction
  
   
  

endclass

module tb;
    
	occ_5 des;
	
	initial
	  begin
	    des = new(); 
		repeat(20)
		 begin
		    des.randomize();
		 end
	     
	  end
endmodule */


// 6.constraint to generate 0,1,x and z randomly.
 
/*

typedef enum {S0, S1, SX, SZ} mvl4_t; // Multi-Value Logic 4 -states
 
class A;
  rand mvl4_t Sa;
  logic a;
  rand bit ctrl;
  
  constraint a1{ctrl dist {0:=5 , 1:=5};}
  constraint a_unknown { if (ctrl) 
                              Sa inside {SX, SZ};
                            else   
							  Sa inside {S0, S1}; }
  function void post_randomize;
    case (Sa)
    S0: a = 0;
    S1: a = 1;
    SX: a = 'x;
    SZ: a = 'Z;
    endcase
  endfunction
endclass


module top();
  initial 
    begin
	 
     A a_h = new;
	 repeat(10)
	  begin
       a_h.randomize();
       $display(a_h.a); // This should give either x or z randomly.
     end
  end
endmodule */





//with using out using constraint 
/*
  class A;
    rand logic a;
 
     
 
    function void post_randomize();
      a =  a ?'x:'z;
    endfunction : post_randomize
	
  endclass


module top();
  initial 
    begin
	 
     A a_h = new;
	 repeat(5)
	  begin
       a_h.randomize();
       $display(a_h.a); // This should give either x or z randomly.
     end
  end
endmodule */


/*7.write a program using dynamic array
  .array1: no.of elements should be between 30-40.
  ..array2:sum of all elements should be <100
  ...array3: sum of all elements should be >100. */
  
  
  /*
  class array;
     rand byte array1[];
     rand bit [3:0]  array2[];
     rand  byte unsigned array3[];
	 
	 constraint c1 {array1.size() inside {[30:40]};}
	 constraint c2 {array2.size()==10;}
	 constraint c3 {array3.size()==30;}
  
  function void display();
    begin
     $display("array1 size=%0d",array1.size());
	 
	 $display("array2 size=%0d",array2.size());
	 $display("array2 = %0p",array2);
	 $display("array2 sum=%0d",array2.sum());
	 
	 $display("array3 size=%0d",array3.size());
	 $display("array3 = %0p",array3);
	 $display("array3 sum=%0d",array3.sum());
	 
	 
	end 
  endfunction
  
  endclass
  
  module tb;
       array a1;
    initial
	 begin
	   a1=new();
	    repeat(5);
		  begin
		    a1.randomize();
			a1.display();
		  end
	 
	 end
  
  
  endmodule */
  
  
  // 9.constraint with array size of 5 to 10 values & the array values should be in ascending order.
  
 /* 
  class a1;
    rand byte unsigned array[];
	
	constraint a1{array.size() inside {[5:10]};}
     function void display();
	    begin
		  $display("array size=%0d",array.size());
		  $display("array elements=%p",array);
		  array.sort();
		  $display("array ascending=%p",array);
		   
		    
		end
      endfunction	 
  
  endclass
  
  module tb;
      a1  a2;
	  
	  initial
	   begin
	      a2=new();
             repeat(4);
                begin
				   a2.randomize();
				   a2.display();
                end				
	     end
  
  
  endmodule */
  
  
 // 10.constraint with array size of 5 to 10 values & the array values should be in descending order.
 
 /*
   class a1;
    rand byte unsigned array[];
	
	constraint a1{array.size() inside {[5:10]};}
     function void display();
	    begin
		  $display("array size=%0d",array.size());
		  $display("array elements=%p",array);
		  array.rsort();
		  $display("array decending=%p",array);
		   
		    
		end
      endfunction	 
  
  endclass
  
  module tb;
      a1  a2;
	  
	  initial
	   begin
	      a2=new();
             repeat(4);
                begin
				   a2.randomize();
				   a2.display();
                end				
	     end
  
  
  endmodule */
  
  
  
//  11.constraint for 0-100 range 70% and for 101-255 range 30%.
/*
class cls;

rand bit[7:0] a;
 
  constraint c1{ a dist {[0:100]:= 7,[101:255]:=3 }; }


endclass

module tb;

cls cls1;

initial
  begin
    cls1=new();
	   repeat(10)
	    begin
		  cls1.randomize();
		  if(cls1.a<100)
		    $display("a is in b/w 0 to 100 =%0d",cls1.a);
			else
			$display("a is in b/w 101 to 255 =%0d",cls1.a);
		    
		end
  
  end



endmodule */


//12.without inside operator generate random values for the range 34-43.
/*

class cls;
  rand bit [7:0] a;
  
  constraint c1 { a>34;} 
  constraint c2 { a<43;}
  
endclass

module tb;
cls cls1;
initial
  begin
     cls1=new();
     repeat(10)
	 begin
      cls1.randomize();
	  $display("a=%0d",cls1.a);
    end
  end
  
endmodule  */

//13.generate unique values without using rand or randc.


/*
class cls;

 bit [4:0] v[10];
 bit [4:0] j;

function new();
  begin
   foreach(v[i])
     v[i]=i;
  end
endfunction
			  
			  

function display();
  begin
    v.shuffle();
    $display("v=%p",v);
    $display("j=%0d",j);
	foreach(v[i])
	 begin
	    j=v[i];
		$display(" foreach j=%0d",j);
	  end
 end
endfunction

endclass

module tb;

cls cls1;
initial
  begin
    cls1=new();
	repeat(2)
	 begin
	   cls1.randomize();
	   cls1.display();
	 end
  
  end


endmodule */


/*14.randomize the belowvariables:
    class randvar;
       rand bit [7:0] var1,var2,var3,var4;
    endclass

   1.randomize all variables.
   2.randomize only var2.
   3.randomize var1 and var4.
   4.randomize var1,var3 and var4. */
   
   
   /*
   class cls;
       rand bit [7:0] var1,var2,var3,var4;
	   
	   function void display1();
	     begin
		   $display("var1=%0d,var2=%0d,var3=%0d,var4=%0d",var1,var2,var3,var4);
		   
		 end	   
	   endfunction
	   
    endclass
   
   module tb;
    
     initial
	   begin
	      cls cls1;
		  cls1=new();
		    repeat(5)
			 begin
			    cls1.randomize();
				cls1.display1();	
			 end
			 $display("-----------------------------");
			 
			 repeat(5)
			 begin
			    cls1.randomize(var2);
				cls1.display1();
			
			 end
			 $display("-----------------------------");
			 repeat(5)
			 begin
			    cls1.randomize(var1,var4);
				cls1.display1();	
			 end
			 $display("-----------------------------");
			 
			 repeat(5)
			 begin
			 
			     cls1.randomize(var1,var4,var3);
				cls1.display1();	
			 end
			 $display("-----------------------------");
		  
	   end
       
   
   
   endmodule*/
   
   
   /*15.write a single constraint to generate  random 
   values for bit [8:0] variable in the below range 1-34,127,129-156,192-202,257-260 */
   
  /* class cls;
   
   rand bit [8:0] v;
     constraint c1{ v inside {[1:34],127,[129:156],[192:202],[257:260]};}
	                
   
   function void display();
     begin
      $display("value v=%0d",v);
	   if(v>1 && v<34)
	    $display("value 1 && 34 v=%0d",v);
		 if(v>129 && v<156)
	    $display("value 129 && 156 v=%0d",v);
		 if(v>192 && v<202)
	    $display("value 192 && 202 v=%0d",v);
		 if(v>257 && v<260)
	    $display("value 257 && 260 v=%0d",v);
		 if(v == 127)
	     $display("value 127 v=%0d",v);
	 
	 end	 
   endfunction
   endclass
   
   module tb;
   cls cls1;
   
   initial
    begin
	  cls1=new();
	  
	  repeat(5)
	    begin
		 cls1.randomize();
		 cls1.display();
		 
		end
	
	end

   endmodule */
   
   
// 16.generate unique random values without using unique constraint.  


/*

class cls;
  rand bit [4:0] data[10];
    bit [4:0] v;  
  
  function void display();
    begin
    $display("data=%p",data);
	  data.shuffle();
	  foreach(data[i])
	    begin
		   data[i] = i;
		      data.shuffle();
		  //  v = data[i];
		   $display("data=%p",data);
		end	
	end
  endfunction
  
endclass


module tb;
cls cls1;

   initial
     begin
	     cls1=new();
		   repeat(5)
		    begin
			  cls1.randomize();
			  cls1.display();
			  
			end
	 end
endmodule */



//18.write a constraint for 16-bit variables 
// such that no two consecutive (continuous )ones should be generated.

/*
  class cls;
    rand bit [15:0] v;
	  
	  constraint c1{foreach(v[i])
	                  {
					    if(v[i] == 1 && i<15)
						  v[i+1]==0;
					  }
                      	  }
	
	  function void display();
        begin
		  
		  $display("v=%0d----v=%0b",v,v);
		end
     endfunction		
	  
	
	
  endclass

  module tb;
    initial
	  begin
	     cls cls1;
		 cls1=new();
		   repeat(5)
		     begin
			   cls1.randomize();
			    cls1.display(); 
			 end
	  end
  endmodule */
  
  
//19.write a constraint using $countones.
/*
class cls;
  rand bit [4:0] v;
  
  constraint c1{$countones(v);}
  
  function display();
     $display("v=%0b",v);
     $display($countones(v));
  endfunction


endclass

module tb;
   cls cls1;
    initial 
	 begin
	    cls1=new();
		repeat(5)
		  begin
		    cls1.randomize();
			cls1.display();
		  end
	 end

 	
endmodule  */


//20.generate a 32-bit random number with only one bit set(should not use $countones).

/*
class cls;
  rand int  v;
  rand bit [4:0] shift;
  
  constraint c1{ v==1<<shift;}
  
  function display();
     $display("v=%0b",v);
     $display("v=%0d",v);
     $display("shift=%0d",shift);
    
  endfunction


endclass

module tb;
   cls cls1;
    initial 
	 begin
	    cls1=new();
		repeat(5)
		  begin
		    cls1.randomize();
			cls1.display();
		  end
	 end

 	
endmodule   */

//21.having 16-bit of 
 //variable,only single bit high values need to be accessed 
 //.write a constraint for that?
 /*
 class cls;
   rand bit[15:0] v;
   
   constraint c1{$onehot(v);}
    function display();
	  $display("v=%0b",v);
	  $display("v=%0d",v);
	endfunction
 
 endclass
 module tb;
  cls cls1;
    initial 
	  begin
	    cls1=new();
		 repeat(5)
		  begin
		  cls1.randomize();
		 cls1.display();
	  end
	  end
  
 
 endmodule */
 
 //22.write a constraint to generate random values for 
 //var1[7:0] within 50 and var2[7:0] with the non-repeated 
 //value in every randomization.
 /*
 class cls;
   rand bit [7:0] var1;
   rand bit [7:0] var2;
    
	constraint c1{var1<50;
	              unique{var2};}
				  
	function display();
	   begin
	     $display("var1=%0d,var2=%0d",var1,var2);
	   end
     endfunction	
 
 endclass
 
 
 module tb;
    initial
	  begin
	     cls cls1=new();
		 repeat(10)
		   begin
		    cls1.randomize();
			cls1.display();
			
		   end
	   end
     
 endmodule */
 
 //23.write a constraint to randomly 
 //generated unique prime numbers in an array between 1 and 200. 
 //the generated prime numbers should have 7 in it (eg:7:17,37...etc)?
 
 
 /*
module test;
class prime_number;
  rand bit [8:0] a[$],b[$];
  constraint abc {a.size==200; }
  constraint cba { foreach(a[i])
    if(i>1 )
     a[i]==prime(i);}
 
  function int prime( int g);
    for(int i=2;i<g;i++)
        if(g%i==0)
          return 2; //if it is not a prime number ,returning 2 which is one of prime
      prime=g;
	  $display("g=%0d",g);
    endfunction
  function void post_randomize();
    a=a.unique;
   for(int i=0;i<a.size;i++)
     if(a[i]%10==7)
       b.push_back(a[i]);  //in b queue you will find prime numbers with units place as 7.
 
  endfunction
endclass
 
prime_number pri;
 
initial
  begin
    pri=new;
    void'(pri.randomize);
    $display("%p",pri);
  end
endmodule */


// 24.write a constraint to generate multiples of power 2?


class cls;
  
  rand bit [4:0] v;
  rand bit [4:0] power;
  
  constraint c1{v==2**power;}
  
  function display();
     $display("power=%0d,v=%0d",power,v);
  endfunction


endclass


module tb;
 cls cls1=new();
 initial
   begin
      repeat(5)
	    begin
		  cls1.randomize();
		  cls1.display();
		  
		end
   end

endmodule