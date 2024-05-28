
namespace HotelAppLibrary.Databases
{
    public interface ISQLDataAccess
    {
        List<T> LoadData<T, U>(string sqlStatement, U parameters, string connectionStringName,bool IsStoredProcedure= false);
        void SaveData<T>(string sqlStatement, T parameters, string connectionStringName, bool IsStoredProcedure = false);
    }
}