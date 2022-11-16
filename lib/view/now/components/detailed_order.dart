import 'package:fdriver/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailedOrder extends StatelessWidget {
  const DetailedOrder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/image_splash.png'),
                  radius: defaultSizeImage,
                ),
              ),
              Text(
                'Nguyễn văn khách',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        InfoLine(
          title: 'Số điện thoại',
          content: '031923123',
        ),
        InfoLine(
          title: 'Điểm đón',
          content: '345435345345',
        ),
        InfoLine(
          title: 'Điểm đến',
          content: 'asdasdasd',
        ),
        InfoLine(
          title: 'Giờ khởi hành',
          content: '13:00',
        ),
        InfoLine(
          title: 'Quảng đường ước tính',
          content: '2000 km',
        ),
        InfoLine(
          title: 'Thành tiền',
          content: '100000 vnđ',
        ),
      ],
    );
  }
}

class InfoLine extends StatelessWidget {
  InfoLine({Key? key, required this.title, required this.content})
      : super(key: key);

  String title;
  String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${title}: ',
            style: Theme.of(context).textTheme.headline5,
          ),
          Container(
            width: Get.width / 2,
            child: Text(
              content,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}
