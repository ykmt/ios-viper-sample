// ViewAction.swift

/// ViewAction
///
/// `VIPER`で定義された`View`で発生するイベントをハンドリングする為に使用するプロトコルです。
///
/// このプロトコルは `Presenter`に実装継承されます。また、`Presenter`と`Interactor`の参照を保持します。
///
/// このプロトコルを適用する場合は、`ViewAction`を継承したプロトコルを用意する必要があります。

protocol ViewAction { }
