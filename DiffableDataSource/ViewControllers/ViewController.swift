//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by James Rochabrun on 8/4/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI
    @IBOutlet var collectionView: UICollectionView! {
        didSet {
            collectionView.register(MovieCell.self)
            collectionView.register(MovieCellRed.self)
            collectionView.registerHeader(TitleSupplementaryView.self, kind: UICollectionView.elementKindSectionHeader)
            collectionView.collectionViewLayout = createLayout()
            collectionView.delegate = self
            collectionView.backgroundColor = #colorLiteral(red: 0.1181615219, green: 0.9998033643, blue: 0.6902739406, alpha: 1)
        }
    }
    
    
    // MARK:- Private Properties
    private var dataSource: UICollectionViewDiffableDataSource<Section<Header, [Film]>, Film>?
    private var currentSnapshot: NSDiffableDataSourceSnapshot<Section<Header, [Film]>, Film>?

    private let starWarMovieSectionTitles = ["Classics", "Not that cool stuff"]

    // MAR:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
        configureHeader()
        fetchData()
    }
    
    /*
     If you want to know more about building API's using Generics ->
     https://blog.usejournal.com/advanced-generics-and-protocols-in-swift-c30020fd5ded
     */
    private func fetchData() {
        
        VaderAPI().get(Resources<Film>.self) { result in
            
            switch result {
            case .success(let resources):
                guard let resources = resources, let films = resources.results else {
                    print("the error is maybe array nil")
                    return
                }
                self.handle(films)
            case .failure(let err):
                print("the error is  \(err.customDescription)")
            }
        }
    }
    
    private func handle(_ films: [Film]) {
        
        let splitedArray = films.splitInTwoDimensions()
        // a
        var sectionItems = [Section<Header, [Film]>]()
        // b
        for (title, films) in zip(starWarMovieSectionTitles, splitedArray) {
            sectionItems.append(Section(headerItem: Header(titleHeader: title), items: films))
        }
        // c
        let payloadDatasource = DataSource(sections: sectionItems)
        // d
        currentSnapshot = NSDiffableDataSourceSnapshot<Section<Header, [Film]>, Film>()
        // e
        payloadDatasource.sections.forEach {
            currentSnapshot?.appendSections([$0])
            currentSnapshot?.appendItems($0.items)
        }
        // f
        guard let snapShot = currentSnapshot else { return }
        self.dataSource?.apply(snapShot, animatingDifferences: true)
    }
    
    
    private func configureDataSource() {
        
        dataSource = UICollectionViewDiffableDataSource.init(collectionView: collectionView, cellProvider: { collectionView, indexPath, film  in
            let cell: MovieCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            cell.configureCell(with: film)
            return cell
        })
    }
    
    func configureHeader() {

        dataSource?.supplementaryViewProvider = { (
            collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath) -> UICollectionReusableView? in

            let header: TitleSupplementaryView = collectionView.dequeueSuplementaryView(of: UICollectionView.elementKindSectionHeader, at: indexPath)
            header.backgroundColor = .lightGray
            
            if let section = self.currentSnapshot?.sectionIdentifiers[indexPath.section] {
                header.label.text = "\(section.headerItem.titleHeader)"
            }
            return header
        }
    }
    
    // MARK:- Handlers
    @IBAction func relaodData() {
        fetchData()
    }
    
    @IBAction func insertItem() {
        
        let lastJedi = Film(title: "The Last Jedi", episodeId: nil, openingCrawl: nil, director: nil, producer: nil, releaseDate: nil, species: nil, starships: ["nil"], vehicles: nil, characters: nil, planets: nil, url: nil, created: nil, edited: nil)
        guard let snapshot = dataSource?.snapshot() else { return }
        snapshot.appendItems([lastJedi])
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}

// MARK:- UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let movie = self.dataSource?.itemIdentifier(for: indexPath) else { return }
        guard let snaphost = self.dataSource?.snapshot() else { return }
        snaphost.deleteItems([movie], at: indexPath.section)
        dataSource?.apply(snaphost, animatingDifferences: true)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

// MARK:- Layout
extension ViewController {
    
    func createLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(44))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind:  UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [sectionHeader]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

