// PresenterInterface.swift

/// PresenterInterface
/// 
/// `Router`から参照される`Presenter`のインターフェイスです。
///
/// このプロトコルを`Presenter`が適用することで、`Router`からは`PresenterInterface`のインターフェイスしか見えなくなります。
///
/// 従って、`Presenter`に対する操作を制限します。
///
/// このプロトコルを適用する場合は、`PresenterInteractor`を継承したプロトコルを用意する必要があります。

protocol PresenterInterface { }
