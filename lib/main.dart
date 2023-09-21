import 'package:flutter/material.dart';
import 'package:mars_test/components/credit_card_scanner/credit_card_scanner.dart';
import 'package:mars_test/screens/responsive-layout/home-mobile.dart';
import 'package:mars_test/screens/responsive-layout/home-tablet.dart';
// import 'package:test_app/components/signature-pad/signature_pad.dart';
import 'components/slide_drawer/slide-drawer-collapse-menu.dart';
import 'components/slide_drawer/slide_drawer_header.dart';
import 'components/slide_drawer/slide_drawer_menu.dart';
// import 'screens/open_jobs.dart';
import 'layout/navBar.dart';
import 'layout/footer.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

//OLD MAIN FUNCTION
// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://d5f7b56c6ac1072f09489e164b078f8a@o4505919507726336.ingest.sentry.io/4505919516966912';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(MyApp()),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= 768) {
              // For screen sizes 768px and above, use custom sliding drawer
              return CustomSizedDrawer(
                drawerWidth: 250, // Adjust this value as needed
                drawerChild: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: [
                    slide_drawer_header(),
                    slide_drawer_menu(),
                    slide_drawer_menu(
                      title: 'Credit Card Scanner',
                      onTap: () => print("onPress"),
                    ),
                    CollapsibleListTile(),
                  ],
                ),
                body: const MyTabletBody(),
              );
            } else {
              // For screen sizes below 768px, use normal drawer behavior
              return Scaffold(
                appBar: AppBar(
                  iconTheme: const IconThemeData(size: 20, color: Colors.white),
                  elevation: 0.0,
                  backgroundColor: Colors.purple,
                  title: const Text("Snapsuite"),
                  centerTitle: true,
                ),
                drawerEnableOpenDragGesture: true,
                drawer: Drawer(
                  child: ListView(
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: [
                      slide_drawer_header(),
                      slide_drawer_menu(),
                      slide_drawer_menu(
                        title: 'Credit Card Scanner',
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreditCardScanner())),
                      ),
                      CollapsibleListTile(),
                    ],
                  ),
                ),
                body: const MyMobileBody(),
              );
            }
          },
        ),
      ),
    );
  }
}

class CustomSizedDrawer extends StatefulWidget {
  final Widget drawerChild;
  final double drawerWidth;
  final Widget body;

  const CustomSizedDrawer({
    required this.drawerChild,
    required this.drawerWidth,
    required this.body,
  });

  @override
  State<CustomSizedDrawer> createState() => _CustomSizedDrawerState();
}

class _CustomSizedDrawerState extends State<CustomSizedDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isDrawerOpen = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
      if (_isDrawerOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ensure the drawer stays open on first load
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (_isDrawerOpen) {
        _animationController.value = 1.0;
      }
    });

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(size: 20, color: Colors.white),
        elevation: 0.0,
        backgroundColor: Colors.purple,
        title: const Text("Snapsuite"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: toggleDrawer,
        ),
      ),
      drawerEnableOpenDragGesture: false,
      drawer: SizedBox(
        width: widget.drawerWidth,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_isDrawerOpen ? 0 : -widget.drawerWidth, 0),
              child: child,
            );
          },
          child: Drawer(
            child: widget.drawerChild,
          ),
        ),
      ),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Stack(
            children: [
              if (!_isDrawerOpen)
                GestureDetector(
                  onTap: toggleDrawer,
                  child: Container(
                    color: Colors.black
                        .withOpacity(0.4 * _animationController.value),
                  ),
                ),
              child!,
            ],
          );
        },
        child: Row(
          children: [
            if (_isDrawerOpen)
              SizedBox(
                width: widget.drawerWidth,
                child: widget.drawerChild,
              ),
            Expanded(child: widget.body),
          ],
        ),
      ),
    );
  }
}
