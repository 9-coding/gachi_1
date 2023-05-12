import 'package:flutter/material.dart';

// 메인 화면의 같은 색 상단 부분을 지정하는 코드입니다.
/*
* 수정일 : 0508
* 수정자 : 구도연
* */

Widget searchBox() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: const TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search), //검색 아이콘 추가
        contentPadding: EdgeInsets.only(left: 5, bottom: 5, top: 5, right: 5),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.black)),
        hintText: '검색 키워드를 입력해주세요',
      ),
    ),
  );
}

Widget gachiImage() {
  return Container(
    margin: const EdgeInsets.all(10),
    child: Image.asset(
      'assets/images/gachi_removebg.png',
      width: 150,
    ),
  );
}

Widget appbar() {
  return Container(
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                gachiImage(),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.black12,
                          shape: RoundedRectangleBorder(
                              //모서리를 둥글게
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text(
                          "내가치",
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.notifications_none_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ]),
          const SizedBox(
            height: 20,
          ),
          searchBox(),
          const SizedBox(
            height: 30,
          ),
        ],
      ));
}