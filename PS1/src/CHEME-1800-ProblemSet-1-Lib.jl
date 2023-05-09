"""
    encrypt(plaintext::String) -> Dict{Int64,String}

Fill me in
"""
function encrypt(plaintext::String)::Dict{Int64,String}
    
    message = Dict{Int64,String}()
    counter = 0;

    encryption_model = _build(DNAEncryptionKey);
    encryptionkey = encryption_model.encryptionkey;

    for c ∈ uppercase(plaintext)

        message[counter] = encryptionkey[c]

        counter = counter + 1
    end

    return message
end


"""
    decrypt(encrypteddata::Dict{Int64,String}) -> String

Fill me in
"""
function decrypt(encrypteddata::Dict{Int64,String})::String

   number_of_chars = length(encrypteddata)
   inverse_encryptionkey_dict = Dict{String, Char}()
   plaintext = Vector{Char}()

   encryption_model = _build(DNAEncryptionKey);
   encryptionkey = encryption_model.encryptionkey;

   for (key, value) ∈ encryptionkey
       inverse_encryptionkey_dict[value] = key
   end

   for i ∈ 0:(number_of_chars - 1)
       
       codon = encrypteddata[i]
       value = inverse_encryptionkey_dict[codon]
       push!(plaintext, value)
   end

   return String(plaintext)
end