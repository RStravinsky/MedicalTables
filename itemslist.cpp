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
        itemsList.append(new MedicalTable("/images/images/electric_regulation_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/belt_holder_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/angle_regulation_CH.png", "CHECKED", false));
        itemsList.append(new MedicalTable("/images/images/electric_top_L.png", "UNCHECKED", false));
        itemsList.append(new MedicalTable("/images/images/chassis.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/bolser.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/chair_position_L.png", "UNCHECKED", false));
        itemsList.append(new MedicalTable("/images/images/foot_control.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/remote_control.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/pins_L.png", "UNCHECKED", false));
        itemsList.append(new MedicalTable("/images/images/sheet_holder.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/plug.png", "UNCHECKED", false));
        emit itemsListChanged(getItemsList());
    }
    else if(buttonName == "T3")
    {
        itemsList.clear();      
        itemsList.append(new MedicalTable("/images/images/electric_regulation_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/belt_holder.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/angle_regulation_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/electric_top_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/chassis.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/bolser.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/chair_position.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/foot_control.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/remote_control.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/pins.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/sheet_holder.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/plug.png", "UNCHECKED", true));
        emit itemsListChanged(getItemsList());
    }
    else if(buttonName == "T7")
    {
        itemsList.clear();
        itemsList.append(new MedicalTable("/images/images/electric_regulation_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/belt_holder.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/angle_regulation_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/electric_top_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/chassis_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/bolser_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/chair_position.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/foot_control.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/remote_control.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/pins.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/sheet_holder.png", "UNCHECKED", true)); // OK
        itemsList.append(new MedicalTable("/images/images/plug.png", "UNCHECKED", true));
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


