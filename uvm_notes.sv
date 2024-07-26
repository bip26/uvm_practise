//Basic format of Top:

    module top;
      import uvm_pkg:: *;		//required for all the testbench
      import axi_ic_pkg:: *;		//importing the testbench components pkg

      //declearing interface
      my_dut_interface my_dut_intf();

      //DUT instantiation and connection with TB
      my_dut_rtl my_dut (.if(my_dut_intf));

      initial begin
	//setting virtual interface into config_db for connecting DUT with the tb driver
        uvm_config_db #(virtual my_dut_intf) :: set (null, "*", "DUT_if", my_dut_intf);
        run_test ();	//static methode to start the test 
      end
    endmodule: top

/*
o As config_db is a class. Why it is not required to create the object before use?
   - Since config_db has static methodes(set, get), so we can access static the methodes without creacting the object by using scope resulation(::) operator.
   - The bellow code is the example of having static methode, and accessing the static methode without creating the object. 
*/
  class parent;
    static int a,b;
  
    static function void display();
      $display ("a=%0d , b=%0d",a,b);
    endfunction
  endclass:parent


  module top;
    initial begin
      parent:: a= 32;
      parent:: b= 64;
      parent:: display();	//calling the static methode
    end
  endmodule














