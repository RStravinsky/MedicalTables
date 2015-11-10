#include "itemslist.h"

ItemsList::ItemsList(QObject *parent) : QObject(parent)
{

}

void ItemsList::setArray()
{
    for(int i = 0; i < itemsList.size() - 2; ++i)
    {
        if(itemsList.at(i)->property("imageState").toString() == "CHECKED")
            indexArray[i] = true;
        else
            indexArray[i] = false;
    }
}

void ItemsList::generateCSV()
{
    QDir dir;
    QString path = dir.absolutePath();
    QString pathFile = path + "/optionsList.csv";

    QFile csvFile(pathFile);
    QTextStream out( &csvFile );
    csvFile.open(QIODevice::WriteOnly);

    uint numberOfTables = 3;

    out << actualTable << endl;
    out << numberOfTables << endl;

    /* fill options */
    for( uint row = 0 ; row < indexArray.size() ; ++row )
        out << indexArray[row] << endl;

    out << topColor << endl;
    out << bottomColor << endl;

    csvFile.close();
}

void ItemsList::mainButtonClicked( const QString &buttonName)
{
    actualTable = buttonName;
}

void ItemsList::itemClicked( const int &itemIndex, const QString state)
{
    indexArray[itemIndex] = !indexArray[itemIndex];
    itemsList.at(itemIndex)->setProperty( "imageState", (QVariant)state );
}

void ItemsList::setItemsList(const QString &buttonName)
{
    if(buttonName == "Noxi T2")
    {
        itemsList.clear();
        itemsList.append(new MedicalTable("/images/images/electric_regulation_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/belt_holder_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/angle_regulation_CH.png", "CHECKED", false));
        itemsList.append(new MedicalTable("/images/images/elastic.png", "CHECKED", false));
        itemsList.append(new MedicalTable("/images/images/electric_top_L.png", "UNCHECKED", false));
        itemsList.append(new MedicalTable("/images/images/chassis.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/bolser.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/chair_position_L.png", "UNCHECKED", false));
        itemsList.append(new MedicalTable("/images/images/foot_control.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/remote_control.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/pins_L.png", "UNCHECKED", false));
        itemsList.append(new MedicalTable("/images/images/sheet_holder.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/plug.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/inox_steel.png", "CHECKED", true));
        itemsList.append(new MedicalTable("/images/images/top_color.png", "CHECKED", true ,"#13AAB8", "6099"));
        itemsList.append(new MedicalTable("/images/images/bottom_color.png", "CHECKED", true,"gray", "9006"));
        emit itemsListChanged(getItemsList());
    }
    else if(buttonName == "Noxi T3")
    {
        itemsList.clear();      
        itemsList.append(new MedicalTable("/images/images/electric_regulation_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/belt_holder.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/angle_regulation_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/elastic.png", "CHECKED", false));
        itemsList.append(new MedicalTable("/images/images/electric_top_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/chassis.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/bolser.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/chair_position.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/foot_control.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/remote_control.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/pins.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/sheet_holder.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/plug.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/inox_steel.png", "CHECKED", true));
        itemsList.append(new MedicalTable("/images/images/top_color.png", "CHECKED", true ,"#13AAB8", "6099"));
        itemsList.append(new MedicalTable("/images/images/bottom_color.png", "CHECKED", true,"gray", "9006"));
        emit itemsListChanged(getItemsList());
    }
    else if(buttonName == "Noxi T7")
    {
        itemsList.clear();
        itemsList.append(new MedicalTable("/images/images/electric_regulation_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/belt_holder.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/angle_regulation_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/elastic.png", "CHECKED", false));
        itemsList.append(new MedicalTable("/images/images/electric_top_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/chassis_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/bolser_CH.png", "CHECKED", false)); // CHECKED
        itemsList.append(new MedicalTable("/images/images/chair_position.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/foot_control.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/remote_control.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/pins.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/sheet_holder.png", "UNCHECKED", true)); // OK
        itemsList.append(new MedicalTable("/images/images/plug.png", "UNCHECKED", true));
        itemsList.append(new MedicalTable("/images/images/inox_steel.png", "CHECKED", true));
        itemsList.append(new MedicalTable("/images/images/top_color.png", "CHECKED", true ,"#13AAB8", "6099"));
        itemsList.append(new MedicalTable("/images/images/bottom_color.png", "CHECKED", true,"gray", "9006"));
        emit itemsListChanged(getItemsList());
    }
    else
        return;

    setArray();
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

void ItemsList::generateSchedule()
{
    generateCSV();
}

void ItemsList::setColor( const QString color, const int &itemIndex )
{
    itemsList.at(itemIndex)->setProperty("tableColor", (QVariant)color);
    emit itemsListChanged(getItemsList());
}

void ItemsList::setText( const QString text, const int &itemIndex )
{
    if( itemIndex == 14 ) topColor = text;
    else if ( itemIndex == 15 ) bottomColor = text;
    itemsList.at(itemIndex)->setProperty("tableText", (QVariant)text);
    emit itemsListChanged(getItemsList());
}


