import 'package:firebase_database/firebase_database.dart';
import 'package:firebasecrud/fbcrud/roundbutton.dart';
import 'package:firebasecrud/fbcrud/utils.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  bool loading = false;
  final postcontroller = TextEditingController();

  final databaseRef = FirebaseDatabase.instance.ref('Post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: postcontroller,
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'what is your name',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundButton(
              title: 'ADD',
              loading: loading,
              onTap: () {
                final dateTime1 =
                    DateTime.now().millisecondsSinceEpoch.toString();
                setState(() {
                  loading = true;
                });
                databaseRef.child(dateTime1).set({
                  'name': postcontroller.text.toString(),
                  'id': dateTime1,
                }).then((value) {
                  Utils().toastMessage('Post added');
                  setState(() {
                    loading = false;
                  });
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                  setState(() {
                    loading = false;
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
