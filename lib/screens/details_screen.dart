import 'package:flutter/material.dart';
import 'package:user_data/model/user_model.dart';

class DetailsScreen extends StatelessWidget {
  final UserData user;
  DetailsScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 38, 44, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromRGBO(27, 38, 44, 1),
        title: Text(
          user.name,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


       //---------------------details--------------------------------     
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.blue),
                      title: Text(
                        "Name",
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(user.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.account_circle, color: Colors.blue),
                      title: Text(
                        "Username",
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(user.username,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email, color: Colors.blue),
                      title: Text(
                        "Email",
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(user.email,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.phone, color: Colors.blue),
                      title: Text(
                        "Phone",
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(user.phone,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Divider(),
                    ListTile(
                      leading:
                          Icon(Icons.wifi_2_bar_outlined, color: Colors.blue),
                      title: Text(
                        "Website",
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(user.website,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),


        //-----------------------Address card--------------------------------
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    ListTile(
                      leading: Icon(Icons.location_on, color: Colors.green),
                      title: Text('Street', style: TextStyle(fontSize: 16)),
                      subtitle: Text(user.address.street,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_city, color: Colors.green),
                      title: Text('Suite', style: TextStyle(fontSize: 16)),
                      subtitle: Text(user.address.suite,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_city, color: Colors.green),
                      title: Text('City', style: TextStyle(fontSize: 16)),
                      subtitle: Text(user.address.city,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_city, color: Colors.green),
                      title: Text('Zipcode', style: TextStyle(fontSize: 16)),
                      subtitle: Text(user.address.zipcode,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),


        //-----------------------company card--------------------------------
    
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Company',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    ListTile(
                      leading: Icon(Icons.business, color: Colors.red),
                      title: Text('Name', style: TextStyle(fontSize: 16)),
                      subtitle: Text(user.company.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    ListTile(
                      leading: Icon(Icons.flag, color: Colors.red),
                      title:
                          Text('CatchPhrase', style: TextStyle(fontSize: 16)),
                      subtitle: Text(user.company.catchPhrase,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    ListTile(
                      leading: Icon(Icons.work, color: Colors.red),
                      title: Text('BS', style: TextStyle(fontSize: 16)),
                      subtitle: Text(user.company.bs,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
