#include "tabledialog.h"
#include "ui_tabledialog.h"

extern bool mainOrderActive;

TableDialog::TableDialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::TableDialog)
{
    ui->setupUi(this);
    model = new QStandardItemModel;
    model->setVerticalHeaderItem( 0, new QStandardItem("Rodzaj stołu"));
    model->setVerticalHeaderItem( 1, new QStandardItem("Elektryczna regulacja wysokości"));
    model->setVerticalHeaderItem( 2, new QStandardItem("Uchwyty do pasów"));
    model->setVerticalHeaderItem( 3, new QStandardItem("Regulacja kąta odchylenia"));
    model->setVerticalHeaderItem( 4, new QStandardItem("Elektrycznie łamane leżysko"));
    model->setVerticalHeaderItem( 5, new QStandardItem("Układ jezdny z hamulcami"));
    model->setVerticalHeaderItem( 6, new QStandardItem("Zagłowek 3-elementowy"));
    model->setVerticalHeaderItem( 7, new QStandardItem("Pozycja fotela"));
    model->setVerticalHeaderItem( 8, new QStandardItem("Sterowanie nożne"));
    model->setVerticalHeaderItem( 9, new QStandardItem("Pilot podblatowy"));
    model->setVerticalHeaderItem( 10, new QStandardItem("Kołki do stabilizacji"));
    model->setVerticalHeaderItem( 11, new QStandardItem("Uchwyt na prześcieradło"));
    model->setVerticalHeaderItem( 12, new QStandardItem("Zatycznka"));
    model->setVerticalHeaderItem( 13, new QStandardItem("Stal nierdzewna"));
    model->setVerticalHeaderItem( 14, new QStandardItem("Ilość sztuk"));
    model->setVerticalHeaderItem( 15, new QStandardItem("Kolor tapicerki"));
    model->setVerticalHeaderItem( 16, new QStandardItem("Kolor stelaża"));
    model->setVerticalHeaderItem( 17, new QStandardItem("Uwagi"));


    ui->tableView->setEditTriggers(QAbstractItemView::NoEditTriggers);
    ui->tableView->horizontalHeader()->setFixedHeight( 40 );
    ui->tableView->verticalHeader()->setFixedWidth( 220 );
    ui->tableView->horizontalHeader()->setSectionResizeMode(QHeaderView::Fixed);
    ui->tableView->horizontalHeader()->setHighlightSections(false);
    ui->tableView->verticalHeader()->setHighlightSections(false);
    ui->tableView->setModel(model);
}

void TableDialog::deleteRecord()
{
    bool deleted {false};
    QModelIndexList indexes = ui->tableView->selectionModel()->selectedRows();
    while (!indexes.isEmpty())
    {
        deleted = true;
        model->removeRows(indexes.last().row(), 1);
        indexes.removeLast();
        generateCSV();
    }

    if( deleted == false )
    {
        QMessageBox msgBox;
        msgBox.setWindowTitle(QString("Informacja"));
        msgBox.setText(QString("Nie zaznaczono wiersza do usunięcia."));
        msgBox.setIcon(QMessageBox::Information);
        msgBox.exec();
    }

}


void TableDialog::generateCSV()
{
    QString separator = ";";
    QString pathFile = QDir::homePath()+"/schedule.csv";
    QFile csvFile(pathFile);
    QTextStream in(&csvFile);
    QTextStream out(&csvFile);

    // get data
    csvFile.open(QIODevice::ReadOnly);
    QString firstLine = in.readLine();
    QString secondLine = in.readLine();
    csvFile.remove();

    // write new data
    csvFile.open(QIODevice::WriteOnly);
    out << firstLine << endl;
    out << secondLine << endl;

    for ( int i=0; i<model->rowCount(); ++i)
    {
        for ( int j=0; j<model->columnCount(); ++j)
        {
            QModelIndex index = model->index(i, j);
            out << ui->tableView->model()->data(index).toString() + ";";
        }
        out << endl;
    }
    csvFile.close();

    // check if model is empty
    if (!model->rowCount()) {
        mainOrderActive = false;
        csvFile.resize(0);
        this -> close();
    }
}

void TableDialog::keyPressEvent(QKeyEvent *e)
{
    if ( e->key () == Qt::Key_Delete) {
        deleteRecord();
    }

    else
        QDialog::keyPressEvent (e);
}

TableDialog::~TableDialog()
{
    delete ui;
}
