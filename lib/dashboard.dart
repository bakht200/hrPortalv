import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hrportalv2/add_employees.dart';
import 'package:hrportalv2/chat_screen.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

Stream<QuerySnapshot> getUsers() {
  var data = FirebaseFirestore.instance.collection('users').snapshots();
  print(data.length);
  for (var i = 0; i < 2; i++) {
    data.forEach((element) {
      FirebaseFirestore.instance.doc(element.docs[i].id.toString());
    });
  }
  return FirebaseFirestore.instance.collection('users').snapshots();
}

data2() async {
  var data1 =
      await FirebaseFirestore.instance.collection('user_leave_request').get();

  return data1;
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.chat),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (builder) => ChatScreen()));
          }),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&w=1000&q=80'),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF30475E),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Icon(Icons.notifications)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GridView.count(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 2,
                children: <Widget>[
                  buildSquareButton(
                      Colors.red,
                      Colors.white,
                      Icons.person_2_outlined,
                      ("Active"),
                      StreamBuilder<QuerySnapshot>(
                        stream: getUsers(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final documents = snapshot.data!.docs;
                            print(documents.length);

                            final filteredDocuments = documents.where((doc) =>
                                doc['list'].any((item) =>
                                    item['AVERAGE'] == "0:00:00.000000"));

                            // Get the count of filtered documents
                            final count = filteredDocuments.length;

                            return Text(
                              '$count',
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                              'Error: ${snapshot.error}',
                              style: TextStyle(fontSize: 16),
                            );
                          } else {
                            return Text(
                              'Loading...',
                              style: TextStyle(fontSize: 16),
                            );
                          }
                        },
                      )),
                  buildSquareButton(
                      Colors.blue,
                      Colors.white,
                      Icons.calendar_month,
                      ("Leaves"),
                      StreamBuilder<QuerySnapshot>(
                        stream: getUsers(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final documents = snapshot.data!.docs;

                            // Filter the documents where average != 0
                            final filteredDocuments = documents.where((doc) =>
                                doc['list'] != null &&
                                doc['list'].any((item) =>
                                    item['AVERAGE'] == "0:00:00.000000"));

                            // Get the count of filtered documents
                            final count = filteredDocuments.length;

                            return Text(
                              '$count',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                              'Error: ${snapshot.error}',
                              style: TextStyle(fontSize: 16),
                            );
                          } else {
                            return Text(
                              'Loading...',
                              style: TextStyle(fontSize: 16),
                            );
                          }
                        },
                      )),
                  buildSquareButton(
                      Colors.green,
                      Colors.white,
                      Icons.apartment,
                      ("Total Employees"),
                      StreamBuilder<QuerySnapshot>(
                        stream: getUsers(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final documents = snapshot.data!.docs;

                            // Filter the documents where average != 0
                            final filteredDocuments = documents.where((doc) =>
                                doc['list'] != null &&
                                doc['list'].any((item) =>
                                    item['AVERAGE'] == "0:00:00.000000"));

                            // Get the count of filtered documents
                            final count = filteredDocuments.length;

                            return Text(
                              '$count',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.green),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                              'Error: ${snapshot.error}',
                              style: TextStyle(fontSize: 16),
                            );
                          } else {
                            return Text(
                              'Loading...',
                              style: TextStyle(fontSize: 16),
                            );
                          }
                        },
                      )),
                  GestureDetector(
                    onTap: () {
                      print("object");
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (builder) => AddEmployees()));
                    },
                    child: buildSquareButton(
                        Colors.white,
                        Color.fromARGB(255, 237, 139, 46),
                        Icons.person_add,
                        ("Add Employees"),
                        StreamBuilder<QuerySnapshot>(
                          stream: getUsers(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final documents = snapshot.data!.docs;

                              // Filter the documents where average != 0
                              final filteredDocuments = documents.where((doc) =>
                                  doc['list'] != null &&
                                  doc['list'].any((item) =>
                                      item['AVERAGE'] == "0:00:00.000000"));

                              // Get the count of filtered documents
                              final count = filteredDocuments.length;

                              return Text(
                                '$count',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              );
                            } else if (snapshot.hasError) {
                              return Text(
                                'Error: ${snapshot.error}',
                                style: TextStyle(fontSize: 16),
                              );
                            } else {
                              return Text(
                                'Loading...',
                                style: TextStyle(fontSize: 16),
                              );
                            }
                          },
                        )),
                  ),
                ],
              ),
              Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("user_leave_request")
                          .where('status', isNotEqualTo: 'accepted')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: const CircularProgressIndicator());
                        }
                        final userSnapshot = snapshot.data?.docs;
                        if (userSnapshot!.isEmpty) {
                          return const Text("no data");
                        }
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: userSnapshot.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://media.istockphoto.com/id/1415598585/vector/thin-outline-icon-sheet-of-paper-or-document-in-a-persons-hand-such-line-sign-as-request.jpg?s=612x612&w=0&k=20&c=OEg3W67Td0rqYuNBk_a0lTRWqFbCx2OG7xdaGw7VykE="),
                                ),
                                title: Text(
                                  'Zain Tariq',
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        print(userSnapshot[index]['id']);
                                        await FirebaseFirestore.instance
                                            .collection('user_leave_request')
                                            .doc(userSnapshot[index]['id'])
                                            .update({'status': 'accepted'})
                                            .then((value) =>
                                                print("User Updated"))
                                            .catchError((error) => print(
                                                "Failed to update user: $error"));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Icon(
                                            Icons.done,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Row(
                                  children: [
                                    Text(
                                      userSnapshot[index]["reason"],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      userSnapshot[index]["date"],
                                    ),
                                  ],
                                ),
                              );
                            });
                      }))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSquareButton(Color color, Color color2, IconData icon,
      String reason, var streamBuilder) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: color2,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  icon,
                  size: 48.0,
                  color: color,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                reason,
                style: TextStyle(color: color),
              ),
              streamBuilder
            ],
          ),
          margin: EdgeInsets.all(8.0),
          width: 150,
          height: 150,
        ),
      ],
    );
  }
// }
// class MyWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: getUsers(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final documents = snapshot.data!.docs;

//           // Filter the documents where average != 0
//           final filteredDocuments =
//               documents.where((doc) => doc['list'] != null && doc['list'].any((item) => item['average'] != 0));

//           // Get the count of filtered documents
//           final count = filteredDocuments.length;

//           return Text('Count: $count');
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else {
//           return Text('Loading...');
//         }
//       },
//     );
//   }
// }
}
