# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from ranger_msgs/MotorState.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class MotorState(genpy.Message):
  _md5sum = "4f0afbdb08d903468630312c9e20a600"
  _type = "ranger_msgs/MotorState"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """int32 rpm
float32 current
int32 pulse_count"""
  __slots__ = ['rpm','current','pulse_count']
  _slot_types = ['int32','float32','int32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       rpm,current,pulse_count

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(MotorState, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.rpm is None:
        self.rpm = 0
      if self.current is None:
        self.current = 0.
      if self.pulse_count is None:
        self.pulse_count = 0
    else:
      self.rpm = 0
      self.current = 0.
      self.pulse_count = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_ifi().pack(_x.rpm, _x.current, _x.pulse_count))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 12
      (_x.rpm, _x.current, _x.pulse_count,) = _get_struct_ifi().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_ifi().pack(_x.rpm, _x.current, _x.pulse_count))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 12
      (_x.rpm, _x.current, _x.pulse_count,) = _get_struct_ifi().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_ifi = None
def _get_struct_ifi():
    global _struct_ifi
    if _struct_ifi is None:
        _struct_ifi = struct.Struct("<ifi")
    return _struct_ifi
