#include<stdio.h>
#include<mpi.h>

int main(int argc, char **argv){

    int size, rank, length, dest = 0, tag = 999;
    char name[80];

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    if(rank > 0){
        MPI_Get_processor_name(name, &length);
        MPI_Send(name, 80, MPI_CHAR, dest, tag, MPI_COMM_WORLD);
    } else {
        MPI_Status status;
        int source;
        for(source = 1; source < size; source++){
            MPI_Recv(name, 80, MPI_CHAR, source, tag, MPI_COMM_WORLD, &status);
            printf("msg from %d %d on %s\n", source, size, name);
        }
    }

    MPI_Finalize();
    return 0;
}