import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(controller.title.value)),
          centerTitle: true,
          actions: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Badge(
                position: BadgePosition.topEnd(end: 4, top: 0),
                badgeContent: const Text("9"),
                child: IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    size: 32,
                  ),
                  onPressed: controller.openNotification,
                ),
              ),
            )
          ],
        ),
        drawer: Drawer(
          width: size.width * 0.75,
          child: ListView(
            children: [
               Card(
                margin: const EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  accountName: const Text("Name"),
                  accountEmail: const Text("Roll Number"),
                  currentAccountPicture:
                      Image.asset("assets/images/vc_logo.png"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.person,color: Colors.blue),
                  title: const Text("Profile"),
                  onTap: controller.openAcademicCalender,
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.pending_actions,color: Colors.blue,),
                  title: const Text("Results"),
                  onTap: controller.openRoutine,
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.people,color: Colors.blue),
                  title: const Text("Change Account"),
                  onTap: controller.scanQr,
                ),
              ),
            ],
          ),
        ),
        body: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomeWidget(),
            LibraryWidget(),
            ScienceBulletinWidget(),
            StoreWidget(),
          ],
        ),
        bottomNavigationBar: const VermaBottomNav(),
      ),
    );
  }
}

List<IconData> listOfIcons = [
  Icons.home_rounded,
  Icons.local_library,
  Icons.precision_manufacturing,
  Icons.store,
];

List<String> titles = ["Home", "Library", "Science Bulletin", "Bagpack"];

class VermaBottomNav extends StatelessWidget {
  const VermaBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.find<HomeController>();
    return Container(

      margin: const EdgeInsets.all(16),
      height: size.width * .155,
      decoration: BoxDecoration(
        color: Colors.yellow.shade200,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: size.width * .024),
        itemBuilder: (context, index) => Obx(
          () => InkWell(
            onTap: () {
              controller.currentIndex.value = index;
              controller.title.value = titles[index];
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(
                    bottom: index == controller.currentIndex.value
                        ? 0
                        : size.width * .029,
                    right: size.width * .0422,
                    left: size.width * .0422,
                  ),
                  width: size.width * .128,
                  height: index == controller.currentIndex.value
                      ? size.width * .014
                      : 0,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),
                Icon(
                  listOfIcons[index],
                  size: size.width * .076,
                  color: index == controller.currentIndex.value
                      ? Colors.blueAccent
                      : Colors.black38,
                ),
                SizedBox(height: size.width * .03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Upcoming Tests",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        SizedBox(
            height: 200,
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.red,
                  ),
                ),
              ),
              scrollDirection: Axis.horizontal,
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Upcoming Classes",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) => Card(
                      color: Colors.blue,
                      child: Container(
                        height: 150,
                      ),
                    )))
      ],
    );
    // return CustomScrollView(
    //   slivers: [
    //     SliverStickyHeader(
    //       header: Container(
    //         height: 128,
    //         color: Colors.lightBlue,
    //         alignment: Alignment.centerLeft,
    //         child: const Center(
    //           child: Text(
    //             'Upcoming Tests',
    //             style: TextStyle(color: Colors.white),
    //           ),
    //         ),
    //       ),
    //       sliver: SliverList(
    //         delegate: SliverChildBuilderDelegate(
    //           childCount: 5,
    //
    //           (context, index) => ClipRRect(
    //             child: Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Container(
    //                 color: Colors.red,
    //                 width: 200,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //     SliverList(
    //       delegate: SliverChildBuilderDelegate(
    //         childCount: 5,
    //         (context, index) => ClipRRect(
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Container(
    //               color: Colors.blue,
    //               height: 200,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //     // SliverToBoxAdapter(
    //     //   child: SizedBox(
    //     //     height: 312,
    //     //     width: MediaQuery.of(context).size.width,
    //     //     child: Column(
    //     //       mainAxisSize: MainAxisSize.min,
    //     //       crossAxisAlignment: CrossAxisAlignment.start,
    //     //       children: [
    //     //         Padding(
    //     //           padding: const EdgeInsets.all(8.0),
    //     //           child: Text(
    //     //             "Upcoming Classes",
    //     //             style: Theme.of(context).textTheme.headline5,
    //     //           ),
    //     //         ),
    //     //         Expanded(
    //     //           child: ListView.builder(
    //     //             scrollDirection: Axis.vertical,
    //     //             itemCount: 4,
    //     //             itemBuilder: (context, index) {
    //     //               return ClipRRect(
    //     //                 child: Padding(
    //     //                   padding: const EdgeInsets.all(8.0),
    //     //                   child: Container(
    //     //                     color: Colors.blue,
    //     //                     height: 200,
    //     //                   ),
    //     //                 ),
    //     //               );
    //     //             },
    //     //           ),
    //     //         ),
    //     //       ],
    //     //     ),
    //     //   ),
    //     // ),
    //   ],
    // );
  }
}

class LibraryWidget extends StatelessWidget {
  const LibraryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl: "https://ndl.iitkgp.ac.in/",
    );
  }
}

class ScienceBulletinWidget extends StatelessWidget {
  const ScienceBulletinWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => Card(
          color: Colors.blue,
          child: Container(
            height: 150,
          ),
        ));
  }
}

class StoreWidget extends StatelessWidget {
  const StoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "New Arrival",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        SizedBox(
            height: 200,
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.red,
                  ),
                ),
              ),
              scrollDirection: Axis.horizontal,
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Categories",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Colors.blue,
                  child: Container(
                    height: 150,
                  ),
                )))
      ],
    );
  }
}
