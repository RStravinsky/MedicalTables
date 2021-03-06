#include <QApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include <QtQml>
#include <QQuickWindow>
#include <QSplashScreen>
#include <QQuickView>
#include <QGuiApplication>
#include <QQmlEngine>
#include <QQmlContext>
#include <QQmlComponent>
#include <QObject>
#include <itemslist.h>
#include <tabledialog.h>

bool mainOrderActive{false};

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    app.setWindowIcon(QIcon("qrc:/images/logo.ico"));

    qmlRegisterType<ItemsList>("ItemsListComponent",1,0,"ItemsList");
    //qmlRegisterType<MedicalTable>("MedicalTableComponent",1,0,"MedicalTable");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
