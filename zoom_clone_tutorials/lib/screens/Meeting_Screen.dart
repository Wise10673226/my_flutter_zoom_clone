import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone_tutorials/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone_tutorials/widgets/home_meeting_button.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({Key? key}) : super(key: key);

  @override
  State<MeetingScreen> createState() => MeetingScreenState();
}

class MeetingScreenState extends State<MeetingScreen> {
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }



  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, 'video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
                onPressed: createNewMeeting,
                icon: Icons.videocam,
                text: "New meeting"),
            HomeMeetingButton(
                onPressed: () => joinMeeting(context),
                icon: Icons.add_box_rounded,
                text: "Join meeting"),
            HomeMeetingButton(
                onPressed: () {}, icon: Icons.calendar_today, text: "Schedule"),
            HomeMeetingButton(
                onPressed: () {}, icon: Icons.calendar_today, text: "Schedule"),
            HomeMeetingButton(
                onPressed: () {},
                icon: Icons.arrow_upward_rounded,
                text: "Share screen"),
          ],
        ),
        const Expanded(
            child: Center(
          child: Text(
            "Create or Join meetings with just a click!",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ))
      ],
    );
  }
}
