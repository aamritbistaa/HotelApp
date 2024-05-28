using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using Microsoft.Extensions.Configuration;
namespace HotelAppLibrary.Databases
{
    public class SQLDataAccess : ISQLDataAccess
    {
        private readonly IConfiguration _config;
        public SQLDataAccess(IConfiguration config)
        {
            _config = config;
        }
        public List<T> LoadData<T, U>(string sqlStatement, U parameters, string connectionStringName, bool IsStoredProcedure = false)
        {
            string connectionString = _config.GetConnectionString(connectionStringName);
            CommandType commandType = CommandType.Text;
            if (IsStoredProcedure == true)
            {
                commandType = CommandType.StoredProcedure;
            }
            using (IDbConnection connection = new SqlConnection(connectionString))
            {
                List<T> data = connection.Query<T>(sqlStatement, parameters, commandType: commandType).ToList();
                return data;
            }
        }
        public void SaveData<T>(string sqlStatement, T parameters, string connectionStringName, bool IsStoredProcedure = false)
        {
            string connectionString = _config.GetConnectionString(connectionStringName);
            var commandType = CommandType.Text;
            if (IsStoredProcedure ==true)
            {
                commandType = CommandType.StoredProcedure;
            }


            using (var connection = new SqlConnection(connectionString))
            {
                connection.Execute(sqlStatement, parameters, commandType: commandType);
            }

        }
    }
}
