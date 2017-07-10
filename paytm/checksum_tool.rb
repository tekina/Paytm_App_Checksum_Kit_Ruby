class ChecksumTool
  include EncryptionNewPG
  

  def self.is_valid_merchant_id?(mid)
    return mid.eql?(MID)
  end

  def get_checksum_hash(paytmparams, key)
    new_pg_checksum(paytmparams, key)
  end

  def get_checksum_verified_array(paytmparams, key)
    checksum_hash = paytmparams["CHECKSUMHASH"]
    paytmparams.delete("CHECKSUMHASH")
    return_array = paytmparams
    return new_pg_verify_checksum(paytmparams, checksum_hash, key)
  end
end
