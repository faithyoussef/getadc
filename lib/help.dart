


import 'package:flutter/material.dart';

var kBoxDecoIndigo = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Colors.white.withOpacity(0.30),
      Colors.indigo.withOpacity(0.10),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomCenter,
    stops: const [0.0, 1.0],
  ),

);

var kBoxDecoWhite = BoxDecoration(
  borderRadius: BorderRadius.circular(10.0),
  border: Border.all(color: Colors.white.withOpacity(0.08)),
  gradient: LinearGradient(
    colors: [
      Colors.white.withOpacity(0.5),
      Colors.white.withOpacity(0.2),
    ],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    stops: const [0.0, 1.0],
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.indigo.withOpacity(0.02),
      spreadRadius: 1,
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ],
);

var kBoxDecoWithBoxShadow = BoxDecoration(
  borderRadius: BorderRadius.circular(5.0),
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 2,
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ],
);


class Doctors {
  String doctorName;
  String doctorType;
  String doctorLocation;
  int doctorExperience;
  int doctorPatients;
  String doctorAbout;
  String doctorImage;

  Doctors({
    required this.doctorName,
    required this.doctorType,
    required this.doctorLocation,
    required this.doctorExperience,
    required this.doctorPatients,
    required this.doctorAbout,
    required this.doctorImage,
  });
}
////////////////////////////////////

class Chat {
  String message;
  String doctor;
  String dateTime;
  String image;
  bool isOnline;
  bool hasStory;
  String messageType;

  Chat(
      {required this.message,
        required this.doctor,
        required this.dateTime,
        required this.image,
        required this.isOnline,
        required this.hasStory,
        required this.messageType});
}

List<Chat> chats = [
  Chat(message: 'Hello there!', doctor: 'Angela', dateTime: 'Yesterday', image: 'https://images.pexels.com/photos/4173251/pexels-photo-4173251.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', hasStory: true, isOnline: true, messageType: 'sender'),
  Chat(message: 'Hi how are you?', doctor: 'Max', dateTime: 'Friday', image: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80', hasStory: false, isOnline: true, messageType: 'receiver'),
  Chat(message: 'Are you taking a shift tomorrow?', doctor: 'Martin', dateTime: '27 Oct', image: 'https://images.pexels.com/photos/4586993/pexels-photo-4586993.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', hasStory: true, isOnline: false, messageType: 'sender'),
  Chat(message: 'No, still on vacation', doctor: 'Iva', dateTime: '25 Oct', image: 'https://images.pexels.com/photos/4225880/pexels-photo-4225880.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', hasStory: false, isOnline: true, messageType: 'receiver'),
  Chat(message: 'Oh ok!', doctor: 'Birgitte', dateTime: '20 Oct', image: 'https://images.unsplash.com/photo-1614608682850-e0d6ed316d47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=976&q=80', hasStory: true, isOnline: false, messageType: 'sender'),
  Chat(message: 'I come back on saturday', doctor: 'Mayme', dateTime: '13 Oct', image: 'https://images.pexels.com/photos/4989131/pexels-photo-4989131.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', hasStory: false, isOnline: false, messageType: 'receiver'),
  Chat(message: 'See ya there!', doctor: 'Christian', dateTime: '10 Oct', image: 'https://images.unsplash.com/photo-1618498082410-b4aa22193b38?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80', hasStory: false, isOnline: true, messageType: 'sender'),
];
//////////////////////////////

List<AppointmentList> novAppointments = [
  AppointmentList(
      appointTime: '09:30 AM',
      appointMonth: 'Nov',
      textColor: Colors.white,
      color: const Color(0xffDA165E),
      iconColor: const Color(0xffDA165E),
      doctorType: 'Heart Surgeon',
      appointDate: '10'),
  AppointmentList(
      appointTime: '11:30 AM',
      appointMonth: 'Nov',
      textColor: Colors.white,
      color: const Color(0xff1651DA),
      iconColor: const Color(0xff1651DA),
      doctorType: 'ECG TEST',
      appointDate: '16'),
  AppointmentList(
      appointTime: '10:30 AM',
      appointMonth: 'Nov',
      textColor: Colors.white,
      color: const Color(0xffff6f00),
      iconColor: const Color(0xffff6f00),
      doctorType: 'Radiologist',
      appointDate: '25'),
];

List<AppointmentList> decAppointments = [
  AppointmentList(
      appointTime: '10:30 AM',
      appointMonth: 'Dec',
      textColor: Colors.black87,
      color: Colors.white,
      iconColor: Colors.black87,
      doctorType: 'Dentist',
      appointDate: '12'),
  AppointmentList(
      appointTime: '11:30 AM',
      appointMonth: 'Dec',
      textColor: Colors.black87,
      color: Colors.white,
      iconColor: Colors.black87,
      doctorType: 'Physiologist',
      appointDate: '20'),
  AppointmentList(
      appointTime: '14:00 PM',
      appointMonth: 'Dec',
      textColor: Colors.black87,
      color: Colors.white,
      iconColor: Colors.black87,
      doctorType: 'Neurologists',
      appointDate: '29'),
];
class AppointmentList {
  String appointTime;
  String appointMonth;
  Color textColor;
  Color color;
  Color iconColor;
  String doctorType;
  String appointDate;

  AppointmentList(
      {required this.appointTime,
        required this.appointMonth,
        required this.textColor,
        required this.color,
        required this.iconColor,
        required this.doctorType,
        required this.appointDate});
}