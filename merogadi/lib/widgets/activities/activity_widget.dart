import 'package:flutter/material.dart';

abstract class _Constants {
  static const double iconSize = 30;
  //static const double itemSpacing = 20;
  static const double badgeSize = 15;
}

enum ActivityType { book, location, profile }
enum ActivityQuality { good, bad }

class ActivityWidget extends StatelessWidget {
  const ActivityWidget(
      {Key? key, required this.activityType, required this.activityQuality})
      : super(key: key);

  final ActivityType activityType;
  final ActivityQuality activityQuality;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: _Constants.badgeSize / 2,
                right: _Constants.badgeSize / 2,
              ),
              child: _buildActivityContainer(
                context,
                _imageForActivityType(activityType),
                _titleForActivityType(activityType),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: _buildWarningBadge(activityQuality),
            ),
          ],
        ),
      );

  Widget _buildActivityContainer(
    BuildContext context,
    Image activityIcon,
    String title,
  ) =>
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(60),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Center(
            child: _buildActivityColumn(context, activityIcon, title),
          ),
        ),
      );

  Widget _buildActivityColumn(
    BuildContext context,
    Image activityIcon,
    String title,
  ) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: _Constants.iconSize,
            height: _Constants.iconSize,
            child: activityIcon,
          ),
          const SizedBox(height: 10),
          Opacity(
            opacity: 0.75,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      );

  Widget _buildWarningBadge(ActivityQuality quality) {
    switch (quality) {
      case ActivityQuality.good:
        return Container();
      case ActivityQuality.bad:
        return SizedBox(
          width: _Constants.badgeSize,
          height: _Constants.badgeSize,
          child: Image.asset("assets/images/icon_warning.png"),
        );
    }
  }

  Image _imageForActivityType(ActivityType activityType) {
    switch (activityType) {
      case ActivityType.book:
        return Image.asset("assets/images/booking.png");
      case ActivityType.location:
        return Image.asset("assets/images/location.png");
      case ActivityType.profile:
        return Image.asset("assets/images/profile.png");
    }
  }

  String _titleForActivityType(ActivityType activityType) {
    switch (activityType) {
      case ActivityType.book:
        return "Book";
      case ActivityType.location:
        return "Nearby";
      case ActivityType.profile:
        return "Profile";
    }
  }
}
