import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TouristSitesPage extends StatelessWidget {
  final User user;

  const TouristSitesPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sitios Turísticos'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Sitios_turisticos')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;

              return Card(
                child: ListTile(
                  title: Text(data['Nombre']),
                  subtitle: Text(data['Descripción']),
                  leading: Image.network(
                    "${data['Imagen_url']}?alt=media",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TouristSitesPage(user: FirebaseAuth.instance.currentUser!),
  ));
}
