using MySqlConnector;
using System.Data;
using System.Windows;
namespace DMCourceWork
{
    public partial class HelpForSubscribers : Window
    {
        MySqlConnection conn;
        public HelpForSubscribers(MySqlConnection connection)
        {
            conn = connection;
            InitializeComponent();
            Abonents.ItemsSource = GetTable("абоненты");
        }
        public DataView GetTable(string Table)
        {
            MySqlCommand cmd = new ($"SELECT * FROM {Table}", conn);
            cmd.ExecuteNonQuery();
            MySqlDataAdapter dA = new (cmd);
            DataTable dataTable = new (Table);
            dA.Fill(dataTable);
            return dataTable.DefaultView;
        }
    }
}
