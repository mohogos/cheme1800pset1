include("Include.jl")

plaintext = "Julia is awesome. The computer is my best friend, and it loves me. This is a test and only a test."

call = encrypt(plaintext)
test = decrypt(call)