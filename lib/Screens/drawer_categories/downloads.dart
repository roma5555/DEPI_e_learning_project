import 'package:e_learning/Widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../Widgets/custom_appbar.dart';

class Downloads extends StatefulWidget {
  const Downloads({super.key});
//maybe a state management
  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Appbar(title: 'Downloads')),
      body: Center(
          child: Column(
        children: [

          const SizedBox(height: 50,),

          const Icon(Icons.cloud_download_outlined,color: Color(0xFF3e48b2),size: 100,),

          const SizedBox(height: 20,),

          const Text('No downloads yet !',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),),

          const SizedBox(height: 50,),

          Customelevatedbutton(text: 'Explore', h: 50, color: Colors.white,bgcolor: Colors.black, OnPressed: (){}, fontSize: 22,w: 220,)
        ],
      )),
    );
  }
}
