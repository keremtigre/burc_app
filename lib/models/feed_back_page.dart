import 'package:flutter/material.dart';
class FeedBackPage extends StatefulWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bize Geri bildirim Gönder"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
               Padding(
                 padding: EdgeInsets.only(top: 80,left: 30,right: 30),
                 child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Geri bildiriminizi buraya Yazın',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.solid
                      )
                    )
                  ),
                  maxLines: 6,
                  maxLength: 300,

              ),
               ),


             ElevatedButton(onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Teşekkürler ! Geri bildiriminiz gönderildi')));
              },
                  child: Text('Gönder'),
              ),

          ],
        ),
      ),
    );
  }
}
