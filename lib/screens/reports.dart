import 'package:flutter/material.dart';

class Reports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Reports",style: TextStyle(fontFamily: "Poppins"),),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/background3.jpg"),fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              SizedBox(height: 15,),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 300,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text("Vitrinden toplam satış tutarı",style: textStyle(Colors.green),),
                            Text("₺ 300", style: textStyle(Colors.green),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Column(
                          children: [
                            Text("Kredi kartı ile yapılan satış tutarı",style: textStyle(Colors.purple),),
                            Text("₺ 300", style: textStyle(Colors.purple),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Column(
                          children: [
                            Text("Kasada olması gereken tutar",style: textStyle(Colors.blue),),
                            Text("₺ 300", style: textStyle(Colors.blue),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}

TextStyle textStyle(Color color){
  return TextStyle(fontFamily: "Poppins",fontSize: 18,color: color);
}