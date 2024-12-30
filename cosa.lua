function parsePayload(appeui,deveui,payload)
    Tag1 = "dummy"
    
    
    value = string.match(strvalue, 'Dummy Sensor Value is ([0-9]+)')
    resiot_debug(string.format("SN_TEST_GG Tag: %s Value: %s \n",Tag1, value))
    worked, err = resiot_setnodevalue(appeui, deveui, Tag1, value)
    if (not worked) then
      resiot_debug(string.format("SN_TEST_GG Set Value Error %s \n",err))
    else
      resiot_debug("SN_TEST_GG Set Node value successful\n")
    end
  end
  
  Origin = resiot_startfrom()
  
  if Origin == "Manual" then
    --payload = "44756d6d792053656e736f722056616c756520697320323437"
    payload = "10019b0340c0107d3442bc0209000200010014000f00c800640032003200"
    appeui = "70b3d57ed000ac4a"
    deveui = "7139323559379194"
  else
    appeui = resiot_comm_getparam("appeui")
    deveui = resiot_comm_getparam("deveui")
    payload, err = resiot_getlastpayload(appeui, deveui)
    resiot_debug("SN_TEST_GG Test Auto Mode\n")
  end
  parsePayload(appeui,deveui,payload)