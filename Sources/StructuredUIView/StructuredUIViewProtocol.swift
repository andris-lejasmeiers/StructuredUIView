//
//  StructuredUIViewProtocol.swift
//  StructuredUIView
//
//  Created by Andris Lejasmeiers on 05/12/2019.
//

import UIKit

/// A protocol for making UIView custom subviews more reusable and structurally similar
public protocol StructuredUIViewProtocol: UIView {
  // MARK: Generic

  func setUp()
  func setUpView()

  // MARK: Layout

  func setUpLayout()

  // MARK: Constraints

  func setUpConstraints()

  // MARK: Appearance

  func setUpAppearance()
  func updateAppearanceIfNeeded()
  func updateAppearance()
  func needsUpdateAppearance() -> Bool
  func setNeedsUpdateAppearance()
  func resetNeedsUpdateAppearance()
}
