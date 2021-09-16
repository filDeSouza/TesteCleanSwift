//
//  ExtratoTableViewCell.swift
//  Teste Santander VIP
//
//  Created by Filipe de Souza on 16/09/21.
//

import UIKit

class ExtratoTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTipo: UILabel!
    @IBOutlet weak var labelData: UILabel!
    @IBOutlet weak var labelDescricao: UILabel!
    @IBOutlet weak var labelValor: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func popularCelula(extrato: ExtratoModel){
        
        labelValor.text = "\(extrato.valor)"
        
    }

}
