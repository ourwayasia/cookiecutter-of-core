using System;
using System.IO;
using System.Text;

namespace OF.WinService
{
    public class LogHelper
    {
        private static string lockKey = "lock";
        public static void SaveLog(Exception ex)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine(ex.Message);
            sb.AppendLine(ex.StackTrace);
            sb.AppendLine(ex.Source);

            SaveLog("错误日志",sb.ToString());
        }
        public static void SaveLog(String logName, string msg, params string[] para)
        {
            try
            {
                if (!Directory.Exists(AppDomain.CurrentDomain.BaseDirectory + "\\logs\\"))
                {
                    Directory.CreateDirectory(AppDomain.CurrentDomain.BaseDirectory + "\\logs\\");

                }

                DateTime now = DateTime.Now;
                String LogFile = AppDomain.CurrentDomain.BaseDirectory + "\\logs\\" + logName + "_" + now.ToString("yyyy-MM-dd") + ".log";
                lock (lockKey)
                {
                    using (FileStream fs = new FileStream(LogFile, FileMode.Append, FileAccess.Write))
                    {
                        byte[] datetimefile = Encoding.Default.GetBytes(logName + "_" + now.ToString("yyyy-MM-dd HH:mm:ss.fff") + ":\r\n");
                        fs.Write(datetimefile, 0, datetimefile.Length);
                        if (!String.IsNullOrEmpty(msg))
                        {
                            byte[] data = Encoding.Default.GetBytes(string.Format(msg, para) + "\r\n==========================================\r\n");
                            fs.Write(data, 0, data.Length);
                        }
                        fs.Flush();
                    }
                }
            }
            catch
            { }
        }
    }
}