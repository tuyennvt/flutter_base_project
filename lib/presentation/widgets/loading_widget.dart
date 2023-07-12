import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

const BoxDecoration _boxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(
    Radius.circular(2),
  ),
);

class LoadingListWidget extends StatelessWidget {
  const LoadingListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        period: const Duration(milliseconds: 2500),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => const LoadingListItem(hasShimmer: false),
          itemCount: 20,
        ),
      );
}

class LoadingListItem extends StatelessWidget {
  const LoadingListItem({Key? key, this.hasShimmer = true}) : super(key: key);
  final bool hasShimmer;

  @override
  Widget build(BuildContext context) {
    Widget child = Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  decoration: _boxDecoration,
                  height: 18,
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: _boxDecoration,
                  height: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  decoration: _boxDecoration,
                  height: 16,
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 4,
                child: Container(
                  decoration: _boxDecoration,
                  height: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  decoration: _boxDecoration,
                  height: 16,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ],
      ),
    );
    return hasShimmer
        ? Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: child,
          )
        : child;
  }
}

class LoadingDetailWidget extends StatelessWidget {
  const LoadingDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        period: const Duration(milliseconds: 2500),
        child: ListView(
          shrinkWrap: true,
          children: [
            _group,
            _group,
            _group,
            _group,
            _group,
            _group,
          ],
        ),
      );

  final Widget _group = const Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      _LoadingDetailListItem(
        titleFlex: 3,
        valueFlex: 4,
      ),
      _LoadingDetailListItem(
        titleFlex: 4,
        valueFlex: 3,
      ),
      _LoadingDetailListItem(
        titleFlex: 5,
        valueFlex: 2,
      ),
      _LoadingDetailListItem(
        titleFlex: 6,
        valueFlex: 3,
        spaceFlex: 1,
      ),
    ],
  );
}

class _LoadingDetailListItem extends StatelessWidget {
  const _LoadingDetailListItem({
    Key? key,
    required this.titleFlex,
    required this.valueFlex,
    this.spaceFlex = 2,
  }) : super(key: key);
  final int titleFlex;
  final int valueFlex;
  final int spaceFlex;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(flex: titleFlex, child: Container(decoration: _boxDecoration, height: 24)),
            Spacer(flex: spaceFlex),
            Expanded(flex: valueFlex, child: Container(decoration: _boxDecoration, height: 24))
          ],
        ),
      );
}

class LoadingModifyWidget extends StatelessWidget {
  const LoadingModifyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        period: const Duration(milliseconds: 2500),
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 16),
          itemBuilder: (BuildContext context, int index) => Container(
            margin: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(decoration: _boxDecoration, width: 96, height: 16),
                const SizedBox(height: 4),
                Container(decoration: _boxDecoration, height: 40)
              ],
            ),
          ),
          itemCount: 24,
        ),
      );
}

class LoadingFilterWidget extends StatelessWidget {
  const LoadingFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        period: const Duration(milliseconds: 2500),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _LoadingFilterListTile(),
                _LoadingFilterRow(),
                _LoadingFilterListTile(),
                _LoadingFilterRow(),
                _LoadingFilterListTile(),
                _LoadingFilterRow(),
                _LoadingFilterListTile(),
                _LoadingFilterRow(),
              ],
            ),
          ),
        ),
      );
}

class _LoadingFilterRow extends StatelessWidget {
  const _LoadingFilterRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(decoration: _boxDecoration, height: 24),
            ),
            const Spacer(),
            Expanded(
              flex: 2,
              child: Container(decoration: _boxDecoration, height: 24),
            ),
          ],
        ),
      );
}

class _LoadingFilterListTile extends StatelessWidget {
  const _LoadingFilterListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(decoration: _boxDecoration, width: 120, height: 24),
          const SizedBox(height: 16),
          _buildRow(4),
          const SizedBox(height: 8),
          _buildRow(3),
          const SizedBox(height: 8),
          _buildRow(4),
          const SizedBox(height: 8),
          _buildRow(2),
          const SizedBox(height: 32),
        ],
      );

  Widget _buildRow(int amount) => Row(
        children: List.generate(
          amount,
          (index) => Expanded(
            child: Container(
              decoration: _boxDecoration,
              height: 24,
              margin: const EdgeInsets.only(right: 12),
            ),
          ),
        ).toList(),
      );
}
