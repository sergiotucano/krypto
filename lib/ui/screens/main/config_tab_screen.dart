import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfigTabScreen extends StatelessWidget {
  const ConfigTabScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<String> letters = <String>[
      'Aleatórias',
      'Maiusculas',
      'Minúsculas',
    ];

    String dropdownValue = 'Aleatórios';

    return Material(
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                height: (height / 4),
                width: (width / 1.2),
                child: Card(
                  elevation: 5,
                  child: new GridTile(
                    header: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'A Senha terá quantos caracteres ?',
                        style: TextStyle(
                          color: const Color(0xFFFF8000),
                          letterSpacing: 1.1,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 40, horizontal: (width / 4)),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: (height / 4),
                width: (width / 1.2),
                child: Card(
                  elevation: 5,
                  child: new GridTile(
                    header: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Na Senha serão aceitos . . .',
                        style: TextStyle(
                          color: const Color(0xFFFF8000),
                          letterSpacing: 1.1,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 5),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Letras',
                                  style: TextStyle(
                                    color: const Color(0xFFFF8000),
                                    letterSpacing: 1.1,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Transform.scale(
                                  scale: 0.8,
                                  child: Switch(
                                    value: false,
                                    onChanged: null,
                                    activeTrackColor: Colors.lightGreenAccent,
                                    activeColor: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Números',
                                  style: TextStyle(
                                    color: const Color(0xFFFF8000),
                                    letterSpacing: 1.1,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Transform.scale(
                                  scale: 0.8,
                                  child: Switch(
                                    value: false,
                                    onChanged: null,
                                    activeTrackColor: Colors.lightGreenAccent,
                                    activeColor: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Símbolos',
                                  style: TextStyle(
                                    color: const Color(0xFFFF8000),
                                    letterSpacing: 1.1,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Transform.scale(
                                  scale: 0.8,
                                  child: Switch(
                                    value: false,
                                    onChanged: null,
                                    activeTrackColor: Colors.lightGreenAccent,
                                    activeColor: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: (height / 4),
                width: (width / 1.2),
                child: Card(
                  elevation: 5,
                  child: new GridTile(
                    header: Text(
                      'As letras serão . . .',
                      style: TextStyle(
                        color: const Color(0xFFFF8000),
                        letterSpacing: 1.1,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Theme.of(context).accentColor,
                      ),
                      onChanged: null,
                      items: letters.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
