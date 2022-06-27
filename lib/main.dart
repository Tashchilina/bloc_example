import 'package:bloc_example/bottom_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Core (),
    );
  }
}

class Core extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
   return BlocProvider<BottomBloc>(
       create: (context) => BottomBloc(),
           child: const MainPage(),
   );
  }
  
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<BottomBloc, BottomState>(
        builder: (context, state) {
          if(state is FirstPageTapped){
            return Container(
                color: Colors.lightBlueAccent,
             child: Center(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Text(state.counter.toString() + " нажато раз",
                   style: const TextStyle(fontSize: 30),),
                   Card(
                     child: InkWell(
                       child: Container(
                         margin: const EdgeInsets.all(20),
                         child: const Text('Нажми на кнопку'),
                       ),
                       onTap: () => context.read<BottomBloc>().add(ButtonTapped()),
                     ),
                   ),
                 ],
               ),
             ),);
          }
          else if(state is SecondPageTapped){
            return Container(
                color: Colors.lightGreenAccent);
          }
          else{
            return Container();
          }
        }
        ),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'HomePage'),
            BottomNavigationBarItem(
                icon: Icon(Icons.admin_panel_settings),
                label: 'Settings')
          ],
          currentIndex: context.read<BottomBloc>().index,
        onTap: (index) => context.read<BottomBloc>().add(PageTapped(index)),
      ),
    );
  }
}
