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

// MARK: - Functions

// Set one anchor to another
// e.g. view1.topAnchor .= view2.topAnchor
public func .=<T>(lhs: NSLayoutAnchor<T>, rhs: NSLayoutAnchor<T>) -> NSLayoutConstraint {
    return lhs.constraint(equalTo: rhs)
}

public func .<= <T>(lhs: NSLayoutAnchor<T>, rhs: NSLayoutAnchor<T>) -> NSLayoutConstraint {
    return lhs.constraint(lessThanOrEqualTo: rhs)
}

public func .>= <T>(lhs: NSLayoutAnchor<T>, rhs: NSLayoutAnchor<T>) -> NSLayoutConstraint {
    return lhs.constraint(greaterThanOrEqualTo: rhs)
}

// Set one dimension to another
// e.g. view1.widthAnchor .= view2.widthAnchor
public func .=(lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
    return lhs.constraint(equalTo: rhs)
}

public func .<=(lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
    return lhs.constraint(lessThanOrEqualTo: rhs)
}

public func .>=(lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
    return lhs.constraint(greaterThanOrEqualTo: rhs)
}

// Set dimension to constant
// e.g. view1.heightAnchor .= 50.0
public func .=(lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.constraint(equalToConstant: rhs)
}

public func .<=(lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.constraint(lessThanOrEqualToConstant: rhs)
}

public func .>=(lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.constraint(greaterThanOrEqualToConstant: rhs)
}

// Set anchor to anchor plus constant
// e.g. view1.topAnchor .= view2.topAnchor + 123
public func .=<T>(lhs: NSLayoutAnchor<T>, rhs: EQAutolayoutAnchorIntermediate<T>) -> NSLayoutConstraint {
    return lhs.constraint(equalTo: rhs.anchor, constant: rhs.constant)
}

public func .<=<T>(lhs: NSLayoutAnchor<T>, rhs: EQAutolayoutAnchorIntermediate<T>) -> NSLayoutConstraint {
    return lhs.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant)
}

public func .>=<T>(lhs: NSLayoutAnchor<T>, rhs: EQAutolayoutAnchorIntermediate<T>) -> NSLayoutConstraint {
    return lhs.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant)
}

// Set dimension to dimension plus constant
// e.g. view1.widthAnchor .= view2.widthAnchor + 123
public func .=(lhs: NSLayoutDimension, rhs: EQAutolayoutDimensionIntermediate) -> NSLayoutConstraint {
    return lhs.constraint(equalTo: rhs.dimension, constant: rhs.constant)
}

public func .<=(lhs: NSLayoutDimension, rhs: EQAutolayoutDimensionIntermediate) -> NSLayoutConstraint {
    return lhs.constraint(lessThanOrEqualTo: rhs.dimension, constant: rhs.constant)
}

public func .>=(lhs: NSLayoutDimension, rhs: EQAutolayoutDimensionIntermediate) -> NSLayoutConstraint {
    return lhs.constraint(greaterThanOrEqualTo: rhs.dimension, constant: rhs.constant)
}

// MARK: - Intermediate values (Anchors)

// Container to hold intermediate result
public struct EQAutolayoutAnchorIntermediate<T: AnyObject> {
    let anchor: NSLayoutAnchor<T>
    let constant: CGFloat
}

public func +<T>(lhs: NSLayoutAnchor<T>, rhs: CGFloat) -> EQAutolayoutAnchorIntermediate<T> {
    return EQAutolayoutAnchorIntermediate(anchor: lhs, constant: rhs)
}

public func +<T>(lhs: CGFloat, rhs: NSLayoutAnchor<T>) -> EQAutolayoutAnchorIntermediate<T> {
    return EQAutolayoutAnchorIntermediate(anchor: rhs, constant: lhs)
}

public func -<T>(lhs: NSLayoutAnchor<T>, rhs: CGFloat) -> EQAutolayoutAnchorIntermediate<T> {
    return EQAutolayoutAnchorIntermediate(anchor: lhs, constant: -rhs)
}

// MARK: - Intermediate values (Dimension)

// Container to hold intermediate result
public struct EQAutolayoutDimensionIntermediate {
    let dimension: NSLayoutDimension
    let constant: CGFloat
}

public func +(lhs: NSLayoutDimension, rhs: CGFloat) -> EQAutolayoutDimensionIntermediate {
    return EQAutolayoutDimensionIntermediate(dimension: lhs, constant: rhs)
}

public func +(lhs: CGFloat, rhs: NSLayoutDimension) -> EQAutolayoutDimensionIntermediate {
    return EQAutolayoutDimensionIntermediate(dimension: rhs, constant: lhs)
}

public func -(lhs: NSLayoutDimension, rhs: CGFloat) -> EQAutolayoutDimensionIntermediate {
    return EQAutolayoutDimensionIntermediate(dimension: lhs, constant: -rhs)
}
