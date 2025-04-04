Add-Type @"
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Threading.Tasks;

public class Reader
{
    public static List<List<string>> ReadCsv(string path)
    {
        List<List<string>> list = new List<List<string>>();
        using (var reader = new StreamReader(path, Encoding.GetEncoding("shift_jis")))
        {
            while (!reader.EndOfStream)
            {
                List<string> csv = new List<string>();
                string line = reader.ReadLine();
                string[] values = line.Split(',');
                foreach (string val in values)
                {
                    csv.Add(val);
                }
                list.Add(csv);
            }

        }
        return list;
    }
}
"@

$csvList = [Test]::Exec("ファイルパス")
