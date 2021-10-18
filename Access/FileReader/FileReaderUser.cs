﻿using System.IO;
namespace Data.FileReader
{
    public class FileReaderUser
    {

        private const string PathFileUsers = "/Files/Users.txt";

        public StreamReader GetStreamReaderUser()
        {
            var path = Directory.GetCurrentDirectory() + PathFileUsers;
            var fileStream = new FileStream(path, FileMode.Open);
            return new StreamReader(fileStream);
        }
    }
}
