//
//  RootPageViewController.swift
//  TradeMeBook
//
//  Created by Dronya_b on 5/19/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit

class RootPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    let viewList : [UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vcIntro1 = sb.instantiateViewController(withIdentifier: "Intro_1")
        let vcIntro2 = sb.instantiateViewController(withIdentifier: "Intro_2")
        let vcIntro3 = sb.instantiateViewController(withIdentifier: "Intro_3")
        let vcIntro4 = sb.instantiateViewController(withIdentifier: "Intro_4")
        return [vcIntro1, vcIntro2, vcIntro3, vcIntro4]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let vc1 = viewList.first {
            setViewControllers([vc1], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentVCIndex = self.viewList.index(of: viewController) else { return nil}
        let previousIndex = currentVCIndex - 1
        guard previousIndex >= 0 else { return nil }
        guard viewList.count > previousIndex else {return nil}
        
        return self.viewList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentVCIndex = self.viewList.index(of: viewController) else { return nil }
        let nextIndex = currentVCIndex + 1
        guard nextIndex < self.viewList.count else { return nil }
        
        return self.viewList[nextIndex]
    }
}
