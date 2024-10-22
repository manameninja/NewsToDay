//
//  OnboardingViewController.swift
//  NewsToDay
//
//  Created by Даниил Павленко on 21.10.2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    struct SliderItem {
        var color: UIColor
        var title: String
        var text: String
        var imageName: String
        var textButton: String
    }
    
    private var sliderData: [SliderItem] = [
        SliderItem(color: .white, title: "First to know", text: "All news one place, be the first to know last news", imageName: "Image1", textButton: "Next"),
        SliderItem(color: .white, title: "Save to Bookmarks", text: "Save your favourite news and articles to the library", imageName: "Image2", textButton: "Next"),
        SliderItem(color: .white, title: "Search by Categories", text: "Discover things of this world. Thousands of articles in each category", imageName: "Image3", textButton: "Get Started")
    ]

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.isPagingEnabled = true
        
        return collection
    }()
    
    private var pagers: [UIView] = []
    private var currentSlide = 0
    private var widthAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupCollection()
        setupPageControl()
    }
    
    private func setupPageControl() {
        let pagerStack = UIStackView()
        pagerStack.translatesAutoresizingMaskIntoConstraints = false
        
        pagerStack.axis = .horizontal
        pagerStack.spacing = 10
        pagerStack.alignment = .center
        pagerStack.distribution = .fill
        
        for tag in 1...sliderData.count {
            let pager = UIView()
            pager.translatesAutoresizingMaskIntoConstraints = false
            
            pager.tag = tag
            pager.layer.cornerRadius = 5
            pager.backgroundColor = .white
            pager.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(scrollToSlide(sender: ))))
            self.pagers.append(pager)
            pagerStack.addArrangedSubview(pager)
        }
        
        view.addSubview(pagerStack)
        NSLayoutConstraint.activate([
            pagerStack.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.6),
            pagerStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupCollection() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func scrollToSlide(sender: UIGestureRecognizer) {
        if let index = sender.view?.tag {
            collectionView.scrollToItem(at: IndexPath(item: index - 1, section: 0), at: .centeredHorizontally, animated: true)
            currentSlide = index - 1
        }
    }
    
    @objc func nextSlide() {
        let maxSlide = sliderData.count
        if currentSlide < maxSlide - 1 {
            currentSlide += 1
            collectionView.scrollToItem(at: IndexPath(item: currentSlide, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sliderData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? OnboardingCollectionViewCell {
            
            cell.contentView.backgroundColor = sliderData[indexPath.item].color
            cell.titleLabel.text = sliderData[indexPath.item].title
            cell.textLabel.text = sliderData[indexPath.item].text
            cell.nextButton.setTitle(sliderData[indexPath.item].textButton, for: .normal)
            cell.imageSetup(imageName: sliderData[indexPath.item].imageName)
            
            cell.nextButton.addTarget(self, action: #selector(nextSlide), for: .touchUpInside)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        currentSlide = indexPath.item
        
        pagers.forEach { page in
            
            page.constraints.forEach { const in
                page.removeConstraint(const)
            }
            
            let tag = page.tag
            
            let viewTag = indexPath.row + 1
            
            if viewTag == tag {
                page.backgroundColor = .purplePrimary
                widthAnchor = page.widthAnchor.constraint(equalToConstant: 30)
            } else {
                page.backgroundColor = .greyLighter
                widthAnchor = page.widthAnchor.constraint(equalToConstant: 10)
            }
            
            widthAnchor?.isActive = true
            page.heightAnchor.constraint(equalToConstant: 10).isActive = true
        }
    }
    
}

#Preview { OnboardingViewController() }

