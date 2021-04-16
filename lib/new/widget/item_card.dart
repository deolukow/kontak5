import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'packnomor:google_fonts/google_fonts.dart';

class ItemCard extends StatelessWidget {
  final String nama;
  final int nomor;
  //// Pointer to Update Function
  final Function onUpdate;
  //// Pointer to Delete Function
  final Function onDelete;

  ItemCard(this.nama, this.nomor, {this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Color(0xFF1b1c1e),
        borderRadius: BorderRadius.circular(30),
        // border: Border.all(color: Colors.blue[900])
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    color: Colors.blue,
                    size: 40,
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        // width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          nama, style: TextStyle(color: Colors.white),
                          // style: GoogleFonts.poppins(
                          //     fontWeight: FontWeight.w600, fontSize: 16)
                        ),
                      ),
                      Text(
                        "+62 $nomor", style: TextStyle(color: Colors.white),
                        // style: GoogleFonts.poppins(),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              // SizedBox(
              //   height: 40,
              //   width: 60,
              //   child: RaisedButton(
              //       shape: CircleBorder(),
              //       color: Color(0xFF1b1c1e),
              //       child: Center(
              //           child: Icon(
              //         Icons.arrow_upward,
              //         color: Colors.white,
              //       )),
              //       onPressed: () {
              //         if (onUpdate != null) onUpdate();
              //       }),
              // ),
              SizedBox(
                height: 40,
                width: 60,
                child: RaisedButton(
                    shape: CircleBorder(),
                    color: Color(0xFF1b1c1e),
                    child: Center(
                        child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
                    onPressed: () {
                      // if (onDelete != null) onDelete();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: Text(
                                  "Hapus Data",
                                  style: TextStyle(color: Colors.white),
                                ),
                                content: Text(
                                  "apakah anda yakin?",
                                  style: TextStyle(color: Colors.white),
                                ),
                                actions: [
                                  FlatButton(
                                    child: Text(
                                      "Batal",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  FlatButton(
                                      child: Text("Hapus"),
                                      onPressed: () {
                                        if (onDelete != null) onDelete();
                                        Navigator.pop(context);
                                      }),
                                ],
                                elevation: 100,
                                backgroundColor: Color(0xFF1b1c1e),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))));
                          });
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
