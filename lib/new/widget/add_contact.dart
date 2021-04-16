import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController _nameController, _numberController;

  CollectionReference _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference dataKontak = firestore.collection(user.email);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // backgroundColor: Color(0xFF1b1c1e),
        title: Text('Tambah Kontak'),
      ),
      body: Container(
        color: Colors.black,
        margin: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // SizedBox(
            //   height: 35,
            // ),
            Column(
              children: [
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.account_circle_outlined,
                      color: Colors.blue,
                      size: 120,
                    ),
                    //kalo ini pake foto
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(100),
                    //     image: DecorationImage(
                    //         image: NetworkImage(
                    //             "https://yt3.ggpht.com/yti/ANoDKi714iJfc29mVF_OjmIirAOkYaZrUp4CzSsK_ULu=s88-c-k-c0x00ffffff-no-rj-mo"),
                    //         fit: BoxFit.cover)),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),

                ///ini tu kolom input
                Theme(
                  data: Theme.of(context).copyWith(
                      primaryColor: Colors.blue, focusColor: Colors.purple),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _nameController,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        hintText: 'Masukan Nama',
                        hintStyle: TextStyle(color: Colors.white54),
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Colors.white54,
                          size: 25,
                        ),
                        fillColor: Color(0xFF1b1c1e),
                        filled: true,
                        contentPadding: EdgeInsets.all(15)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _numberController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      hintText: 'Masukan Nomor',
                      hintStyle: TextStyle(color: Colors.white54),
                      prefixIcon: Icon(
                        Icons.phone_android,
                        color: Colors.white54,
                        size: 25,
                      ),
                      fillColor: Color(0xFF1b1c1e),
                      filled: true,
                      contentPadding: EdgeInsets.all(15)),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 50,
                  margin: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: Text(
                      'Batal',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF418FF5),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      batal();
                    },
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: 150,
                  height: 50,
                  margin: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: Text(
                      'Simpan',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF418FF5),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      dataKontak.add({
                        'nama': _nameController.text,
                        'nomor': int.tryParse(_numberController.text) ?? 0
                      });

                      batal();
                    },
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void batal() {
    Navigator.pop(context);
  }

  // void saveContact() {
  //   String name = _nameController.text;
  //   String number = _numberController.text;

  //   Map<String, String> contact = {
  //     'name': name,
  //     "number": number,
  //   };
  //   _ref.push().set(contact).then((value)
  //   {
  //     Navigator.pop(context);
  //   });
  // }
}
