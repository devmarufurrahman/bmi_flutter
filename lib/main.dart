import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
                width: 150,
                child: Center(
                  child: Text("BMI",
                    style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    label: Text("Enter Your Weight (in KG)"),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                    label: Text("Enter Your Height (in Feet)"),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: TextField(
                  controller: inchController,
                  decoration: const InputDecoration(
                    label: Text("Enter Your Height (in Inch)"),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                height: 40,
                width: 190,
                margin: EdgeInsets.all(12),
                child: ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inchController.text.toString();
                  if(wt!= "" && ft!= ""){
                    // Convert string values to integers
                    int iWt = int.parse(wt);
                    int iFt = int.parse(ft);
                    int iInch = int.parse(inch);

                    // Calculate total inches
                    int tInch = (iFt * 12) + iInch;

                    // Convert inches to centimeters
                    double tCm = tInch * 2.54;

                    // Convert centimeters to meters
                    double tM = tCm / 100;

                    // Calculate BMI
                    double bmi = iWt / (tM * tM);

                    setState(() {
                      result =  "Your BMI value is: ${bmi.toStringAsFixed(2)}";
                      wtController.clear();
                      ftController.clear();
                      inchController.clear();
                    });

                  } else{
                    setState(() {
                      result = "Please Select All Field";
                    });
                  }

                }, child: const Text("Calculate BMI")),
              ),
              Text(result, style: const TextStyle(
                fontSize: 16,
              ),)

            ],
          ),
      )

    );
  }
}
