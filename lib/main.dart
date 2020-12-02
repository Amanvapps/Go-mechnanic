import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gomechanic/screens/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Typography.material2014().white,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isObscure = true;
  bool isMechanic = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/logo.png" , scale: 25,),
              SizedBox(height: 30,),
              loginPanel()
            ],
          ),
        ) /* add child content here */,
      ),
    );
  }

  loginPanel()
  {
    return Opacity(
      opacity: 0.8,
      child: Container(
        margin: const EdgeInsets.only(left: 30 , right: 30),
        decoration: BoxDecoration(
          color: Colors.black
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/1.7,
        child: loginElements(),
      ),
    );
  }

  loginElements()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(left: 10 , top: 5),
          margin: const EdgeInsets.all(20),
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white)
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Phone",
              hintStyle: TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10 , top: 5),
          margin: const EdgeInsets.all(20),
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white)
          ),
          child: TextField(
            obscureText: isObscure,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                  onTap: (){
                    isObscure = !isObscure;

                    setState(() {
                    });
                  },
                  child: Icon((!isObscure) ? Icons.visibility : Icons.visibility_off , color: Colors.white)),
              border: InputBorder.none,
              hintText: "Password",
              hintStyle: TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Text('Forgot Password?' , style: TextStyle( color: Color.fromRGBO(255, 25, 10, 1)),),
        ),
        Container(
          margin: EdgeInsets.only(left: 0 , top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  isMechanic = !isMechanic;

                  setState(() {
                  });

                },
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 25,
                  width: 25,
                  child: Padding(
                    padding: const EdgeInsets.only(left : 0 , right: 2),
                    child: (isMechanic) ? Icon(Icons.done , color: Colors.white,) : Container(),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white)
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Text('I am a mechanic')
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 30 , right: 30 , top: 20),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
              color: Colors.white
          ),
          child: Text('Sign in' , style: TextStyle(color : Colors.black , fontSize: 20 ,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don\'t have an account?' , style: TextStyle(color: Colors.white70 , fontWeight: FontWeight.w600),),
            SizedBox(width: 10,),
            GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
                child: Text('Sign up' , style: TextStyle(color: Colors.blue)))
          ],
        )
      ],
    );
  }
}