/*
 * @Author: Tan Dong 
 * @Date: 2019-03-01 22:50:43 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-03-01 22:50:43 
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttersamples/samples/card_samples.dart';

class AnimationSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimationSamplesState();
  }
}

class AnimationSamplesState extends State<AnimationSamples>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _proxyAnimation;
  Animation<double> _curveAnimation;
  Animation<double> _tweenAnimation;
  Animation<int> _opacityAnimation;
  Animation<double> _rotateAnimation;
  @override
  void initState() {
    ///动画控制类
    _controller = AnimationController(
        lowerBound: 0,
        upperBound: 1,
        duration: const Duration(seconds: 3),
        vsync: this);

    ///动画效果类
    ///CurvedAnimation，AnimationMax
    ///曲线动画
    _curveAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
    );

    ///范围和插值
    _tweenAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    Animation alpha = IntTween(begin: 0, end: 255)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));
    _opacityAnimation = IntTween(begin: 0, end: 255)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));

    ///监听动画每一帧
    _curveAnimation.addListener(() {
      print('addListener');
    });
    _proxyAnimation = ProxyAnimation();

    ///动画状态监听器
    _curveAnimation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.forward) {
        print('Animation Start');
      } else if (status == AnimationStatus.completed) {
        print('Animation Completed');
        // _controller.reverse();
      } else if (status == AnimationStatus.reverse) {
        print('Animation Reverse');
      } else if (status == AnimationStatus.dismissed) {
        print('Animation Dismissed');
        _controller.forward();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: animation1(context),
    );
  }

  ///AnimatedOpacity,AnimatedAlign,AnimatedBuilder,AnimatedContainer
  ///AnimatedCrossFade,AnimatedCrossFadeBuilder
  ///，CurvedAnimation，AnimatedIcon,AnimatedList
  ///AnimatedOpacity,AnimatedPadding,AnimatedPhysicalModel
  ///AnimatedPositioned,AnimatedPositionedDirectional
  ///AnimatedSize,AnimatedSwitcher,AnimatedTheme
  Widget animation1(BuildContext context) {
    double opacityLevel = 1.0;
    return Column(
      children: <Widget>[
        ///StatefulWidget
        AnimatedCrossFade(
          duration: const Duration(seconds: 3),
          firstChild: const FlutterLogo(
              style: FlutterLogoStyle.horizontal, size: 100.0),
          secondChild:
              const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
          crossFadeState: CrossFadeState.showSecond,
          firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
          secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
          sizeCurve: Curves.fastOutSlowIn,
        ),

        ///ImplicitlyAnimatedWidget
        AnimatedOpacity(
          opacity: opacityLevel,
          child: RaisedButton(
            onPressed: () {
              print(opacityLevel);
              setState(() {
                opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
              });
              print(opacityLevel);
            },
            child: Text('AnimatedOpacity'),
          ),
          duration: const Duration(seconds: 3),
        ),

        ///ImplicitlyAnimatedWidget
        AnimatedContainer(
          padding: EdgeInsets.all(100),
          curve: Curves.bounceOut,
          duration: const Duration(seconds: 3),
          child: const FlutterLogo(
            size: 30,
          ),
        ),

        ///StatelessWidget
        GestureDetector(
          child: Hero(
            tag: 'hero',
            transitionOnUserGestures: true,
            child: IgnorePointer(
              ignoring: false,
              child: RaisedButton(
                onPressed: () {},
                child: Text('Hero'),
              ),
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return CardSamples();
            }));
          },
        ),

        ///SingleChildRenderObjectWidget
        Center(
          child: RotationTransition(
            turns: _tweenAnimation,
            child: RaisedButton(
              onPressed: () {
                if (_controller.isAnimating) {
                  _controller.reset();
                } else if (_controller.isCompleted) {
                  _controller.reset();
                } else {
                  _controller.forward();
                }
              },
              child: Text('RotationTransition'),
            ),
          ),
        ),

        ///SingleChildRenderObjectWidget
        SizedBox(
          height: 30,
        ),
        
        LogoFade(),

        ///SingleChildRenderObjectWidget
        // AnimatedSize(
        //   vsync: this,
        //   duration: const Duration(seconds: 3),
        //   child: Text('AnimatedSize'),
        //   curve: Curves.linear,
        // ),

        ///StatelessWidget
        GrowTranstion(
            _curveAnimation,
            GestureDetector(
              child: FlutterLogo(
                size: 20,
              ),
              onTap: () {
                _controller.forward();
              },
            )),
      ],
    );
  }
}

class GrowTranstion extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  GrowTranstion(this.animation, this.child);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return Container(
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

class LogoFade extends StatefulWidget {
  @override
  createState() => LogoFadeState();
}

class LogoFadeState extends State<LogoFade> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: opacityLevel,
          duration: Duration(seconds: 3),
          child: FlutterLogo(),
        ),
        RaisedButton(
          child: Text('Fade Logo'),
          onPressed: _changeOpacity,
        ),
      ],
    );
  }
}

Widget listBody1() {
  return Flex(
    direction: Axis.horizontal,
    children: <Widget>[
      ListBody(
        mainAxis: Axis.horizontal,
        reverse: false,
        children: <Widget>[
          Container(
              color: Colors.red,
              width: 50.0,
              height: 50.0,
              child: Text('标题1', style: TextStyle(color: Color(0xffffffff)))),
          Container(
              color: Colors.yellow,
              width: 50.0,
              height: 50.0,
              child: Text('标题2', style: TextStyle(color: Color(0xffffffff)))),
          Container(
              color: Colors.green,
              width: 50.0,
              height: 50.0,
              child: Text('标题3', style: TextStyle(color: Color(0xffffffff)))),
          Container(
              color: Colors.blue,
              width: 50.0,
              height: 50.0,
              child: Text('标题4', style: TextStyle(color: Color(0xffffffff)))),
          Container(
              color: Colors.teal,
              width: 50.0,
              height: 50.0,
              child: Text('标题5', style: TextStyle(color: Color(0xffffffff))))
        ],
      )
    ],
  );
}

Widget listBody2() {
  return Column(
    children: <Widget>[
      ///主轴空间不能受限，ListBody不会裁剪child
      ///指定轴尺寸正常，另一个轴尺寸会拉伸
      ///使用时最外层控件布局要有全屏特性，Column，Row，ListView，Flex,SingleChildScrollView
      ListBody(
        mainAxis: Axis.vertical,
        reverse: false,
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 20.0,
            height: 50.0,
          ),
          Container(
            color: Colors.yellow,
            width: 20.0,
            height: 50.0,
          ),
          Container(
            color: Colors.green,
            width: 20.0,
            height: 50.0,
          ),
          Container(
            color: Colors.blue,
            width: 20.0,
            height: 50.0,
          ),
          Container(
            color: Colors.black,
            width: 20.0,
            height: 50.0,
          ),
        ],
      ),
      Container(
        color: Colors.teal,
        width: 100.0,
        height: 50.0,
      ),
      Container(
        color: Colors.orange,
        width: 100.0,
        height: 50.0,
      ),
      Container(
        color: Colors.amber,
        width: 100.0,
        height: 50.0,
      ),
    ],
  );
}
