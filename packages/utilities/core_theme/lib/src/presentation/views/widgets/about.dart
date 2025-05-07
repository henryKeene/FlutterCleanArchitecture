import 'package:flutter/material.dart';
import 'package:lego_architecture_demo_mason/app/constants/app_constants.dart';

// This [showAppAboutDialog] function is based on the [AboutDialog] example
// that exist(ed) in the Flutter Gallery App.
void showAppAboutDialog(BuildContext context, {bool useRootNavigator = true}) {
  final theme = Theme.of(context);
  final aboutTextStyle = theme.textTheme.bodyMedium!;
  final footerStyle = theme.textTheme.bodySmall!;

  final mediaSize = MediaQuery.sizeOf(context);
  final width = mediaSize.width;
  final height = mediaSize.height;

  showAboutDialog(
    context: context,
    applicationName: AppConstants.title(context),
    applicationVersion: AppConstants.version,
    useRootNavigator: useRootNavigator,
    applicationIcon: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.info,
          size: 50,
          color: theme.colorScheme.primary,
        ),
      ],
    ),
    applicationLegalese:
        '${AppConstants.copyright}\n${AppConstants.author}\n${AppConstants.license}',
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                style: aboutTextStyle,
                text:
                    // ignore: lines_longer_than_80_chars
                    'This App is a starter skeleton project, it has been written and maintained by Screenmedia\n\n',
              ),
              TextSpan(
                style: footerStyle,
                text: 'Built with Flutter ${AppConstants.flutterVersion}\n'
                    'Media size (w:${width.toStringAsFixed(0)}, '
                    'h:${height.toStringAsFixed(0)})\n\n',
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

/// An about icon button used on the example's app app bar.
class AboutIconButton extends StatelessWidget {
  /// The color used on the icon button.
  ///
  /// If null, default to Icon() class default color.
  final Color? color;

  /// Use root navigator?
  final bool useRootNavigator;

  const AboutIconButton({super.key, this.color, this.useRootNavigator = true});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.info, color: color),
      onPressed: () {
        showAppAboutDialog(context, useRootNavigator: useRootNavigator);
      },
    );
  }
}
