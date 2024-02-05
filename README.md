# EQAutolayout

This simple package defines custom operators that lets one set layout
constraints from layoutAnchors and layoutDimensions as simple, 
easy-to-read equations.

Example:
```
  // Instead of:

  NSLayoutConstraint.activate([
     view1.topAnchor.constraint(equalTo: view2.topAnchor),
     view1.bottomAnchor.constraint(equalTo: view2.bottomAnchor, constant: -12.0),
     view1.leadingAnchor.constraint(equalTo: view2.leadingAnchor, constant: 10.0),
     view1.widthAnchor.constraint(equalToConstant: 100.0)
  ])

  // We can use a more readable:

  NSLayoutConstraint.activate([
     view1.topAnchor     .= view2.topAnchor,
     view1.bottomAnchor  .= view2.bottomAnchor - 12.0,
     view1.leadingAnchor .= view2.leadingAnchor + 10.0,
     view1.widthAnchor   .= 100.0
  ])
```

The following custom operators are defined, and work with both layout dimensions and anchors:

```
// .=   Return constraint equating two anchors or dimensions
// .>=  Return constraint setting one anchor/dimension greater than or equal to another
// .<=  Return constraint setting one anchor/dimension less than or equal to another
```

In addition, a constant +/- offset may be added at the end of a statement:

```
     // Instead of: view1.widthAnchor.constraint(greaterThanOrEqualToConstant: 100.0)
     view1.widthAnchor .>= 100.0

     // Instead of: view1.bottomAnchor.constraint(lessThanOrEqualTo: view2.topAnchor, constant: 10.0)
     view1.bottomAnchor .<= view2.topAnchor + 10.0

```

