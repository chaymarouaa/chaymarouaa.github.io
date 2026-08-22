import numpy as np
import numpy.typing as npt
import matplotlib.pyplot as plt
import random 
import sys

#guide de visualisation
#après avoir run mod_fiss.py puis Code_fissuration.py, vous trouverez au même path des fichiers (environs 200) 
# nommés "particules_100.xyz". Ouvrez le premier fichier au format .xyz dans un logiciel de visualiton adapté comme OVITO. 
#Si les particules sont anormalement volumineuses, pensez à réduire leur volume ou à modifier la particule de référence pour la
# visualisation.




#sys.path.append("D:\TP ProjetME104\TP6") 
from mod_fiss import make_bar
#from truss_figure import *

from mod_fiss import *
from matscipy.neighbours import neighbour_list

#pip install --proxy http://proxyweb.upmc.fr:3128 matscipy   # <- pour les ordis de TP
#pip install matscipy                                        # <- pour votre ordi perso
#from matscipy.neighbours import neighbour_list

nx=20
ny=10


lattice_spacing = 2/19 #distance entre deux particules à l'instant initial
cutoff = 1.5*lattice_spacing #distance au dela de laquelle on considère 
                              #qu'il n'y a plus d'interaction entre une paire de particule
#Pour le choix de cutoff, on veut une distance + que la dist entre 2part
#mais moins que 2*dist entre 2 part. On prend 1.5 pour que ca prenne la voisin diagonale (distance judicieuse)

k=10*(10**6)
#k=2.685*(10**12) # la raideur pour obtenir module d'young= 200GPa
positions = make_bar(lattice_spacing, nx, ny)[:2] # On ne garde que x et y

masses = np.ones(positions.shape[1])
masses=0.2
forces = np.zeros_like(positions) #forces totales appliquées aux paire de particule
velocities = np.zeros_like(positions)
fd= np.zeros_like(positions)

traction=np.zeros_like(positions) #Condition limite

node_left = np.abs(positions[0, :] - np.min(positions[0])) < 1e-6 #definition bord vertical en x=0
node_right = np.abs(positions[0, :] - np.max(positions[0])) < 1e-6 #definition bord vertical en x=L
i,j = get_neighbour_info(positions, cutoff)
Lij, nij = compute_dij_nij(positions, i,j) #distance diagonale en t=0

#On initialise une matrice de raideur qui a la meme taille que la matrice des barres (distances initiales entre les particules)
#on choisit un element aleatoire dans cette matrice qui a une raideur nulle (barre "cassée")

#nf =  random.randint(1,nx*ny) #pour commencer on choisis une valeur fixe, ensuite on ajt aleatoire


raideur_bar= np.zeros_like(Lij) + k

nf = 78      #le chiffre en unité indique la localisation selon y et les dizaines selon x
#si les chiffre des unité sont egaux a 9 alors on a que les barres sup qui se cassent initialement et les diagonales du carré cassé ne sont pas comprises
propag_fiss = premiere_fiss(i, j, raideur_bar, nf, ny)

tau=1/(np.sqrt(k/masses)) #tau calculé pour avoir amortissement critique ksi=1
dt=0.1*tau


# elong=np.zeros(10)
# contr=np.zeros(10)
# module_Y=np.zeros(5)
# el_t=np.zeros(10)
# Poisson=np.zeros(5)



for i_1, j_1, k1 in zip(i, j,raideur_bar):
    A = 1-(k1/k) # permet d'obtenir pour chaque bar une valeur entre 0 et 1, pour ensuite colorer en blanc (invisible) les bars rompues
    #print(A)
    plt.plot([positions[0, i_1], positions[0, j_1]], [positions[1, i_1], positions[1, j_1]], '-o', color= str(A), markersize=5)
plt.figure(1)





Fa=0
#↨Fa=0.1*(10**6)

#for Fa in range(1,11) : #pour avoir 10 points sur la droite
deplacement_critique = 0.15 # a patir de cette valeur de deplacement, les forces d'interactions de la barres dont la raideur est =0 sont toutes =0

for step in range (1,12000) :
    Fa = Fa + 0.00095 #On augmente Fa petit a petit pour pas avoir une grande force des le debut
                       #On l'augmente progressivement pour se rapprocher des conditions d'experience reelles, cad qu'en irl une force augmente et deccelere
    t=(step+1)*dt
    traction[0, node_right] =0.1*(10**6) #Condition limite qui ne change pas
    traction[0, node_right] =Fa*(10**5) #Condition limite qui change entre 100 000 et 1 000 000
    traction[0, (nx*ny-ny)] *= 0.5
    traction[0, (nx*ny-1)] *= 0.5
    
    verlet_predictor(positions,velocities,masses,forces,dt)
    forces_interactions = compute_force_energy_bar(positions, i, j, raideur_bar, Lij, deplacement_critique)
    fd= -(masses*velocities)/tau
    forces = forces_interactions + traction + fd
    verlet_corrector(positions,velocities,masses,forces,dt)
    
    ec=1/2*masses*velocities**2
    ec=ec.sum()
    dij, nij= compute_dij_nij(positions,i,j)
    ep= elastic_bar_energy(dij, raideur_bar, Lij, deplacement_critique)
    ep=ep.sum()
    em= ec+ep

    elongation_long = ((np.max(positions[0,:]) - (nx-1)*lattice_spacing))/((nx-1)*lattice_spacing)
    elongation_trans = ((np.max(positions[1,:]) - (ny-1)*lattice_spacing))/((ny-1)*lattice_spacing)
    
    #Conditions limites 
    velocities[0, node_left]=0 #qui change a tous les pas de temps, on remet les conditions initiales de la vtesse a 0
    forces[0, node_left]=0
        

    if step % 100 == 0 : # pour faire les calculs + vite
        write_xyz(f"particules_{step}.xyz", positions, symbol="Cu")
        
    # if ec < 0.1*ep and step > 1000:
    #     break

    
    dij, nij = compute_dij_nij(positions, i,j)
    

    noeud = (dij-Lij >= 0.5*lattice_spacing)
    raideur_bar[noeud] = 0
    
    largeur_bar_initial=(ny*lattice_spacing)
    contrainte=Fa*(10**5)/largeur_bar_initial
    
    plt.figure(2)
    plt.title("Contrainte en fonction de l'élongation")
    plt.plot(elongation_long,contrainte, marker="x", color='b')
    plt.xlabel("Elongation")
    plt.ylabel("Contrainte")

   
    plt.figure(3)
    plt.title("Elongation transverse en fonction de l'Elongation longitudinale")
    plt.plot(elongation_long,elongation_trans, marker="x", color='b')
    plt.xlabel("Elongation Longitudinale")
    plt.ylabel("Elongation Transversale") 
    plt.figure(3)
   
#     elong[Fa]=elongation_long
#     contr[Fa]=contrainte
#     el_t[Fa]=elongation_trans

# module_Y[0] = (contr[9] - contr[0]) / (elong[9] - elong[0])
# module_Y[1] = (contr[8] - contr[1]) / (elong[8] - elong[1])
# module_Y[2] = (contr[7] - contr[2]) / (elong[7] - elong[2])
# module_Y[3] = (contr[6] - contr[3]) / (elong[6] - elong[3])
# module_Y[4] = (contr[5] - contr[4]) / (elong[5] - elong[4])

# S=0
# for indice in range(0,5):
#     S = S + (np.abs(module_Y[indice]))
# Module_Young = S/5.
# print("Module d'Young 1=", Module_Young)

# Poisson[0] = (el_t[9] - el_t[0]) / (elong[9] - elong[0])
# Poisson[1] = (el_t[8] - el_t[1]) / (elong[8] - elong[1])
# Poisson[2] = (el_t[7] - el_t[2]) / (elong[7] - elong[2])
# Poisson[3] = (el_t[6] - el_t[3]) / (elong[6] - elong[3])
# Poisson[4] = (el_t[5] - el_t[4]) / (elong[5] - elong[4])

# S=0
# for indice in range(0,5):
#     S = S + (np.abs(Poisson[indice]))
# Pois = S/5.
# print("Coefficient Poisson 1=", Pois)
    
for i_1, j_1, k1 in zip(i, j,raideur_bar):
    A = 1-(k1/k) # permet d'obtenir pour chaque bar une valeur entre 0 et 1, pour ensuite colorer en blanc (invisible) les bars rompues
    plt.plot([positions[0, i_1], positions[0, j_1]], [positions[1, i_1], positions[1, j_1]], '-o', color= str(A), markersize=5)
    plt.figure(5)
    
    


# plt.figure(2)
# plt.scatter(*positions)
# plt.gca().set_aspect("equal")
# plt.show()



    
    
    
    
    
    
    
    
    
    
    
    