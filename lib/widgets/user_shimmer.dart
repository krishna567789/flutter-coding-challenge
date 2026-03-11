import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserShimmer extends StatelessWidget {
  const UserShimmer({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),

          child: Shimmer.fromColors(

            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,

            child: Container(
              padding: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),

              child: Row(
                children: [

                  /// Avatar
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// Text Area
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        Container(
                          height: 12,
                          width: double.infinity,
                          color: Colors.grey,
                        ),

                        const SizedBox(height: 10),

                        Container(
                          height: 12,
                          width: 150,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}