module 0x42::Demo{
    use std::debug;

    #[test]
    fun test_if(){
        let x = 5;
        let x2 = 10;
        if (x == 6) {
            debug::print(&x);
        } else {
            debug::print(&x2);
        }
    }

    #[test]
    fun test_while(){
        let x = 5;
        while (x > 0) {
            x = x - 1;
            if(x == 3){
                continue;
            };

            debug::print(&x);
        }
    }

    #[test]
    fun test_loop(){
        let x = 5;
        loop {
            x = x - 1;
            if(x == 3){
                continue;
            };
            if(x == 0){
                break;
            };
            debug::print(&x);
        }
    }
}