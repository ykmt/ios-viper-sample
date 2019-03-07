// Router.swift

/// Router
///
/// `VIPER`で定義された`Router`オブジェクトです。
///
/// `App`は`Router`のルートオブジェクトです。

struct Router {
    static var App: AppWireframe = AppWireframeImpl()
}
