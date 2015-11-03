#ifndef ITEMSLIST_H
#define ITEMSLIST_H

#include <QObject>
#include <QDebug>
#include <medicaltable.h>
#include <tablecolor.h>

class ItemsList : public QObject
{
    Q_OBJECT
    Q_PROPERTY (QQmlListProperty<QObject> itemsList READ getItemsList NOTIFY itemsListChanged)
    QList<QObject*> itemsList;

public:
    explicit ItemsList(QObject *parent = 0); 

    Q_INVOKABLE QQmlListProperty<QObject> getItemsList() {

       return QQmlListProperty<QObject>(this, itemsList);
    }

    Q_INVOKABLE void setItemsList(const QString & buttonName);
    Q_INVOKABLE void clearList();

signals:
    void itemsListChanged(QQmlListProperty<QObject> _itemsList);

public slots:
    void mainButtonClicked(const QString &buttonName);
    void itemClicked(const int &itemIndex);
};

#endif // ITEMSLIST_H
