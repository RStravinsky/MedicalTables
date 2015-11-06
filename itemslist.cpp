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
    if(buttonName == "Noxi T2")
    {
        itemsList.clear();
        itemsList.append(new MedicalTable("/images/images/electric_regulation_CH.png", "CHECKED", false,"transparent")); // CHECKED
        itemsList.append(new MedicalTable("/images/images/belt_holder_CH.png", "CHECKED", false,"transparent")); // CHECKED
        itemsList.append(new MedicalTable("/images/images/angle_regulation.png", "CHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/elastic.png", "CHECKED", false,"transparent"));
        itemsList.append(new MedicalTable("/images/images/electric_top_L.png", "UNCHECKED", false,"transparent"));
        itemsList.append(new MedicalTable("/images/images/chassis.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/bolser.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/chair_position_L.png", "UNCHECKED", false,"transparent"));
        itemsList.append(new MedicalTable("/images/images/foot_control.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/remote_control.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/pins_L.png", "UNCHECKED", false,"transparent"));
        itemsList.append(new MedicalTable("/images/images/sheet_holder.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/plug.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/inox_steel.png", "CHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("", "UNCHECKED", true,"#00CED1"));
        itemsList.append(new MedicalTable("", "UNCHECKED", true,"white"));
        emit itemsListChanged(getItemsList());
    }
    else if(buttonName == "Noxi T3")
    {
        itemsList.clear();      
        itemsList.append(new MedicalTable("/images/images/electric_regulation_CH.png", "CHECKED", false,"transparent")); // CHECKED
        itemsList.append(new MedicalTable("/images/images/belt_holder.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/angle_regulation_CH.png", "CHECKED", false,"transparent")); // CHECKED
        itemsList.append(new MedicalTable("/images/images/elastic.png", "CHECKED", false,"transparent"));
        itemsList.append(new MedicalTable("/images/images/electric_top_CH.png", "CHECKED", false,"transparent")); // CHECKED
        itemsList.append(new MedicalTable("/images/images/chassis.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/bolser.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/chair_position.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/foot_control.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/remote_control.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/pins.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/sheet_holder.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/plug.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/inox_steel.png", "CHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("", "CHECKED", true,"#00CED1"));
        itemsList.append(new MedicalTable("", "CHECKED", true,"white"));
        emit itemsListChanged(getItemsList());
    }
    else if(buttonName == "Noxi T7")
    {
        itemsList.clear();
        itemsList.append(new MedicalTable("/images/images/electric_regulation_CH.png", "CHECKED", false,"transparent")); // CHECKED
        itemsList.append(new MedicalTable("/images/images/belt_holder.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/angle_regulation_CH.png", "CHECKED", false,"transparent")); // CHECKED
        itemsList.append(new MedicalTable("/images/images/elastic.png", "CHECKED", false,"transparent"));
        itemsList.append(new MedicalTable("/images/images/electric_top_CH.png", "CHECKED", false,"transparent")); // CHECKED
        itemsList.append(new MedicalTable("/images/images/chassis_CH.png", "CHECKED", false,"transparent")); // CHECKED
        itemsList.append(new MedicalTable("/images/images/bolser_CH.png", "CHECKED", false,"transparent")); // CHECKED
        itemsList.append(new MedicalTable("/images/images/chair_position.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/foot_control.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/remote_control.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/pins.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/sheet_holder.png", "UNCHECKED", true,"transparent")); // OK
        itemsList.append(new MedicalTable("/images/images/plug.png", "UNCHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("/images/images/inox_steel.png", "CHECKED", true,"transparent"));
        itemsList.append(new MedicalTable("", "CHECKED", true,"#00CED1"));
        itemsList.append(new MedicalTable("", "CHECKED", true,"white"));
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

void ItemsList::setImagesList(const QString &buttonName)
{
    if(buttonName == "Noxi T2")
    {
        imagesList.clear();
        imagesList.append(new ImagesPath("/images/images/t2.png"));
        imagesList.append(new ImagesPath("/images/images/t2.png"));
        imagesList.append(new ImagesPath("/images/images/t2.png"));
        imagesList.append(new ImagesPath("/images/images/t2.png"));
        emit imagesListChanged(getImagesList());
    }
    else if(buttonName == "Noxi T3")
    {
        imagesList.clear();
        imagesList.append(new ImagesPath("/images/images/t3.png"));
        imagesList.append(new ImagesPath("/images/images/t3.png"));
        imagesList.append(new ImagesPath("/images/images/t3.png"));
        imagesList.append(new ImagesPath("/images/images/t3.png"));
        emit imagesListChanged(getImagesList());
    }
    else if(buttonName == "Noxi T7")
    {
        imagesList.clear();
        imagesList.append(new ImagesPath("/images/images/t7.png"));
        imagesList.append(new ImagesPath("/images/images/t7.png"));
        imagesList.append(new ImagesPath("/images/images/t7.png"));
        imagesList.append(new ImagesPath("/images/images/t7.png"));
        emit imagesListChanged(getImagesList());
    }
    else
        return;
}


