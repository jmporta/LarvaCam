function checkError(nRet,nErrorCode)
  global g;
  
  if nRet == 0
      if nErrorCode==7 || nErrorCode==107
        % warnings (non harmful errors)
        disp(['PDC_GetStatus Error ' num2str(nErrorCode) ': ' g.errorMsg{nErrorCode} ]);
      else
        error(['PDC_GetStatus Error ' num2str(nErrorCode) ': ' g.errorMsg{nErrorCode} ]);
      end
  end
end