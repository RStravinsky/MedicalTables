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
#include <schedule.h>

int main(int argc, char *argv[])
{
//    QApplication app(argc, argv);

    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon("qrc:/images/logo.ico"));

    qmlRegisterType<ItemsList>("ItemsListComponent",1,0,"ItemsList");

    Schedule sched("schedule.xlsx");
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("scheduleItem", (QObject *)&sched);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
