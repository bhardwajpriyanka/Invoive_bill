import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice/model.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home>{
  TextEditingController txtname =TextEditingController();
  TextEditingController txtamount = TextEditingController();
  TextEditingController txtqty = TextEditingController();
  List <Model> l1=[];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.blue,
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.arrow_back_ios_new_rounded)),
            ],
            centerTitle: true,
            title: Text(
              "Invoice",
                style:GoogleFonts.roboto(
                color: Colors.black,fontSize: 30,
                fontWeight: FontWeight.w400,
              ) ,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: txtname,
                  decoration:InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: "Add Product"
                    ),
                  ) ,
                SizedBox(height: 10),
                TextFormField(
                  controller: txtamount,
                  decoration:InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      hintText: "Amount"
                  ),
                ) ,
                SizedBox(height: 10),
                TextFormField(
                  controller: txtqty,
                  decoration:InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      hintText: "Quantity"
                  ),
                ) ,
                SizedBox(height: 15,),
                InkWell(
                  onTap: () {
                    Model d1= Model(name: txtname.text,amount: txtamount.text,quantity: txtqty.text);
                    setState(() {
                      l1.add(d1);
                      });
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "Add",style: TextStyle(color: Colors.lightBlueAccent.shade100,fontWeight: FontWeight.w600,fontSize: 20),),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                    child: Container(
                      child: ListView.builder(
                          itemBuilder: (context,index){
                            return View(l1[index],index);
                          },
                        itemCount: l1.length,
                      ),
                    ),
                 ),

                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent,
                  ),
                   child: Center(
                       child: Text("Generate",style: TextStyle(color: Colors.white,fontSize: 20),
                       ),
                   ),
                ),
              ],
            ),
          ),
        ),
    );
  }
  Widget View(Model l2,int a1)
  {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blue),
         ),
          child: Row(
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    l1.removeAt(a1);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.delete,color: Colors.black,size: 20,
                  ),
                ),
              ),
               Text("Product: ${l2.name}",style: TextStyle(fontSize:20,color: Colors.blue.shade100
                 ),
               ),
               Text("Amount:${l2.amount}",style: TextStyle(fontSize: 20,color: Colors.blue.shade100
                ),
               ),
               Text("Quantity:${l2.quantity}",style:TextStyle(fontSize: 20,color: Colors.blue.shade100
                ),
               ),
            ],
          ),
        ),
     );
   }
}
