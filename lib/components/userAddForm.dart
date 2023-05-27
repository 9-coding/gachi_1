import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

String warning = "값이 입력되지 않았어요!";

/*
* 작성자: 구도연
* 회원가입의 전반적인 기능을 담당하는 부분입니다.
* 가능한 것 : 빈값처리, 글자수 제한, 비밀번호 확인
* 불가능한 것 : 아이디 중복확인
* */

// 다음 입력화면으로 넘어가도록 하는 버튼.
// value가 텍스트를 담고 있음.
// 이곳에서 빈값이면 페이지를 넘기지 않는 기능, 비밀번호 확인 기능 구현.
Widget nextBtn(BuildContext context, var next, var _textEditingController, var _pwCheckController, double pageNum){
  return ElevatedButton(
      onPressed: (){
        String value = _textEditingController.text;
        // 비밀번호 확인 페이지를 위한 코드.
        if (pageNum == 2){
          if (_textEditingController.text == _pwCheckController.text){
            // 파이어베이스 연동하실 때 _textEditingController.text를 이용하시면 입력창에 있는 텍스트를 가져오실 수 있습니다.
            print(_textEditingController.text);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> next));
          }
        }
        //일반적인 경우의 코드.
        else{
          if (value != "") {
            print(value);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> next));
          }
          }
      },
      style: ElevatedButton.styleFrom(
          primary: const Color(0xFFEF8C00),
          elevation: 0
      ),

      child: pageNum == 4 ? const Text('완료') : const Text('다음'));
}

// 입력창에 대한 코드.
// 값을 입력하지 않으면 값을 입력하라는 메시지가 뜸.
Widget input(var _controller, int limit, double pageNum, String hint){
  return TextFormField(
    controller: _controller,
    autovalidateMode: AutovalidateMode.always,
    validator: (value){
      if (value == null || value.isEmpty){
        return '값을 입력해주세요';
      }
      return null;
    },
    maxLength: limit,
    inputFormatters: [pageNum != 3 ? FilteringTextInputFormatter.singleLineFormatter : FilteringTextInputFormatter.digitsOnly], //주민번호는 숫자만 입력받을 수 있도록.
    obscureText: pageNum != 2 ? false : true,
    decoration: InputDecoration(hintText: hint),);
}


class userAddForm extends StatefulWidget {
  userAddForm(this.pageNum, this.title, this.text, this.hint, this.limit, this.next);
  final double pageNum;
  final String title;
  final String text;
  final String hint;
  final int limit;
  var next;


  @override
  State<userAddForm> createState() => _userAddFormState();
}

class _userAddFormState extends State<userAddForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _pwCheckController = TextEditingController();
  XFile? _image; //이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화

  //이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
      });
    }
  }

  @override

  void dispose() {
    _textEditingController.dispose(); // Dispose the TextEditingController
    _pwCheckController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double pageNum = widget.pageNum;
    String title = widget.title;
    String text = widget.text;
    String hint = widget.hint;
    int limit = widget.limit;
    var next = widget.next;


    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 40,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 100,
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new_rounded),),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  pageNum == 4 ?
                  Column(
                    children: [
                      _image != null
                      ? Container(
                        width: 300,
                        height: 300,
                        child: Image.file(File(_image!.path)), //가져온 이미지를 화면에 띄워주는 코드
                      )
                          : Container(
                      width: 300,
                      height: 300,
                      color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFEF8C00),
                                  elevation: 0
                              ),
                              onPressed: () {
                                getImage(ImageSource.camera); //getImage 함수를 호출해서 카메라로 찍은 사진 가져오기
                              },
                              child: const Text("카메라"),
                            ),
                            const SizedBox(width: 30),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFEF8C00),
                                  elevation: 0
                              ),
                              onPressed: () {
                                getImage(ImageSource.gallery); //getImage 함수를 호출해서 갤러리에서 사진 가져오기
                              },
                              child: const Text("갤러리"),
                            ),
                        ],
                      ),
                    ],
                  )
                  : input(_textEditingController, limit, pageNum, hint),
                  Text(text),
                  const SizedBox(height: 20,),
                  pageNum != 2 ? const SizedBox(height: 0,) :
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      input(_pwCheckController, limit, pageNum, hint),
                      const Text('비밀번호를 다시 입력해주세요'),
                      const SizedBox(height: 30,)
                    ],
                  ),
                  pageNum == 1 ? Row(children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFEF8C00),
                            elevation: 0
                        ),
                        onPressed: (){

                    }, child: const Text('중복확인')),
                    const SizedBox(width: 30,),
                    nextBtn(context, next, _textEditingController, _pwCheckController, pageNum)
                  ],) :
                  nextBtn(context, next, _textEditingController, _pwCheckController, pageNum)
                ],
              )
          ),
          const SizedBox(
            height: 0,
          ),
          const SizedBox(
            height: 0,
          ),
        ],
      ),
    );
  }
}
