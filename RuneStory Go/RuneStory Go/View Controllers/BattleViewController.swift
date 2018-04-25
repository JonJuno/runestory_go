//
//  BattleViewController.swift
//  RuneStory Go
//
//  Created by Johnny Le on 4/19/18.
//  Copyright © 2018 Johnny Le. All rights reserved.
//

import Foundation
import UIKit

class BattleViewController: RuneStoryGoUIViewController {
    
    @IBOutlet weak var mobNameLabel: UILabel!
    @IBOutlet weak var mobHealthLabel: UILabel!
    @IBOutlet weak var mobImageView: UIImageView!
    
    @IBOutlet weak var attackSelectionView: UIView!
    @IBOutlet weak var attackPicker: UIPickerView!
    
    @IBOutlet weak var battleDescriptionView: UIView!
    @IBOutlet weak var battleDescriptionLabel: UILabel!
    
    @IBOutlet weak var actionButton: UIButton!
    
    var battleModel: Battle?
    var blueButtonColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        blueButtonColor = self.view.tintColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        redrawBattle(state: battleModel!.getPhase(), entity: battleModel!.mob.name, damage: 0)
        actionButton.setTitle("Okay", for: UIControlState.normal)
        if battleModel!.getPhase() == Battle.BattlePhase.Finished {
            dismiss(animated: true, completion: nil)
        }
        displayText()
    }
    
    func enableButton() {
        actionButton.isEnabled = true
        actionButton.tintColor = blueButtonColor
    }
    
    func disableButton() {
        actionButton.isEnabled = false
        actionButton.tintColor = UIColor.lightGray
    }
    
    func displayText() {
        self.attackSelectionView.isHidden = true
        self.battleDescriptionView.isHidden = false
    }
    
    func hideText() {
        self.attackSelectionView.isHidden = false
        self.battleDescriptionView.isHidden = true
    }
    
    func displayTextTimed(finished: @escaping () -> Void) {
        displayText()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.hideText()
            finished()
        }
    }
    
    @IBAction func attackButtonPressed(_ sender: Any) {
        let state = battleModel!.getPhase()
        
        if (state == Battle.BattlePhase.Started) {
            battleModel!.startBattle()
            hideText()
            actionButton.setTitle("Attack", for: UIControlState.normal)
            return
        }
        
        let damage = battleModel!.advanceBattle()
        redrawBattle(state: state, entity: battleModel!.mob.name, damage: damage)
        
        if state == Battle.BattlePhase.PlayerAttack {
            actionButton.setTitle("Okay", for: UIControlState.normal)
            displayText()
        } else {
            disableButton()
            self.actionButton.setTitle("Attack", for: UIControlState.normal)
            displayTextTimed(finished: {() -> Void in
                self.enableButton()
            })
        }

        if battleModel!.getPhase() == Battle.BattlePhase.Finished {
            self.performSegue(withIdentifier: "battleFinishedSegue", sender: self)
        }
    }
    
    func redrawBattle(state: Battle.BattlePhase, entity: String, damage: Int) {
        fillMobData()
        
        switch state {
        case Battle.BattlePhase.PlayerAttack:
            battleDescriptionLabel.text = genAttackText(target: entity, damage: damage)
        case Battle.BattlePhase.MobAttack:
            battleDescriptionLabel.text = genDamagedText(enemy: entity, damage: damage)
        case Battle.BattlePhase.Started:
            battleDescriptionLabel.text = genEncounterText(enemy: entity)
        default:
            battleDescriptionLabel.text = ""
        }
    }
    
    func fillMobData() {
        mobImageView.image = battleModel!.mob.image
        mobHealthLabel.text = String(describing: battleModel!.mob.getHealth())
        mobNameLabel.text = battleModel!.mob.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! ResultViewController
        dest.enemyMob = battleModel?.mob
        dest.won = battleModel?.mob.getHealth() == 0
    }
}
