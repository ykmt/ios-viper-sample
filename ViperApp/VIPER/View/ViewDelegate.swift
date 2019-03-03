// ViewDelegate.swift

import Foundation

/// ViewDelegate
///
/// このプロトコルは`VIPER`で定義された`View`のライフサイクルを委譲します。
///
/// このプロトコルは `Presenter`に実装継承されます。また、`Behavior`の参照を保持します。
///
/// このプロトコルを適用する場合は、`ViewDelegate`を継承したプロトコルを用意する必要があります。

/// View Delegate

protocol ViewDelegate {
    // Managing the View
    func loadView()
    func viewDidLoad()
    
    // Responding to View Events
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
    
    // Configuring the View's Layout Behavior
    func viewWillLayoutSubviews()
    func viewDidLayoutSubviews()
    func updateViewConstraints()
}
