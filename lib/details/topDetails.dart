

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TopDetail extends StatefulWidget {
  final DocumentSnapshot post;
  TopDetail({this.post});
  @override
  _TopDetailState createState() => _TopDetailState();
}

class _TopDetailState extends State<TopDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(widget.post.data['desc']),
      ),
    );
  }
}
