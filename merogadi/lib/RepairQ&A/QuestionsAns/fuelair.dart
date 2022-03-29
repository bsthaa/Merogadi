import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Fuel extends StatefulWidget {
  const Fuel({Key? key}) : super(key: key);

  @override
  _FrameRepState createState() => _FrameRepState();
}

class _FrameRepState extends State<Fuel> {
  late YoutubePlayerController controller;
  @override
  void initState() {
    super.initState();
    const url = 'https://www.youtube.com/watch?v=uSo_PkyYvXY';

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
                "How to replace a carburetor",
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
                      'Detach the negative battery cable first before proceeding to remove the air filter assembly. Use a masking tape to mark the vacuum lines you have removed. Also remove the throttle, choke linkages, and other items connected to the carburetor. Make sure to leave a guide mark on the removed items for ease in reinstallation. Don’t forget to remove the fuel line from the carburetor and if there is fuel spill wipe it.\n\nOnce all the linkages have been disconnected, also remove the bolts or nuts which secure the carburetor using a socket or combination wrench. Remove the carburetor from the engine carefully and at a level because it contains fuel. Drain the fuel into a safe can and detach the old gasket from the intake manifold.\n\nRub the old gasket with a hand cloth. Proceed to install the new carburetor and gasket on the carburetor box. Secure its place with the bolts or nuts and reinstall the linkages you have removed earlier. Reconnect the vacuum line, the choke and throttle, and lastly the fuel line. Also replace the filters for fuel and air and reconnect the negative battery cable. Here you are simply replacing the items you removed so it should be easy to do.',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    )),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    'assets/images/carburetot.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.all(8),
                //   child: Image.asset('assets/images/frame.jpg'),
                // ),
              ],
            )),
      );
}
