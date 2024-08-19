import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop/core/function/getImageFromDrive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/model/item.dart';


class ItemDetailsWidget extends StatelessWidget {
  const ItemDetailsWidget({
    super.key,
    required this.item, this.withSizedBox = false,
  });

  final Item item;
  final bool? withSizedBox;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Row(
              children: [
                Container(
                  color: Color(toInt(item.background)!),
                  width: 100,
                  height: 150,
                  child: FractionallySizedBox(
                    widthFactor: 120 / 120,
                    heightFactor: 100 / 150,
                    child: CachedNetworkImage(
                      imageUrl: getImageFromDrive(item.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      height: 150,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20),
                      color: Theme.of(context).colorScheme.onPrimary,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item.category,
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary,
                                    letterSpacing: 5,
                                    fontSize: 14),
                              ),
                              Text(
                                item.name,
                                style: const TextStyle(color: Colors.white,fontSize: 22),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "⭐ (${item.reviewCount} reviews)",
                                style: const TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '\$${item.price} ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.75)),
                                    ),
                                    const Text(
                                      'per one',
                                      style: TextStyle(color: Colors.grey, fontSize: 12),
                                    )
                                  ])
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                padding:
                                const EdgeInsets.only(left: 4, right: 4),
                                width: 42,
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      item.numberOfPieces.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge,
                                    )),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
        if (withSizedBox!) ...[
          const SizedBox(height: 25),
        ]
      ],
    );
  }
}