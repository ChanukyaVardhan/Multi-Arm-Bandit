#ifndef BANDIT_H
#define BANDIT_H

#include <iostream>
#include <vector>
#include <string.h>

#include "gsl/gsl_rng.h"
#include "gsl/gsl_randist.h"

using namespace std;

class Bandit{

 private:

  int numArms;
  vector<double> armMeans;
  vector<gsl_rng*> ran;

  double maxMean;

  double cumulativeReward;
  unsigned long int numTotalPulls;

  string banditDist;

  vector<double> a_beta, b_beta; // For beta distribution


 public:

  // Bandit(const int &numArms, const vector<double> &means, const int &seed);
  Bandit(const int &numArms, const vector<double> &means, const int &seed, const string &banditDist);
  Bandit(const int &numArms, const vector<double> &a_in, const vector<double> &b_in, const int &seed, const string &banditDist); // For beta
  ~Bandit();

  int getNumArms();
  unsigned long int getNumTotalPulls();

  double pull(const int &armIndex);

  double getCumulativeReward();
  double getRegret();

  double getMaxMean();

  void display();
};

#endif

