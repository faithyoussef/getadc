import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../help.dart';


class appintment_screen extends StatefulWidget {
  const appintment_screen({Key? key}) : super(key: key);

  @override
  State<appintment_screen> createState() => _appintment_screenState();
}

class _appintment_screenState extends State<appintment_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        decoration: kBoxDecoIndigo,
        child: Padding(
        padding: EdgeInsets.all(2.h),
                  child: SingleChildScrollView(
                       child:
                     Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                       SizedBox(
                       height: 2.h,
                     ),
                        AppointmentsColumn(
                           list: novAppointments,
                              month: 'November',
                                 ),
                         SizedBox(
                             height: 2.h,
                            ),
                       AppointmentsColumn(
                                  list: decAppointments,
                                    month: 'December',
                                  ),
                                 ]),
                               ),
                  ),
              ),
       );
  }
}
class AppointmentsColumn extends StatelessWidget {
  final List<AppointmentList> list;
  final String month;
  const AppointmentsColumn({
    Key? key,
    required this.list,
    required this.month,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0.h),
      decoration: kBoxDecoWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(month, style: Theme.of(context).textTheme.headline4),
          SizedBox(
            height: 46.h,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (var i in list)
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.5.h),
                    child: AppointmentTile(
                      appointDate: i.appointDate,
                      appointMonth: i.appointMonth,
                      textColor: i.textColor,
                      iconColor: i.iconColor,
                      appointTime: i.appointTime,
                      doctorType: i.doctorType,
                      color: i.color,
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppointmentTile extends StatelessWidget {
  final String appointDate;
  final String appointMonth;
  final Color textColor;
  final Color color;
  final Color iconColor;
  final String doctorType;
  final String appointTime;
  const AppointmentTile({
    Key? key,
    required this.appointDate,
    required this.appointMonth,
    required this.textColor,
    required this.iconColor,
    required this.appointTime,
    required this.doctorType,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 13.h,
          width: MediaQuery.of(context).size.width * 0.23,
          decoration: kBoxDecoWithBoxShadow.copyWith(color: color,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                appointDate,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: textColor, fontWeight: FontWeight.w600),
              ),
              Text(
                appointMonth,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: textColor),
              ),
            ],
          ),
        ),
        SizedBox(
            width: 1.5.h
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(doctorType, style: Theme.of(context).textTheme.bodyText2),
            SizedBox(
              height: 0.5.h,
            ),
            Text(
              appointTime,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.black38),
            ),
          ],
        ),
        const Spacer(),
        ReusableRawBtn(
          icon: Icons.phone,
          iconColor: iconColor,
          size: 26.0,
        ),
      ],
    );
  }
}
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


class ReusableRawBtn extends StatelessWidget {
  const ReusableRawBtn({Key? key, required Color iconColor, required IconData icon, required double size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
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