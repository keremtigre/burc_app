import 'package:burc_app_tekrar/models/burc.dart';
import 'package:burc_app_tekrar/models/burc_detay.dart';
import 'package:flutter/material.dart';

class BurcItem extends StatelessWidget {
  final Burc listeleneBurc;
  const BurcItem({required this.listeleneBurc ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle=Theme.of(context).textTheme;
    return Card(
elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: ListTile(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BurcDetay(secilenBurc: listeleneBurc,)));
          },
          trailing: Icon(Icons.arrow_forward),
          leading: Image.asset("images/"+listeleneBurc.burcKucukResim,width: 64,height: 64,),
          title: Text(
            listeleneBurc.burcAdi,style: myTextStyle.headline5,
          ),
          subtitle: Text(
              listeleneBurc.burcTarihi,style: myTextStyle.subtitle1,
          ),

        ),
      ),
    );
  }
}
