.PHONY: clean data test resultat

TARGET = tp2
OBJECTS = tp2.o
CODE = code.txt
CC = gcc
CFLAGS = -Wall -pedantic -std=c99
SOURCE = https://www.github.com/guyfrancoeur/INF3135_H2019/raw/master/tp1/data.zip
FILE := cp.txt
CP := $(shell cat ${FILE})

default: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $(TARGET) -lm

$(OBJECTS): $(TARGET).c
	$(CC) $(CFLAGS) -c $(TARGET).c -o $(TARGET).o

clean:
	rm -rf $(OBJECTS) $(TARGET) $(CODE)

data:
	mkdir data
	wget $(SOURCE)
	unzip data.zip  -d ./data

test:
	./$(TARGET) -c $(CP) -i ./data/data.txt

resultat: 
	git add resultat.txt
	git commit -m "Poussez le resultat dans le projet"
	git push origin master 
