//
//  EQAutolayout.swift
//  EQAutolayout
//
//  Created by Vince Lee on 12/12/2022.
//

import UIKit

///
/// Creates custom operators to define autolayout constraints in a readable format:
///
///  Example:
///  ````
///  NSLayoutConstraint.activate([
///     view1.topAnchor     .= view2.topAnchor,
///     view1.bottomAnchor  .= view2.bottomAnchor - 12.0,
///     view1.leadingAnchor .= view2.leadingAnchor + 10.0,
///     view1.widthAnchor   .= 100.0
///  ])

infix operator .=: AssignmentPrecedence
infix operator .>=: AssignmentPrecedence
infix operator .<=: AssignmentPrecedence

// MARK: - Anchor to Anchor

// Set one anchor equal to another
// e.g. view1.topAnchor .= view2.topAnchor
public func .= <T>(lhs: NSLayoutAnchor<T>, rhs: NSLayoutAnchor<T>) -> NSLayoutConstraint {
    return lhs.constraint(equalTo: rhs)
}

// Set one anchor less than another
// e.g. view1.topAnchor .<= view2.topAnchor
public func .<= <T>(lhs: NSLayoutAnchor<T>, rhs: NSLayoutAnchor<T>) -> NSLayoutConstraint {
    return lhs.constraint(lessThanOrEqualTo: rhs)
}

// Set one anchor greater than another
// e.g. view1.topAnchor .>= view2.topAnchor
public func .>= <T>(lhs: NSLayoutAnchor<T>, rhs: NSLayoutAnchor<T>) -> NSLayoutConstraint {
    return lhs.constraint(greaterThanOrEqualTo: rhs)
}

// MARK: - Dimension to Dimension

// Set one dimension equal to another
// e.g. view1.widthAnchor .= view2.widthAnchor
public func .= (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
    return lhs.constraint(equalTo: rhs)
}

// Set one dimension less than another
// e.g. view1.widthAnchor .<= view2.widthAnchor
public func .<= (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
    return lhs.constraint(lessThanOrEqualTo: rhs)
}

// Set one dimension greater than another
// e.g. view1.widthAnchor .>= view2.widthAnchor

public func .>= (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
    return lhs.constraint(greaterThanOrEqualTo: rhs)
}

// MARK: - Dimension to constant

// Set dimension to constant
// e.g. view1.heightAnchor .= 50.0
public func .= (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.constraint(equalToConstant: rhs)
}

// Set dimension less than constant
// e.g. view1.heightAnchor .<= 50.0
public func .<= (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.constraint(lessThanOrEqualToConstant: rhs)
}

// Set dimension greater than constant
// e.g. view1.heightAnchor .>= 50.0
public func .>= (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.constraint(greaterThanOrEqualToConstant: rhs)
}

// MARK: - Anchor to Anchor +/- constant

// Set anchor to anchor plus constant
// e.g. view1.topAnchor .= view2.topAnchor + 123
public func .= <T>(lhs: NSLayoutAnchor<T>, rhs: EQAutolayoutAnchorIntermediate<T>) -> NSLayoutConstraint {
    return lhs.constraint(equalTo: rhs.anchor, constant: rhs.constant)
}

// Set anchor less than anchor plus constant
// e.g. view1.topAnchor .<= view2.topAnchor + 123
public func .<= <T>(lhs: NSLayoutAnchor<T>, rhs: EQAutolayoutAnchorIntermediate<T>) -> NSLayoutConstraint {
    return lhs.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant)
}

// Set anchor greater than anchor plus constant
// e.g. view1.topAnchor .>= view2.topAnchor + 123
public func .>= <T>(lhs: NSLayoutAnchor<T>, rhs: EQAutolayoutAnchorIntermediate<T>) -> NSLayoutConstraint {
    return lhs.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant)
}

// MARK: - Dimension to Dimension +/- constant

// Set dimension to dimension plus constant
// e.g. view1.widthAnchor .= view2.widthAnchor + 123
public func .= (lhs: NSLayoutDimension, rhs: EQAutolayoutDimensionIntermediate) -> NSLayoutConstraint {
    return lhs.constraint(equalTo: rhs.dimension, constant: rhs.constant)
}

// Set dimension less than dimension plus constant
// e.g. view1.widthAnchor .<= view2.widthAnchor + 123
public func .<= (lhs: NSLayoutDimension, rhs: EQAutolayoutDimensionIntermediate) -> NSLayoutConstraint {
    return lhs.constraint(lessThanOrEqualTo: rhs.dimension, constant: rhs.constant)
}

// Set dimension greater than dimension plus constant
// e.g. view1.widthAnchor .>= view2.widthAnchor + 123
public func .>= (lhs: NSLayoutDimension, rhs: EQAutolayoutDimensionIntermediate) -> NSLayoutConstraint {
    return lhs.constraint(greaterThanOrEqualTo: rhs.dimension, constant: rhs.constant)
}

// MARK: - Intermediate values (Anchors)

// Container to hold intermediate result
public struct EQAutolayoutAnchorIntermediate<T: AnyObject> {
    let anchor: NSLayoutAnchor<T>
    let constant: CGFloat
}

// anchor + constant
public func + <T>(lhs: NSLayoutAnchor<T>, rhs: CGFloat) -> EQAutolayoutAnchorIntermediate<T> {
    return EQAutolayoutAnchorIntermediate(anchor: lhs, constant: rhs)
}

// constant + anchor
public func + <T>(lhs: CGFloat, rhs: NSLayoutAnchor<T>) -> EQAutolayoutAnchorIntermediate<T> {
    return EQAutolayoutAnchorIntermediate(anchor: rhs, constant: lhs)
}

// anchor - constant
public func - <T>(lhs: NSLayoutAnchor<T>, rhs: CGFloat) -> EQAutolayoutAnchorIntermediate<T> {
    return EQAutolayoutAnchorIntermediate(anchor: lhs, constant: -rhs)
}

// MARK: - Intermediate values (Dimension)

// Container to hold intermediate result
public struct EQAutolayoutDimensionIntermediate {
    let dimension: NSLayoutDimension
    let constant: CGFloat
}

// dimension + constant
public func + (lhs: NSLayoutDimension, rhs: CGFloat) -> EQAutolayoutDimensionIntermediate {
    return EQAutolayoutDimensionIntermediate(dimension: lhs, constant: rhs)
}

// constant + dimension
public func + (lhs: CGFloat, rhs: NSLayoutDimension) -> EQAutolayoutDimensionIntermediate {
    return EQAutolayoutDimensionIntermediate(dimension: rhs, constant: lhs)
}

// dimension - constant
public func - (lhs: NSLayoutDimension, rhs: CGFloat) -> EQAutolayoutDimensionIntermediate {
    return EQAutolayoutDimensionIntermediate(dimension: lhs, constant: -rhs)
}
