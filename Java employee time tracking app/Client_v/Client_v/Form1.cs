using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Net.Http;
using Newtonsoft.Json;
using System.Diagnostics;
using RestSharp;
using System.Globalization;

namespace Client_v
{
    
    public partial class Form1 : Form
    {
        List<Employee> employees = new List<Employee>();
        List<Employee> suggested = new List<Employee>();
        Employee selectedEmployee;
        List<EmpCheck> checks = new List<EmpCheck>();
        int enable_in = 1;
        public Form1()
        {
            InitializeComponent();
            button_in.Visible = false;
            button_out.Visible = false;
            name_label.Visible = false;
            back_button.Visible = false;
            button_in_now.Visible = false;
            button_out_now.Visible = false;
            label_time.Visible = false;
            labe_date.Visible = false;
            text_date.Visible = false;
            text_time.Visible = false;
            button_out_manual.Visible = false;
            button_in_manual.Visible = false;
        }

        private void textSearch_Click(object sender, EventArgs e)
        {
            if(this.textSearch.Text == "Search")
                this.textSearch.Text = "";
        }//pretty pls
       
        private void Form1_Load(object sender, EventArgs e)//http get request employees + checks
        {
            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri("http://localhost:8082//employees");
            HttpResponseMessage response=client.GetAsync(client.BaseAddress).Result;
            string response_str = response.Content.ReadAsStringAsync().Result;
            this.employees = JsonConvert.DeserializeObject<List<Employee>>(response_str);
            foreach (Employee emp in employees)
            {
                suggested.Add(emp);
                this.myListBox.Items.Add(emp.name);
            }
            // get all checks

            HttpClient client2 = new HttpClient();
            client2.BaseAddress = new Uri("http://localhost:8082//checks");
            HttpResponseMessage response2 = client2.GetAsync(client2.BaseAddress).Result;
            string response_str2 = response2.Content.ReadAsStringAsync().Result;
            this.checks = JsonConvert.DeserializeObject<List<EmpCheck>>(response_str2);


        }

        private void selectButton_Click(object sender, EventArgs e)//select employee
        {
            if (myListBox.SelectedItems.Count != 0)
            {
                selectedEmployee = (Employee)employees.Find(x => x.name == myListBox.SelectedItem);
                myListBox.Visible = false;
                selectButton.Visible = false;
                textSearch.Visible = false;
                button_in.Visible = true;
                button_out.Visible = true;
                name_label.Visible = true;
                name_label.Text = "Welcome, " + selectedEmployee.name + " !";

                int selectedId = selectedEmployee.id;
                int index = 0;
                foreach(EmpCheck empCheck in checks)
                {
                    if (empCheck.employee.id == selectedId)
                    {
                        index++;
                    }
                }
                if (index % 2 == 0)
                {
                    enable_in = 1;
                    button_out.Enabled = false;
                }
                else
                {
                    enable_in = 0;
                    button_in.Enabled = false;
                }
            }
        }

        private void textSearch_TextChanged(object sender, EventArgs e)//search
        {
            string inp = textSearch.Text;
            //MessageBox.Show(inp);
            if (inp == "")
            {
                myListBox.Items.Clear();
                suggested.Clear();
                suggested.AddRange(employees);
                foreach (Employee emp in suggested)
                {
                    myListBox.Items.Add(emp.name);
                }

                return;
            }
            else
            {
                myListBox.Items.Clear();
                suggested.Clear();
                foreach (Employee emp in employees)
                {
                    string cname = emp.name.ToUpper();
                    if (cname.IndexOf(inp.ToUpper()) == 0)
                    {
                        suggested.Add(emp);
                    }
                }
                foreach (Employee emp in suggested)
                {
                    myListBox.Items.Add(emp.name);
                }
            }
            
        } 

        private void button_in_Click(object sender, EventArgs e)//check in
        {
            button_out.Visible = false;
            button_in.Visible = false;
            back_button.Visible = true;
            button_in_now.Visible = true;
            label_time.Visible = true;
            labe_date.Visible = true;
            text_date.Visible = true;
            text_time.Visible = true;
            button_in_manual.Visible = true;
        }

        private void button_out_Click(object sender, EventArgs e)//check out
        {
            button_in.Visible= false;
            button_out.Visible= false;
            back_button.Visible = true;
            button_out_now.Visible = true;
            label_time.Visible = true;
            labe_date.Visible = true;
            text_date.Visible = true;
            text_time.Visible = true;
            button_out_manual.Visible = true;

        }

        private void back_button_Click(object sender, EventArgs e)//back
        {
            name_label.Visible= false;
            myListBox.Visible = true;
            selectButton.Visible = true;
            textSearch.Visible = true;
            back_button.Visible = false;
            button_in.Visible = false;
            button_out.Visible = false;
            button_in_now.Visible = false;
            button_out_now.Visible = false;
            label_time.Visible = false;
            labe_date.Visible = false;
            text_date.Visible = false;
            text_time.Visible = false;
            button_out_manual.Visible = false;
            button_in_manual.Visible = false;
            button_in.Enabled = true;
            button_out.Enabled = true;
        }

        private void button_in_now_Click(object sender, EventArgs e)//check in now
        {
            DateTime now = DateTime.Now;

            string url = "http://localhost:8082//checks";
            var client = new RestClient(url);
            var request = new RestRequest();
            var body = new EmpCheck{check_in=now,check_out=null};

            request.AddBody(body);
            var response = client.Post(request);
            MessageBox.Show(response.StatusCode.ToString() + "   " + response.Content.ToString());

            // put request to server

            string putURL = "http://localhost:8082//checks/"+(checks.Count+1).ToString()+
                "/employee/"+ selectedEmployee.id.ToString();
            var putClient = new RestClient(putURL);
            var putRequest = new RestRequest();
            var putResponse = putClient.Put(putRequest);
            MessageBox.Show(putResponse.StatusCode.ToString() + "   " + putResponse.Content.ToString());

            new Form1().Show();
            this.Hide();

        }

        private void button_out_now_Click(object sender, EventArgs e)//check out now
        {
            DateTime now = DateTime.Now;

            string url = "http://localhost:8082//checks";
            var client = new RestClient(url);
            var request = new RestRequest();
            var body = new EmpCheck { check_in = null, check_out = now };

            request.AddBody(body);
            var response = client.Post(request);
            MessageBox.Show(response.StatusCode.ToString() + "   " + response.Content.ToString());


            // put request to server

            string putURL = "http://localhost:8082//checks/" + (checks.Count + 1).ToString() +
                "/employee/" + selectedEmployee.id.ToString();
            var putClient = new RestClient(putURL);
            var putRequest = new RestRequest();
            var putResponse = putClient.Put(putRequest);
            MessageBox.Show(putResponse.StatusCode.ToString() + "   " + putResponse.Content.ToString());

            new Form1().Show();
            this.Hide();
        }

        private void button_in_manual_Click(object sender, EventArgs e)// manual check in
        {

            string txt_date = text_date.Text;
            string txt_time = text_time.Text;

            /*if(txt_date=="" || txt_time == "")
            {
                MessageBox.Show("Wrong input! You can do it.");
            }*/

            try
            {
                DateTime dt = DateTime.ParseExact(txt_date + " " + txt_time, "yyyy-MM-dd HH:mm", CultureInfo.InvariantCulture);



                DateTime? date_last_out = null;
                EmpCheck ec = null;
                foreach(EmpCheck empCheck in checks)
                {
                    if(empCheck.employee.id==selectedEmployee.id)
                        ec= empCheck;
                            
                }
                if (ec != null)
                {
                    date_last_out = ec.check_out;
                }
                
                //todo
               
                if (date_last_out!=null  && date_last_out > dt)//* you shouldnt be able to check in before your last checkout*///
                {
                    MessageBox.Show("Cannot check in before last check out");
                    return;
                }
                

                string url = "http://localhost:8082//checks";
                var client = new RestClient(url);
                var request = new RestRequest();
                var body = new EmpCheck { check_in = dt, check_out = null };

                request.AddBody(body);
                var response = client.Post(request);
                MessageBox.Show(response.StatusCode.ToString() + "   " + response.Content.ToString());
                //
                string putURL = "http://localhost:8082//checks/" + (checks.Count + 1).ToString() +
                "/employee/" + selectedEmployee.id.ToString();
                var putClient = new RestClient(putURL);
                var putRequest = new RestRequest();
                var putResponse = putClient.Put(putRequest);
                MessageBox.Show(putResponse.StatusCode.ToString() + "   " + putResponse.Content.ToString());
            }
            catch
            {
                MessageBox.Show("Wrong input! You can do it.");
            }
            finally
            {
                new Form1().Show();
                this.Hide();
            }
        }

        private void button_out_manual_Click(object sender, EventArgs e)//manual check out
        {
            string txt_date = text_date.Text;
            string txt_time = text_time.Text;

            /*if(txt_date=="" || txt_time == "")
            {
                MessageBox.Show("Wrong input! You can do it.");
            }*/

            try
            {
                DateTime dt = DateTime.ParseExact(txt_date + " " + txt_time, "yyyy-MM-dd HH:mm", CultureInfo.InvariantCulture);

                DateTime? date_in = checks.FindLast(x => x.employee.id == selectedEmployee.id).check_in;
                if (date_in > DateTime.Now || date_in>dt)
                {
                    MessageBox.Show("Time travel is not a thing. Or is it?");
                    return;
                }
                string url = "http://localhost:8082//checks";
                var client = new RestClient(url);
                var request = new RestRequest();
                var body = new EmpCheck { check_in = null, check_out = dt };

                request.AddBody(body);
                var response = client.Post(request);
                MessageBox.Show(response.StatusCode.ToString() + "   " + response.Content.ToString());


                // put request to server

                string putURL = "http://localhost:8082//checks/" + (checks.Count + 1).ToString() +
                    "/employee/" + selectedEmployee.id.ToString();
                var putClient = new RestClient(putURL);
                var putRequest = new RestRequest();
                var putResponse = putClient.Put(putRequest);
                MessageBox.Show(putResponse.StatusCode.ToString() + "   " + putResponse.Content.ToString());

            }
            catch
            {
                MessageBox.Show("Wrong input! You can do it.");
            }
            finally
            {
                new Form1().Show();
                this.Hide();
            }
            

        }
    }
}
