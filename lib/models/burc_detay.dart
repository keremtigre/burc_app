import 'package:burc_app_tekrar/models/feed_back_page.dart';
import 'package:flutter/material.dart';
import 'burc.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:share/share.dart';
class BurcDetay extends StatefulWidget {
  var katiliyorum=0;
  var katilmiyorum=0;
  final Burc secilenBurc;

   BurcDetay({required this.secilenBurc,Key? key}) : super(key: key);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  late PaletteGenerator _paletteGenerator;
Color appBarRengi=Colors.transparent;
  @override
  void initState() {
    super.initState();
    appBarRenginiBul();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              ElevatedButton(onPressed: () async {
                final RenderBox box = context.findRenderObject() as RenderBox;
                Share.share("${widget.secilenBurc.burcAdi} Burcu Özellikleri:\n"+widget.secilenBurc.burcDetayi,subject:widget.secilenBurc.burcAdi ,sharePositionOrigin:box.localToGlobal(Offset.zero)&box.size );

              }, child: Icon(Icons.share),style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ) ,),
             PopupMenuButton(itemBuilder: (context)=>[
               PopupMenuItem(child: Text('Hakkımızda'),value: 1),
               PopupMenuItem(child: Text('Geri Bildirim'),value: 2),
                 ],onSelected: (value){
               if(value==2){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FeedBackPage()));
               }
             },

             )
            ],
expandedHeight: 250,
  backgroundColor: appBarRengi,
            flexibleSpace: FlexibleSpaceBar(
  centerTitle: true,

  title: Text(
      widget.secilenBurc.burcAdi+" Burcu ve Özellikleri"
  ),
  background: Image.asset('images/'+widget.secilenBurc.burcBuyukResim,fit: BoxFit.cover,),
),

pinned: true,
            
          ),
          SliverToBoxAdapter(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(widget.secilenBurc.burcDetayi,style: Theme.of(context).textTheme.bodyText1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed: (){
                      widget.katiliyorum++;
                      setState(() {

                      });
                   }, child: Row(
                      children: [
                         Icon(Icons.thumb_up),
                         SizedBox(width: 10,),
                         Text('Katılıyorum (${widget.katiliyorum})'),
                       ],
                    ),
                    ),
                    ElevatedButton(onPressed: (){
                      widget.katilmiyorum++;
                      setState(() {

                      });
                    }, child: Row(
                      children: [
                        Icon(Icons.thumb_down),
                        SizedBox(width: 10,),
                        Text('Katılmıyorum (${widget.katilmiyorum})'),
                      ],
                    )),
                  ],
                )

                ],

              ),
            ),
          ),

          ),

        ],
      ),
    );
  }

  void appBarRenginiBul() async{
    _paletteGenerator=await PaletteGenerator.fromImageProvider(AssetImage('images/${widget.secilenBurc.burcBuyukResim}'));
    appBarRengi=_paletteGenerator.dominantColor!.color;
    setState(() {

    });
  }
}
