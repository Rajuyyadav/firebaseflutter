import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebasecrud/fbcrud/add.dart';
import 'package:firebasecrud/fbcrud/utils.dart';
import 'package:flutter/material.dart';

class FireBaseCrudOne extends StatefulWidget {
  const FireBaseCrudOne({Key? key}) : super(key: key);

  @override
  State<FireBaseCrudOne> createState() => _FireBaseCrudOneState();
}

class _FireBaseCrudOneState extends State<FireBaseCrudOne> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Post');
  final searchFilter = TextEditingController();
  final editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Hello data'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: searchFilter,
              // style: TextStyle(color: Colors.blue),
              decoration: const InputDecoration(
                hintText: 'search',
                border: OutlineInputBorder(),
              ),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),

          /*
          Expanded(
              child: StreamBuilder(
                  stream: ref.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      Map<dynamic, dynamic> map =
                          snapshot.data!.snapshot.value as dynamic;
                      List<dynamic> list = [];
                      list.clear();
                      list = map.values.toList();

                      return ListView.builder(
                        itemCount: snapshot.data!.snapshot.children.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(list[index]['name']),
                          subtitle: Text(list[index]['id']),
                        ),
                      );
                    }
                  })), //       method one to write this thing.
*/

          Expanded(
            child: FirebaseAnimatedList(
                defaultChild: Text('loading'),
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  final name = snapshot.child('name').value.toString();
                  final id = snapshot.child('id').value.toString();

                  if (searchFilter.text.isEmpty) {
                    return ListTile(
                      title: Text(snapshot.child('name').value.toString()),
                      subtitle: Text(snapshot.child('id').value.toString()),
                      trailing: PopupMenuButton(
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                              child: ListTile(
                            onTap: () {
                              Navigator.pop(context);

                              showDialogE(name, id);
                            },
                            leading: const Icon(Icons.edit),
                            title: const Text('Edit'),
                          )),
                          PopupMenuItem(
                              child: ListTile(
                            onTap: () {
                              Navigator.pop(context);

                              ref
                                  .child(snapshot.child('id').value.toString())
                                  .remove();
                            },
                            leading: Icon(Icons.delete),
                            title: Text('Delete'),
                          )),
                        ],
                      ),
                    );
                  } else if (name
                      .toLowerCase()
                      .contains(searchFilter.text.toLowerCase())) {
                    return ListTile(
                      title: Text(snapshot.child('name').value.toString()),
                      subtitle: Text(snapshot.child('id').value.toString()),
                    );
                  } else {
                    return Container();
                  }
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPost()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showDialogE(String name, String id) {
    editController.text = name;

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('update'),
            content: TextFormField(
              controller: editController,
              decoration: const InputDecoration(hintText: 'Edit'),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('cancel')),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  ref.child(id).update(
                    {
                      'name': editController.text.toLowerCase(),
                    },
                  ).then((value) {
                    Utils().toastMessage('Post Update');
                  }).onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                  });
                },
                child: Text('update'),
              ),
            ],
          );
        });
  }

  // Future showDialogD() {
  //   return;
  // }
}
