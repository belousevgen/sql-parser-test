using JetBrains.Annotations;
using SqlParser.Dto.DataModel;

namespace SqlParser.Biz.Services
{
    public interface ISqlParserService
    {
        /// <summary>
        /// Parses SQL Script and generates DataModel.
        /// </summary>
        /// <param name="dbType">DatabaseType <see cref="DbTypeDto"/></param>
        /// <param name="sqlScript">SqlScript</param>
        /// <returns><see cref="DataModelDto"/></returns>
        [NotNull] DataModelDto ParseSql(DbTypeDto dbType, [NotNull] string sqlScript);
    }
}
