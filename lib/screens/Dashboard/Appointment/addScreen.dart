import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectsystem/screens/Dashboard/dashboardScreen.dart';
import 'package:projectsystem/screens/adminFeatures/adminNLscreen/Admin.dart';

class addScreen extends StatefulWidget {
  @override
  _addScreenState createState() => _addScreenState();
}

class _addScreenState extends State<addScreen> {
  late DateTime selectedDate;
  late String selectedTime;
  late String appointmentTitle;
  late String appointmentReason;

  List<Appointment> appointments = [];

  void submitAppointment(BuildContext context) {
    // Retrieve the values from the text fields
    // and create an Appointment object
    Appointment newAppointment = Appointment(
      date: selectedDate,
      time: selectedTime,
      title: appointmentTitle,
      reason: appointmentReason,
    );

    // Add the new appointment to the list
    appointments.add(newAppointment);

    // Navigate to the admin screen for approval or rejection
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AdminScreen(
        appointments: appointments,
        onAppointmentAction: (appointment) {
          // Handle approval or rejection of the appointment
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                padding: EdgeInsets.zero,
                width: MediaQuery.of(context).size.width,
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0x00000000),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.zero,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xff000000),
                          size: 24,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DashboardScreen(),
                          ));
                        },
                      ),
                    ),
                    Text(
                      "CREATE APPOINTMENT",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.blueGrey.shade100,
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Choose Date",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: 350,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime dateTime) {
                      setState(() {
                        selectedDate = dateTime;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Choose Time",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.zero,
                width: 350,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: CupertinoPicker(
                    itemExtent: 32.0,
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedTime = getTimeFromIndex(index);
                      });
                    },
                    children: getPickerTimeItems(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Appointment Title",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.zero,
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      appointmentTitle = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Appointment Reason",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.zero,
                width: 350,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      appointmentReason = value;
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () => submitAppointment(context),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      colors: [Colors.red, Color(0xff800000)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'ADD APPOINTMENT',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.white,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getPickerTimeItems() {
    List<Widget> pickerItems = [];
    for (int i = 0; i < 24; i++) {
      pickerItems.add(Text(getTimeFromIndex(i)));
    }
    return pickerItems;
  }

  String getTimeFromIndex(int index) {
    return '${index.toString().padLeft(2, '0')}:00';
  }
}

class Appointment {
  final DateTime date;
  final String time;
  final String title;
  final String reason;

  Appointment({
    required this.date,
    required this.time,
    required this.title,
    required this.reason,
  });
}
