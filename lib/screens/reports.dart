import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_bakery/shared/constants.dart';
import 'package:flutter_my_bakery/shared/bottom_bar.dart';

class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  int seciliSayfa = 0;
  void sayfaDegistir(int index){
    setState(() {
      seciliSayfa = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double size1 = MediaQuery.of(context).size.height / 50;
    double size2 = MediaQuery.of(context).size.height / 35;

    return Scaffold(
      appBar: AppBar(
        title: Text("Reports",style: TextStyle(fontFamily: "Poppins"),),
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context,constraints){
        return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/background3.jpg"),fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    SizedBox(height: size1,),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 20,
                        height: MediaQuery.of(context).size.height / 3 - 20,
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
                              SizedBox(height: size1,),
                              Column(
                                children: [
                                  Text("Kredi kartı ile yapılan satış tutarı",style: textStyle(Colors.purple),),
                                  Text("₺ 300", style: textStyle(Colors.purple),),
                                ],
                              ),
                              SizedBox(height: size1,),
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
                    SizedBox(height: size2,),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3 - 20,
                            height: MediaQuery.of(context).size.height / 4 - 20,
                            child: Container(
                              decoration: BoxDecoration(color: Color(0xff633333),borderRadius: BorderRadius.all(Radius.circular(30.0))),
                              child: Column(
                                children: [
                                  Image(image: AssetImage('assets/images/bread.png')),
                                  Text("Toplam Çıkan Ekmek",style: textStyle2,textAlign: TextAlign.center,),
                                  SizedBox(height: size1,),
                                  Text("1200",style: textStyle3,textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: size1,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3 - 20,
                            height: MediaQuery.of(context).size.height / 4 - 20,
                            child: Container(
                              decoration: BoxDecoration(color: Color(0xff2b516c),borderRadius: BorderRadius.all(Radius.circular(30.0))),
                              child: Column(
                                children: [
                                  Image(image: AssetImage('assets/images/bread.png')),
                                  Text("Dağıtımda Satılan Ekmek",style: textStyle2,textAlign: TextAlign.center,),
                                  SizedBox(height: size1),
                                  Text("1200",style: textStyle3,textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: size1,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3 - 20,
                            height: MediaQuery.of(context).size.height / 4 - 20,
                            child: Container(
                              decoration: BoxDecoration(color: Color(0xff773774),borderRadius: BorderRadius.all(Radius.circular(30.0))),
                              child: Column(
                                children: [
                                  Image(image: AssetImage('assets/images/bread.png')),
                                  Text("Toplam Kalan Ekmek",style:  textStyle2,textAlign: TextAlign.center,),
                                  SizedBox(height: size1,),
                                  Text("1200",style: textStyle3,textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),
        );
      },),
      bottomNavigationBar: myBottomNavigationBar(seciliSayfa, sayfaDegistir),
    );
  }
}

