import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Widgets/build_dashed_line.dart';
import 'Widgets/day_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> navBarItems = [
    SvgPicture.asset('assets/icons/home.svg'),
    SvgPicture.asset('assets/icons/message.svg'),
    SvgPicture.asset('assets/icons/CameraButton.svg'),
    SvgPicture.asset('assets/icons/person.svg'),
    SvgPicture.asset('assets/icons/calender.svg'),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final year = now.year;
    final month = now.month;

    final daysInMonth = List<DateTime>.generate(
      DateTime(year, month + 1, 0).day,
      (index) => DateTime(year, month, index + 1),
    );

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(70),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xff2260FF), // Set background color
            unselectedItemColor: Colors.white,
            selectedItemColor: const Color(0xff00278C),
            items: List.generate(navBarItems.length, (index) {
              return BottomNavigationBarItem(
                icon: SizedBox(
                  width: 45, // Adjust the width of the icon
                  height: 40, // Adjust the height of the icon
                  child: navBarItems[index], // Use SvgPicture as icon
                ),
                label: '', // Remove the label
              );
            }),
          ),
        ),
      ),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/image_person.png'),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hi, Welcome Back',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.blueAccent,
              ),
            ),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: const Color(0xffCAD6FF),
              radius: 15,
              child: SvgPicture.asset('assets/icons/ring.svg'),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: const Color(0xffCAD6FF),
              radius: 15,
              child: SvgPicture.asset('assets/icons/setting.svg'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/doctor.svg'),
                ),
                Column(
                  children: [
                    SvgPicture.asset('assets/icons/favorite.svg'),
                    const SizedBox(height: 5),
                    const Text(
                      'Favorite',
                      style: TextStyle(color: Color(0xff2260FF), fontSize: 12),
                    ),
                    SizedBox(width: 80,)
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffCAD6FF),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/icons/text_setting.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/icons/search.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: const Color(0xffCAD6FF),
            width: double.infinity,
            height: 320,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        daysInMonth.map((day) => DayWidget(day: day)).toList(),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    width: 350,
                    height: 170,
                    child: Center(
                        child: buildDashedLine()), // A placeholder widget
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 350,
            height: 90,
            decoration: BoxDecoration(
              color: const Color(0xffCAD6FF),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Center(
              child: Text(
                'Content Goes Here',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
