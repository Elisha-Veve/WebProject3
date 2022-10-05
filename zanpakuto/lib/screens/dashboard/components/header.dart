import 'package:flutter/material.dart';
import 'package:zanpakuto/components/search_field.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Dashboard', style: Theme.of(context).textTheme.headline4),
        Spacer(
          flex: 2,
        ),
        Expanded(child: SearchField()),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(children: [Icon(Icons.person_rounded), Text('Profile')]));
  }
}
