//
//  MAlignedCollectionViewFlowLayout.swift
//
//  Created by Aleksey Makhutin on 01.08.2024.
//

import UIKit

open class MAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    public enum HorizontalAlignment {
        case center
        case left
        case right
        case fill
    }
    public enum VerticalAlignment {
        case center
        case top
        case bottom
    }

    open var horizontalAlignment: HorizontalAlignment = .fill {
        didSet {
            self.invalidateLayout()
        }
    }
    open var verticalAlignment: VerticalAlignment = .top {
        didSet {
            self.invalidateLayout()
        }
    }

    open override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributesObjectsByLines = super.layoutAttributesForElements(in: rect)?
            .compactMap { $0.copy() as? UICollectionViewLayoutAttributes }
            .splitLinesByMidY() ?? []

        layoutAttributesObjectsByLines
            .forEach { line in
                self.updateHorizontalLayout(for: line)
                self.updateVerticalLayout(for: line)
            }

        return layoutAttributesObjectsByLines.flatMap { $0 }
    }

    private func updateHorizontalLayout(for line: [UICollectionViewLayoutAttributes]) {
        let itemsWidth: CGFloat = line.reduce(into: 0, { $0 += $1.frame.width })
        let itemsAndSpacingWidth = itemsWidth + (self.minimumInteritemSpacing * CGFloat(line.count - 1))
        let collectionWidth: CGFloat = self.collectionView?.bounds.width ?? 0.0
        let itemsInsets = (collectionWidth - itemsAndSpacingWidth) / 2

        switch self.horizontalAlignment {
        case .center:
            var currentX = itemsInsets
            line.forEach {
                $0.frame.origin = CGPoint(x: currentX, y: $0.frame.origin.y)
                currentX = $0.frame.maxX + self.minimumInteritemSpacing
            }
        case .left:
            var currentX: CGFloat = 0
            line.forEach {
                $0.frame.origin = CGPoint(x: currentX, y: $0.frame.origin.y)
                currentX = $0.frame.maxX + self.minimumInteritemSpacing
            }
        case .right:
            var currentX: CGFloat = itemsInsets * 2
            line.forEach {
                $0.frame.origin = CGPoint(x: currentX, y: $0.frame.origin.y)
                currentX = $0.frame.maxX + self.minimumInteritemSpacing
            }
        case .fill:
            let inset = itemsInsets * 2 / CGFloat(line.count - 1)
            var currentX: CGFloat = 0
            line.forEach {
                $0.frame.origin = CGPoint(x: currentX, y: $0.frame.origin.y)
                currentX = $0.frame.maxX + inset + self.minimumInteritemSpacing
            }
        }
    }

    private func updateVerticalLayout(for line: [UICollectionViewLayoutAttributes]) {
        switch self.verticalAlignment {
        case .center:
            break
        case .top:
            let minimalY = line.min(by: { $0.frame.minY < $1.frame.minY })?.frame.minY ?? 0
            line.forEach { $0.frame.origin = CGPoint(x: $0.frame.origin.x, y: minimalY) }
        case .bottom:
            let maximalY = line.max(by: { $0.frame.maxY < $1.frame.maxY })?.frame.maxY ?? 0
            line.forEach { $0.frame.origin = CGPoint(x: $0.frame.origin.x, y: maximalY - $0.frame.height) }
        }
    }
}

private extension [UICollectionViewLayoutAttributes] {
    mutating func appending(_ newElement: Element) -> [Element] {
        self.append(newElement)
        return self
    }

    func splitLinesByMidY() -> [[UICollectionViewLayoutAttributes]] {
        self.reduce(into: [:], { $0[$1.frame.midY] = $0[$1.frame.midY]?.appending($1) ?? [$1] })
            .map { $0.value }
    }
}
