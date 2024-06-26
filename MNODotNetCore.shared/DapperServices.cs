﻿using System.Data;
using Dapper;
using System.Data.SqlClient;

namespace MNODotNetCore.shared
{
    public class DapperServices
    {
        private readonly string _connectionString;
        public DapperServices(string connectionString)
        {
            _connectionString = connectionString;
        }
        public List<N> Query<N>(string query, object? para = null)
        {
            using IDbConnection database = new SqlConnection(_connectionString);
            database.Open();
            var item = database.Query<N>(query,para).ToList();
            return item;


        }
        public N QueryFirstOrDefault<N>(string query, object? para = null)
        {
            using IDbConnection database = new SqlConnection(_connectionString);
            database.Open();
            var item = database.Query<N>(query, para).FirstOrDefault();
            return item!;


        }
        public int Execute(string query, object? para = null)
        {
            using IDbConnection database = new SqlConnection(_connectionString);
            var outcome = database.Execute(query, para);
            return outcome;
        }

        public T Query2<T>(string query, T blogModel)
        {
            throw new NotImplementedException();
        }
    }
}
