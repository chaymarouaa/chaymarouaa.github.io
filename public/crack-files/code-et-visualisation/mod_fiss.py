import numpy as np
import numpy.typing as npt
import matplotlib.pyplot as plt

from matscipy.neighbours import neighbour_list

def write_xyz(fname: str, positions: npt.NDArray[float], symbol : str = None):
    """Writes an XYZ file from atom positions (2d or 3d)"""
    natoms = positions.shape[1]

    dtype = np.dtype([('symbols', np.unicode_, 2),
                      ('positions', float, 3)])
    dtype = np.dtype(dtype)
    
    extended_pos = np.zeros(natoms, dtype=dtype)
    extended_pos['positions'][:, :positions.shape[0]] = positions.T
    extended_pos['symbols'][:] = 'H' if symbol is None else symbol
    
    with open(fname, 'w') as fh:
        fh.write(str(natoms) + '\n\n')
        for row in extended_pos:
            s, x = row['symbols'], row['positions']
            fh.write(f"{s} {x[0]:.18e} {x[1]:.18e} {x[2]:.18e}\n")

def verlet_predictor(positions: npt.NDArray[float],
                     velocities: npt.NDArray[float],
                     masses: npt.NDArray[float],
                     forces: npt.NDArray[float], dt: float):
                     
                     "positions += velocities * dt + ((dt**2)/2)*forces/masses"
                     velocities += (dt/2)*forces/masses
                     positions += velocities * dt
                     
    
def verlet_corrector(positions: npt.NDArray[float],
                     velocities: npt.NDArray[float],
                     masses: npt.NDArray[float],
                     forces: npt.NDArray[float], dt: float):

                     velocities += (dt/2)*forces/masses

                      
def compute_dij_nij(positions: npt.NDArray[float], i,j):
    """Calcule les distances et vecteurs normaux pour des paires de particules"""
    # MODIF TP 5 rij = positions[:, np.newaxis, :] - positions[:, :, np.newaxis] #On calcule de cette façon la distance entre chaque particules cf voir schema
    rij = positions[:,j] - positions[:,i]
    dij =  np.linalg.norm(rij, axis=0) # distances entre paires de particules |r_ij|=dij
    nij = rij / dij # vecteurs normaux r_ij / |r_ij|
    np.nan_to_num(nij, copy=False, nan=0.)
    return dij, nij

#TP2.2 séance 3

#Calcul de force entre deux particules
def elastic_bounce_force(dij: npt.NDArray[float], R: float, ka: float):
    """Calcule l'intensité de la force de rappel élastique entre les particules"""
    H = 2*R-dij >= 0
    du = ka*dij*H   
    
    return du


#fonction qui appelle les fonctions dont on a besoin pour calculer
# la distance entre deux particules à chaque instant

def compute_forces_collision(positions: npt.NDArray[float],
                             R: float, ka: float):
    """Calcule les forces sur chaque particule"""
    # Étape 1: calcul de dij et nij
    dij,nij = compute_dij_nij(positions)
    
    # Étape 2: calcul de l'amplitude de la force entre chaque paire de particule
    #avec la fonction elastic_bounce_force
    force = elastic_bounce_force(dij,R,ka)
    
    # Étape 3: calcul de fij 
    
    fij = nij*force   #fij est la matrice qui donne la force entre chaque paire de particule
    
    # Étape 4: somme pour calculer fi
    fi = fij.sum(axis=2) 
    
    return fi

def lj_force(dij: npt.NDArray[float], epsilon: float, sigma: float):
    """Calcule l'intensité de la force selon le potentiel de Lennard-Jones"""
    dulj = 4*epsilon*((-12*(sigma**12)*(dij**-13)) + (6*(sigma**6)*(dij**-7)))
    np.nan_to_num(dulj, copy=False, nan=0.)
    return dulj

def lj_energy(dij: npt.NDArray[float], epsilon: float, sigma: float):
    """Calcule pour chaque paire l'énergie potentielle de Lennard-Jones"""
    ulj = 4*epsilon*((sigma/dij)**12-(sigma/dij)**6)
    np.nan_to_num(ulj, copy=False, nan=0.)
    return ulj

def compute_forces_energy_lj(positions: npt.NDArray[float], 
                             epsilon: float, sigma: float):
    """Calcule les forces sur chaque particule"""
    # Étape 1: calcul de dij et nij
    dij,nij = compute_dij_nij(positions)
    # Étape 2: calcul de U_2'(dij) avec la fonction lj_force
    amplitude_force = lj_force(dij,epsilon, sigma) #amplitude de la force entre deux particules
    # Étape 2': calcul de U_2(dij) avec la fonction lj_energy
    energie = lj_energy(dij, epsilon, sigma) #amplitude de l'energie entre deux particules
    # Étape 3: calcul de fij
    fij = nij*amplitude_force #vecteur force entre deux particules
    # Étape 4: somme pour calculer fi 
    fi = fij.sum(axis=2) #somme sur j des forces de chaque particule (1 vecteur), Pour une particule, toutes les forces (somme fij) qu'elle subit
    # Étape 4': somme pour calculer l'énergie potentielle totale
    ei = 1/2*energie.sum() #somme de tous les éléments du tableau énergie (1 scalaire)
    return fi, ei # on retourne forces et énergie potentielle


def make_crystal(lattice_spacing: float,
                 radius: float,
                 angle: float = np.pi / 2):
    """Crée un cristal avec un angle"""
    l = float(lattice_spacing)
    
    # Nombre de répétitions de la cellule de base du cristal
    nx = int(2 * radius / l) + 1
    ny = int(2 * radius / (l * np.sin(angle))) + 1

    # Génération de la structure cristaline
    i, j = np.mgrid[0:nx, 0:ny]
    ei = np.array([1., 0, 0])
    ej = np.array([np.cos(angle), np.sin(angle), 0])

    lattice = (
        ei[np.newaxis, np.newaxis] * i[..., np.newaxis]
        + ej[np.newaxis, np.newaxis] * j[..., np.newaxis]
    )
    
    lattice = lattice.reshape(lattice.shape[0] * lattice.shape[1], -1).T

    # On passe d'un parallélogramme à un rectangle
    shifts = np.floor(lattice[0] / nx)
    lattice[0] -= shifts * nx

    # On centre le lattice
    center = np.array([radius / l] * 2 + [0])
    lattice -= center[:, np.newaxis]

    # On masque les positions hors du cercle de rayon "radius"
    mask = sum(x**2 for x in lattice) <= (radius / l)**2

    # On retourne le lattice avec la bonne constante
    return lattice[:, mask] * lattice_spacing


#Algorithme des listes voisins (code + rapide du prof)


def compute_forces_energy_neighbours_lj(positions,
                                        epsilon, sigma, cutoff,
                                        domain=None, periodicity=None):
    """Calcule les forces entre particules par liste de voisins"""
    if domain is None:
        domain = np.max(positions, axis=1) - np.min(positions, axis=1)

    domain = np.asanyarray(domain)

    # On complète la matrice du domaine
    if domain.ndim == 1:
        domain = np.diag(domain)

    if domain.shape == (2, 2):
        extended_domain = np.eye(3)
        extended_domain[:2, :2] = domain
        domain = extended_domain

    # Non-périodique par défaut
    if periodicity is None:
        periodicity = np.array([False] * 3)

    periodicity = np.asanyarray(periodicity)

    # On complète la périodicité
    if periodicity.shape[0] == 2:
        periodicity = np.concatenate((periodicity, [False]))

    # On rajoute une coordonnée en 2d
    if positions.shape[0] == 2:
        full_positions = np.vstack((positions, np.zeros(positions.shape[1])))
    else:
        full_positions = positions

    # Calcul des voisins avec matscipy
    i, j, dij, rij = neighbour_list('ijdD', positions=full_positions.T,
                                    cell=domain, pbc=periodicity,
                                    cutoff=float(cutoff))

    # Calcul de la force
    fij = lj_force(dij, epsilon, sigma)

    fij = (fij / dij)[np.newaxis] * rij.T 

    # Calcul de l'énergie
    eij = lj_energy(dij, epsilon, sigma) - lj_energy(cutoff, epsilon, sigma)

    # Somme des forces de paires pour chaque particule
    forces = np.zeros_like(positions)
    natoms = forces.shape[1]
    for d in range(positions.shape[0]):
        forces[d] -= 0.5 * np.bincount(j, weights=fij[d], minlength=natoms)
        forces[d] += 0.5 * np.bincount(i, weights=fij[d], minlength=natoms)
    return forces, 0.5 * eij.sum(), rij


def temperature(masses, velocities):
    """Calcule la température instantanée"""
    N=masses.size #même taille que la matrice masse (ou veloticies)
    kb=1 #constante
    temp = 2/(3*N*kb)*1/2*masses*((velocities)**2)
    temp = temp.sum()
    return temp

 
def pos_centre_grav(positions):
    r_center = positions - positions.mean(axis=1)[:, np.newaxis] # valide si toutes les masses sont identiques
    distance_grav =  np.linalg.norm(r_center, axis=0)
    return distance_grav


def histo(positions):
    distance_grav=pos_centre_grav(positions)
    histogram = np.histogram(distance_grav)
    return distance_grav

#TP 5
#
#
#
#
#
#
#
#

def elastic_bar_force(dij, kij, Lij, dc):
    cassee = (dij-Lij) >= dc #on crée un groupe de noeud 
    kij[cassee] = 0
        
    dU2 = -kij*(dij-Lij) #dérivée de l'energie potentielle donne la force
    return dU2

def elastic_bar_energy(dij, kij, Lij, dc):
    U2=1/2*kij*(dij-Lij)**2
    return U2

def assemble_forces(fij, natoms, i, j):
    forces_ = np.zeros([fij.shape[0], natoms]) #forces ici est fij, cad Pour une particule, toutes les forces (somme fij) qu'elle subit
    for d in range(fij.shape[0]):
        forces_[d] += 0.5 * np.bincount(j, weights=fij[d], minlength=natoms)
        forces_[d] -= 0.5 * np.bincount(i, weights=fij[d], minlength=natoms)
    return forces_


def compute_force_energy_bar(positions, i, j, kij, Lij, dc):
    natoms= positions.shape[1]
    dij, nij = compute_dij_nij(positions, i,j)
    
    amplitude_f = elastic_bar_force(dij, kij, Lij, dc)
    energie_f = elastic_bar_energy(dij, kij, Lij, dc)
    
    fij = nij*amplitude_f
    f = assemble_forces(fij, natoms, i, j)
   #ei = 1/2*energie_f.sum()
    
    return f


def make_bar(lattice_spacing: float, nx, ny):
    """Crée un cristal avec un angle"""
    l = float(lattice_spacing) #espacement entre 2 particules

    # Génération de la structure cristaline
    i, j = np.mgrid[0:nx, 0:ny]
    ei = np.array([1., 0, 0]) #vecteur ei canonique en x, y, z
    ej = np.array([0, 1., 0])

    lattice = (
        ei[np.newaxis, np.newaxis] * i[..., np.newaxis]
        + ej[np.newaxis, np.newaxis] * j[..., np.newaxis]
    ) #maillage où chaque noeud est espacé de 1 (position selon ei et ej)
    
    lattice = lattice.reshape(lattice.shape[0] * lattice.shape[1], -1).T

    # On passe d'un parallélogramme à un rectangle
    shifts = np.floor(lattice[0] / nx)
    lattice[0] -= shifts * nx

    # On retourne le lattice avec la bonne constante
    return lattice * lattice_spacing #positions initial



def get_neighbour_info(positions, cutoff, data='ij',
                       domain=None, periodicity=None):
    """
    Calcule les listes de voisins (optionellement les distances).

    Exemple d'utilisation:
    >>> i, j = get_neighbour_info(positions, rc)
    """
    if domain is None:
        domain = np.max(positions, axis=1) - np.min(positions, axis=1)
        domain[domain == 0] = np.max(domain)

    domain = np.asanyarray(domain)

    # On complète la matrice du domaine
    if domain.ndim == 1:
        domain = np.diag(domain)

    if domain.shape == (2, 2):
        extended_domain = np.eye(3)

        extended_domain[:2, :2] = domain
        domain = extended_domain

    # Non-périodique par défaut
    if periodicity is None:
        periodicity = np.array([False] * 3)

    periodicity = np.asanyarray(periodicity)

    # On complète la périodicité
    if periodicity.shape[0] == 2:
        periodicity = np.concatenate((periodicity, [False]))

    # On rajoute une coordonnée en 2d
    if positions.shape[0] == 2:
        full_positions = np.vstack((positions, np.zeros(positions.shape[1])))
    else:
        full_positions = positions

    # Calcul des voisins avec matscipy
    neigh_data = list(neighbour_list(data, positions=full_positions.T,
                                     cell=domain, pbc=periodicity,
                                     cutoff=float(cutoff)))

    # Transpose rij
    D_index = data.find('D')
    if D_index != -1:
        neigh_data[D_index] = neigh_data[D_index].T

    return neigh_data

def barre_casse(i,j,raideur_bar,nf_x, nf_y) :
    b1 = (i==nf_x)&(j==nf_y)
    b2 = (i==nf_y)&(j==nf_x)
    raideur_bar[b1|b2] = 0
    


def premiere_fiss(i,j,raideur_bar, nf, ny) :
    
    # nf_x = 40
    # nf_y = 50 
    #on rompt la barre horizontale inférieure, correspondant pour nf=40 à la 3e barre horizontale en y=0 (bord inf) 
    nf_x = nf
    nf_y = nf_x + ny
    b1 = (i==nf_x)&(j==nf_y)
    b2 = (i==nf_y)&(j==nf_x)
    raideur_bar[b1|b2] = 0

    # nf_x = 41
    # nf_y = 51
    #barre horizontale supérieure
    # nf_x = nf+1
    # nf_y = nf_x+ ny
    # b1 = (i==nf_x)&(j==nf_y)
    # b2 = (i==nf_y)&(j==nf_x)
    # raideur_bar[b1|b2] = 0

    # nf_x = 41
    # nf_y = 40
    #barre verticale gauche
    # nf_x = nf +1
    # nf_y = nf_x -1
    # b1 = (i==nf_x)&(j==nf_y)
    # b2 = (i==nf_y)&(j==nf_x)
    # raideur_bar[b1|b2] = 0

    # nf_x = 51
    # nf_y = 50
    #barre verticale droite
    # nf_x = nf + ny + 1
    # nf_y = nf_x - 1
    # b1 = (i==nf_x)&(j==nf_y)
    # b2 = (i==nf_y)&(j==nf_x)
    # raideur_bar[b1|b2] = 0

    # nf_x = 40
    # nf_y = 51
    #barre diagonale inf gauche - sup droit
    nf_x = nf
    nf_y = nf_x + ny +1
    b1 = (i==nf_x)&(j==nf_y)
    b2 = (i==nf_y)&(j==nf_x)
    raideur_bar[b1|b2] = 0

    # nf_x = 41
    # nf_y = 50
    #barre diagonale inf droit - sup gauche
    nf_x = nf + 1
    nf_y = nf_x + ny -1
    b1 = (i==nf_x)&(j==nf_y)
    b2 = (i==nf_y)&(j==nf_x)
    raideur_bar[b1|b2] = 0





