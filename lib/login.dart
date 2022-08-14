import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBox(),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }
}

class LoginBox extends StatelessWidget {
  const LoginBox({super.key});

  @override 
  Widget build(BuildContext context) {
    return Center (child: ListView(
      shrinkWrap: true,
      children: const  <Widget>[
        LoginImage(),
        InputContainer(),
      ],
    ));
  }
}

class LoginImage extends StatelessWidget {
  const LoginImage({super.key});

  @override 
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      width:  MediaQuery.of(context).size.width * .2,
      height: MediaQuery.of(context).size.height * .2,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image:  AssetImage("assets/logo3.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(50),
      ) 
      
    );
  }
}


class InputBox extends StatelessWidget {
  InputBox({super.key, required this.myIcon, this.placeholder = '', this.obscure = false});
  dynamic myIcon;
  String placeholder;
  bool obscure;

  @override 
  Widget build(BuildContext context) {

    return 
    Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        margin: const EdgeInsets.all(5),
        child:
          Material(
            borderRadius: BorderRadius.circular(50),
            elevation: 6.0,
            shadowColor: Colors.grey[50],
            child: 
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
              child:
                TextField(
                  obscureText: obscure,
                  decoration: InputDecoration(
                    icon: Icon(myIcon, color: Color.fromARGB(255, 125, 147, 255)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                    hintText: placeholder,
                    border: InputBorder.none,

                    
                  ),

                
                )
            )
          )
    );
  }
}

class InputContainer extends StatelessWidget {
  const InputContainer({super.key});

  @override 
  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.all(20),
      child: Column(
      children: [
        InputBox(myIcon: Icons.person, placeholder: "Username"),
        InputBox(myIcon: Icons.lock, placeholder: "Password", obscure: true),
        Padding(padding: const EdgeInsets.all(0), child: _Button()),
      ]
    ));
  }
}

class _Button extends StatefulWidget {

  @override 
  Button createState() => Button();
}

class Button extends State<_Button> {
  // const Button({super.key});
  bool isLoading = false;

  @override 
  void initState() {
    super.initState();
    dataLoadFunction();
  }


  dataLoadFunction() async {
    setState( () {
      isLoading = !isLoading? true : false;
      
    });
  }

  @override 
  Widget build(BuildContext context) {
    return Padding (
      padding: const  EdgeInsets.symmetric(vertical: 20),
      child:
      Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child:  
        ElevatedButton(
          onPressed: dataLoadFunction,
          style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 106, 161, 255)),
                foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)),
                // padding: MaterialStateProperty.all( const EdgeInsets.all(0)),
                textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                elevation: MaterialStateProperty.all(6.0),
          ),
          
          child: isLoading ? const CircularProgressIndicator() : const Text("Log In"),
        )
      )  
      ,
    );
  }
}
