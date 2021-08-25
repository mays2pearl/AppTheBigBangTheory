//
//  ViewController.swift
//  TheBigBangTheory
//
//  Created by Maysa on 17/07/21.
//

import UIKit



class ViewController: UIViewController {
    
    private var arrayPersonagens: [Personagens] = []
    
    
    @IBOutlet weak var timeLineTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.arrayPersonagens = [Personagens(nome: "Amy Farrah Fowler", descricao: "Amy Farrah Fowler, Ph.D., é uma neurobiologista, que Raj e Howard descobriram como possível namorada para Sheldon através de um serviço de namoro online (sem o conhecimento de Sheldon). Amy é da cidade de Glendale. Ela estudou em Harvard e estudou um semestre na Noruega. Ela também tem um doutorado em neurobiologia. Ela mora no seu próprio apartamento, em Glendale.Logo nos episodios futuro teve romance com Sheldon e se casaram.", imageName: "Amy", imageNameBackground: "fundo cinza 2"), Personagens(nome: "Sheldon Cooper", descricao: "Sheldon Lee Cooper,Ph.D, fisico teorico, é o melhor amigo e colega de quarto de Leonard Hofstader, com quem compartilha os mesmos gostos. Ele é fã de histórias em quadrinhos, séries de ficção científica, jogos de cartas colecionáveis, Video games e RPG,possui comportamento que se assemelha a um robo. Conhece Amy Farrah Fowler, constroem um relacionamento e casam-se futuramente. Tambem recebem um premio Nobel de fisica", imageName: "Sheldon", imageNameBackground: "fundo verde"), Personagens(nome: "Penny", descricao: "Penny nasceu em uma fazendo em Omaha, Nebraska, e é uma aspirante a atriz, embora a sua carreira não seja bem-sucedida. Ela trabalhava na The Cheesecake Factory como garçonete, mas pediu demissão logo depois. Penny sempre foi o interesse amoroso de Leonard desde o primeiro episódio, namoraram a maior parte da serie e posteriormente se casaram.", imageName: "Penny", imageNameBackground: "fundo preto"), Personagens(nome: "Leonard Hofstadter", descricao: "", imageName: "Leonard", imageNameBackground: "fundo amarelo"), Personagens(nome: "Bernadette Wolowitz", descricao: "Bernadette, Ph.D., era uma garçonete na Cheesecake Factory e terminou o seu PhD em microbiologia e conseguiu um emprego lucrativo em uma companhia farmacêutica. Ela começou a namorar Howard Wolowitz,e eventualmente se casou com ele,futuramente começam a pensar sobre aumentar a família depois que a mãe de Howard melhorar.", imageName: "Bernadette", imageNameBackground: "fundo branco"), Personagens(nome: "Howard Wolowitz", descricao: "Howard Joel Wolowitz é um engenheiro aeroespacial judeu. Seu melhor amigo é Rajesh Koothrappali, e geralmente eles passam tempo no apartamento de Leonard e Sheldon com eles. Ele acaba se casando com Bernadette, com a qual ele se aproximou devido ao fato de ambos terem mães super-protetoras. Sua relação com ela fez com que ele ficasse menos assustador. Tecnicamente, ele também é um especialista ativo/astronauta.", imageName: "Howard", imageNameBackground: "fundo cinza"), Personagens(nome: "Raj Koothrappali", descricao: "Rajesh Koothrappali, Ph.D., ou Raj, é um astrofísico indiano e melhor amigo de Howard Wolowitz.Costuma dizer que veio de origem humilde na India, o que se mostra o contrario na serie, pois sua familia é rica. É o unico da serie que nao terminou com relacionamento amoroso efetivo. ", imageName: "Raj", imageNameBackground: "fundo amarelo")]
        
        self.timeLineTableView.register(UINib(nibName:"horizontalTableViewCell", bundle: nil), forCellReuseIdentifier: "horizontalTableViewCell")
        self.timeLineTableView.register(UINib(nibName:"CardTableViewCell", bundle: nil), forCellReuseIdentifier: "CardTableViewCell")
        self.timeLineTableView.dataSource = self
        self.timeLineTableView.delegate = self
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        return self.arrayPersonagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell: horizontalTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "horizontalTableViewCell", for: indexPath) as? horizontalTableViewCell
            
            cell?.delegate = self
            cell?.setup(value: self.arrayPersonagens)
            
            return cell ?? UITableViewCell()
        }else {
            
            let cell: CardTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell", for: indexPath) as? CardTableViewCell
            
            cell?.setup(value: self.arrayPersonagens[indexPath.row])
            
            return cell ?? UITableViewCell()
        }
        
     
        
    }
    
}


extension ViewController: horizontalTableViewCellProtocol {
    
    func didSelectPersonagens(value: Personagens) {
 
        print("ViewController=====HorizontalTableViewCellProtocol=======didSelectPersonagens\n \(value)")
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let personagemSelecionado: Personagens = self.arrayPersonagens[indexPath.row]
        
        performSegue(withIdentifier: "DetailViewController", sender: personagemSelecionado)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc: DetailViewController? = segue.destination as? DetailViewController
        
        vc?.personagemSelecionado = sender as? Personagens
    }
}

