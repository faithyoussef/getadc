
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';
import 'package:getadc/help.dart';
import '../help.dart';
import 'doctors profile.dart';

class counselling extends StatelessWidget {
  const counselling({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBoxDecoIndigo,
        height: MediaQuery.of(context).size.height * 1.2,
             child: SingleChildScrollView(
           child: Column(
             children:  const [
               SizedBox(height: 70.0,),
               CircleAvatarChatRow(),
               SizedBox(
                 height: 20.0,
               ),
               ChatRow(),
             ],
           ),
           ),
      ),
    );
  }
}
class CircleAvatarChatRow extends StatelessWidget {
  const CircleAvatarChatRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: <Widget>[
      const Padding(
      padding: EdgeInsets.only(right: 15.0, left: 15.0),
      child: ChatStory(),
    ),
              Row(
                  children: List.generate(chats.length, (index) {
            return Padding(
             padding: const EdgeInsets.only(right: 15.0),
               child: Column(
                  children: [
                    SizedBox(
                          width: 60.0,
                    height: 60.0,
                    child: Stack(
                         children: [
                                 chats[index].hasStory
                                   ? ChatContainer(index: index)
                                       : CachedImage(
                                doctorImage: chats[index].image,
                                        height: 70.0,
                               width: 70.0,
                                         ),
                                    chats[index].isOnline
                                  ? const ChatPositioned()
                                   : Container()
                                     ],
                                 ),
                                    ),

                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: 75.0,
                      child: Align(
                          child: Text(
                            chats[index].doctor,
                            style: Theme.of(context).textTheme.bodyText1,
                            overflow: TextOverflow.ellipsis,
                          )),
                    )
                  ],),
              );
              }
              ))],
      ),);
  }
}
class ChatStory extends StatelessWidget {
  const ChatStory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade300,
          ),
          child: const Center(
            child: Icon(UniconsLine.plus,
              size: 30.0, color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          width: 75.0,
          child: Align(
            child: Text(
              'Story',
              style: Theme.of(context).textTheme.bodyText1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }
}

class ChatPositioned extends StatelessWidget {
  const ChatPositioned({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40.0,
      left: 42.0,
      child: Container(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          color: const Color(0xff0E7723),
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}

class ChatContainer extends StatelessWidget {
  final int index;
  const ChatContainer({
    Key? key,
    required this.index,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xff1651DA),
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: CachedImage(
          doctorImage: chats[index].image,
          height: 75.0,
          width: 75.0,
        ),
      ),
    );
  }
}

class ChatRow extends StatelessWidget {
  const ChatRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(chats.length, (index) {
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 5.0,
              top: 5.0,
              bottom: 5.0,
            ),
            child: Row(children: [
              SizedBox(
                width: 70.0,
                height: 60.0,
                child: Stack(
                  children: [
                    chats[index].hasStory
                        ? ChatContainer(index: index)
                        : CachedImage(
                      doctorImage: chats[index].image,
                      height: 70.0,
                      width: 70.0,
                    ),
                    chats[index].isOnline
                        ? const ChatPositioned()
                        : Container()
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: ListTile(
                  title: Text(
                    chats[index].doctor,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle: Text(
                    chats[index].message,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black38),
                  ),
                  trailing: Text(
                    chats[index].dateTime,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.black38,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              )
            ]),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewChatScreen(
                doctorName: chats[index].doctor,
                doctorImage: chats[index].image,
                isOnline: chats[index].isOnline,
              ),
              settings: RouteSettings(arguments: chats[index]),
            ),
          ),
        );
      }),
    );
  }
}
class NewChatScreen extends StatelessWidget {
  final String doctorName;
  final String doctorImage;
  final bool isOnline;
  const NewChatScreen(
      {Key? key,
        required this.doctorName,
        required this.doctorImage,
        required this.isOnline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Stack(
        children: [
          SizedBox(
            height: 81.h,
            child: const ChatListView(),
          ),
          const ChatButtonBar(),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: SafeArea(
        child: Container(
          decoration: kBoxDecoIndigo,
          padding: EdgeInsets.only(right: 1.5.h, top: 0.5.h),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black87,
                ),
              ),
              CachedImage(
                doctorImage: doctorImage,
                height: 40.0,
                width: 40.0,
              ),
              SizedBox(
                width: 1.5.h,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      doctorName,
                      style: GoogleFonts.yantramanav(
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      isOnline == false ? 'Offline' : 'Online',
                      style: GoogleFonts.yantramanav(
                        color: Colors.grey.shade600,
                        fontSize: 12.0.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatButtonBar extends StatelessWidget {
  const ChatButtonBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: EdgeInsets.all(1.0.h),
        color: Colors.white,
        height: 8.0.h,
        width: double.infinity,
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Icon(
                UniconsLine.paperclip,
                color: Colors.grey.shade400,
                size: 30.0,
              ),
            ),
            SizedBox(
              width: 1.5.h,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "Write message...",
                  hintStyle: GoogleFonts.yantramanav(
                    color: Colors.black54, fontSize: 16.0.sp,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              width: 1.5.h,
            ),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(
                UniconsLine.message,
                color: Colors.white,
                size: 20,
              ),
              backgroundColor: const Color(0xff1651DA),
              elevation: 0,
            ),
          ],
        ),
      ),
    );
  }
}

class ChatListView extends StatelessWidget {
  const ChatListView({
    Key? key,
  }) : super(key: key);

  get chats => Chat;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: kBoxDecoIndigo,
            height: 12.h,
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              top: 10.0,
              bottom: 15.0,
            ),
            child: Align(
              alignment: (chats[index].messageType == 'receiver'
                  ? Alignment.topLeft
                  : Alignment.topRight),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: (chats[index].messageType == 'receiver'
                      ? Colors.white.withOpacity(0.5)
                      : Colors.blue.shade200),
                ),
                padding: EdgeInsets.all(2.0.h),
                child: Text(
                  chats[index].message,
                  style: TextStyle(fontSize: 12.0.sp),
                ),
              ),
            ),
          );
        });
  }
}
