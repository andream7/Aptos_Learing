module MyPackage::M1{
    friend MyPackage::M2;
    
    public fun num():u64 {
        66
    }

    public(friend) fun num2():u64 {
        88
    }
}