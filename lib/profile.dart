import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unity_instagram/home.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static const String route = '/';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Screenshot your profile after you done filling the fields and setting your avatar pic"),
              SizedBox(
                height: 20,
              ),
              ProfileSticker(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileSticker extends StatelessWidget {
  const ProfileSticker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset("assets/blank_profile.png"),
      AvatarField(),
      NameField(),
      BirthdayField(),
      TeamField(),
      EnlistmentField()
    ]);
  }
}

class AvatarField extends StatefulWidget {
  const AvatarField({
    Key? key,
  }) : super(key: key);

  @override
  State<AvatarField> createState() => _AvatarFieldState();
}

class _AvatarFieldState extends State<AvatarField> {
  Uint8List? _pickedImage;

  Future pickProfilePic() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        print("Image is null");
        return;
      }
      var selectedImageData = await image.readAsBytes();

      setState(() {
        _pickedImage = selectedImageData;
      });
    } on PlatformException catch (e) {
      print("Failed to pick an image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.036,
            MediaQuery.of(context).size.width * 0.027,
            MediaQuery.of(context).size.width * 0.26,
            0),
        child: GestureDetector(
          onTap: () => pickProfilePic(),
          child: _pickedImage != null
              ? CircleAvatar(
                  radius: 161,
                  backgroundImage: MemoryImage(_pickedImage!),
                )
              : CircleAvatar(
                  radius: 161,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/avatar.png'),
                ),
        ));
  }
}

class EnlistmentField extends StatelessWidget {
  const EnlistmentField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.57,
          MediaQuery.of(context).size.width * 0.09,
          MediaQuery.of(context).size.width * 0.24,
          0),
      child: UserInputField(hint: "MM/YYYY", textAlign: TextAlign.center),
    );
  }
}

class TeamField extends StatelessWidget {
  const TeamField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.38,
          MediaQuery.of(context).size.width * 0.096,
          MediaQuery.of(context).size.width * 0.41,
          0),
      child: UserInputField(
        hint: "Team",
        fontSize: 60,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class BirthdayField extends StatelessWidget {
  const BirthdayField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.26,
          MediaQuery.of(context).size.width * 0.09,
          MediaQuery.of(context).size.width * 0.59,
          0),
      child: UserInputField(hint: "DD/MM"),
    );
  }
}

class NameField extends StatelessWidget {
  const NameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.26,
          MediaQuery.of(context).size.width * 0.021,
          MediaQuery.of(context).size.width * 0.25,
          0),
      child: UserInputField(hint: "Your_Name"),
    );
  }
}

class UserInputField extends StatelessWidget {
  const UserInputField(
      {Key? key,
      required this.hint,
      this.fontSize = 70,
      this.textAlign = TextAlign.left})
      : super(key: key);

  final String hint;
  final double fontSize;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: textAlign,
      decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      style: TextStyle(
          fontSize: fontSize,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w600),
    );
  }
}
