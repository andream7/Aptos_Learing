module MyPackage::M3{
    #[test]
    fun test(){
        use std::debug::print;
        use MyPackage::M1::num;

        let n = num();
        print(&n);
    }

    // #[test]
    // fun test2(){
    //     use std::debug::print;
    //     use MyPackage::M1::num2;

    //     let n = num2();
    //     print(&n);
    // }
}