using System.Windows;
using MySqlConnector;
using System.Data;
namespace DMCourceWork
{
    public partial class Report : Window
    {
        MySqlConnection conn;
        public Report(MySqlConnection connection)
        {
            conn = connection;
            InitializeComponent();
            Doc.ItemsSource = GetTable("Документация");
        }
        public DataView GetTable(string Table)
        {
            MySqlCommand cmd = new($"SELECT `Инвентарный номер`, Название," +
                $"(SELECT Название FROM Тема WHERE Номер = Документация.тема) AS Тема, " +
                $"Количество,  Ячейка," +
                $"(SELECT Полка FROM Ячейки WHERE Номер = Документация.ячейка) AS Полка," +
                $"(SELECT Стеллаж FROM Полки WHERE Номер = (SELECT Полка FROM Ячейки WHERE Номер = Документация.ячейка)) AS Стеллаж," +
                $"`Дата поступления` FROM документация; ", conn);
            cmd.ExecuteNonQuery();
            MySqlDataAdapter dA = new(cmd);
            DataTable dataTable = new(Table);
            dA.Fill(dataTable);
            return dataTable.DefaultView;
        }
    }
}
