import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trauxit_test/utilities/constance/images_strings.dart';

class DefaultNetworkImage extends StatelessWidget {
  const DefaultNetworkImage(
    this.image, {
    Key? key,
    this.height,
    this.width,
    this.fit,
    this.placeholder,
    this.fromSliverList,
    this.loadingSize,
    this.needCache = true,
    this.filterQuality,
  }) : super(key: key);

  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Widget Function(BuildContext, String)? placeholder;
  final bool? fromSliverList;
  final double? loadingSize;
  final bool? needCache;
  final FilterQuality? filterQuality;
  @override
  Widget build(BuildContext context) {
    return needCache!
        ? CachedNetworkImage(
            imageUrl: image,
            placeholder: placeholder ??
                (context, url) =>
                    fromSliverList != null && fromSliverList == true
                        ? Image.asset(
                            ImagePath.iconWithoutBackground,
                            height: 25,
                            width: 25,
                            fit: BoxFit.contain,
                          )
                        : Image.asset(
                            ImagePath.iconWithoutBackground,
                            height: 25,
                            width: 25,
                            fit: BoxFit.contain,
                          ),
            //placeholderFadeInDuration: Duration.zero,
            //fadeOutDuration: Duration.zero,
            maxWidthDiskCache: 1000,
            maxHeightDiskCache: 1000,
            useOldImageOnUrlChange: true,
            filterQuality: filterQuality ?? FilterQuality.low,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: height ?? MediaQuery.of(context).size.height,
            width: width ?? MediaQuery.of(context).size.width,
            fit: fit ?? BoxFit.cover,
            fadeInCurve: Curves.ease,
          )
        : Image.network(
            image,
            loadingBuilder: (context, url, _) =>
                fromSliverList != null && fromSliverList == true
                    ? Image.asset(
                        ImagePath.iconWithoutBackground,
                        height: 25,
                        width: 25,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        ImagePath.iconWithoutBackground,
                        height: 25,
                        width: 25,
                        fit: BoxFit.contain,
                      ),
            errorBuilder: (context, url, error) => const Icon(Icons.error),
            height: height ?? MediaQuery.of(context).size.height,
            width: width ?? MediaQuery.of(context).size.width,
            fit: fit ?? BoxFit.cover,
          );
  }
}
