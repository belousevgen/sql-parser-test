using System.Collections.Generic;
using System.Runtime.Serialization;
using Newtonsoft.Json;

namespace SqlParser.Dto.DataModel
{
    [DataContract(Namespace = "")]
    public class DataModelDto
    {
        public DataModelDto()
        {
            Schemas = new List<SchemaDto>();
            Tables = new List<TableDto>();
        }

        public DataModelDto(List<SchemaDto> schemas, List<TableDto> tables)
        {
            Schemas = schemas;
            Tables = tables;
        }

        /// <summary>
        /// Max Unique Id in the model
        /// </summary>
        [DataMember]
        public int MaxUniqueId { get; set; }

        [DataMember]
        public DbTypeDto DbType { get; set; }

        [DataMember]
        public List<SchemaDto> Schemas { get; set; }

        [DataMember]
        public List<TableDto> Tables { get; set; }

        public override string ToString()
        {
            return JsonConvert.SerializeObject(this, new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Ignore
            });
        }
    }
}