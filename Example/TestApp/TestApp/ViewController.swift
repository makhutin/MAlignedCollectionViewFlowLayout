//
//  ViewController.swift
//  TestApp
//
//  Created by Aleksey Makhutin on 01.08.2024.
//

import UIKit
import MAlignedCollectionViewFlowLayout

class ViewController: UIViewController {
    private let flowLayout = MAlignedCollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)

    var data = (1..<30).map { index in Props(name: "\(index)") }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.translatesAutoresizingMaskIntoConstraints = false

        self.flowLayout.minimumLineSpacing = 8
        self.flowLayout.minimumLineSpacing = 8

        self.flowLayout.horizontalAlignment = .center
        self.flowLayout.verticalAlignment = .center

        self.view.addSubview(self.collectionView)

        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])

        self.collectionView.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: TestCollectionViewCell.self))

//        Also you can use animation for changing aligment
//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
//            self.collectionView.performBatchUpdates {
//                self.flowLayout.horizontalAlignment = .left
//            }
//        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: String(describing: TestCollectionViewCell.self), for: indexPath) as? TestCollectionViewCell
        cell?.render(props: self.data[indexPath.item])
        return cell ?? UICollectionViewCell()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let props = self.data[indexPath.item]
        return CGSize(width: props.width, height: props.height)
    }
}

internal struct Props {
    let name: String

    var height: CGFloat = {
        return [50, 70, 100].randomElement()!
    }()

    var width: CGFloat = {
        return [50, 70, 100].randomElement()!
    }()
}

internal final class TestCollectionViewCell: UICollectionViewCell {
    private enum Constants {
        static let contentInset = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
    }

    private let nameLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    private var nameLeadingConstraint: NSLayoutConstraint?
    private var nameToImageLeadingConstraint: NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.contentView.backgroundColor = .lightGray
        self.contentView.addSubview(self.nameLabel)

        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.contentView.layer.cornerRadius = 8
    }

    func render(props: Props) {
        self.nameLabel.text = props.name
    }
}
