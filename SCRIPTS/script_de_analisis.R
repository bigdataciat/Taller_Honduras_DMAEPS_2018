# file data-analysis-AEPS-BigData.R
# 
# This file contains a script to develop regressions with machine learning methodologies
#
#
# author: Hugo Andres Dorado 02-16-2015
#  
#This script is free: you can redistribute it and/or modify
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 

#-----------------------------------------------------------------------------------------------------------------


#SCRIPT BUILED FOR R VERSION 3.0.2 
#PACKAGES
rm(list=ls())
require(gtools)
require(gridBase)
require(gridExtra)
require(relaimpo)
require(caret)
require(party)
require(randomForest)
require(snowfall)
require(earth)
require(agricolae)
require(cowplot)
require(reshape)
require(stringr)
require(gbm)
require(plyr)
library(rpart)
library(rpart.plot)

#Load functions; Open  All-Functions-AEPS_BD.RData

load("C:/Users/hadorado/Desktop/TALLER_EN_R_JULIO_2018/All-Functions-AEPS_BD.RData")

#Work Directory

dirFol <- "C:/Users/hadorado/Desktop/TALLER_EN_R_JULIO_2018/"

setwd(dirFol)

#DataBase structure

datNam <- "mora_toyset_2.csv"

dataSet   <- read.csv(datNam,row.names=1)

namsDataSet <- names(dataSet)


inputs  <- 1:22  #inputs columns
segme   <- 23   #split column
output  <- 24   #output column


#Creating the split factors

#contVariety <- table(dataSet[,segme])
#variety0    <- names(sort(contVariety[contVariety>=30]))

#if(length(variety0)==0){variety = variety0 }else{variety = factor(c(variety0,"All"))}

variety <- 'Todos'

#creating folders



createFolders(dirFol,variety)

#Descriptive Analysis

descriptiveGraphics(variety,dataSet,inputs = inputs,segme = segme,output = output,
                    smooth=T,ylabel = "Rendimiento (kg/ha)",smoothInd = NULL,
                    ghrp="box",res=80)

#DataSets ProcesosF

dataSetProces(variety,dataSet,segme,corRed="caret")

#RANDOM FOREST

randomForestFun("Todos",nb.it=10,ncores = 2,saveWS=F,barplot = T)

# CLASIFCATION AND REGRESSION TREES

mora.arbol <- rpart(Yield~.,data=dataSet[,-23])

rpart.plot(mora.arbol,type = 2,main="Teff")

