module 0x42::VectorDemo{
    use std::debug;
    use std::vector;

    const ARR:vector<u64> = vector[1,2,3,4,5,6,7,8,9,10]; 

    #[test]
    fun test_vector(){
        debug::print(&ARR);
    }

    #[test]
    fun test_empty_vector(){
        let bools:bool = vector::is_empty(&ARR);
        debug::print(&bools);
    }

    #[test]
    fun test_vector_length(){
        let len:u64 = vector::length(&ARR);
        debug::print(&len);
    }

    #[test]
    fun test_vector_borrow(){
        let val = vector::borrow(&ARR, 3);
        debug::print(val);
    }

    #[test]
    fun test_vector_borrow_mut(){
        let arr:vector<u64> = vector[1,2,3,4,5,6,7,8,9,10];
        let val = vector::borrow_mut(&mut arr, 3);
        *val = 100;
        debug::print(&arr);
    }

    #[test]
    fun test_vector_contains(){
        let n:u64 = 3;
        let n2:u64 = 11;
        let bools:bool = vector::contains(&ARR, &n);
        let bools2:bool = vector::contains(&ARR, &n2);
        debug::print(&bools);
        debug::print(&bools2);
    }

    #[test]
    fun test_vector_index_of(){
        let n:u64 = 3;
        let n2:u64 = 11;
        let (isIndex,index) = vector::index_of(&ARR, &n);
        let (isIndex2, index2) = vector::index_of(&ARR, &n2);
        debug::print(&isIndex);
        debug::print(&index);
        debug::print(&isIndex2);
        debug::print(&index2);
    }
}