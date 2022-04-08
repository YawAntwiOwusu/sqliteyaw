import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqliteyaw/models/user_model.dart';
import 'package:sqliteyaw/utils/database_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () async {
              final box = GetStorage();
              box.write('loggedIn', false);
              Navigator.pushNamed(context, "/");
            },
          ),
        ],
      ),
      body: FutureBuilder<User>(
        future: DatabaseHelper.instance.getUser(),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("Loading"),
            );
          }
          return snapshot.data != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 7, 82, 45),
                        radius: 60,
                        child: FlutterLogo(
                          size: 60,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      snapshot.data!.firstName + " " + snapshot.data!.lastName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      snapshot.data!.email,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Text(
                    "No Data",
                  ),
                );
        },
      ),
    );
  }
}
