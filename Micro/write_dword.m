function write_dword(handles,pos,value)
  
  val=int32(value);
  val1=int16(bi2de(bitget(val,1:16)));
  val2=int16(bi2de(bitget(val,17:32)));
  
  write_word(handles,pos,val1); 
  write_word(handles,pos+2,val2); 
end