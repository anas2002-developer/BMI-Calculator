import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "BMI Calculator"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var weight_kg_ctrl = TextEditingController();
  var height_cm_ctrl = TextEditingController();
  var result = "";
  var category = "";
  var bgColor = Colors.transparent;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:
        Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: weight_kg_ctrl,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      label: Text("Weight in kg"),
                      prefixIcon: Icon(Icons.monitor_weight)
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    controller: height_cm_ctrl,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        label: Text("Height in cm"),
                        prefixIcon: Icon(Icons.height)
                    ),
                  ),
                  SizedBox(height: 40,),
                  ElevatedButton(onPressed: (){
                    var w1 = weight_kg_ctrl.text.toString();
                    var h1 = height_cm_ctrl.text.toString();

                    if (w1!="" && h1!=""){
                      var weight_kg = int.parse(w1);
                      var height_cm = int.parse(h1);


                      var bmi = (weight_kg * 10000)/(height_cm * height_cm );
                      result = "${bmi.toStringAsFixed(4)}";

                      if (bmi>25){
                        category = "You are Overweight";
                        bgColor = Colors.red.shade100;
                      }
                      else if(bmi<18){
                        category = "You are Underweight";
                        bgColor = Colors.amber.shade100;
                      }
                      else{
                        category = "You are Healthy";
                        bgColor = Colors.green.shade100;
                      }
                      setState(() {});

                    }
                    else{
                      result = "Please enter details";
                    }
                  }, child: Text("Calculate")),
                  SizedBox(height: 20,),
                  Text("BMI = $result \n $category"),
                ],

              ),
            ),
          ),
        )
    );
  }
}
