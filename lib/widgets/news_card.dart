import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/pages/home_page/api/news_response.dart';
import 'package:hutech_check_in_app/route/router.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAIL_NEWS, arguments: news);
      },
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 0, vertical: MySizes.size10SW),
        child: Container(
          padding: EdgeInsets.all(MySizes.size12SW),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MySizes.size10SW),
            color: MyColors.white,
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(123, 174, 255, 0.5),
                blurRadius: MySizes.size1SW,
                spreadRadius: MySizes.size1SW,
                offset: Offset(
                  MySizes.size1SW / 10,
                  MySizes.size1SW / 10,
                ),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.center,
                news.title ?? '',
                style: MyTextStyles.content18BoldBlackSW,
              ),
              SizedBox(height: MySizes.size12SW),
              MarkdownBody(
                listItemCrossAxisAlignment:
                    MarkdownListItemCrossAxisAlignment.start,
                data: news.description ?? '',
                styleSheet: MarkdownStyleSheet(
                  p: MyTextStyles.content16RegularBlackSW,
                ),
              ),
              SizedBox(height: MySizes.size12SW),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.timer_outlined,
                    color: Colors.grey,
                    size: MySizes.size24SW, // Màu của icon
                  ),
                  SizedBox(
                    width: MySizes.size8SW,
                  ), // Khoảng cách giữa icon và văn bản
                  Text(
                    news.createdAt ?? '',
                    style: MyTextStyles.content14MediumGreySW,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    News news = ModalRoute.of(context)?.settings.arguments as News;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          slivers: [
            SliverAppBar(
              centerTitle: true,
              floating: true,
              pinned: false,
              snap: false,
              scrolledUnderElevation: 0,
              toolbarHeight: MySizes.size85SW,
              leadingWidth: MySizes.size65SW,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              leading: const BackArrowButton(),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MySizes.size20SW),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news.title ?? '',
                          style: MyTextStyles.content20BoldBlackSW,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: MySizes.size8SW),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person_pin_outlined,
                                color: Colors.grey,
                                size: MySizes.size24SW,
                              ),
                              SizedBox(
                                width: MySizes.size8SW,
                              ),
                              Text(
                                news.createdBy ?? '',
                                style: MyTextStyles.content14MediumGreySW,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: MySizes.size12SW),
                        MarkdownBody(
                          data: news.content ?? '',
                          styleSheet: MarkdownStyleSheet(
                            p: MyTextStyles.content17RegularBlackSW,
                            // Các style khác cho Markdown
                          ),
                          onTapLink:
                              (String text, String? href, String title) async {
                            Uri url = Uri.parse(href!);
                            if (!await launchUrl(url)) {
                              throw Exception('Không thể mở link này');
                            }
                          },
                        ),
                        SizedBox(height: MySizes.size12SW),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              color: Colors.grey,
                              size: MySizes.size24SW,
                            ),
                            SizedBox(
                              width: MySizes.size8SW,
                            ),
                            Text(
                              news.createdAt ?? '',
                              style: MyTextStyles.content14MediumGreySW,
                            ),
                          ],
                        ),
                        SizedBox(height: MySizes.size30SW),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
