#include "itemslist.h"

extern bool mainOrderActive;

ItemsList::ItemsList(QObject *parent) : QObject(parent)
{
    tableDialog = new TableDialog;
    QString pathFile = QDir::homePath()+"/schedule.csv";
    csvFile = new QFile(pathFile);
}

void ItemsList::setItemsList(const QString & _buttonName)
{
    if(_buttonName == "Noxi T2")
    {
        m_itemsList.clear();
        m_itemsList.append(new MedicalTable("/images/images/electric_regulation_CH.png", "CHECKED", false));
        m_itemsList.append(new MedicalTable("/images/images/belt_holder_CH.png", "CHECKED", false));
        m_itemsList.append(new MedicalTable("/images/images/angle_regulation_CH.png", "CHECKED", false));
        m_itemsList.append(new MedicalTable("/images/images/electric_top_L.png", "UNCHECKED", false));
        m_itemsList.append(new MedicalTable("/images/images/chassis.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/bolser.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/chair_position_L.png", "UNCHECKED", false));
        m_itemsList.append(new MedicalTable("/images/images/foot_control.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/remote_control.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/pins_L.png", "UNCHECKED", false));
        m_itemsList.append(new MedicalTable("/images/images/sheet_holder.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/plug.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/inox_steel.png", "CHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/settings.png", "CHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/top_color.png", "CHECKED", true ,"#13AAB8", "6099"));
        m_itemsList.append(new MedicalTable("/images/images/bottom_color.png", "CHECKED", true,"gray", "9006"));
        emit itemsListChanged(getItemsList());
    }
    else if(_buttonName == "Noxi T3")
    {
        m_itemsList.clear();
        m_itemsList.append(new MedicalTable("/images/images/electric_regulation_CH.png", "CHECKED", false));
        m_itemsList.append(new MedicalTable("/images/images/belt_holder.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/angle_regulation_CH.png", "CHECKED", false));
        m_itemsList.append(new MedicalTable("/images/images/electric_top_CH.png", "CHECKED", false));
        m_itemsList.append(new MedicalTable("/images/images/chassis.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/bolser.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/chair_position.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/foot_control.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/remote_control.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/pins.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/sheet_holder.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/plug.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/inox_steel.png", "CHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/settings.png", "CHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/top_color.png", "CHECKED", true ,"#13AAB8", "6099"));
        m_itemsList.append(new MedicalTable("/images/images/bottom_color.png", "CHECKED", true,"gray", "9006"));
        emit itemsListChanged(getItemsList());
    }
    else if(_buttonName == "Noxi T7")
    {
        m_itemsList.clear();
        m_itemsList.append(new MedicalTable("/images/images/electric_regulation_CH.png", "CHECKED", false));
        m_itemsList.append(new MedicalTable("/images/images/belt_holder.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/angle_regulation_CH.png", "CHECKED", false));
        m_itemsList.append(new MedicalTable("/images/images/electric_top_CH.png", "CHECKED", false));
        m_itemsList.append(new MedicalTable("/images/images/chassis_CH.png", "CHECKED", false));
        m_itemsList.append(new MedicalTable("/images/images/bolser_CH.png", "CHECKED", false));
        m_itemsList.append(new MedicalTable("/images/images/chair_position.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/foot_control.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/remote_control.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/pins.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/sheet_holder.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/plug.png", "UNCHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/inox_steel.png", "CHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/settings.png", "CHECKED", true));
        m_itemsList.append(new MedicalTable("/images/images/top_color.png", "CHECKED", true ,"#13AAB8", "6099"));
        m_itemsList.append(new MedicalTable("/images/images/bottom_color.png", "CHECKED", true,"gray", "9006"));
        emit itemsListChanged(getItemsList());
    }
    else
        return;
}

void ItemsList::setImagesList(const QString & _buttonName)
{
    if(_buttonName == "Noxi T2")
    {
        m_imagesList.clear();
        m_imagesList.append(new MainImageSource("/images/images/t2.png"));
        m_imagesList.append(new MainImageSource("/images/images/t2_1.png"));
        m_imagesList.append(new MainImageSource("/images/images/t2_2.png"));
        m_imagesList.append(new MainImageSource("/images/images/t2_3.png"));
        emit imagesListChanged(getImagesList());
    }
    else if(_buttonName == "Noxi T3")
    {
        m_imagesList.clear();
        m_imagesList.append(new MainImageSource("/images/images/t3.png"));
        m_imagesList.append(new MainImageSource("/images/images/t3_1.png"));
        m_imagesList.append(new MainImageSource("/images/images/t3_2.png"));
        m_imagesList.append(new MainImageSource("/images/images/t3_3.png"));
        emit imagesListChanged(getImagesList());
    }
    else if(_buttonName == "Noxi T7")
    {
        m_imagesList.clear();
        m_imagesList.append(new MainImageSource("/images/images/t7.png"));
        m_imagesList.append(new MainImageSource("/images/images/t7_1.png"));
        m_imagesList.append(new MainImageSource("/images/images/t7_2.png"));
        m_imagesList.append(new MainImageSource("/images/images/t7_3.png"));
        emit imagesListChanged(getImagesList());
    }
    else
        return;
}

void ItemsList::setItemsState()
{
    for(int i = 0; i < m_itemsList.size() - 3; ++i)
    {
        if(m_itemsList.at(i)->property("imageState").toString() == "CHECKED")
            m_statesArray[i] = true;
        else
            m_statesArray[i] = false;
    }
}

void ItemsList::setColor( const QString _color, const int & _itemIndex )
{
    m_itemsList.at(_itemIndex)->setProperty("tableColor", (QVariant)_color);
    emit itemsListChanged(getItemsList());
}

void ItemsList::setText( const QString _colorText, const int & _itemIndex )
{
    if( _itemIndex == 14 ) m_topColor = _colorText;
    else if ( _itemIndex == 15 ) m_bottomColor = _colorText;
    m_itemsList.at(_itemIndex)->setProperty("tableText", (QVariant)_colorText);
    emit itemsListChanged(getItemsList());
}

void ItemsList::setAdditionalSettings(const QString _quantity, const QString _notes)
{
   if ( _quantity == "" ) m_quantity = "1";
   else m_quantity = _quantity;
   m_notes = _notes;
}

void ItemsList::showTable()
{
    if (mainOrderActive) tableDialog->exec();
    else
    {
        QMessageBox msgBox;
        msgBox.setWindowTitle(QString("Informacja"));
        msgBox.setText(QString("Zamówienie jest puste."));
        msgBox.setIcon(QMessageBox::Information);
        msgBox.exec();
    }
}

bool ItemsList::checkData()
{
    if( m_order.isEmpty() || m_recipient.isEmpty())
    {
        QMessageBox msgBox;
        msgBox.setWindowTitle(QString("Informacja"));
        msgBox.setText(QString("Nie uzupełniono pól tekstowych"));
        msgBox.setIcon(QMessageBox::Information);
        msgBox.exec();
        return false;
    }
    else if( m_year.toInt() < 2015 || m_day.toInt() < 1 || m_month.toInt() < 1)
    {
        QMessageBox msgBox;
        msgBox.setWindowTitle(QString("Informacja"));
        msgBox.setText(QString("Termin dostawy nieprawidłowy."));
        msgBox.setIcon(QMessageBox::Information);
        msgBox.exec();
        return false;
    }
    else
        return true;
}

void ItemsList::generateCSV()
{
    QString separator = ";";
    QList <QStandardItem*> itemsList;
    QTextStream out( csvFile );
    csvFile->open(QIODevice::WriteOnly | QIODevice::Append);

    if (!mainOrderActive)
    {
        out << m_order + separator << m_year + "-" + m_month + "-" + m_day + separator << m_recipient + separator << endl;
        out << "Rodzaj stołu" + separator
            << "Elektryczna regulacja wysokości" + separator
            << "Uchwyty do pasów" + separator
            << "Regulacja kąta odchylenia" + separator
            << "Elektrycznie łamane leżysko" + separator
            << "Układ jezdny z hamulcami"+ separator
            << "Zagłówek 3-elementowy"+ separator
            << "Pozycja fotela"+ separator
            << "Sterowanie nożne"+ separator
            << "Pilot podblatowy"+ separator
            << "Kołki do stabilizacji"+ separator
            << "Uchwyt na prześcieradło"+ separator
            << "Zatyczka"+ separator
            << "Stal nierdzewna"+ separator
            << "Ilość sztuk"+ separator
            << "Kolor blatu"+ separator
            << "Kolor ramy" + separator
            << "Uwagi" << endl;
        mainOrderActive = true;
    }

    out << m_actualTable + separator;
    QStandardItem * item = new QStandardItem(m_actualTable);
    item -> setTextAlignment( Qt::AlignHCenter | Qt::AlignVCenter );
    itemsList.push_back( item );

    /* fill options */
    for( uint row = 0 ; row < m_statesArray.size() ; ++row ) {
        out << QString::number(m_statesArray[row]) + separator;
        item = new QStandardItem(QString::number(m_statesArray[row]));
        item -> setTextAlignment( Qt::AlignHCenter | Qt::AlignVCenter );
        itemsList.push_back( item );
    }

    out << m_quantity + separator;
    item = new QStandardItem(m_quantity);
    item -> setTextAlignment( Qt::AlignHCenter | Qt::AlignVCenter );
    itemsList.push_back( item );

    out << m_topColor + separator;
    item = new QStandardItem(m_topColor);
    item -> setTextAlignment( Qt::AlignHCenter | Qt::AlignVCenter );
    itemsList.push_back( item );

    out << m_bottomColor  + separator ;
    item = new QStandardItem(m_bottomColor);
    item -> setTextAlignment( Qt::AlignHCenter | Qt::AlignVCenter );
    itemsList.push_back( item );

    out << m_notes << endl;
    item = new QStandardItem(m_notes);
    item -> setTextAlignment( Qt::AlignHCenter | Qt::AlignVCenter );
    itemsList.push_back( item );

    csvFile->close();
    tableDialog->model->appendColumn(itemsList);

    QMessageBox msgBox;
    msgBox.setWindowTitle(QString("Informacja"));
    msgBox.setText(QString("Dodano do zamówienia."));
    msgBox.setIcon(QMessageBox::Information);
    msgBox.exec();
}

bool ItemsList::generateSchedule()
{
    if (!m_actualTable.isEmpty() && mainOrderActive )
    {
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

        csvFile->remove();
        tableDialog->model->clear();
        mainOrderActive = false;
        return true;
     }
     else if(m_actualTable.isEmpty() || !mainOrderActive )
     {
        QMessageBox msgBox;
        msgBox.setWindowTitle(QString("Informacja"));
        msgBox.setText(QString("Zamówienie jest puste."));
        msgBox.setIcon(QMessageBox::Information);
        msgBox.exec();
        return false;
    }

    return false;

}

void ItemsList::clear()
{
    m_notes.clear();
    m_bottomColor = "9006";
    m_topColor = "6099";
    m_quantity = "1";
}


// SLOTS

void ItemsList::onMainButtonClicked( const QString & _buttonName)
{
    m_actualTable = _buttonName;   
    setItemsList( m_actualTable );
    setImagesList( m_actualTable );
    setItemsState();
    clear();
}

void ItemsList::onItemClicked(const int & _itemIndex, const QString _itemState)
{
    m_statesArray[_itemIndex] = !m_statesArray[_itemIndex];
    m_itemsList.at(_itemIndex)->setProperty( "imageState", (QVariant)_itemState );
}

void ItemsList::onOrderChanged(const QString _order)
{
    m_order = _order;
}

void ItemsList::onRecipientChanged(const QString _recipient)
{
    m_recipient = _recipient;
}

void ItemsList::onDateChanged(const QString _deliveryTime, QString _type)
{
    if ( _type == "year")
        m_year = _deliveryTime;
    else if ( _type == "month")
        m_month = _deliveryTime;
    else if ( _type == "day")
        m_day = _deliveryTime;
}




