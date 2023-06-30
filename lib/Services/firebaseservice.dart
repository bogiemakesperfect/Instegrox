import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdddUser extends StatelessWidget {
  final String Nickname;
  final String csrftoken;
  final int ds_user_id;
  final String sessionid;

  const AdddUser(this.Nickname, this.csrftoken, this.ds_user_id, this.sessionid, {super.key});

  @override
  Widget build(BuildContext context) {
    // users isimli collection'ı çağırıyoruz ve bu erişim değerini 
    // CollectionReference isimli değişkene atıyoruz.

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // CollectionReference'ı çağırarak yeni bir kullanıcı ekliyoruz.

      return users.add({
            'Nickname': Nickname,
            'csrftoken': csrftoken,
            'ds_user_id': ds_user_id,
            'sessionid': sessionid,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: const Text(
        "Add User",
      ),
    );
  }
}