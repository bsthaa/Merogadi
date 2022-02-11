import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:merogadi/widgets/activities/activities_widget.dart';
import 'package:merogadi/widgets/activities/activity_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get bottom => null;

  Widget _buildTitle() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Merogadi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

  Widget _buildSearch() => Column(
        children: <Widget>[
          AppBar(
            title: Container(
              width: double.infinity,
              height: 40,
              color: Colors.white,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      /* Clear the search field */
                    },
                  ),
                  hintText: 'Search for something....',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      );

  Widget _buildFeatureContent() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: const Text('Parts and Accessories'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('General Services'),
          ),
        ],
      );

  Widget _buildFeatureContentSecond() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: const Text('Repair'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Pickup and drop service'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Parts upgrade'),
          ),
        ],
      );

  Widget _buildActivitiesWidget() => const Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: ActivitiesWidget(
          activities: {
            ActivityType.book: ActivityQuality.good,
            ActivityType.location: ActivityQuality.bad,
            ActivityType.profile: ActivityQuality.good,
          },
        ),
      );

  Widget _buildDetailsWidget() => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/icon_arrow_down.png",
                width: 12, height: 12),
          ],
        ),
      );

  Widget _buildExpandedContent() => Expanded(
        child: Column(
          children: <Widget>[
            Expanded(child: Container()),
            _buildFeatureContent(),
            _buildFeatureContentSecond(),
            _buildDetailsWidget(),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildTitle(),
            _buildSearch(),
            _buildExpandedContent(),
            _buildActivitiesWidget(),
          ],
        ),
      ),
    );
  }
}
