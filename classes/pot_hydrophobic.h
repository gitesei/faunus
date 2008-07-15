#ifndef _POT_HYDROPHOBIC_H
#define _POT_HYDROPHOBIC_H

#include "potentials.h"

/*! \brief Double vdW interaction for certain particles with hydrophobic groups 
 *  \author Mikael Lund 
 *
 *  This potential consists of a Coulomb and LJ potential as usual. When encountering
 *  a particle of type "id" AND a hydrophobic group, the LJ epsilon parameter will be
 *  scaled by pot_setup::hydroscale (Input keyword: "hydroscale").
 */
class pot_hydrophobic : public pot_lj {
  private:
    double scale;
  public:
    particle::type id;    //!< Particle to interact with hydrophobic groups (default: iodide)
    pot_hydrophobic( pot_setup &pot ) : pot_lj( pot.eps/pot.lB ) {
      f=pot.lB;
      scale=pot.hydroscale;
      id=particle::I;
      name+="/Coulomb w. extra hydrophobicity";
    }
    inline double pairpot(particle &p1, particle &p2) {
      register double r2=p1.sqdist(p2), u=lj(p1,p2,r2);
      if (p1.id==id && p2.hydrophobic==true)
        u=scale*u;
      else if (p2.id==id && p1.hydrophobic==true)
        u=scale*u;
      return u + p1.charge*p2.charge/sqrt(r2);
    }
    string info();
};

string pot_hydrophobic::info() {
  ostringstream o;
  o << pot_lj::info()
    << "#   Bjerrum length     = " << f << endl
    << "#   Hydrop. LJ scaling = " << scale << endl;
  return o.str();
}
#endif