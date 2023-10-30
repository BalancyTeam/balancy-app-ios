//
//  OnboardingViewController.swift
//  Balancy
//
//  Created by Дарья Пивовар on 27.09.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == 0 {
                firstButton.setTitle("Просто капець як", for: .normal)
            } else if currentPage == slides.count - 1 {
                firstButton.setTitle("Ну пігнали", for: .normal)
            } else {
                firstButton.setTitle("Та то жесть якась", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            OnboardingSlide(description: "За*бався від великої кількості тасків та хаосу в житті?", image: #imageLiteral(resourceName: "1"), highlightedText: "великої кількості тасків"),
            OnboardingSlide(description: "Дедлайни підпалюють твою сраку і не знаєш, що робити далі?", image: #imageLiteral(resourceName: "2"), highlightedText: "підпалюють твою сраку"),
            OnboardingSlide(description: "Вихід є! Гоу з нами балансувати твоє бісове життя", image: #imageLiteral(resourceName: "3"), highlightedText: "Гоу з нами")
        ]
        
    }
    
    
    @IBAction func firstButtonClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "customTabBarViewController") as! UIViewController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = collectionView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
    
    
}
