import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/news_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String? countryCode;
    var height =  MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    var width = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(Icons.newspaper, color: Colors.black,),
            SizedBox(width: 10),
            Text("NewsApp", style: TextStyle(color: Colors.black),)
          ],
        ),
      ),

      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[

            Column(
              children: <Widget>[

              const SizedBox(height: 25),

              Container(
                height: height * 0.3,
                width: width * 0.3,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15)
                ),
              child:Image.asset("images/news_icon_vector.png", height: 350, width: 350),
            ),

             SizedBox(height: height * 0.1),
             
             Container(
              height: height * 0.05,
              width: width * 0.4,
              alignment: Alignment.center,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(30),
                 color: Colors.grey.withOpacity(0.5)
               ),
               child: const Text("First select the country:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
             ),

            SizedBox(height: height * 0.06),

            Container(
              height: height * 0.1,
              width: width * 0.4,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30)
              ),
              child: CountryListPick(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  iconTheme: const IconThemeData(
                    color: Colors.black
                  ),
                  title: const Text("Select country" , style: TextStyle(color: Colors.black)),
                  centerTitle: true,
                ),
                theme: CountryTheme(
                  isShowFlag: true,
                  isShowTitle: true,
                  isShowCode: true,
                  isDownIcon: true,
                  showEnglishName: true
                ),
                initialSelection: "+55" ,
                onChanged: (CountryCode? code) {
                  countryCode = code?.code;
                },
              ),
            ),

           SizedBox(height: height * 0.06),

            ElevatedButton(
              onPressed: (){
                if ( countryCode == null ) {
                  showDialog(context: context, builder: (context) {
                    return const AlertDialog(
                      title: Text("You didn't selected the country"),
                    );
                  });
                  return;
                }
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: ((context) => NewsPage(countryCode!)))
                );
              }, 
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.withOpacity(0.5)
              ),
              child: const Text("See News" , style: TextStyle(color: Colors.black, fontSize: 30))
            )
              ],
            )
          ],
        ),
      ),
    );

    
  }
}
