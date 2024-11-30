using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace VO.Models
{
    public class ExceptionsWeb : Exception
    {
        [DataMember(EmitDefaultValue = false)]
        public eErrorType ErrorType { get; set; } = eErrorType.None;

        public ExceptionsWeb() { }

        public ExceptionsWeb(string message) : base(message) { }

        public ExceptionsWeb(string message, eErrorType errorType) : base(message)
        {
            ErrorType = errorType;
        }
    }
}
