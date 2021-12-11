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
            MySqlCommand cmd = new($"SELECT * FROM {Table}", conn);
            cmd.ExecuteNonQuery();
            MySqlDataAdapter dA = new(cmd);
            DataTable dataTable = new(Table);
            dA.Fill(dataTable);
            return dataTable.DefaultView;
        }
    }
}
