# EQAutolayout

This simple package adds a custom ".=" operator that lets one define layout
constraints from layoutAnchors and layoutDimensions as simple, 
easy-to-read equations.

Example:
```
  NSLayoutConstraint.activate([
     view1.topAnchor     .= view2.topAnchor,
     view1.bottomAnchor  .= view2.bottomAnchor - 12.0,
     view1.leadingAnchor .= view2.leadingAnchor + 10.0,
     view1.widthAnchor   .= 100.0
  ])
```
