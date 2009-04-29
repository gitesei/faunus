// This file has been generated by Py++.

#include "boost/python.hpp"
#include "generated/generated_header.h"
#include "saltmove.pypp.hpp"

namespace bp = boost::python;

struct saltmove_wrapper : Faunus::saltmove, bp::wrapper< Faunus::saltmove > {

    saltmove_wrapper(Faunus::saltmove const & arg )
    : Faunus::saltmove( arg )
      , bp::wrapper< Faunus::saltmove >(){
        // copy constructor
        
    }

    saltmove_wrapper(::Faunus::ensemble & arg0, ::Faunus::container & arg1, ::Faunus::energybase & arg2 )
    : Faunus::saltmove( boost::ref(arg0), boost::ref(arg1), boost::ref(arg2) )
      , bp::wrapper< Faunus::saltmove >(){
        // constructor
    
    }

    saltmove_wrapper(::Faunus::ensemble & arg0, ::Faunus::container & arg1, ::Faunus::energybase & arg2, ::Faunus::inputfile & arg3 )
    : Faunus::saltmove( boost::ref(arg0), boost::ref(arg1), boost::ref(arg2), boost::ref(arg3) )
      , bp::wrapper< Faunus::saltmove >(){
        // constructor
    
    }

    virtual ::std::string info(  ) {
        if( bp::override func_info = this->get_override( "info" ) )
            return func_info(  );
        else
            return this->Faunus::saltmove::info(  );
    }
    
    
    ::std::string default_info(  ) {
        return Faunus::saltmove::info( );
    }

};

void register_saltmove_class(){

    bp::class_< saltmove_wrapper, bp::bases< Faunus::markovmove > >( "saltmove", bp::init< Faunus::ensemble &, Faunus::container &, Faunus::energybase & >(( bp::arg("arg0"), bp::arg("arg1"), bp::arg("arg2") )) )    
        .def( bp::init< Faunus::ensemble &, Faunus::container &, Faunus::energybase &, Faunus::inputfile & >(( bp::arg("arg0"), bp::arg("arg1"), bp::arg("arg2"), bp::arg("arg3") )) )    
        .def( 
            "info"
            , (::std::string ( ::Faunus::saltmove::* )(  ) )(&::Faunus::saltmove::info)
            , (::std::string ( saltmove_wrapper::* )(  ) )(&saltmove_wrapper::default_info) )    
        .def( 
            "move"
            , (double ( ::Faunus::saltmove::* )( ::Faunus::group &,int ) )( &::Faunus::saltmove::move )
            , ( bp::arg("arg0"), bp::arg("arg1") ) )    
        .def( 
            "move"
            , (double ( ::Faunus::saltmove::* )( ::Faunus::group & ) )( &::Faunus::saltmove::move )
            , ( bp::arg("arg0") ) )    
        .def_readwrite( "dpv", &Faunus::saltmove::dpv );

}
