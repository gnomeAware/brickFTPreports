using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql;
using MySql.Data;
using MySql.Data.MySqlClient;
using Obout;
using Obout.Grid;
using Obout.Grid.Design;
using Obout.Ajax;
using Obout.Ajax.UI;

namespace brickFTPreports
{
    public partial class Test1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BuildTree();
        }

        private void BuildTree()
        {
            DataSet ds = new DataSet();

            MySqlConnection conn = new MySqlConnection("server=172.28.1.35;user id=brickFTP;Password=solidfire;database=brickFTP;persist security info=False");
            conn.Open();

            string command = "SELECT ID, parentID, directoryName FROM Directories;";
            MySql.Data.MySqlClient.MySqlDataAdapter adapter = new MySql.Data.MySqlClient.MySqlDataAdapter(command, conn);

            adapter.Fill(ds);

            oTree.Nodes.Clear();

            BindTree(ds, null);
            oTree.DataBind();
            
        }

        private void BindTree(DataSet ds, TreeNode parentNode)
        {
            DataRow[] ChildRows;
            if (parentNode == null)
            {
                string strExpr = "parentId=0";
                ChildRows = ds.Tables[0].Select(strExpr);
            }
            else
            {
                string strExpr = "ParentId=" + parentNode.Value.ToString();
                ChildRows = ds.Tables[0].Select(strExpr);
            }
            foreach (DataRow dr in ChildRows)
            {

                //TreeNode newNode = new TreeNode(dr["directoryName"].ToString(), dr["Id"].ToString());
                Obout.Ajax.UI.TreeView.Node newNode = new Obout.Ajax.UI.TreeView.Node(dr["directoryName"].ToString());
                newNode.Value = dr["Id"].ToString();

                
                //newNode.NavigateUrl = Page.Request.RawUrl + "?ID=" +dr["Id"].ToString();
                newNode.Value = dr["Id"].ToString();
                if (parentNode == null)
                {
                    oTree.Nodes.Add(newNode);
                }
                else
                {
                    //parentNode.ChildNodes.Add(newNode);
                }
                //BindTree(ds, newNode);
            }
        }

        private void Fill_Grid(int selectedID)
        {
            DataSet ds = new DataSet();

            MySqlDataAdapter adapter = queryDatabase(selectedID);

            adapter.Fill(ds);

            gridOutput.DataSource = ds;
            gridOutput.DataBind();

        }

        protected void oTree_SelectedNodeChanged(Object sender, EventArgs e)
        {

            int nodeValue = Convert.ToInt16(oTree.SelectedNode.Value);
            Fill_Grid(nodeValue);
            divGrid.Visible = true;
            gridOutput.ExportToExcel();
        }
        
        public MySqlDataAdapter queryDatabase(int selectedID)
        {
            MySqlConnection conn = new MySqlConnection("server=172.28.1.35;user id=brickFTP;Password=solidfire;database=brickFTP;persist security info=False");
            conn.Open();

            string command = "SELECT CustomerName, Action, File, Date, Time FROM Access WHERE ParentDirectoryID = " + selectedID + " ORDER BY Date, Time DESC;";
            MySqlDataAdapter adapter = new MySqlDataAdapter(command, conn);
            return adapter;
        }
    }
}