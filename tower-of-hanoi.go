package main

import (
	"fmt"
)

func main() {
	var numDisks int
	fmt.Print("Enter the number of disks: ")
	fmt.Scanln(&numDisks)

	moves := towerOfHanoi(numDisks, "A", "B", "C")

	fmt.Println("Moves:", moves)
}

func towerOfHanoi(numDisks int, from string, to string, aux string) int {
	if numDisks == 1 {
		fmt.Println("Move disk 1 from", from, "to", to)
		return 1
	}

	moves := towerOfHanoi(numDisks-1, from, aux, to)
	fmt.Println("Move disk", numDisks, "from", from, "to", to)
	moves++
	moves += towerOfHanoi(numDisks-1, aux, to, from)

	return moves
}
