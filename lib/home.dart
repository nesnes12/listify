import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listify/utils/colors.dart';
import 'task.dart';
import 'addTask.dart';


class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController = PageController(initialPage: 0);
  late int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.babyBlue,
        centerTitle: true,
        title: const Text("My List"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.calendar),
          ),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.greeney,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AddTaskAlertDialog();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: BottomNavigationBar(
            backgroundColor: AppColors.babyBlue,
            currentIndex: _selectedIndex,
            selectedItemColor: AppColors.babyBlue,
            unselectedItemColor: Colors.red,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
                pageController.jumpToPage(index);
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.square_list, size: 23,color: AppColors.greeney,),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.tag,size:20,color: AppColors.greeney,),
                label: '',
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        children: const <Widget>[
          Center(
            child: Tasks(),
          ),
          Center(
            child: Categories(),
          ),
        ],
      ),
    );
  }
}



class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Categories text'),
    );
  }
}



