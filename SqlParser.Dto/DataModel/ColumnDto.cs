using System.Runtime.Serialization;

namespace SqlParser.Dto.DataModel
{
    [DataContract(Namespace = "")]
    public class ColumnDto
    {
        public ColumnDto() { }

        public ColumnDto(
            int columnId,
            string name,
            string dataType,
            bool allowNulls)
        {
            ColumnId = columnId;
            Name = name;
            DataType = dataType;
            AllowNulls = allowNulls;
        }

        /// <summary>
        /// Unique Id across Data Model
        /// </summary>
        [DataMember]
        public int ColumnId { get; set; }

        [DataMember]
        public string Name { get; set; }

        [DataMember]
        public string DataType { get; set; }

        [DataMember]
        public bool AllowNulls { get; set; }

    }
}