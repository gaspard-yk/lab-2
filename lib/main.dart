import 'package:flutter/material.dart';
import "package:flutter/services.dart";
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstPage(title: 'Converter'),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Page_2(title: 'Конвертация длин');
                }));
              },
              child: const Text(
                'Конвертация длин',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Page_2(title: 'Конвертация валют');
                }));
              },
              child: const Text(
                'Конвертация валют',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Page_2(title: 'Конвертация массы');
                }));
              },
              child: const Text(
                'Конвертация массы',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Page_2(title: 'Конвертация памяти');
                }));
              },
              child: const Text(
                'Конвертация памяти',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Page_2(title: 'Конвертация температуры');
                }));
              },
              child: const Text(
                'Конвертация температуры',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page_2 extends StatefulWidget {
  const Page_2({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Page_2> createState() => _Page_2State();
}

class _Page_2State extends State<Page_2> {
  final TextEditingController uservalue = TextEditingController();
  final items = <String>[];
  String result = '';
  String t = "";
  @override
  void initState() {
    super.initState();
    createcontent(widget.title);
    t = widget.title;
    select_from = items[0];
    select_to = items[0];
  }

  @override
  // final List<String> items = [];
  String? select_from;
  String? select_to;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextField(
              controller: uservalue,
              decoration: InputDecoration(
                  labelText: 'Ведите значение',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Из",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    value: select_from,
                    isExpanded: true,
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (String? value) {
                      setState(() {
                        select_from = value;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 300,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "В",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    value: select_to,
                    isExpanded: true,
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (String? value) {
                      setState(() {
                        select_to = value;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 300,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                get_result();
              },
              child: const Text(
                'Получить резльтат',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            Text(
              'Результат : $result',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Вернуться на главную',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  createcontent(title) {
    switch (title) {
      case 'Конвертация длин':
        {
          items.addAll({'сантиметр', 'метр', 'миллиметр'});
        }
      case 'Конвертация валют':
        {
          items.addAll({'рубль', 'доллар', 'лира'});
        }
      case 'Конвертация массы':
        {
          items.addAll({'грамм', 'килограмм', 'тонна'});
        }
      case 'Конвертация памяти':
        {
          items.addAll({'бит', 'байт', 'килобайт'});
        }
      case 'Конвертация температуры':
        {
          items.addAll({'Градус Цельсия', 'Градус Фаренгейта', 'Кельвин'});
        }
    }
  }

  void get_result() {
    if (uservalue != null) {
      switch (t) {
        case 'Конвертация длин':
          {
            switch (select_from) {
              case 'сантиметр':
                {
                  switch (select_to) {
                    case 'сантиметр':
                      {
                        result = uservalue.text;
                      }
                    case 'метр':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex / 100).toString();
                      }
                    case 'миллиметр':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex * 10).toString();
                      }
                  }
                }
              case 'метр':
                {
                  switch (select_to) {
                    case 'сантиметр':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex * 100).toString();
                      }
                    case 'метр':
                      {
                        result = uservalue.text;
                      }
                    case 'миллиметр':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex * 1000).toString();
                      }
                  }
                }
              case 'миллиметр':
                {
                  switch (select_to) {
                    case 'сантиметр':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex / 10).toString();
                      }
                    case 'метр':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex / 1000).toString();
                      }
                    case 'миллиметр':
                      {
                        result = uservalue.text;
                      }
                  }
                }
            }
          }
        case 'Конвертация валют':
          {
            switch (select_from) {
              case 'рубль':
                {
                  switch (select_to) {
                    case 'рубль':
                      {
                        result = uservalue.text;
                      }
                    case 'доллар':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex / 100).toString();
                      }
                    case 'лира':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex / 3.5).toString();
                      }
                  }
                }
              case 'доллар':
                {
                  switch (select_to) {
                    case 'рубль':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex * 100).toString();
                      }
                    case 'доллар':
                      {
                        result = uservalue.text;
                      }
                    case 'лира':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex * 100 / 3.5).toString();
                      }
                  }
                }
              case 'лира':
                {
                  switch (select_to) {
                    case 'рубль':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex * 3.5).toString();
                      }
                    case 'доллар':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex * 3.5 / 100).toString();
                      }
                    case 'лира':
                      {
                        result = uservalue.text;
                      }
                  }
                }
            }
          }
        case 'Конвертация массы':
          {
            switch (select_from) {
              case 'грамм':
                {
                  switch (select_to) {
                    case 'грамм':
                      {
                        result = uservalue.text;
                      }
                    case 'килограмм':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex / 1000).toString();
                      }
                    case 'тонна':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex / 1000000).toString();
                      }
                  }
                }
              case 'килограмм':
                {
                  switch (select_to) {
                    case 'грамм':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex * 1000).toString();
                      }
                    case 'килограмм':
                      {
                        result = uservalue.text;
                      }
                    case 'тонна':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex / 1000).toString();
                      }
                  }
                }
              case 'тонна':
                {
                  switch (select_to) {
                    case 'грамм':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex * 1000000).toString();
                      }
                    case 'килограмм':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex * 1000).toString();
                      }
                    case 'тонна':
                      {
                        result = uservalue.text;
                      }
                  }
                }
            }
          }
        case 'Конвертация памяти':
          {
            switch (select_from) {
              case 'бит':
                {
                  switch (select_to) {
                    case 'бит':
                      {
                        result = uservalue.text;
                      }
                    case 'байт':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex / 8).toString();
                      }
                    case 'килобайт':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex / 1024 / 8).toString();
                      }
                  }
                }
              case 'байт':
                {
                  switch (select_to) {
                    case 'бит':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex * 8).toString();
                      }
                    case 'байт':
                      {
                        result = uservalue.text;
                      }
                    case 'килобайт':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex / 1024).toString();
                      }
                  }
                }
              case 'килобайт':
                {
                  switch (select_to) {
                    case 'бит':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex * 1024 * 8).toString();
                      }
                    case 'байт':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex * 1024).toString();
                      }
                    case 'килобайт':
                      {
                        result = uservalue.text;
                      }
                  }
                }
            }
          }
        case 'Конвертация температуры':
          {
            items.addAll({'Градус Цельсия', 'Градус Фаренгейта', 'Кельвин'});
            switch (select_from) {
              case 'Градус Цельсия':
                {
                  switch (select_to) {
                    case 'Градус Цельсия':
                      {
                        result = uservalue.text;
                      }
                    case 'Градус Фаренгейта':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex * 9 / 5 + 32).toString();
                      }
                    case 'Кельвин':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex + 273).toString();
                      }
                  }
                }
              case 'Градус Фаренгейта':
                {
                  switch (select_to) {
                    case 'Градус Цельсия':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = ((ex - 32) * 5 / 9).toString();
                      }
                    case 'Градус Фаренгейта':
                      {
                        result = uservalue.text;
                      }
                    case 'Кельвин':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = ((ex - 32) * 5 / 9 + 273).toString();
                      }
                  }
                }
              case 'Кельвин':
                {
                  switch (select_to) {
                    case 'Градус Цельсия':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = (ex - 273).toString();
                      }
                    case 'Градус Фаренгейта':
                      {
                        var x = Parser().parse(uservalue.text);
                        var ex =
                            x.evaluate(EvaluationType.REAL, ContextModel());
                        result = ((ex - 273) * 9 / 5 + 32).toString();
                      }
                    case 'Кельвин':
                      {
                        result = uservalue.text;
                      }
                  }
                }
            }
          }
      }
    }
    setState(() {
      result;
    });
  }
}
