import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SliverFillViewport extends SliverMultiBoxAdaptorWidget {
  /// Creates a sliver whose box children that each fill the viewport.
  const SliverFillViewport({
    Key key,
    @required SliverChildDelegate delegate,
    this.viewportFraction: 1.0,
  })
      : assert(viewportFraction != null),
        assert(viewportFraction > 0.0),
        super(key: key, delegate: delegate);

  /// The fraction of the viewport that each child should fill in the main axis.
  ///
  /// If this fraction is less than 1.0, more than one child will be visible at
  /// once. If this fraction is greater than 1.0, each child will be larger than
  /// the viewport in the main axis.
  final double viewportFraction;

  @override
  RenderSliverFillViewport createRenderObject(BuildContext context) {
    final SliverMultiBoxAdaptorElement element = context;
    return new RenderSliverFillViewport(
        childManager: element, viewportFraction: viewportFraction);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderSliverFillViewport renderObject) {
    renderObject.viewportFraction = viewportFraction;
  }
}

class RenderSliverFillViewport extends RenderSliverFixedExtentBoxAdaptor {
  /// Creates a sliver that contains multiple box children that each fill the
  /// viewport.
  ///
  /// The [childManager] argument must not be null.
  RenderSliverFillViewport({
    @required RenderSliverBoxChildManager childManager,
    double viewportFraction: 1.0,
  })
      : assert(viewportFraction != null),
        assert(viewportFraction > 0.0),
        _viewportFraction = viewportFraction,
        super(childManager: childManager);

  @override
  double get itemExtent =>
      constraints.viewportMainAxisExtent * viewportFraction;

  /// The fraction of the viewport that each child should fill in the main axis.
  ///
  /// If this fraction is less than 1.0, more than one child will be visible at
  /// once. If this fraction is greater than 1.0, each child will be larger than
  /// the viewport in the main axis.
  double get viewportFraction => _viewportFraction;
  double _viewportFraction;

  set viewportFraction(double value) {
    assert(value != null);
    if (_viewportFraction == value) return;
    _viewportFraction = value;
    markNeedsLayout();
  }

  double get _padding =>
      (1.0 - viewportFraction) * constraints.viewportMainAxisExtent * 0.5;

  @override
  double indexToLayoutOffset(double itemExtent, int index) {
    return _padding + super.indexToLayoutOffset(itemExtent, index);
  }

  @override
  int getMinChildIndexForScrollOffset(double scrollOffset, double itemExtent) {
    return super.getMinChildIndexForScrollOffset(
        math.max(scrollOffset - _padding, 0.0), itemExtent);
  }

  @override
  int getMaxChildIndexForScrollOffset(double scrollOffset, double itemExtent) {
    return super.getMaxChildIndexForScrollOffset(
        math.max(scrollOffset - _padding, 0.0), itemExtent);
  }

  @override
  double estimateMaxScrollOffset(
    SliverConstraints constraints, {
    int firstIndex,
    int lastIndex,
    double leadingScrollOffset,
    double trailingScrollOffset,
  }) {
    final double padding = _padding;
    return childManager.estimateMaxScrollOffset(
          constraints,
          firstIndex: firstIndex,
          lastIndex: lastIndex,
          leadingScrollOffset: leadingScrollOffset - padding,
          trailingScrollOffset: trailingScrollOffset - padding,
        ) +
        padding +
        padding;
  }
}
