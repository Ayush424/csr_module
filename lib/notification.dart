import "package:flutter/material.dart";

class notification extends StatefulWidget {
  notification({Key? key}) : super(key: key);

  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton.icon(
        icon: Icon(Icons.check),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(45, 55, 72, 1)),
        ),
        label: Text('Mark as Read'),
        onPressed: () {
          _asyncSimpleDialog(context);
        },
      ),
    );
  }
}

var today = new DateTime.now();
var fiftyDaysFromNow = today.add(new Duration(hours: 1));

_asyncSimpleDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) => Padding(
      padding: const EdgeInsets.all(40),
      child: Align(
        alignment: Alignment.topRight,
        child: Material(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              width: 500,
              child: ListView(
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Notification',
                    style: TextStyle(
                        color: Color.fromARGB(255, 42, 67, 101),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: ListTile(
                              leading: Icon(Icons.notification_add),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Wrap(
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text("$fiftyDaysFromNow")),
                                  ],
                                ),
                              ),
                              // trailing: Text("$newDate"),
                              title: Text(
                                  "Notification of the day to be added to the main $index")),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
