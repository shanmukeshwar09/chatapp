import 'package:chatapp/screens/profile_screen.dart';
import 'package:chatapp/widgets/custom_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Friends extends StatefulWidget {
  final String uid;

  const Friends({Key key, this.uid}) : super(key: key);
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  CustomWidgets _customWidgets = CustomWidgets();
  CollectionReference _usersRef;
  CollectionReference _friendReqRef;

  initRef() {
    _usersRef = Firestore.instance.collection('Users');
    _friendReqRef = _usersRef.document(widget.uid).collection('friends');
  }

  @override
  void initState() {
    initRef();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: StreamBuilder<QuerySnapshot>(
              stream: _friendReqRef.snapshots(),
              builder: (context, friendSnap) {
                if (friendSnap.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: friendSnap.data.documents.length,
                      itemBuilder: (_, index) {
                        return StreamBuilder<DocumentSnapshot>(
                            stream: _usersRef
                                .document(
                                    friendSnap.data.documents[index].documentID)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) {
                                        return ProfileScreen(
                                          name: snapshot.data.data['name'],
                                          status: snapshot.data.data['status'],
                                          thumbUrl:
                                              snapshot.data.data['thumbUrl'],
                                          uid: snapshot.data.documentID,
                                          myUid: widget.uid,
                                        );
                                      }));
                                    },
                                    child: _customWidgets.getDetailedCard(
                                      snapshot.data.data['name'],
                                      'Since ${friendSnap.data.documents[index].data['timestamp']}',
                                      snapshot.data.data['thumbUrl'],
                                    ));
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            });
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ));
  }
}
