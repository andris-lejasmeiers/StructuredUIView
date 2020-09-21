//
//  StructuredUITableViewCell.swift
//  StructuredUIView
//
//  Created by Andris Lejasmeiers on 05/12/2019.
//

import UIKit

open class StructuredUITableViewCell: UITableViewCell, StructuredUIViewProtocol {
  private var _needsUpdateAppearance = false

  public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUp()
  }

  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    setUp()
  }

  open override func traitCollectionDidChange(_: UITraitCollection?) {
    super.traitCollectionDidChange(traitCollection)
    setNeedsUpdateAppearance()
  }

  open override func didMoveToSuperview() {
    super.didMoveToSuperview()
    if superview != nil {
      setNeedsUpdateAppearance()
    }
  }

  open override func prepareForReuse() {
    super.prepareForReuse()
    resetNeedsUpdateAppearance()
  }

  // MARK: - StructuredUIViewProtocol

  // MARK: Generic

  open func setUp() {
    setUpView()
    setUpLayout()
    setUpConstraints()
    setUpAppearance()
  }

  open func setUpView() {}

  // MARK: Layout

  open func setUpLayout() {}

  // MARK: Constraints

  open func setUpConstraints() {}

  // MARK: Appearance

  open func setUpAppearance() {}

  public func updateAppearanceIfNeeded() {
    guard needsUpdateAppearance() else { return }
    resetNeedsUpdateAppearance()
    updateAppearance()
  }

  open func updateAppearance() {}

  public func needsUpdateAppearance() -> Bool { _needsUpdateAppearance }

  public func setNeedsUpdateAppearance() {
    guard !needsUpdateAppearance() else { return }
    resetNeedsUpdateAppearance()
    CFRunLoopPerformBlock(
      RunLoop.main.getCFRunLoop(),
      RunLoop.Mode.common as CFTypeRef,
      updateAppearanceIfNeeded
    )
  }

  public func resetNeedsUpdateAppearance() {
    _needsUpdateAppearance = false
  }
}
