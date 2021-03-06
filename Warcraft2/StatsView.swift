import UIKit

class StatsView: UIView {
    let iconName: [AssetType: String] = [
        .peasant: "peasant",
        .footman: "footman",
        .archer: "archer",
        .ranger: "ranger",
        .goldMine: "gold-mine",
        .townHall: "town-hall",
        .keep: "keep",
        .castle: "castle",
        .farm: "chicken-farm",
        .barracks: "human-barracks",
        .lumberMill: "human-lumber-mill",
        .blacksmith: "human-blacksmith",
        .scoutTower: "scout-tower",
        .guardTower: "human-guard-tower",
        .cannonTower: "human-cannon-tower"
    ]

    let icons: GraphicTileset

    let iconImageView = UIImageView()
    let nameLabel = UILabel()
    let healthLabel = UILabel()
    let armorLabel = UILabel()
    let damageLabel = UILabel()
    let rangeLabel = UILabel()
    let sightLabel = UILabel()
    let speedLabel = UILabel()

    init(size: CGSize, icons: GraphicTileset) {
        self.icons = icons
        super.init(frame: CGRect(origin: .zero, size: size))
        backgroundColor = .black
        self.addSubview(iconImageView)
        self.addSubview(nameLabel)
        self.addSubview(healthLabel)
        self.addSubview(armorLabel)
        self.addSubview(damageLabel)
        self.addSubview(rangeLabel)
        self.addSubview(sightLabel)
        self.addSubview(speedLabel)
        for subview in subviews where subview is UILabel {
            let label = subview as! UILabel
            label.textAlignment = .center
            label.textColor = .white
            label.font = UIFont(name: "Papyrus", size: 16)
        }
    }

    override init(frame: CGRect) {
        fatalError("View can't be initialized using this method.")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("View can't be initialized using this method.")
    }

    override func layoutSubviews() {
        iconImageView.frame = CGRect(x: 8, y: 8, width: icons.tileWidth, height: icons.tileHeight)
        nameLabel.frame = CGRect(x: Int(iconImageView.frame.maxX), y: 12, width: bounds.width - icons.tileWidth - 16, height: icons.tileHeight)
        healthLabel.frame = CGRect(x: 8, y: 50, width: bounds.width - 16, height: 30)
        armorLabel.frame = CGRect(x: 8, y: 80, width: bounds.width - 16, height: 30)
        damageLabel.frame = CGRect(x: 8, y: 110, width: bounds.width - 16, height: 30)
        rangeLabel.frame = CGRect(x: 8, y: 140, width: bounds.width - 16, height: 30)
        sightLabel.frame = CGRect(x: 8, y: 170, width: bounds.width - 16, height: 30)
        speedLabel.frame = CGRect(x: 8, y: 200, width: bounds.width - 16, height: 30)
    }

    func displayAssetInfo(_ asset: PlayerAsset?) {
        for subview in subviews {
            subview.isHidden = asset == nil
        }

        guard let asset = asset else {
            return
        }

        nameLabel.text = asset.assetType.name
        healthLabel.text = "Health: \(asset.hitPoints) / \(asset.maxHitPoints)"
        armorLabel.text = "Armor: \(asset.effectiveArmor)"
        damageLabel.text = "Damage: \(asset.effectiveBasicDamage) + \(asset.effectivePiercingDamage)"
        rangeLabel.text = "Range: \(asset.effectiveRange)"
        sightLabel.text = "Sight: \(asset.effectiveSight)"
        speedLabel.text = "Speed: \(asset.effectiveSpeed)"

        if asset.speed == 0 {
            armorLabel.isHidden = true
            damageLabel.isHidden = true
            rangeLabel.isHidden = true
            sightLabel.isHidden = true
            speedLabel.isHidden = true
            healthLabel.adjustsFontSizeToFitWidth = true
            let command = asset.currentCommand
            if let capability = command.capability, command.action == .capability {
                if AssetCapabilityType.trains.contains(capability) {
                    if let trainProcess = command.activatedCapability as? PlayerCapabilityTrainNormal.ActivatedCapability {
                        if let unit = command.assetTarget {
                            armorLabel.isHidden = false
                            armorLabel.text = "Training \(unit.assetType.name)"
                            damageLabel.isHidden = false
                            damageLabel.text = "\(trainProcess.percentComplete(max: 100))%"
                        }
                    }
                } else if AssetCapabilityType.upgrades.contains(capability) {
                    if let upgradeProcess = command.activatedCapability as? PlayerCapabilityUnitUpgrade.ActivatedCapability {
                        armorLabel.isHidden = false
                        armorLabel.text = "Upgrading"
                        damageLabel.isHidden = false
                        damageLabel.text = "\(upgradeProcess.percentComplete(max: 100))%"
                    }
                }
            }
        }

        icons.drawTile(on: iconImageView, index: icons.findTile(iconName[asset.assetType.type] ?? "disabled"))
    }
}
