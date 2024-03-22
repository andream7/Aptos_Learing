module Lesson1::HelloWorld{
    use std::debug::print;
    use std::string::utf8;

    // 在控制台输出需要加 #[test]
    // aptos move test
    #[test]
    fun test_hello_world(){
        // &var 只读
        // &mut var 可读可写
        print(&utf8(b"Hello World!"));
    }
}