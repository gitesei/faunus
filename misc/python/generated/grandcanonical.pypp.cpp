// This file has been generated by Py++.

#include "boost/python.hpp"
#include "generated/generated_header.h"
#include "grandcanonical.pypp.hpp"

namespace bp = boost::python;

void register_grandcanonical_class(){

    bp::class_< Faunus::grandcanonical, bp::bases< Faunus::ensemble > >( "grandcanonical" )    
        .def( 
            "addgroup"
            , (void ( ::Faunus::grandcanonical::* )( ::Faunus::group & ) )( &::Faunus::grandcanonical::addgroup )
            , ( bp::arg("arg0") ) )    
        .def( 
            "erase"
            , (bool ( ::Faunus::grandcanonical::* )( ::std::vector< Faunus::particle > &,unsigned int,unsigned char ) )( &::Faunus::grandcanonical::erase )
            , ( bp::arg("arg0"), bp::arg("arg1"), bp::arg("arg2")=(unsigned char)(1) ) )    
        .def( 
            "findgroup"
            , (short int ( ::Faunus::grandcanonical::* )( ::std::string ) )( &::Faunus::grandcanonical::findgroup )
            , ( bp::arg("arg0") ) )    
        .def( 
            "info"
            , (::std::string ( ::Faunus::grandcanonical::* )(  ) )( &::Faunus::grandcanonical::info ) )    
        .def( 
            "insert"
            , (bool ( ::Faunus::grandcanonical::* )( ::std::vector< Faunus::particle > &,unsigned int,::Faunus::particle,unsigned char ) )( &::Faunus::grandcanonical::insert )
            , ( bp::arg("arg0"), bp::arg("arg1"), bp::arg("arg2"), bp::arg("arg3")=(unsigned char)(1) ) )    
        .def( 
            "searchsalt"
            , (void ( ::Faunus::grandcanonical::* )( ::Faunus::container &,::Faunus::salt & ) )( &::Faunus::grandcanonical::searchsalt )
            , ( bp::arg("arg0"), bp::arg("arg1") ) )    
        .def_readwrite( "g", &Faunus::grandcanonical::g );

}
