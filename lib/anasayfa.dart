import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  late double ilkSayi;
  late double ikinciSayi;
  late String gecmis="";
  late String textYazdir="";
  late String sonuc;
  late String operator;

  void btnClick(String btnDeger){
    print(btnDeger);

    if(btnDeger=="AC"){
      textYazdir="";
      ilkSayi=0;
      ikinciSayi=0;
      gecmis="";
      sonuc="";
    } else if(btnDeger == 'C') {
      textYazdir="";
      ilkSayi=0;
      ikinciSayi=0;
      sonuc="";
    }
    else if(btnDeger=="+/-"){
      if(textYazdir[0]!='-'){
        sonuc="-"+textYazdir;
      }else{
        sonuc=textYazdir.substring(1);
      }
    }
    else if(btnDeger=="+" || btnDeger=="-" || btnDeger=="X" || btnDeger=="/"){
      ilkSayi=double.parse(textYazdir);
      sonuc="";
      operator=btnDeger;
    }else if(btnDeger=="="){
      ikinciSayi=double.parse(textYazdir);
      if(operator=="+"){
        sonuc=(ilkSayi+ikinciSayi).toString();
        gecmis=ilkSayi.toString()+operator.toString()+ikinciSayi.toString();
      }
      if(operator=="-"){
        sonuc=(ilkSayi-ikinciSayi).toString();
        gecmis=ilkSayi.toString()+operator.toString()+ikinciSayi.toString();
      }
      if(operator=="X"){
        sonuc=(ilkSayi*ikinciSayi).toString();
        gecmis=ilkSayi.toString()+operator.toString()+ikinciSayi.toString();
      }
      if(operator=="/"){
        sonuc=(ilkSayi/ikinciSayi).toString();
        gecmis=ilkSayi.toString()+operator.toString()+ikinciSayi.toString();
      }
    }else{
      sonuc=int.parse(textYazdir+btnDeger).toString();
    }
    setState(() {
      textYazdir=sonuc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hesap Makinesi",style: TextStyle(color: Colors.white),),backgroundColor: Colors.deepOrange,centerTitle: true),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Container(
                padding: EdgeInsets.only(right: 12) ,
                child: Text(gecmis,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.grey),),
                alignment: Alignment(1.0,1.0),
              ),
              Container(padding:EdgeInsets.all(12),child: Text(textYazdir,maxLines: 1,style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),),
                alignment: Alignment(1.0,1.0),
              ),

              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buton("AC", Colors.grey, Colors.black,btnClick),
                  Buton("+/-", Colors.grey, Colors.black,btnClick),
                  Buton("C", Colors.grey, Colors.black,btnClick),
                  Buton("/", Colors.orange, Colors.black,btnClick),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buton("7", Colors.white, Colors.black,btnClick),
                  Buton("8", Colors.white, Colors.black,btnClick),
                  Buton("9", Colors.white, Colors.black,btnClick),
                  Buton("X", Colors.orange, Colors.black,btnClick),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buton("4", Colors.white, Colors.black,btnClick),
                  Buton("5", Colors.white, Colors.black,btnClick),
                  Buton("6", Colors.white, Colors.black,btnClick),
                  Buton("-", Colors.orange, Colors.black,btnClick),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buton("1", Colors.white, Colors.black,btnClick),
                  Buton("2", Colors.white, Colors.black,btnClick),
                  Buton("3", Colors.white, Colors.black,btnClick),
                  Buton("+", Colors.orange, Colors.black,btnClick),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){btnClick("0");},
                    child: Text("0",style: TextStyle(fontSize: 35,color: Colors.black),),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder(),padding: EdgeInsets.fromLTRB(80, 10, 80,10)),),
                  Buton("00", Colors.white, Colors.black,btnClick),
                  Buton("=", Colors.orange, Colors.black,btnClick),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Buton extends StatelessWidget {
  String butonText;
  Color butonColor;
  Color textColor;
  Function calistir;


  Buton(this.butonText, this.butonColor, this.textColor, this.calistir);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(onPressed: (){
        calistir(butonText);
      },
        child:Text(butonText,style: TextStyle(color: textColor,fontSize: 35),),
        style:ElevatedButton.styleFrom(backgroundColor: butonColor,shape: CircleBorder(),padding: EdgeInsets.all(10)),
      ),
    );
  }
}


