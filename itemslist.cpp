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
    qDebug() << pathFile << endl;

    QFile csvFile(pathFile);
    QTextStream out( &csvFile );
    csvFile.open(QIODevice::WriteOnly);

    uint numberOfTables = 3;

    out << actualTable << endl;
    out << numberOfTables << endl;

    /* fill options */
    for( uint row = 0 ; row < indexArray.size() ; ++row )
        out << indexArray[row] << endl;

    csvFile.close();
}

void ItemsList::mainButtonClicked( const QString &buttonName)
{
    actualTable = buttonName;
}

void ItemsList::itemClicked( const int &itemIndex)
{
    indexArray[itemIndex] = !indexArray[itemIndex];
}

void ItemsList::setItemsList(const QString &buttonName)
{
    if(buttonName == "Noxi T2")
    {
        itemsList.clear();
        itemsList.append(new MedicalTable("/images/images/electric_regulation_CH.png", "CHECKED", false,"transparent")); // CHECKED
        itemsList.append(new MedicalTable("/images/images/belt_holder_CH.png", "CHECKED", false,"transparent")); // CHECKED
        itemsList.append(new MedicalTable("/images/images/angle_regulation_CH.png", "CHECKED", false,"transparent"));
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
        itemsList.append(new MedicalTable("/images/images/top_color.png", "CHECKED", true ,"#00CED1"));
        itemsList.append(new MedicalTable("/images/images/bottom_color.png", "CHECKED", true,"white"));
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
        itemsList.append(new MedicalTable("/images/images/top_color.png", "CHECKED", true,"#00CED1"));
        itemsList.append(new MedicalTable("/images/images/bottom_color.png", "CHECKED", true,"white"));
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
        itemsList.append(new MedicalTable("/images/images/top_color.png", "CHECKED", true,"#00CED1"));
        itemsList.append(new MedicalTable("/images/images/bottom_color.png", "CHECKED", true,"white"));
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

    QAxObject* excel;
    QAxObject* wbooks;
    QAxObject* book;
    QFileInfo scheduleFile("schedule.xlsm");
    QVariant excelPath;
    QVariant destPath;

    excelPath = QVariant(scheduleFile.absoluteFilePath().replace("/", "\\\\"));

    excel = new QAxObject("Excel.Application", this);
    excel->setProperty("Visible", false);
    excel->setProperty("DisplayAlerts",0);

    wbooks = excel->querySubObject("Workbooks");
    book = wbooks->querySubObject("Open (const QString&)", excelPath);
    destPath = excel->dynamicCall("Run(QVariant)", QVariant("runMacro"));

    book->dynamicCall("Close()");
    excel->dynamicCall("Quit()");

    QMessageBox msgBox;
    msgBox.setWindowTitle(QString("Informacja"));
    msgBox.setText(QString("Wygenerowano harmonogram."));
    msgBox.setInformativeText(destPath.toString());
    msgBox.setIcon(QMessageBox::Information);
    msgBox.exec();

    delete book;
    delete wbooks;
    delete excel;

}

void ItemsList::setColor( const QString color, const int &itemIndex )
{
    qDebug() << color << endl;
    itemsList.at(itemIndex)->setProperty("tableColor", (QVariant)color);
    emit itemsListChanged(getItemsList());
    for( int i = 0 ; i < itemsList.size(); ++i )
        qDebug() << itemsList.at(i)->property("tableColor").toString() << endl;
}


