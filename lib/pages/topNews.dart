import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:newsphobia/details/topDetails.dart';

class TopNews extends StatefulWidget {
  @override
  _TopNewsState createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildListView(),
    );
  }




}
class _buildListView extends StatefulWidget {
  @override
  __buildListViewState createState() => __buildListViewState();
}

class __buildListViewState extends State<_buildListView> {


  Future getPost()async{
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('top').getDocuments();
    return qn.documents;
  }
  nav(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> TopDetail(post: post,)));
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      child: FutureBuilder(
        future: getPost(),

        builder: (_, snapshot){
          if(snapshot.connectionState==  ConnectionState.waiting){
            return Center(
              child: Text('Loading'),
            );

          }
          else{
            return ListView.builder(
              shrinkWrap: true,
                itemCount: snapshot.data.length,

                itemBuilder: (_, index){
                  return Column(
                    children: [
                      Padding(padding: EdgeInsets.all(10)),
                      ListTile( title: Image.network(snapshot.data[index].data['img']),
                        subtitle:Text(snapshot.data[index].data['tittle'] ),

                        onTap: (){
                          nav(snapshot.data[index]);
                        },
                      ),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          Text(snapshot.data[index].data['author']),

                        ],
                      )


                      

                    ],

                  );
                });

          }
        },),
    );
  }
}





