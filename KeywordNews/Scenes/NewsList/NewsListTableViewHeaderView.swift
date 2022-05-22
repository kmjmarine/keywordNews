//
//  NewsListTableViewHeaderView.swift
//  KeywordNews
//
//  Created by kmjmarine on 2022/05/22.
//

import UIKit
import TTGTags
import SnapKit

final class NewsListTableViewHeaderView: UITableViewHeaderFooterView {
    static let identifier = "NewsListTableViewHeaderView"
    
    private var tags: [String] = ["ducati", "scrambler", "night shift", "kawasaki", "honda", "bmw s1000rr", "bmw r-ninet", "triumph", "suzuki"]
    
    private lazy var tagCollectionView = TTGTextTagCollectionView()
    
    func setup() {
        contentView.backgroundColor = .systemBackground
        
        setupTagCollectionViewLayout()
        setupTagCollectionView()
    }
}

extension NewsListTableViewHeaderView: TTGTextTagCollectionViewDelegate {
    func textTagCollectionView(_ textTagCollectionView: TTGTextTagCollectionView!, didTap tag: TTGTextTag!, at index: UInt) {
        guard tag.selected else { return }
        print(tags[Int(index)])
    }
}

private extension NewsListTableViewHeaderView {
    func setupTagCollectionViewLayout() {
        addSubview(tagCollectionView)
        
        tagCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupTagCollectionView() {
        tagCollectionView.delegate = self
        tagCollectionView.numberOfLines = 1
        tagCollectionView.scrollDirection = .horizontal
        tagCollectionView.showsHorizontalScrollIndicator = false
        tagCollectionView.selectionLimit = 1
        
        let insetValue: CGFloat = 16.0
        tagCollectionView.contentInset = UIEdgeInsets(top: insetValue, left: insetValue, bottom: insetValue, right: insetValue)
        
        let cornerRadiusValue = 12.0
        let shadowOpacityValue = 0.0
        let extraSpaceValue = CGSize(width: 20.0, height: 12.0)
        let color = UIColor.systemOrange
        
        let style = TTGTextTagStyle()
        style.backgroundColor = color
        style.cornerRadius = cornerRadiusValue
        style.borderWidth = 0.0
        style.shadowOpacity = shadowOpacityValue
        style.extraSpace = extraSpaceValue
        
        let selectStyle = TTGTextTagStyle()
        selectStyle.backgroundColor = .white
        selectStyle.cornerRadius = cornerRadiusValue
        selectStyle.shadowOpacity = shadowOpacityValue
        selectStyle.extraSpace = extraSpaceValue
        selectStyle.borderColor = color
        
        tags.forEach { tag in
            let font = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
            let tagContents = TTGTextTagStringContent(
                text: tag,
                textFont: font,
                textColor: .white
            )
            let selectedTagContents = TTGTextTagStringContent(
                text: tag,
                textFont: font,
                textColor: color
            )
            
            let tag = TTGTextTag(
                content: tagContents,
                style: style,
                selectedContent: selectedTagContents,
                selectedStyle: selectStyle
            )
            
            tagCollectionView.addTag(tag)
        }
    }
}


