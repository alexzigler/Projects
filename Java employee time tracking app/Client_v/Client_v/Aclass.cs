using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace Client_v
{
    public class Aclass
    {
        HttpClient client = new HttpClient();
        public static String resp;

        /*public static async Task Hqwe()
        {
            Aclass aclass= new Aclass();
            await aclass.GetItemsQ();
        }*/
        public async Task GetItemsQ()
        {
            //string response = await client.GetStringAsync("https://jsonplaceholder.typicode.com/todos");
            string response = await client.GetStringAsync("http://localhost:8082//employee");
            resp = response;
        }
    }
}
