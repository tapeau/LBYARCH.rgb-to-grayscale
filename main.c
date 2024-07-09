/* 
A simple C and x86 NASM program developed for DLSU LBYARCH course (T3 2023-2024)
By John Lorenzo Tapia

GitHub Repository:
https://github.com/tapeau/LBYARCH.rgb-to-grayscale
*/
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

const int m = 3; // Width
const int n = 3; // Height

// Assembly function prototype
extern void cvtRGBToGray(uint8_t img2[][n], uint8_t img1[][n][3], int m, int n);

int main() {
    // Input colored image (3D array)
    uint8_t img1[3][3][3] = {
        {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}},
        {{1, 2, 6}, {2, 6, 7}, {9, 4, 8}},
        {{1, 5, 7}, {1, 3, 3}, {3, 4, 6}}
    };

    // Print colored image (img1)
    printf("Colored image:\n");
    for (int i = 0; i < 3; ++i) {
        printf("\t[");
        for (int j = 0; j < 3; ++j) {
            printf("[%d, %d, %d]", img1[i][j][0], img1[i][j][1], img1[i][j][2]);
            if (j < 2) {
                printf(", ");
            }
        }
        printf("]\n");
    }
    
    // Output grayscale image (2D array)
    uint8_t img2[3][3];
    
    // Call assembly function
    cvtRGBToGray(img2, img1, m, n);
    
    // Print grayscale image (img2)
    printf("Grayscale image:\n");
    for (int i = 0; i < m; ++i) {
        printf("\t[%d, %d, %d]", img2[i][0], img2[i][1], img2[i][2]);
        printf("\n");
    }
    
    return 0;
}
