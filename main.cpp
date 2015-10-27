#include <QApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include <QRect>
#include <QDebug>
#include <QDesktopWidget>
#include <QQmlContext>
#include <QStringListModel>
#include <QtQml>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    app.setWindowIcon(QIcon("qrc:/images/logo.ico"));
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
