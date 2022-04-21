import 'package:flutter/cupertino.dart';
import 'package:musicly/utilities/styles.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'add_music_view.dart';
import 'account_view.dart';
import 'download_music_view.dart';
import 'download_drill_view.dart';
import 'client_view.dart';
import 'server_view.dart';

/// Creates and manages the Home screen.
class HomeView extends StatefulWidget {
  const HomeView({Key? key, this.conductor = false}) : super(key: key);
  final bool conductor;

  /// Creates the dynamic state for the Home class.
  @override
  _HomeViewState createState() => _HomeViewState(conductor);
}

/// Creates and manages the Home screen.
class _HomeViewState extends State<HomeView> {
  _HomeViewState(this.conductor);
  final bool conductor;

  @override
  initState() {
    super.initState();
  }

  CupertinoSliverNavigationBar _buildBar(BuildContext context) {
    if (conductor) {
      return const CupertinoSliverNavigationBar(
        automaticallyImplyLeading: false,
        largeTitle: Text(
          'Home: Conductor',
          style: TextStyle(color: VanderbiltStyles.gold),
        ),
      );
    } else {
      return CupertinoSliverNavigationBar(
        automaticallyImplyLeading: false,
        largeTitle: const Text(
          'Home: Student',
          style: TextStyle(color: VanderbiltStyles.gold),
        ),
        // Right nav bar button, navigates to Account view.
        trailing: CupertinoButton(
            child: const Icon(CupertinoIcons.person),
            padding: const EdgeInsets.all(10),
            // Navigates to Account View when pressed.
            onPressed: () {
              showCupertinoModalBottomSheet(
                  context: context,
                  expand: true,
                  duration: const Duration(milliseconds: 300),
                  builder: (_) => AccountView(conductor: conductor));
            }
        ),
      );
    }
  }

  Column _buildColumn(BuildContext context) {
    if (conductor) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 0, right: 0, top: 35.0, bottom: 0),
            child: SizedBox(
              width: 370,
              child: CupertinoButton(
                child: const Text(
                  'Add New Sheet Music',
                  style: VanderbiltStyles.textButton,
                ),
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => AddMusicView()));
                },
                borderRadius: BorderRadius.circular(25.0),
                color: VanderbiltStyles.gold,
                pressedOpacity: 0.75,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 0, right: 0, top: 35.0, bottom: 0),
            child: SizedBox(
              width: 370,
              child: CupertinoButton(
                child: const Text(
                  'Connect to Live Changes',
                  style: VanderbiltStyles.textButton,
                ),
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => ClientPage()));
                },
                borderRadius: BorderRadius.circular(25.0),
                color: VanderbiltStyles.gold,
                pressedOpacity: 0.75,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 0, right: 0, top: 35.0, bottom: 0),
            child: SizedBox(
              width: 370,
              child: CupertinoButton(
                child: const Text(
                  'Conductor Music Change',
                  style: VanderbiltStyles.textButton,
                ),
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => ServerPage()));
                },
                borderRadius: BorderRadius.circular(25.0),
                color: VanderbiltStyles.gold,
                pressedOpacity: 0.75,
              ),
            ),
          )
        ]
      );
    } else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 0, right: 0, top: 35.0, bottom: 0),
            child: SizedBox(
              width: 370,
              child: CupertinoButton(
                child: const Text(
                  'Download New Music',
                  style: VanderbiltStyles.textButton,
                ),
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => DownloadMusicView()));
                  //FirebaseFiles().downloadFile(context);
                },
                borderRadius: BorderRadius.circular(25.0),
                color: VanderbiltStyles.gold,
                pressedOpacity: 0.75,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 0, right: 0, top: 35.0, bottom: 0),
            child: SizedBox(
              width: 370,
              child: CupertinoButton(
                child: const Text(
                  'Download New Drill',
                  style: VanderbiltStyles.textButton,
                ),
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => DownloadDrillView()));
                  //FirebaseFiles().downloadFile(context);
                },
                borderRadius: BorderRadius.circular(25.0),
                color: VanderbiltStyles.gold,
                pressedOpacity: 0.75,
              ),
            ),
          ),
        ],
      );
    }
  }

  /// Builds the UI using widgets.
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: <Widget>[
            // Navigation bar at the top of the screen that contains the view title and navigation buttons.
            _buildBar(context),
            SliverFillRemaining(
              child: _buildColumn(context)
            )
          ],
        )
    );
  }
}
