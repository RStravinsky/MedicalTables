#include "tabledialog.h"
#include "ui_tabledialog.h"

TableDialog::TableDialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::TableDialog)
{
    ui->setupUi(this);
    model = new QStandardItemModel;
    model->setHorizontalHeaderItem( 0, new QStandardItem("Rodzaj stołu"));
    model->setHorizontalHeaderItem( 1, new QStandardItem("Elektryczna regulacja wysokości"));
    model->setHorizontalHeaderItem( 2, new QStandardItem("Uchwyty do pasów"));
    model->setHorizontalHeaderItem( 3, new QStandardItem("Regulacja kąta odchylenia"));
    model->setHorizontalHeaderItem( 4, new QStandardItem("Elektrycznie łamane leżysko"));
    model->setHorizontalHeaderItem( 5, new QStandardItem("Układ jezdny z hamulcami"));
    model->setHorizontalHeaderItem( 6, new QStandardItem("Zagłowek 3-elementowy"));
    model->setHorizontalHeaderItem( 7, new QStandardItem("Pozycja fotela"));
    model->setHorizontalHeaderItem( 8, new QStandardItem("Sterowanie nożne"));
    model->setHorizontalHeaderItem( 9, new QStandardItem("Pilot podblatowy"));
    model->setHorizontalHeaderItem( 10, new QStandardItem("Kołki do stabilizacji"));
    model->setHorizontalHeaderItem( 11, new QStandardItem("Uchwyt na prześcieradło"));
    model->setHorizontalHeaderItem( 12, new QStandardItem("Zatycznka"));
    model->setHorizontalHeaderItem( 13, new QStandardItem("Stal nierdzewna"));
    model->setHorizontalHeaderItem( 14, new QStandardItem("Ilość sztuk"));
    model->setHorizontalHeaderItem( 15, new QStandardItem("Kolor tapicerki"));
    model->setHorizontalHeaderItem( 16, new QStandardItem("Kolor stelaża"));
    model->setHorizontalHeaderItem( 17, new QStandardItem("Uwagi"));

    QFont font( QFont("Arial", 10, QFont::Light ,false) );
    ui->tableView->setFont(font);
    ui->tableView->resizeRowsToContents();
    ui->tableView->setEditTriggers(QAbstractItemView::NoEditTriggers);
    ui->tableView->setModel(model);
}

TableDialog::~TableDialog()
{
    delete ui;
}
