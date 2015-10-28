#include "itemslist.h"

ItemsList::ItemsList(QObject *parent) : QObject(parent)
{

}

void ItemsList::mainButtonClicked( const QString &buttonName)
{
    qDebug() << buttonName;
}

void ItemsList::itemClicked( const int &itemIndex)
{
    qDebug() << itemIndex;
}

void ItemsList::setItemsList(const QString &buttonName)
{
    if(buttonName == "T2")
    {
        itemsList.clear();
        itemsList.append(new MedicalTable("/images/images/zaglowek.png", "CHECKED", true));
        itemsList.append(new MedicalTable("/images/images/zaglowek.png", "CHECKED", true));
        itemsList.append(new MedicalTable("/images/images/zaglowek.png", "CHECKED", true));
        itemsList.append(new MedicalTable("/images/images/zaglowek.png", "CHECKED", true));
        itemsList.append(new MedicalTable("/images/images/zaglowek.png", "CHECKED", true));
        emit itemsListChanged(getItemsList());
    }
    else if(buttonName == "T3")
    {
        itemsList.clear();
        itemsList.append(new MedicalTable("/images/images/uklad_jezdny.png", "CHECKED", true));
        itemsList.append(new MedicalTable("/images/images/uklad_jezdny.png", "CHECKED", true));
        itemsList.append(new MedicalTable("/images/images/uklad_jezdny.png", "CHECKED", true));
        itemsList.append(new MedicalTable("/images/images/uklad_jezdny.png", "CHECKED", true));
        itemsList.append(new MedicalTable("/images/images/uklad_jezdny.png", "CHECKED", true));
        emit itemsListChanged(getItemsList());
    }
    else if(buttonName == "T7")
    {
        itemsList.clear();
        itemsList.append(new MedicalTable("/images/images/pilot.png", "CHECKED", true));
        itemsList.append(new MedicalTable("/images/images/pilot.png", "CHECKED", true));
        itemsList.append(new MedicalTable("/images/images/pilot.png", "CHECKED", true));
        itemsList.append(new MedicalTable("/images/images/pilot.png", "CHECKED", true));
        itemsList.append(new MedicalTable("/images/images/pilot.png", "CHECKED", true));
        emit itemsListChanged(getItemsList());
    }
    else
        return;
}

void ItemsList::clearList()
{
    QList<QObject*> tmpList = itemsList;
    itemsList.clear();
    emit itemsListChanged(getItemsList());
    qDeleteAll(tmpList);
    tmpList.clear();
    emit itemsListChanged(getItemsList());
}


