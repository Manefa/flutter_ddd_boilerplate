import 'package:binder/binder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/ui/home/page/get_random_number_trivia_logic_ref.dart';
import 'package:flutter_boilerplate/src/ui/home/state/get_random_number_trivia_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  String inputStr = "";

  @override
  Widget build(BuildContext context) {
    final loading = context.watch(loadingRandomNumberTriviaStateRef);
    final data = context.watch(randomNumberTriviaStateRef);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: const Text(
            "Number Trivia App"
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: LogicLoader(
              refs: [getRandomNumberTriviaLogic],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 50,),
                    loading ? const CircularProgressIndicator() : Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Center(
                        child:  data.fold((model) {
                          return Text("Failed to load Api data${model.message}");
                        }, (r) {
                          return Column(
                            children: <Widget>[
                              Text(r == null ? " " : r.number.toString()),
                              Text(r == null ? " " : r.text.toString()),
                            ],
                          );const Text("Failed to load Api data");
                        }),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextField(
                          controller: controller,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Input a number',
                          ),
                          onChanged: (value) {
                            inputStr = value;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: OutlinedButton(
                            child: Text(
                              'Search',
                              style: TextStyle(
                                color: Theme.of(context).appBarTheme.color,
                              ),
                            ),
                            onPressed: (){
                              context.use(getRandomNumberTriviaLogic).getConcreteNumberTrivia(int.parse(controller.text));
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton(
                            child: const Text(
                              'Get random trivia',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            onPressed: (){
                              context.use(getRandomNumberTriviaLogic).load();
                            },
                          ),
                        ),
                      ],
                      )
                    ],
                  ),
              ),
            ),
          ),
        ),
    );
  }
}
