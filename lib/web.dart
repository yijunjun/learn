import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebPage extends StatefulWidget {
  WebPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('确定退出吗?'),
        actions: <Widget>[
          FlatButton(
            child: Text('暂不'),
            onPressed: () => Navigator.pop(context, false),
          ),
          FlatButton(
            child: Text('确定'),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return WillPopScope(
        onWillPop: _onWillPop,
        child: WebviewScaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title),
          ),
          url:"https://resume.pycode.cn/",
          withZoom: true,
          withLocalStorage: true,
          hidden: true,
          scrollBar:true,
          allowFileURLs:true,
          initialChild: Container(
            color: Colors.redAccent,
            child: const Center(
            child: Text('Waiting.....'),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.home), 
                  onPressed: () {
                    Navigator.pushNamed(context, "HomePage");
                  },
                ),
                SizedBox(), //中间位置空出
                IconButton(
                  icon: Icon(Icons.file_download),
                  onPressed: (){
                    Navigator.pushNamed(context, "DownloadPage");
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
            ),
          ),
        ),
    );
  }
}