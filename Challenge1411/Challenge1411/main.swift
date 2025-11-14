//
//  main.swift
//  Challenge1411
//
//  Created by LUANA MIYASHIRO SALLES DE OLIVEIRA on 14/11/25.
//

import Foundation

//Ouro do aventureiro
var ouro = 100

print("Olá, Tav! Antes de entrar em nossa loja, como lhe devo te chamar?")
let nomeTav = readLine() ?? ""

let ItemsShop: [(nome: String, preco: Int)] = [
    ("Pacote de Suplimentos", 40),
    ("Elixir de Resistencia", 10),
    ("Elixir Supremo", 65),
    ("Pocao de vida", 10),
    ("Antidoto", 13),
    ("Amuleto da Absoluta", 20 ),
    ("Arco de Goblin", 16),
    ("Espada fraca", 20),
    ("Arco de Yurgir", 50),
    ("Espada da Chama", 60)
    
]

print("Bem-vindo(a), \(nomeTav), a loja ItemsSuperMegaImportantes para sua Jornada!!! (sim, esse é o nome da loja) \nAtualmente você tem: \(ouro)g")

//Inventorio
var inventario: [String] = []

//Menu
func mostrarMenu() {
    print("""
    \nComo posso te ajudar?
    
    [1] Ver itens da loja
    [2] Comprar item
    [3] Ver inventário
    [4] Ver ouro
    [5] Sair

    Escolha uma opção:
    """)

}

//Mostrar Items
func showItemsShop() {
    print("\nClaro! Aqui estão os itens disponíveis:\n")
    for (index, item) in ItemsShop.enumerated() {
        print("[\(index + 1)] \(item.nome) - \(item.preco)g")
    }
}

//Comprar Items
func comprarItem() {
    showItemsShop()
    print("\nDigite o número do item que deseja comprar:")

    if let input = readLine(), let choice = Int(input) {
        if choice >= 1 && choice <= ItemsShop.count {
            let selectedItem = ItemsShop[choice - 1]
            
            if ouro >= selectedItem.preco {
                ouro -= selectedItem.preco
                inventario.append(selectedItem.nome)
                print("\n✔ Você comprou: \(selectedItem.nome)!")
                print("Ouro restante: \(ouro)g\n")
            } else {
                print("\nSinto muito, \(nomeTav) você não tem ouro suficiente!\n")
            }
        } else {
            print("\nOpa! Opção inválida! Tente novamente!\n")
        }
    }
}

// Mostrar Inventorio
func showInventario() {
    print("\nSeu inventário:")
    if inventario.isEmpty {
        print("Seu inventário não tem nada :(\n")
    } else {
        for item in inventario {
            print("- \(item)")
        }
        print("")
    }
}

// Loop principal
var isRunning = true

while isRunning {
    mostrarMenu()

    if let input = readLine(), let option = Int(input) {
        switch option {
        case 1:
            showItemsShop()
        case 2:
            comprarItem()
        case 3:
            showInventario()
        case 4:
            print("\nVocê tem \(ouro)g.\n")
        case 5:
            print("\nAté mais, \(nomeTav)! Lembre-se que não aceitamos devoluções! \n")
            isRunning = false
        default:
            print("\nOpção inválida!\n")
        }
    } else {
        print("\nEntrada inválida!\n")
    }
}






