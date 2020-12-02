import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:circular_menu/circular_menu.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yoga_app/myprofile.dart';
import 'package:yoga_app/notification.dart';
import 'package:yoga_app/registration.dart';
import 'package:yoga_app/login.dart';
import 'package:yoga_app/yoga class.dart';
import 'about us.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage>  {
  int _currentIndex=0;List cardList=[
    Item1(),
    Item2(),
    Item3(),
    Item4()
  ];List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Builder(
        builder: (context) =>Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent.shade400,
            title: Center(child: Text(' YOGA APP ')),
          ),
          body: CircularMenu(
            alignment: Alignment.bottomRight,
            toggleButtonColor: Colors.amber,
            items: [
              CircularMenuItem(
                  icon: Icons.perm_device_information,
                  color: Colors.indigoAccent, onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => About()),
                );
              }),
              CircularMenuItem(
                  icon: Icons.event, color: Colors.orange, onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YogaClass()),
                );
              }),
              CircularMenuItem(
                  icon: Icons.notification_important, color: Colors.green, onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notifications()),
                );
              }),
              CircularMenuItem(
                  icon: Icons.account_box, color: Colors.blue, onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyProfile()),
                );
              }),
            ],
            backgroundWidget:Column(
              children:<Widget> [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnTouch: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: cardList.map((card){
                    return Builder(
                        builder:(BuildContext context){
                          return Container(
                            height: MediaQuery.of(context).size.height*0.30,
                            width: MediaQuery.of(context).size.width,
                            child: Card(
                              color: Colors.blueAccent,
                              child: card,
                            ),
                          );
                        }
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(cardList, (index, url) {
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
                      ),
                    );
                  }),
                ),
                Expanded(
                  flex: 1,
                  child: new SingleChildScrollView(
                    scrollDirection: Axis.vertical, //.horizontal
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('A set of specific exercises, called poses, combined with specific breathing techniques and meditation principles are the building blocks of a yoga class. If a pose causes pain or proves too difficult, there are variations and modifications that can be made to help students. Props like blocks, blankets and straps — even chairs — can be used to help you get the most benefit from the poses.',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily:'Lato',
                            ),),
                        ),
                        Image.network('https://insaneforthehurricane.files.wordpress.com/2014/07/extended-childs-pose.jpg'),
                        Text('CHILD POSE',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('This calming pose is a good default pause position. You can use child’s pose to rest and refocus before continuing to your next pose. It gently stretches your lower back, hips, thighs, knees and ankles and relaxes your spine, shoulders and neck.',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily:'Lato',
                            ), ),
                        ),
                        Image.network('https://www.yogajournal.com.au/wp-content/uploads/2016/03/plank.jpg'),
                        Text('PLANK POSE',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('A commonly seen exercise, plank helps build strength in the core, shoulders, arms and legs.',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily:'Lato',
                            ), ),
                        ),
                        Image.network('https://media4.popsugar-assets.com/files/thumbor/o4XMnVYldcgobI-4edPHbLDD9x4/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2015/11/30/778/n/1922398/fdb49812abecfaaa_Tree-Pose.jpg'),
                        Text('TREE POSE',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Beyond helping improve your balance, it can also strengthen your core, ankles, calves, thighs and spine.',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily:'Lato',
                            ), ),
                        ),
                        Image.network('https://freedomgenesis.com/wp-content/uploads/2019/11/cobra-pose-woman-in-blue-yoga-outfit-performing-the-pose.jpg'),
                        Text('COBRA POSE',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('This back-bending pose can help strengthen the back muscles, increase spinal flexibility and stretches the chest, shoulders and abdomen.',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily:'Lato',
                            ), ),
                        ),
                        Image.network('https://s3.amazonaws.com/images-s3.yogainternational.com/assets/content/articles/TRIANGLE-POSE-42.JPG'),
                        Text('TRIANGLE POSE',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Triangle, which is a part of many yoga sequences helps build strength in the legs and stretches the hips, spine, chest, shoulders, groins, hamstrings and calves. It can also help increase mobility in the hips and neck.',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily:'Lato',
                            ), ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ) ,
          ),
        ),
      ),
    );
  }
}
class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
        'https://static.onecms.io/wp-content/uploads/sites/35/2019/04/16045736/benefits-yoga-fb1.jpg');
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
        'https://images.hellogiggles.com/uploads/2017/04/26025431/yoga-first-time.jpeg');
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
        'https://www.fivepillarsyoga.com/wp-content/uploads/2016/06/maxresdefault.jpg');
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
        'https://ilivehealthy.net/wp-content/uploads/2020/05/healthy-yoga-750x430.png');
  }
}

