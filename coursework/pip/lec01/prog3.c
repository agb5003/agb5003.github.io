#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

int main() {
	int ans;
	time_t t1;

	printf("Select which random program you would like to run:\n1. Dice roll\n2. Coin flip\n3. Random number generator\n");
	scanf("%d", &ans);

	srand( (unsigned) time (&t1)); // Initialize rand() with seed obtained from time
	/* NOTE: This means that the random numbers generated aren't actually random. While it is debatable if true random exists,
	the numbers generated with this method is quite far from non-deterministic. */

	if (ans == 1) {
		printf("Rolling a dice...\n");
		int dice_result = rand() % 6 + 1;
		printf("The dice shows a %d!", dice_result);
	}

	else if (ans == 2) {
		printf("Flipping a coin...\n");
		int coin_result = rand() % 2 + 1;
		if (coin_result == 1) {
			printf("It's heads!\n");
		}
		else if (coin_result == 2) {
			printf("It's tails!\n");
		}
	}

	else if (ans == 3) {
		int start_number, end_number, to_generate;

		printf("Enter the smallest and largest possible number to be generated, separated with a space:\n");
		scanf("%d %d", &start_number, &end_number);
		printf("Now enter how many numbers you want to generate.\n");
		scanf("%d", &to_generate);

		printf("Result:\n");
		for (int i = 0; i < to_generate; i++) {
			printf("%d\n", rand() % (end_number - start_number + 1) + start_number);
		}
	}
}