using System.Runtime.Serialization;

namespace SqlParser.Dto.DataModel
{
    [DataContract(Namespace = "")]
    public class SchemaDto
    {
        public SchemaDto() { }

        public SchemaDto(int schemaId, string name)
        {
            SchemaId = schemaId;
            Name = name;
        }

        /// <summary>
        /// Unique Id across Data Model
        /// </summary>
        [DataMember]
        public int SchemaId { get; set; }

        [DataMember]
        public string Name { get; set; }

    }
}