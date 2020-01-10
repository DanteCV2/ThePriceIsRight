//
//  PageViewController.swift
//  ThePriceIsRight
//
//  Created by Dante Vega on 7/23/19.
//  Copyright © 2019 Dante Vega. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController , UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    
    lazy var pageViewControllers : [UIViewController] = {
        return [self.createNewVC(name: "RoomsVC"),
                self.createNewVC(name: "BathsVC"),
                self.createNewVC(name: "CarsVC"),
                self.createNewVC(name: "YearVC"),
                self.createNewVC(name: "SizeVC"),
                self.createNewVC(name: "ConditionVC"),
                self.createNewVC(name: "ResumenVC")
        ]
    }()
    
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        if let firstViewController = self.pageViewControllers.first{
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        self.delegate = self
        configurePageControl()
    }
    
    func configurePageControl() {
        self.pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
        self.pageControl.numberOfPages = self.pageViewControllers.count
        print(self.viewControllers!.count)
        self.pageControl.currentPage = 0
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(self.pageControl)
    }
    
    func createNewVC(name : String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = self.pageViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        
        if previousIndex >= 0{
            return pageViewControllers[previousIndex]
        }else{
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControlleIndex = self.pageViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = viewControlleIndex + 1
        if nextIndex < self.pageViewControllers.count {
            return self.pageViewControllers[nextIndex]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let currentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = self.pageViewControllers.firstIndex(of: currentViewController)!
    }
}
