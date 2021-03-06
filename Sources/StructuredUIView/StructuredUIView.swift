//
//  StructuredUIView.swift
//  StructuredUIView
//
//  Created by Andris Lejasmeiers on 05/12/2019.
//

#if os(iOS) || os(tvOS)
import UIKit

open class StructuredUIView: UIView, StructuredUIViewProtocol {
  private var _needsUpdateAppearance = false

  public override init(frame: CGRect) {
    super.init(frame: frame)
    setUp()
  }

  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    setUp()
  }

  open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    if traitCollection != previousTraitCollection {
      setNeedsUpdateAppearance()
    }
  }

  open override func didMoveToSuperview() {
    super.didMoveToSuperview()
    if superview != nil {
      setNeedsUpdateAppearance()
    }
  }

  open override func draw(_ rect: CGRect) {
    updateAppearanceIfNeeded()
    super.draw(rect)
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

  open func needsUpdateAppearance() -> Bool { _needsUpdateAppearance }

  public func setNeedsUpdateAppearance() {
    guard !needsUpdateAppearance() else { return }
    _needsUpdateAppearance = true
    setNeedsDisplay()
  }

  public func resetNeedsUpdateAppearance() { _needsUpdateAppearance = false }
}
#endif
