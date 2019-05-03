#include<stdio.h>
#include<mpi.h>

int b [][] = {{1, 1, 1, 1},{2, 2, 2, 2},{3, 3, 3, 3},{4, 4, 4, 4}};
int w [] = {1, 2, 3, 4};


int main(int argc, char **argv){

    int size, id;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &id);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    int j, i, s, z = 0, r = 40/size;
    
    //B = A( 0 : n -1, id . r : (id + 1)r -1)
    for
    for(i = id*r ; i <= ((id +1) *r) - 1; i ++){
        z += b[i];
    }
    printf("%d\n\n", z);

    if(id == 0)
        s = 0;
    else{
        MPI_Recv(&s, 1, MPI_INT, id-1, 890, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        printf("%d recebeu de %d o %d\n", id , id-1, s);
    }

    s += z;
    int next = id == 3 ? 0 : id + 1;
    MPI_Send(&s, 1, MPI_INT, (id+1)%4, 890, MPI_COMM_WORLD);
    if(id == 0){
        MPI_Recv(&s, 1, MPI_INT, 3, 890, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        printf("O resultado Final é %d\n", s);
    }

    MPI_Finalize();
    return 0;
}
