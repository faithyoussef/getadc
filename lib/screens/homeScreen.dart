import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../help.dart';
import '../widgets/searchfield.dart';
import 'appointment_screen.dart';
import 'doctors profile.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
    decoration: kBoxDecoIndigo,
    child: Padding(
    padding: EdgeInsets.all(2.0.h),
    child: const HomeWidgets(),
      ),
      ),
    );
  }
}
class HomeWidgets extends StatelessWidget {
  const HomeWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 5.0.h,
        ),
        const HomeSearchBar(),
        SizedBox(
          height: 2.0.h,
        ),
        const HomeCalendar(),
        SizedBox(
          height: 2.0.h,
        ),
        const HomeDoctorTile(
          doctorName: 'Dr. ChatBot',
          doctorImage:
          'https://images.pexels.com/photos/5733421/pexels-photo-5733421.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          doctorType: 'Assistant',
        )
      ]),
    );
  }
}

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 32.h,
      padding: EdgeInsets.all(1.0.h),
      decoration: kBoxDecoWhite,
      child: Column(
        children: [
          Text(
            'Let\'s find your doctor',
            style: Theme.of(context).textTheme.headline4!.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 3.0.h,
          ),
          const RawBtnRow(),
          SizedBox(
            height: 3.0.h,
          ),
          const searchfield(),
          SizedBox(
            height: 3.0.h,
          ),
        ],
      ),
    );
  }
}

class RawBtnRow extends StatelessWidget {
  const RawBtnRow({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ReusableRawBtn(
            icon: Icons.medication,
            iconColor: const Color(0xffff6f00),
            size: 24.0.sp,
          ),
        ),
        Expanded(
          child: ReusableRawBtn(
            icon: Icons.medical_services,
            iconColor: const Color(0xffDA165E),
            size: 24.0.sp,
          ),
        ),
        Expanded(
          child: ReusableRawBtn(
            icon: Icons.favorite,
            iconColor: const Color(0xff1565C0),
            size: 24.0.sp,
          ),
        ),
        Expanded(
          child: ReusableRawBtn(
            icon: Icons.accessible,
            iconColor: const Color(0xff0E7723),
            size: 24.0.sp,
          ),
        ),
      ],
    );
  }
}

class HomeCalendar extends StatelessWidget {
  const HomeCalendar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      padding: EdgeInsets.all(2.0.h),
      decoration: kBoxDecoWhite,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text('')
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class HomeDoctorTile extends StatelessWidget {
  const HomeDoctorTile({
    Key? key,
    required this.doctorName,
    required this.doctorType,
    required this.doctorImage,
  }) : super(key: key);

  final String doctorName;
  final String doctorType;
  final String doctorImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecoWhite,
      padding: EdgeInsets.all(2.0.h),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                doctorName,
                style: Theme.of(context).textTheme.headline3,
              ),
              subtitle: Text(
                doctorType,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.black38),
              ),
              trailing: CachedImage(
                doctorImage: doctorImage,
                height: 70.0,
                width: 70.0,
              ),
            ),
          ),
          SizedBox(
            /*height: 10.0,*/
            height: 2.0.h,
          ),
          Row(
            children: [
              Text(
                'Available for your need',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: const Color(0xff1651DA),
                ),
              ),
              const Spacer(),
              ReusableMaterialBtn(
                text: 'Contact',
                width: 0.25,
                color: Colors.white,
                function: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ReusableMaterialBtn extends StatelessWidget {
  final double width;
  final String text;
  final Function function;
  final Color color;
  const ReusableMaterialBtn({
    Key? key,
    required this.width,
    required this.text,
    required this.function,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(5.0),
      color: color,
      child: InkWell(
        borderRadius: BorderRadius.circular(5.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * width,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ),
        onTap: () => function(),
      ),
    );
  }
}
