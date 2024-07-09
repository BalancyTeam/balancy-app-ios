//
//  CategoryBalanceViewController.swift
//  Balancy
//
//  Created by  Toropov Oleksandr on 19.12.2023.
//

import UIKit

class CategoryBalanceViewController: UIViewController {

    private let maxSliderValue: Float = 100.0

    private var workProgressWidthConstraint: NSLayoutConstraint!
    private var lifeProgressWidthConstraint: NSLayoutConstraint!
    private var educationProgressWidthConstraint: NSLayoutConstraint!
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let workSliderTooltipImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let lifeSliderTooltipImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let educationSliderTooltipImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let chooseBalanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Оберіть баланс категорій"
        label.font = UIFont(name: FontName.regular, size: 24)
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()

    private let progressBarView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var workProgress = createProgressSection(color: AppColor.work)
    private lazy var lifeProgress = createProgressSection(color: AppColor.life)
    private lazy var educationProgress = createProgressSection(color: AppColor.education)
    
    private let workProgressLabel = createProgressLabel()
    private let lifeProgressLabel = createProgressLabel()
    private let educationProgressLabel = createProgressLabel()

    private let workLabel = createCategoryLabel(text: "Робота")
    private let lifeLabel = createCategoryLabel(text: "Життя")
    private let educationLabel = createCategoryLabel(text: "Навчання")

    private let workSlider = createCategorySlider(tintColor: AppColor.work)
    private let lifeSlider = createCategorySlider(tintColor: AppColor.life)
    private let educationSlider = createCategorySlider(tintColor: AppColor.education)

    private let workPercentageLabel = createPercentageLabel()
    private let lifePercentageLabel = createPercentageLabel()
    private let educationPercentageLabel = createPercentageLabel()

    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Localized.runButton.localizedString, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: FontName.medium, size: 16)
        button.backgroundColor = AppColor.button
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 2
        pageControl.currentPage = 1
        pageControl.pageIndicatorTintColor = AppColor.pageIndicatorTintColor
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        logoImageView.image = UIImage(named: ImageName.logo)
        workSliderTooltipImageView.image = UIImage(named: ImageName.sliderTooltip)
        lifeSliderTooltipImageView.image = UIImage(named: ImageName.sliderTooltip)
        educationSliderTooltipImageView.image = UIImage(named: ImageName.sliderTooltip)


        workSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        lifeSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        educationSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    
        setupUI()
        setupConstraints()
        
        workSlider.value = 50
        lifeSlider.value = 30
        educationSlider.value = 20
    }
    
    override func viewDidLayoutSubviews() {
        updatePercentageLabels()
        updateProgressBar()
        updateTooltipPositions()
    }

    private func setupUI() {
        [logoImageView, chooseBalanceLabel, progressBarView, workLabel, workSlider, lifeLabel, lifeSlider, educationLabel, educationSlider, actionButton, pageControl, workSliderTooltipImageView, lifeSliderTooltipImageView, educationSliderTooltipImageView, workPercentageLabel, lifePercentageLabel, educationPercentageLabel].forEach {
            view.addSubview($0)
        }

        progressBarView.addSubview(workProgress)
        progressBarView.addSubview(lifeProgress)
        progressBarView.addSubview(educationProgress)
        progressBarView.addSubview(workProgressLabel)
        progressBarView.addSubview(lifeProgressLabel)
        progressBarView.addSubview(educationProgressLabel)

        workProgressWidthConstraint = workProgress.widthAnchor.constraint(equalToConstant: 0)
        lifeProgressWidthConstraint = lifeProgress.widthAnchor.constraint(equalToConstant: 0)
        educationProgressWidthConstraint = educationProgress.widthAnchor.constraint(equalToConstant: 0)

        NSLayoutConstraint.activate([
            workProgress.leadingAnchor.constraint(equalTo: progressBarView.leadingAnchor),
            workProgress.topAnchor.constraint(equalTo: progressBarView.topAnchor),
            workProgress.bottomAnchor.constraint(equalTo: progressBarView.bottomAnchor),
            workProgressWidthConstraint,

            lifeProgress.leadingAnchor.constraint(equalTo: workProgress.trailingAnchor),
            lifeProgress.topAnchor.constraint(equalTo: progressBarView.topAnchor),
            lifeProgress.bottomAnchor.constraint(equalTo: progressBarView.bottomAnchor),
            lifeProgressWidthConstraint,

            educationProgress.leadingAnchor.constraint(equalTo: lifeProgress.trailingAnchor),
            educationProgress.topAnchor.constraint(equalTo: progressBarView.topAnchor),
            educationProgress.bottomAnchor.constraint(equalTo: progressBarView.bottomAnchor),
            educationProgress.trailingAnchor.constraint(equalTo: progressBarView.trailingAnchor),
            educationProgressWidthConstraint
        ])
    }
    
    @objc private func sliderValueChanged(_ sender: UISlider) {
        sender.value = roundToNearestFive(sender.value)
        
        let totalValue = workSlider.value + lifeSlider.value + educationSlider.value
        if totalValue > maxSliderValue {
            let excess = totalValue - maxSliderValue
            sender.value = roundToNearestFive(sender.value - excess)
        }

        workPercentageLabel.text = "\(Int(workSlider.value))%"
        lifePercentageLabel.text = "\(Int(lifeSlider.value))%"
        educationPercentageLabel.text = "\(Int(educationSlider.value))%"

        updateProgressBar()
        updateTooltipPositions()
    }
    
    private func updatePercentageLabels() {
        workPercentageLabel.text = "\(Int(workSlider.value))%"
        lifePercentageLabel.text = "\(Int(lifeSlider.value))%"
        educationPercentageLabel.text = "\(Int(educationSlider.value))%"
    }

    private func updateProgressBar() {
        let totalValue = workSlider.value + lifeSlider.value + educationSlider.value
        if totalValue == 0 {
            return
        }

        let workPercentage = Int(workSlider.value)
        let lifePercentage = Int(lifeSlider.value)
        let educationPercentage = Int(educationSlider.value)

        updateProgressLabel(workProgressLabel, percentage: workPercentage)
        updateProgressLabel(lifeProgressLabel, percentage: lifePercentage)
        updateProgressLabel(educationProgressLabel, percentage: educationPercentage)

        let workMultiplier = CGFloat(workSlider.value / totalValue)
        let lifeMultiplier = CGFloat(lifeSlider.value / totalValue)
        let educationMultiplier = CGFloat(educationSlider.value / totalValue)

        workProgressWidthConstraint.constant = workMultiplier * progressBarView.bounds.width
        lifeProgressWidthConstraint.constant = lifeMultiplier * progressBarView.bounds.width
        educationProgressWidthConstraint.constant = educationMultiplier * progressBarView.bounds.width
        
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }

    private func updateProgressLabel(_ label: UILabel, percentage: Int) {
        if percentage < 10 {
            label.isHidden = true
        } else {
            label.isHidden = false
            label.text = "\(percentage)%"
        }
    }
    
    private func updateTooltipPositions() {
        let sliderWidth = workSlider.bounds.width
        let tooltipWidth = workSliderTooltipImageView.bounds.width

        for (slider, tooltipImageView, percentageLabel) in [
            (workSlider, workSliderTooltipImageView, workPercentageLabel),
            (lifeSlider, lifeSliderTooltipImageView, lifePercentageLabel),
            (educationSlider, educationSliderTooltipImageView, educationPercentageLabel)
        ] {
            let thumbCenterX = slider.thumbCenterX
            
            var tooltipCenterX = thumbCenterX
            let minX = slider.frame.minX + tooltipWidth / 2
            let maxX = slider.frame.maxX - tooltipWidth / 2
            
            tooltipCenterX = max(minX, min(maxX, tooltipCenterX))
            
            tooltipImageView.center.x = tooltipCenterX
            percentageLabel.center = tooltipImageView.center
        }
    }
    private static func createCategoryLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: FontName.light, size: 14)
        label.textColor = AppColor.category
        return label
    }

    private static func createCategorySlider(tintColor: UIColor) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.tintColor = tintColor
        slider.thumbTintColor = tintColor
        slider.maximumTrackTintColor = AppColor.sliderMaximumTintColor
        return slider
    }

    private static func createPercentageLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: FontName.light, size: 12)
        label.textColor = AppColor.category
        return label
    }

    private static func createProgressLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: FontName.bold, size: 14)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }

    private func createProgressSection(color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        return view
    }
    
    private func roundToNearestFive(_ value: Float) -> Float {
        return round(value / 5) * 5
    }
}

private extension CategoryBalanceViewController {
    private func setupConstraints() {
        [logoImageView, chooseBalanceLabel, progressBarView, workProgress, workLabel, workSlider, workPercentageLabel, workProgressLabel, lifeProgress, lifeLabel, lifeSlider, lifePercentageLabel, lifeProgressLabel, educationProgressLabel, educationProgress, educationLabel, educationSlider, educationPercentageLabel, actionButton, pageControl, workSliderTooltipImageView, lifeSliderTooltipImageView, educationSliderTooltipImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            logoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.076),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor, multiplier: 0.71875),
            
            chooseBalanceLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            chooseBalanceLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            chooseBalanceLabel.widthAnchor.constraint(equalToConstant: 283),

            progressBarView.topAnchor.constraint(equalTo: chooseBalanceLabel.bottomAnchor, constant: 20),
            progressBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            progressBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            progressBarView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            
            workProgressLabel.trailingAnchor.constraint(equalTo: workProgress.trailingAnchor, constant: -4),
            workProgressLabel.centerYAnchor.constraint(equalTo: progressBarView.centerYAnchor),

            lifeProgressLabel.trailingAnchor.constraint(equalTo: lifeProgress.trailingAnchor, constant: -4),
            lifeProgressLabel.centerYAnchor.constraint(equalTo: progressBarView.centerYAnchor),

            educationProgressLabel.trailingAnchor.constraint(equalTo: educationProgress.trailingAnchor, constant: -4),
            educationProgressLabel.centerYAnchor.constraint(equalTo: progressBarView.centerYAnchor),

            workLabel.topAnchor.constraint(equalTo: progressBarView.bottomAnchor, constant: 10),
            workLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            workSlider.topAnchor.constraint(equalTo: workLabel.bottomAnchor),
            workSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            workSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            workSlider.trailingAnchor.constraint(equalTo: workPercentageLabel.leadingAnchor, constant: -10),

//            workPercentageLabel.centerYAnchor.constraint(equalTo: workSlider.centerYAnchor),
//            workPercentageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            lifeLabel.topAnchor.constraint(equalTo: workSliderTooltipImageView.bottomAnchor),
            lifeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            lifeSlider.topAnchor.constraint(equalTo: lifeLabel.bottomAnchor),
            lifeSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lifeSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lifeSlider.trailingAnchor.constraint(equalTo: lifePercentageLabel.leadingAnchor, constant: -10),

//            lifePercentageLabel.centerYAnchor.constraint(equalTo: lifeSlider.centerYAnchor),
//            lifePercentageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            educationLabel.topAnchor.constraint(equalTo: lifeSliderTooltipImageView.bottomAnchor),
            educationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            educationSlider.topAnchor.constraint(equalTo: educationLabel.bottomAnchor),
            educationSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            educationSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            educationSlider.trailingAnchor.constraint(equalTo: educationPercentageLabel.leadingAnchor, constant: -10),

//            educationPercentageLabel.centerYAnchor.constraint(equalTo: educationSlider.centerYAnchor),
//            educationPercentageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            actionButton.heightAnchor.constraint(equalToConstant: 50),
            
            pageControl.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            workSliderTooltipImageView.topAnchor.constraint(equalTo: workSlider.bottomAnchor),
            workSliderTooltipImageView.centerXAnchor.constraint(equalTo: workSlider.leadingAnchor),

            lifeSliderTooltipImageView.topAnchor.constraint(equalTo: lifeSlider.bottomAnchor),
            lifeSliderTooltipImageView.centerXAnchor.constraint(equalTo: lifeSlider.leadingAnchor),

            educationSliderTooltipImageView.topAnchor.constraint(equalTo: educationSlider.bottomAnchor),
            educationSliderTooltipImageView.centerXAnchor.constraint(equalTo: educationSlider.leadingAnchor),
        ])
    }
}




