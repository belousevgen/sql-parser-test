using System.Collections.Generic;
using System.Runtime.Serialization;

namespace SqlParser.Dto.DataModel
{
    [DataContract(Namespace = "")]
    public class TableDto
    {

        public TableDto()
        {
            Columns = new List<ColumnDto>();
        }

        public TableDto(
            int tableId,
            int schemaId,
            string name,
            List<ColumnDto> columns = null)
        {
            TableId = tableId;
            SchemaId = schemaId;
            Name = name;
            Columns = columns;
        }

        /// <summary>
        /// Unique Id across Data Model
        /// </summary>
        [DataMember]
        public int TableId { get; set; }

        [DataMember]
        public int SchemaId { get; set; }

        [DataMember]
        public string Name { get; set; }

        [DataMember]
        public List<ColumnDto> Columns { get; set; }

    }
}