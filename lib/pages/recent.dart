import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsphobia/details/recentDetail.dart';

class Recent extends StatefulWidget {
  @override
  _RecentState createState() => _RecentState();
}

class _RecentState extends State<Recent> {


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
    Navigator.push(context, MaterialPageRoute(builder: (context)=> Drecent(post: post,)));
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
              itemCount: snapshot.data.length,

                itemBuilder: (_, index){
              return ListTile( title: Text(snapshot.data[index].data['tittle']),
                onTap: (){
                nav(snapshot.data[index]);
                },


              );
            });

          }
        },),
      );
    }
  }





