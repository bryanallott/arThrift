/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 */
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using System.IO;
using Thrift;
using Thrift.Collections;
using Thrift.Protocol;
using Thrift.Transport;
namespace arthrift
{

  [Serializable]
  public partial class InvalidOperation : Exception, TBase
  {
    private int what;
    private string why;

    public int What
    {
      get
      {
        return what;
      }
      set
      {
        __isset.what = true;
        this.what = value;
      }
    }

    public string Why
    {
      get
      {
        return why;
      }
      set
      {
        __isset.why = true;
        this.why = value;
      }
    }


    public Isset __isset;
    [Serializable]
    public struct Isset {
      public bool what;
      public bool why;
    }

    public InvalidOperation() {
    }

    public void Read (TProtocol iprot)
    {
      TField field;
      iprot.ReadStructBegin();
      while (true)
      {
        field = iprot.ReadFieldBegin();
        if (field.Type == TType.Stop) { 
          break;
        }
        switch (field.ID)
        {
          case 1:
            if (field.Type == TType.I32) {
              this.what = iprot.ReadI32();
              this.__isset.what = true;
            } else { 
              TProtocolUtil.Skip(iprot, field.Type);
            }
            break;
          case 2:
            if (field.Type == TType.String) {
              this.why = iprot.ReadString();
              this.__isset.why = true;
            } else { 
              TProtocolUtil.Skip(iprot, field.Type);
            }
            break;
          default: 
            TProtocolUtil.Skip(iprot, field.Type);
            break;
        }
        iprot.ReadFieldEnd();
      }
      iprot.ReadStructEnd();
    }

    public void Write(TProtocol oprot) {
      TStruct struc = new TStruct("InvalidOperation");
      oprot.WriteStructBegin(struc);
      TField field = new TField();
      if (__isset.what) {
        field.Name = "what";
        field.Type = TType.I32;
        field.ID = 1;
        oprot.WriteFieldBegin(field);
        oprot.WriteI32(this.what);
        oprot.WriteFieldEnd();
      }
      if (this.why != null && __isset.why) {
        field.Name = "why";
        field.Type = TType.String;
        field.ID = 2;
        oprot.WriteFieldBegin(field);
        oprot.WriteString(this.why);
        oprot.WriteFieldEnd();
      }
      oprot.WriteFieldStop();
      oprot.WriteStructEnd();
    }

    public override string ToString() {
      StringBuilder sb = new StringBuilder("InvalidOperation(");
      sb.Append("what: ");
      sb.Append(this.what);
      sb.Append(",why: ");
      sb.Append(this.why);
      sb.Append(")");
      return sb.ToString();
    }

  }

}
