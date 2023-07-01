




import 'package:flutter/material.dart';


class Themoviedb extends StatefulWidget {
  const Themoviedb({Key? key}) : super(key: key);

  @override
  State <Themoviedb> createState() =>  ThemoviedbState();
}

class  ThemoviedbState extends State <Themoviedb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leading: IconButton(onPressed: (){},
         icon: Icon(Icons.format_list_bulleted,)),
        title: Text("Войти в учётную запись", style: TextStyle(
          fontSize: 15,
        ),),
        actions: [
          IconButton(onPressed: (){},
           icon: Icon(Icons.person)),
           IconButton(onPressed: (){},
           icon: Icon(Icons.search, color: const Color.fromARGB(255, 0, 140, 255),)),
        ],
        
      ),
      body: ListView(children: [
        SizedBox(height: 10,),
           _FormWidget(),
          SizedBox(height: 0,),
          _TextWidget(),
       
        ]),
    );
  }
}


class _TextWidget extends StatelessWidget {
  const _TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [       
          const Text(
            "Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(      
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.transparent,), elevation: MaterialStatePropertyAll(00)
              ),   
              onPressed: (){},
             child:
              Text("Нажмите здесь", 
              style: TextStyle(
                color: Colors.blue
              ),
              )),
            SizedBox(height: 10,),
            const Text(
              "Если вы зарегистрировались, но не получили письмо для подтверждения, отправьте письмо повторно",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black
              ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(         
                style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.transparent,), elevation: MaterialStatePropertyAll(00)
              ),    
                onPressed: (){},
             child:
              Text("Отправить", 
              style: TextStyle(
                color: Colors.blue,
              ),
              )),
        ],
      ),
    );
  }
}


class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  // логика авторизаций

  // 1
  final _loginContoller = TextEditingController(text: "admin");
  final _passwordController = TextEditingController(text: "admin");
  // Вернуть текст ошибки пароля 
  String? errorText;
  // 2
  void _auth(){
    final login = _loginContoller.text;
    if(login == "admin"){
      errorText = null;
      final navigator = Navigator.of(context);
      navigator.pushNamed("/secondScreen");
  
    } else{
      errorText = "Неверный логин или пароль"; 
    }
    setState(() {});
  }
  void _resertPassword(){
    print("Resert password");
  }
  // contoller icons  
  bool _Password = false;
  @override
  Widget build(BuildContext context) {
    // 3
    final errorText = this.errorText;   
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [ 
        
          TextField(
            // controller login 3
            controller: _loginContoller,
            decoration: InputDecoration(        
              contentPadding: EdgeInsets.symmetric(horizontal: 10,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),         
              ),            
              labelText: "Имя пользователя",
            ),      
          ),
          SizedBox(height: 15,),
          TextField(  
            // controller password 3
            controller: _passwordController, 
            obscureText: !_Password,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),     
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              suffixIcon: IconButton(onPressed: (){             
                setState(() {
                  _Password = !_Password;
                });
              },
               icon: Icon(Icons.remove_red_eye)),
              labelText: "Пароль"
            ),
          ),
          SizedBox(height: 20,),
          // 3 добавление неправильный пароль 
          if(errorText != null) ...[
           Text(errorText,
           style: const TextStyle(
            color: Colors.red,
          ),),    
         SizedBox(height: 20,),       
         
         ],
          Row(
            children: [            
              const SizedBox(width: 10,),       
              ElevatedButton(
                onPressed: _auth,
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
              ),
               child: const Text("Войти", style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
               ),
              ),
            ),

               SizedBox(width: 30,),

               ElevatedButton(      
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.transparent,), elevation: MaterialStatePropertyAll(00)
              ),   
              onPressed: _resertPassword,
             child:
              const Text("Сбросить пароль", 
              style: TextStyle(
                color: Colors.blue
              ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}



