#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>
#include <ctype.h>

#define LINE_SIZE 100

struct pizza {

	float prize;
	char name[LINE_SIZE];
};


void kk(char *str);
void write_match(struct pizza* item);
int read_pizza(struct pizza* item);
int search_string(const char* heap, const char* needle);
int h3ck3r_script(int num, char s);

void kk(char* str){

	str[strlen(str)-1]='\0';
}

void write_match(struct pizza* item){

	printf("%s\n%.2f\n",item->name,item->prize);
}



int search_string(const char* heap, const char* needle){
	//needle je keyword pattern M
	//heap je string text N

	int M = strlen(needle); 
	int N = strlen(heap); 

	char newHeap[LINE_SIZE];
	char newNeedle[LINE_SIZE];
	memset(newHeap,0,LINE_SIZE);
	memset(newNeedle,0,LINE_SIZE);


	strcpy(newHeap, heap);
	strcpy(newNeedle, needle);
	
	int i;
	for( i = 0; newHeap[i]; i++){
		newHeap[i] = tolower(newHeap[i]);
	}

	for( i = 0; newNeedle[i]; i++){
		newNeedle[i] = tolower(newNeedle[i]);
	}

	for ( i = 0; i <= N - M; i++) {
		int j; 
		int cislo;
		char znak;
		for (j = 0; j < M; j++) 
			if (newHeap[i + j] != newNeedle[j]){
				if(!isdigit(newHeap[i + j]) && !isdigit(newNeedle[j]))
					break;
				else if(isdigit(newHeap[i + j]) || isdigit(newNeedle[j])){ 
					if(isdigit(newHeap[i + j])){
						cislo = newHeap[i + j] - '0'; 
						znak = newNeedle[j];
					}
					else{
						cislo = newNeedle[j] - '0';
						znak = newHeap[i + j];
					}
					if(h3ck3r_script(cislo, znak)==0)
						break; 
				}
			}
		if (j == M)
			return i;
	} 

	return -1;
}



int read_pizza(struct pizza* item){


	char* f; //to f je ako falat riadka
	char line[LINE_SIZE];
	memset(line,0,LINE_SIZE);
	f = fgets(line,LINE_SIZE,stdin);
	if(f == NULL || line[1] == 0){
		return 0; //nepodarilo sa 
	}
	kk(f);
	strcpy(item->name, f);

	f = fgets(line,LINE_SIZE,stdin);//dalsi riadok s cislom
	float value = strtof(f, NULL);
	if (value == 0.0F){
		return 0;
	}
	item->prize = value;



	return 1;
}
int h3ck3r_script(int num, char s){

	char let[]="oizeasbtbq";
	char help = let[num];

	if(s == help){
		return 1;
	}
	else{
		return 0;
	}
}
	



int main(){

	printf("Zadaj hladanu surovinu:\n");
	char key[LINE_SIZE];
	memset(key, 0, LINE_SIZE);
	fgets(key,LINE_SIZE,stdin);
	kk(key);

	printf("Zadaj jedalny listok:\n");

	struct pizza item; 

	int counter = 0;
	while(read_pizza(&item)){
		counter += 1;
		if(search_string(item.name, key) != -1){
			write_match(&item);
		
		}
	}
	printf("Nacitanych %d poloziek.\n", counter);

	return 0;
}



