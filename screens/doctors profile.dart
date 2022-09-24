import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../help.dart';

class doctor extends StatefulWidget {
  const doctor({Key? key}) : super(key: key);

  @override
  State<doctor> createState() => _doctorState();
}

class _doctorState extends State<doctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Column(
        children:[
          Container(height: MediaQuery.of(context).size.height,
            decoration: kBoxDecoIndigo,
                   child: Padding(
            padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: const [
                        SizedBox(
                        height: 20.0,
                         ),
                           DoctorWidget(),
                          SizedBox(
                          height: 20,
                          ), DoctorAbout(),
                          SizedBox(
                             height: 20.0,
                              ),
                        //ReusableListTile(),
                   ],),),),),
          Container(padding: const EdgeInsets.all(15.0),
                      decoration: kBoxDecoWhite,
            child: Column(children: [
                        const AboutTile(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const ReusableTimeBtn(
                          btnText: 'Book Appointment',
                          btnColor: const Color(0xff1651DA),
                          textColor: Colors.white,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],),),

                   ],));
  }
}

class ReusableTimeBtn extends StatelessWidget {
  const ReusableTimeBtn({Key? key, required String btnText, required Color btnColor, required Color textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AboutTile extends StatelessWidget {
  const AboutTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctor = ModalRoute.of(context)!.settings.arguments as Doctors;
    return SizedBox(
      width: 95.w,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          doctor.doctorName,
          style: Theme.of(context).textTheme.headline2,
        ),
        subtitle: Text(
          doctor.doctorType,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.black38),
        ),
        trailing: CachedImage(
          doctorImage: doctor.doctorImage,
          height: 60.0,
          width: 60.0,
        ),
      ),
    );
  }
}
class CachedImage extends StatelessWidget {
  final String doctorImage;
  double? width;
  double? height;
  CachedImage({
    Key? key,
    required this.doctorImage,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DoctorAbout extends StatelessWidget {
  const DoctorAbout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctor = ModalRoute.of(context)!.settings.arguments as Doctors;
    return Container(
      height: 20.h,
      padding: const EdgeInsets.all(15.0),
      decoration: kBoxDecoWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About ${doctor.doctorName}',
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            doctor.doctorAbout,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(height: 1.4),
          ),
        ],
      ),
    );
  }
}



class DoctorWidget extends StatelessWidget {
  const DoctorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: kBoxDecoWhite,
      child: Column(children: [
        const AboutTile(),
        const SizedBox(
          height: 20.0,
        ),
        const doctor(),
        const SizedBox(
          height: 30.0,
        ),
        //ATH
        ReusableTimeBtn(
          btnText: 'Book Appointment',
          btnColor: const Color(0xff1651DA),
          textColor: Colors.white,
        ),
        const SizedBox(
          height: 20.0,
        ),
      ]),
    );
  }
}

class  paitentcard extends StatelessWidget {
  const paitentcard ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctor = ModalRoute.of(context)!.settings.arguments as Doctors;

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      DoctorCard(
        color: const Color(0xffff6f00),
        number: '${doctor.doctorPatients}',
        title: 'Patients',
      ),
      DoctorCard(
        color: const Color(0xffff6f00),
        number: '${doctor.doctorPatients}',
        title: 'experience',
      )

    ],
  );
  }
}
class DoctorCard extends StatelessWidget {
  final String title;
  final String number;
  final Color color;
  const DoctorCard(
      {Key? key,
        required this.title,
        required this.number,
        required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      height: MediaQuery.of(context).size.height / 5.0,
      decoration: kBoxDecoWithBoxShadow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline3),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            '${number}+',
            style:
            Theme.of(context).textTheme.headline1!.copyWith(color: color),
          )
        ],
      ),
    );
  }
}

List<Doctors> docs = [
  Doctors(doctorName: 'Christian Frazier', doctorType: 'Heart Surgeon', doctorLocation: 'London', doctorExperience: 12, doctorPatients: 230, doctorAbout: 'Specializes in surgical procedures of the heart, lungs, esophagus, and other organs in the chest.', doctorImage: 'https://images.unsplash.com/photo-1618498082410-b4aa22193b38?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80'),
  Doctors(doctorName: 'Kamilla Andrews', doctorType: 'Neurologists', doctorLocation: 'Bristol', doctorExperience: 7, doctorPatients: 180, doctorAbout: 'Specializes in the anatomy, functions, and organic disorders of nerves and the nervous system.', doctorImage: 'https://images.unsplash.com/photo-1614608682850-e0d6ed316d47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=976&q=80'),
  Doctors(doctorName: 'Angela Yu', doctorType: 'Physiologist', doctorLocation: 'Manchester', doctorExperience: 4, doctorPatients: 130, doctorAbout: 'Specializes in the branch of biology that deals with the normal functions of living organisms and their parts.', doctorImage: 'https://images.pexels.com/photos/4173251/pexels-photo-4173251.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  Doctors(doctorName: 'Max Müller', doctorType: 'Immunologist', doctorLocation: 'London', doctorExperience: 18, doctorPatients: 530, doctorAbout: 'Specializes in health issues brought on by immune system problems', doctorImage: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80'),
  Doctors(doctorName: 'Andrea Bizzotto', doctorType: 'Dentist', doctorLocation: 'Bristol', doctorExperience: 6, doctorPatients: 90, doctorAbout: 'Specializes in teeth, gums, and the mouth. ', doctorImage: 'https://images.pexels.com/photos/4173239/pexels-photo-4173239.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  Doctors(doctorName: 'Mayme Gomez', doctorType: 'Neurologist', doctorLocation: 'Manchester', doctorExperience: 12, doctorPatients: 250, doctorAbout: 'Specializes in the anatomy, functions, and organic disorders of nerves and the nervous system', doctorImage: 'https://images.pexels.com/photos/4989131/pexels-photo-4989131.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  Doctors(doctorName: 'Iva Carpenter', doctorType: 'Radiologist', doctorLocation: 'London', doctorExperience: 2, doctorPatients: 50, doctorAbout: 'Specializes in X-rays or other high-energy radiation, especially a doctor specializing in radiology', doctorImage: 'https://images.pexels.com/photos/4225880/pexels-photo-4225880.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  Doctors(doctorName: 'Martin Smith', doctorType: 'Psychiatrist', doctorLocation: 'London', doctorExperience: 12, doctorPatients: 550, doctorAbout: 'Specializing in the diagnosis and treatment of mental illness', doctorImage: 'https://images.pexels.com/photos/4586993/pexels-photo-4586993.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
];