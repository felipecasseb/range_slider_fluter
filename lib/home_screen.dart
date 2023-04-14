import 'package:flutter/material.dart';
import 'package:range_slider_fluter/widgets/container_tamanho.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  RangeValues values = RangeValues(0, 1000);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(values.start.toString(), values.end.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Filtro de pesquisa", style: TextStyle(color: Colors.black87),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tamanho", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                SizedBox(height: 14,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContainerTamanho(text: "Pequeno",),
                    ContainerTamanho(text: "Médio", color: Color(0xFF7661C7),),
                    ContainerTamanho(text: "Grande",),
                ],),
                SizedBox(height: 20,),
                Divider(color: Colors.grey,),
                SizedBox(height: 20,),
                Text("Faixa de preço", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                SizedBox(height: 14,),
                RangeSlider(
                    values: values,
                    min: 0,
                    max: 1000,
                    divisions: 100,
                    activeColor: Color(0xFF7661C7),
                    inactiveColor: Colors.grey,
                    labels: labels,
                    onChanged: (newValues){
                      print(newValues);
                      setState(() {
                        values = newValues;
                      });
                    }
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //MINIMO
                    Column(
                      children: [
                        Text("Mínimo", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                        ContainerTamanho(text: "${values.start.toStringAsFixed(2)}")
                      ],
                    ),
                    //MAXIMO
                    Column(
                      children: [
                        Text("Máximo", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                        ContainerTamanho(text: "${values.end.toStringAsFixed(2)}")
                      ],
                    )
                  ],
                )
              ],
            ),
            //BOTÃO FILTRAR
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFF7661C7),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Center(child: Text("Filtrar", style: TextStyle(color: Colors.white, fontSize: 16))),
            )
          ],
        ),
      ),
    );
  }
}
