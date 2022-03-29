//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HandleBar extends StatefulWidget {
  const HandleBar({Key? key}) : super(key: key);

  @override
  _FrameRepState createState() => _FrameRepState();
}

class _FrameRepState extends State<HandleBar> {
  late YoutubePlayerController controller;
  @override
  void initState() {
    super.initState();
    const url = 'https://www.youtube.com/watch?v=f_EH3usHq2k';

    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        loop: false,
        autoPlay: true,
        hideControls: false,
      ),
    )..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
  }

  // @override
  // void deactivate() {
  //   controller.pause();
  // }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller,
        ),
        builder: (context, player) => Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff18203d),
              title: const Text(
                "How to install handlebar",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
              centerTitle: true,
              elevation: 1,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () {
                  //navigate back to home
                  Navigator.pop(context);
                },
              ),
            ),
            backgroundColor: const Color(0xff18203d),
            body: ListView(
              children: [
                player,

                const SizedBox(height: 6),
                ElevatedButton(
                    child: Text(
                      controller.value.isPlaying ? 'Pause' : 'Play',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (controller.value.isPlaying) {
                        controller.pause();
                      } else {
                        controller.play();
                      }
                      // controller.metadata.title,
                    }),

                Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      'Motorcycle frames are the most distinguished parts of a motorcycle and are the difference between a classy ride and a laudable contraption. \nThere are many types and models of these frames. Depending on your preference, they require a lot of attention as they are susceptible to a lot of damage, including from the elements. Some of these damages can be fixed without the consultation of a professional. In this instance, here are some tips to accompany your repair process. \n\nPerform Assessment : The above step will determine whether you require the services of that professional or not. In the case where your sub-frame has acquired some damage, you WILL need that professional assistance, otherwise negligence will bring about another accident and this time you may not be so lucky. Ensure also to have suitable tools and equipment to cater for the repair of the bike’s components, using your model’s manufacturer for instructions on how to do so. \n\nTest Alignment : If you need to determine whether your bike frame is aligned properly or not, here is a simple exercise. Place your bike on even ground. On a firm object (like a boulder), tie a piece of thin rope and then wrap it all the way to the rear wheel of your bike and then back again to the boulder. If the rope touches anything but the rear tire, then your motorcycle is in need of realignment. Alignment should always be tested after every accident. If you are riding your bike and notice a wobble, poor alignment is usually the first culprit.\n\nAdjust the Jig : This can be found in most garages that accommodate motorcycle repair and is used to straighten out bent motorcycle frames. This process will sometimes demand that you strip the motorcycle to cater to the alignment (recommended). The motorcycle frame will be set in place in the jig and after specific adjustments are made to your model, the jig makes the necessary alignment. \n\nInspect the Frame : \n\nThe most common metals used in the manufacture of motorcycle frames are titanium and aluminum. Titanium is the superior option as scratches can be simply eradicated with the brushing strokes of steel wool. Aluminum on the other hand is more dangerous as a simple hairline crack can lead to the disintegration of the bike when in motion and when other factors are involved. Constantly inspect your frame in this case and make the necessary repairs. Scan for Cracks :\n\nWhere metal joints are, cracks are inevitable. These should be taken seriously, especially cracks that appear on the underside of the down tube. Cracked paint should also be touched up as these will expose the affected metal to corrosion. Test for Corrosion :\n\nMotorcycles are inclined to rust, caused by corrosion from the elements and the sweat of the rider. Ensure that all the metallic parts on your frame are well cared for and are traded in for new ones every so often in the name of repair.\n\nTo check for corrosion, remove your bike’s seat and use a rag to swipe the seat tube. If it is caked by a bright brown color then your frame is rusted. A garage can fortunately fix this problem',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    )),
                Container(
                  padding: const EdgeInsets.all(8),
                  // child: Image.asset(
                  //   'assets/images/frame.jpg',
                  //   fit: BoxFit.fill,
                  // ),
                ),
                // Container(
                //   padding: const EdgeInsets.all(8),
                //   child: Image.asset('assets/images/frame.jpg'),
                // ),
              ],
            )),
      );
}
