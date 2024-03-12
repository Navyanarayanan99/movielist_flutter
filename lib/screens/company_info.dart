import 'package:flutter/material.dart';

class CompanyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'COMPANY INFO',
          style: TextStyle(color: Color.fromARGB(255, 3, 14, 23)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/companylogo.jpg'),
                radius: 50,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.business),
              title: Text(
                'Geeksynergy Technologies Pvt Ltd',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                'Sanjayanagar, Bengaluru-56',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                'XXXXXXXXX09',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(
                'XXXXXX@gmail.com',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
