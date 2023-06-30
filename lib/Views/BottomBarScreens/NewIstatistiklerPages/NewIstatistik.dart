
import 'dart:math' as math;
import 'package:blur/blur.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instero/Views/BottomBarScreens/NewIstatistiklerPages/BarChart7.dart';
import 'package:instero/Views/BottomBarScreens/NewIstatistiklerPages/BarChart8.dart';
import 'package:instero/Views/BottomBarScreens/NewIstatistiklerPages/barchart10.dart';
import 'package:instero/Views/BottomBarScreens/NewIstatistiklerPages/barchart9.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewIstatistik extends StatefulWidget {
  const NewIstatistik({super.key});
  // ! 1.card
   List<Color> get availableColors => const <Color>[
        Colors.purpleAccent,
        Colors.yellow,
        Colors.lightBlue,
        Colors.orange,
        Colors.pink,
        Colors.redAccent,
      ];
   // ! 1.card

   // ! 2.card
   static const shadowColor = Color(0xFFCCCCCC);
  static const dataList = [
    _BarData(Color(0xFFecb206), 18, 18),
    _BarData(Color(0xFFa8bd1a), 17, 8),
    _BarData(Color(0xFF17987b), 10, 15),
    _BarData(Color(0xFFb87d46), 2.5, 5),
    _BarData(Color(0xFF295ab5), 2, 2.5),
    _BarData(Color(0xFFea0107), 2, 2),
  ];




   // ! 2.card

  @override
  State<NewIstatistik> createState() => _NewIstatistikState();
}

class _NewIstatistikState extends State<NewIstatistik> {

  // ! 1.card
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;
// ! 1.card

 // ! 2.card
BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double value,
    double shadowValue,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 6,
        ),
        BarChartRodData(
          toY: shadowValue,
          color: BarChartSample7.shadowColor,
          width: 6,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;
 // ! 2.card





  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
           width: screenWidth,
                height: Adaptive.w(425),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                    Color(0xFF181C3C),
                    Color(0xFF080C2C),
                    ],
                  )
                ),
                child: Column(
                  children: [
                    Container(// ! APPBAR
                      width: screenWidth,
                      height: screenHeight * 0.08,
                      
                      child: Container(
                            width: Adaptive.w(100),
                      height: Adaptive.h(7),
                            child: Padding(
                              padding: const EdgeInsets.only(top :10.0,bottom: 10),
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [       
                              Container( 
                                child: Text("İSTATİSTİK",style: GoogleFonts.roboto(
                                      textStyle : const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: 2.0)
                                ),),
                              )
                        ],
                        ),
                            ),
                          ),
                    ), // ! APPBAR
                    // ! İSTATİSTİKLER
                    Container(
                      width: Adaptive.w(90),
                      height: Adaptive.w(70),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      child: Blur(
                        borderRadius: BorderRadius.circular(20.0),
                        blur: 3,
                        child: Card(
                          color: const Color(0xff81e5cd),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Yorum günleri',
                                      style: TextStyle(
                                          color: const Color(0xff0f4a3c),
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    const Text(
                                    'Gün başına düşen yorum sayısı',
                                    style: TextStyle(
                                      color: Color(0xff379982),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 38,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: BarChart(
                                        isPlaying ? randomData() : mainBarData(),
                                        swapAnimationDuration: animDuration,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      height: 12,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon(
                                      isPlaying ? Icons.pause : Icons.play_arrow,
                                      color: const Color(0xff0f4a3c),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isPlaying = !isPlaying;
                                        if (isPlaying) {
                                          refreshState();
                                        }
                                      });
                                    },
                                  ),
                                ),
                              )
                                          
                            ],
                          ),
                                          
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Blur(
                      borderRadius: BorderRadius.circular(20.0),
                      blur: 3,
                      child: Container(   // ! 2.card
                        width: Adaptive.w(90),
                        height: Adaptive.w(70),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: const Color(0xff81e5cd),
                        ),
                        
                        child: Card(
                          shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                                  color: Colors.white,
                                  elevation: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(24),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                      AspectRatio(
                        aspectRatio: 1.4,
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceBetween,
                            borderData: FlBorderData(
                              show: true,
                                  border: const Border.symmetric(
                            horizontal: BorderSide(
                              color: Color(0xFFececec),
                            ),
                          ),
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          leftTitles: AxisTitles(
                            drawBehindEverything: true,
                            sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toInt().toString(),
                              style: const TextStyle(
                                color: Color(0xFF606060),
                              ),
                              textAlign: TextAlign.left,
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 36,
                          getTitlesWidget: (value, meta) {
                            final index = value.toInt();
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: _IconWidget(
                                color: BarChartSample7.dataList[index].color,
                                isSelected: touchedGroupIndex == index,
                              ),
                            );
                          },
                        ),
                      ),
                      rightTitles: AxisTitles(),
                      topTitles: AxisTitles(),
                                      ),
                                      gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: const Color(0xFFececec),
                        strokeWidth: 1,
                      ),
                                      ),
                                      barGroups: BarChartSample7.dataList.asMap().entries.map((e) {
                      final index = e.key;
                      final data = e.value;
                      return generateBarGroup(
                        index,
                        data.color,
                        data.value,
                        data.shadowValue,
                      );
                                      }).toList(),
                                      maxY: 20,
                                      barTouchData: BarTouchData(
                      enabled: true,
                      handleBuiltInTouches: false,
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.transparent,
                        tooltipMargin: 0,
                        getTooltipItem: (
                          BarChartGroupData group,
                          int groupIndex,
                          BarChartRodData rod,
                          int rodIndex,
                        ) {
                          return BarTooltipItem(
                            rod.toY.toString(),
                            TextStyle(
                              fontWeight: FontWeight.bold,
                              color: rod.color,
                              fontSize: 18,
                              shadows: const [
                                Shadow(
                                  color: Colors.black26,
                                  blurRadius: 12,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      touchCallback: (event, response) {
                        if (event.isInterestedForInteractions &&
                            response != null &&
                            response.spot != null) {
                          setState(() {
                            touchedGroupIndex =
                                response.spot!.touchedBarGroupIndex;
                          });
                        } else {
                          setState(() {
                            touchedGroupIndex = -1;
                          });
                        }
                      },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Blur(
                      borderRadius: BorderRadius.circular(20.0),
                      blur: 3,
                      child: Container(
                        width: Adaptive.w(90),
                        height: Adaptive.w(70),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                        
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color : const Color(0xff81e5cd),
                          child: LineChartSample2(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Blur(
                      borderRadius: BorderRadius.circular(20.0),
                      blur: 3,
                      child: Container(
                        width: Adaptive.w(90),
                        height: Adaptive.w(70),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: const Color(0xff81e5cd),
                        
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color : Colors.white,
                          child: LineChartSample1(),
                        ),
                      ),
                    ),
                     SizedBox(height: 20,),
                    Blur(
                      borderRadius: BorderRadius.circular(20.0),

                      blur: 3,
                      child: Container(
                        width: Adaptive.w(90),
                        height: Adaptive.w(70),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                        
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color :  const Color(0xff81e5cd),
                          child: BarChartSample2(),
                        ),
                      ),
                    ),
                    
                    
      
      
                  ],
                ),
        ),
      ),
    );
    
  }
  
  // ! 1.card
   BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? Colors.yellow : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: Colors.yellow)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 9, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.blueGrey,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = 'Pazartesi';
                break;
              case 1:
                weekDay = 'Salı';
                break;
              case 2:
                weekDay = 'Çarşamba';
                break;
              case 3:
                weekDay = 'Perşembe';
                break;
              case 4:
                weekDay = 'Cuma';
                break;
              case 5:
                weekDay = 'Cumartesi';
                break;
              case 6:
                weekDay = 'Pazar';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('P', style: style);
        break;
      case 1:
        text = const Text('S', style: style);
        break;
      case 2:
        text = const Text('Ç', style: style);
        break;
      case 3:
        text = const Text('P', style: style);
        break;
      case 4:
        text = const Text('C', style: style);
        break;
      case 5:
        text = const Text('CT', style: style);
        break;
      case 6:
        text = const Text('P', style: style);
        break;
      default:
        text = const Text('PZ', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(
              0,
              math.Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  math.Random().nextInt(widget.availableColors.length)],
            );
          case 1:
            return makeGroupData(
              1,
              math.Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  math.Random().nextInt(widget.availableColors.length)],
            );
          case 2:
            return makeGroupData(
              2,
              math.Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  math.Random().nextInt(widget.availableColors.length)],
            );
          case 3:
            return makeGroupData(
              3,
              math.Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  math.Random().nextInt(widget.availableColors.length)],
            );
          case 4:
            return makeGroupData(
              4,
              math.Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  math.Random().nextInt(widget.availableColors.length)],
            );
          case 5:
            return makeGroupData(
              5,
              math.Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  math.Random().nextInt(widget.availableColors.length)],
            );
          case 6:
            return makeGroupData(
              6,
              math.Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  math.Random().nextInt(widget.availableColors.length)],
            );
          default:
            return throw Error();
        }
      }),
      gridData: FlGridData(show: false),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
  // ! 1.card

}
class _BarData {
  const _BarData(this.color, this.value, this.shadowValue);
  final Color color;
  final double value;
  final double shadowValue;
}

class _IconWidget extends ImplicitlyAnimatedWidget {
  const _IconWidget({
    required this.color,
    required this.isSelected,
  }) : super(duration: const Duration(milliseconds: 300));
  final Color color;
  final bool isSelected;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _IconWidgetState();
}

class _IconWidgetState extends AnimatedWidgetBaseState<_IconWidget> {
  Tween<double>? _rotationTween;

  @override
  Widget build(BuildContext context) {
    final rotation = math.pi * 4 * _rotationTween!.evaluate(animation);
    final scale = 1 + _rotationTween!.evaluate(animation) * 0.5;
    return Transform(
      transform: Matrix4.rotationZ(rotation).scaled(scale, scale),
      origin: const Offset(14, 14),
      child: Icon(
        widget.isSelected ? Icons.face_retouching_natural : Icons.face,
        color: widget.color,
        size: 28,
      ),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _rotationTween = visitor(
      _rotationTween,
      widget.isSelected ? 1.0 : 0.0,
      (dynamic value) => Tween<double>(
        begin: value as double,
        end: widget.isSelected ? 1.0 : 0.0,
      ),
    ) as Tween<double>?;
  }
}



