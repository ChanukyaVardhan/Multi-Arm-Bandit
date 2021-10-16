#include <iostream>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <math.h>
#include <vector>
#include <random>
#include <string>

#include "gsl/gsl_rng.h"
#include "gsl/gsl_randist.h"

#define MAXHOSTNAME 256

using namespace std;

// int *num_pulls;
// double *rewards;
vector<double> num_pulls;
vector<double> rewards;
vector<double> variances;
vector<double> success;
vector<double> failures;
const gsl_rng_type * T;
gsl_rng* var;
vector<int> equal_probs_index;
double beta_value;
int p_tuned;

void options(){

  cout << "Usage:\n";
  cout << "bandit-agent\n"; 
  cout << "\t[--numArms numArms]\n";
  cout << "\t[--randomSeed randomSeed]\n";
  cout << "\t[--horizon horizon]\n";
  cout << "\t[--hostname hostname]\n";
  cout << "\t[--port port]\n";
  cout << "\t[--algorithm algorithm]\n";
  cout << "\t[--epsilon epsilon]\n";
  cout << "\t[--beta beta_value]\n";
  cout << "\t[--p p_tuned]\n";
}


/*
  Read command line arguments, and set the ones that are passed (the others remain default.)
*/
bool setRunParameters(int argc, char *argv[], int &numArms, int &randomSeed, unsigned long int &horizon, string &hostname, int &port, string &algorithm, double &epsilon, double &beta_value, int &p_tuned){

  int ctr = 1;
  while(ctr < argc){

    //cout << string(argv[ctr]) << "\n";

    if(string(argv[ctr]) == "--help"){
      return false;//This should print options and exit.
    }
    else if(string(argv[ctr]) == "--numArms"){
      if(ctr == (argc - 1)){
  return false;
      }
      numArms = atoi(string(argv[ctr + 1]).c_str());
      ctr++;
    }
    else if(string(argv[ctr]) == "--randomSeed"){
      if(ctr == (argc - 1)){
  return false;
      }
      randomSeed = atoi(string(argv[ctr + 1]).c_str());
      ctr++;
    }
    else if(string(argv[ctr]) == "--horizon"){
      if(ctr == (argc - 1)){
  return false;
      }
      horizon = atoi(string(argv[ctr + 1]).c_str());
      ctr++;
    }
    else if(string(argv[ctr]) == "--hostname"){
      if(ctr == (argc - 1)){
  return false;
      }
      hostname = string(argv[ctr + 1]);
      ctr++;
    }
    else if(string(argv[ctr]) == "--port"){
      if(ctr == (argc - 1)){
  return false;
      }
      port = atoi(string(argv[ctr + 1]).c_str());
      ctr++;
    }
    else if(string(argv[ctr]) == "--algorithm"){
      if(ctr == (argc - 1)){
  return false;
      }
      algorithm = string(argv[ctr + 1]);
      ctr++;
    }
     else if(string(argv[ctr]) == "--epsilon"){
      if(ctr == (argc - 1)){
  return false;
      }
      epsilon = atof(string(argv[ctr + 1]).c_str());
      ctr++;
    }
    else if(string(argv[ctr]) == "--beta"){
      if(ctr == (argc - 1)){
  return false;
      }
      beta_value = atof(string(argv[ctr + 1]).c_str());
      ctr++;
    }
    else if(string(argv[ctr]) == "--p"){
      if(ctr == (argc - 1)){
  return false;
      }
      p_tuned = atof(string(argv[ctr + 1]).c_str());
      ctr++;
    }
    else{
      return false;
    }

    ctr++;
  }

  return true;
}

/* ============================================================================= */
/* Write your algorithms here */
int sampleArm(string algorithm, double epsilon, int pulls, double reward, int numArms){ // pulls will be the number that is pulled till now
  int size_vec = equal_probs_index.size();
  for(int j=0; j<size_vec; j++)
  {
    equal_probs_index.pop_back();
  }
  if(algorithm.compare("rr") == 0){
    return(pulls % numArms);
  }
  else if(algorithm.compare("epsilon-greedy") == 0){
        vector<double> expectations = vector<double>(numArms, 0.0);
        int size_vec = equal_probs_index.size();
        for(int j=0; j<size_vec; j++)
        {
          equal_probs_index.pop_back();
        }

        double random_number = gsl_rng_uniform(var); // random number between 0 and 1
        double random_index;

        if(epsilon > random_number)
        {
            // return uniformly_pick_from_0-numArms;
            random_index = gsl_rng_uniform(var);
            random_index = int(floor(random_index * numArms));
            return random_index;
        }
        else
        {
            double max_exp = 0.0;
            // int max_index = 0;
            for(int i=0; i<numArms; i++)
            {
                if(num_pulls[i] == 0)
                {
                  expectations[i] = 0.0;
                }
                else
                {
                  expectations[i] = rewards[i] / num_pulls[i];
                }
                if(max_exp < expectations[i])
                {
                    max_exp = expectations[i];
                    // max_index = i;
                    size_vec = equal_probs_index.size();
                    for(int j=0; j<size_vec; j++)
                    {
                      equal_probs_index.pop_back();
                    }
                    equal_probs_index.push_back(i);
                }
                else if(max_exp == expectations[i])
                {
                  equal_probs_index.push_back(i);
                }
            }

            // return by picking uniformly from the max prob arms
            random_index = gsl_rng_uniform(var);
            random_index = int(floor(random_index * equal_probs_index.size()));
            return equal_probs_index[random_index];
        }
  }
  else if(algorithm.compare("UCB") == 0){
        vector<double> ucb = vector<double>(numArms, 0.0);
        double max_ucb = 0.0;
        // int max_index = 0;
        for(int i=0; i<numArms; i++)
        {
            if(num_pulls[i] == 0)
            {
                return i;
            }
        }

        for(int i=0; i<numArms; i++)
        {
            ucb[i] = (rewards[i] / num_pulls[i]) + sqrt((2.0 / num_pulls[i]) * log(pulls));
            if(max_ucb < ucb[i])
            {
                max_ucb = ucb[i];
                // max_index = i;
                size_vec = equal_probs_index.size();
                for(int j=0; j<size_vec; j++)
                {
                  equal_probs_index.pop_back();
                }
                equal_probs_index.push_back(i);
            }
            else if(max_ucb == ucb[i])
            {
              equal_probs_index.push_back(i);
            }
        }
        // return max_index;

        // return by picking uniformly from the max prob arms
        double random_index = gsl_rng_uniform(var);
        random_index = int(floor(random_index * equal_probs_index.size()));
        return equal_probs_index[random_index];
  }
  else if(algorithm.compare("BETA-UCB") == 0){ // reward is being updated after sample arm only
    vector<double> beta_ucb = vector<double>(numArms, 1.0);

    for(int i=0; i<numArms; i++)
    {
      if(num_pulls[i] == 0)
      {
        return i;
      }
    }

    double max_beta_ucb = 0.0;
    for(int i=0; i<numArms; i++)
    {
      double sub_confidence_inverse = (4*numArms*num_pulls[i]*(num_pulls[i]+1))/(beta_value);
      beta_ucb[i] = (rewards[i] / num_pulls[i]) + sqrt((2.0*variances[i]*log(sub_confidence_inverse)) / num_pulls[i]) + ((16.0*log(sub_confidence_inverse))/(3.0*num_pulls[i]));
      beta_ucb[i] = max(1.0, beta_ucb[i]);

      if(max_beta_ucb < beta_ucb[i])
      {
          max_beta_ucb = beta_ucb[i];
          size_vec = equal_probs_index.size();
          for(int j=0; j<size_vec; j++)
          {
            equal_probs_index.pop_back();
          }
          equal_probs_index.push_back(i);
      }
      else if(max_beta_ucb == beta_ucb[i])
      {
        equal_probs_index.push_back(i);
      }
    }

    // return by picking uniformly from the max prob arms
    double random_index = gsl_rng_uniform(var);
    random_index = int(floor(random_index * equal_probs_index.size()));
    return equal_probs_index[random_index];
  }
  else if(algorithm.compare("ADAPTIVE-BETA-UCB") == 0){ // reward is being updated after sample arm only
    vector<double> beta_ucb = vector<double>(numArms, 1.0);

    for(int i=0; i<numArms; i++)
    {
      if(num_pulls[i] == 0)
      {
        return i;
      }
    }

    double max_beta_ucb = 0.0;
    for(int i=0; i<numArms; i++)
    {
      double adaptive_beta = 1.0 / pulls;
      double sub_confidence_inverse = (4*numArms*num_pulls[i]*(num_pulls[i]+1))/(adaptive_beta);
      beta_ucb[i] = (rewards[i] / num_pulls[i]) + sqrt((2.0*variances[i]*log(sub_confidence_inverse)) / num_pulls[i]) + ((16.0*log(sub_confidence_inverse))/(3.0*num_pulls[i]));
      beta_ucb[i] = max(1.0, beta_ucb[i]);

      if(max_beta_ucb < beta_ucb[i])
      {
          max_beta_ucb = beta_ucb[i];
          size_vec = equal_probs_index.size();
          for(int j=0; j<size_vec; j++)
          {
            equal_probs_index.pop_back();
          }
          equal_probs_index.push_back(i);
      }
      else if(max_beta_ucb == beta_ucb[i])
      {
        equal_probs_index.push_back(i);
      }
    }

    // return by picking uniformly from the max prob arms
    double random_index = gsl_rng_uniform(var);
    random_index = int(floor(random_index * equal_probs_index.size()));
    return equal_probs_index[random_index];
  }
  else if(algorithm.compare("UCB-TUNED") == 0){ // reward is being updated after sample arm only
    vector<double> beta_ucb = vector<double>(numArms, 1.0);

    for(int i=0; i<numArms; i++)
    {
      if(num_pulls[i] == 0)
      {
        return i;
      }
    }

    double max_beta_ucb = 0.0;
    for(int i=0; i<numArms; i++)
    {
      beta_ucb[i] = (rewards[i] / num_pulls[i]) + sqrt((2.0*variances[i]*log(4*(pow(pulls, p_tuned)))) / num_pulls[i]) + ((16.0*log(4*(pow(pulls, p_tuned))))/(3.0*num_pulls[i]));
      beta_ucb[i] = max(1.0, beta_ucb[i]);

      if(max_beta_ucb < beta_ucb[i])
      {
          max_beta_ucb = beta_ucb[i];
          size_vec = equal_probs_index.size();
          for(int j=0; j<size_vec; j++)
          {
            equal_probs_index.pop_back();
          }
          equal_probs_index.push_back(i);
      }
      else if(max_beta_ucb == beta_ucb[i])
      {
        equal_probs_index.push_back(i);
      }
    }

    // return by picking uniformly from the max prob arms
    double random_index = gsl_rng_uniform(var);
    random_index = int(floor(random_index * equal_probs_index.size()));
    return equal_probs_index[random_index];
  }
  else if(algorithm.compare("KL-UCB") == 0){
        vector<double> klucb = vector<double>(numArms, 0.0);
        double max_klucb = 0.0;
        // int max_index = 0;
        for(int i=0; i<numArms; i++)
        {
            if(num_pulls[i] == 0)
            {
                return i;
            }
        }

        for(int i=0; i<numArms; i++)
        {
            // getting the klucb term here
            // usign newton raphson
            double logterm = log(pulls) + 3*log(log(pulls));
            double p = (rewards[i] / num_pulls[i]);
            double interval_tolerable = 1e-8;
            // double interval_tolerable = 1e-4;
            p = max(p, interval_tolerable); // to avoid 0
            // double q = 1 - interval_tolerable;
            double q = p + interval_tolerable;
            if(p == 1)
            {
                klucb[i] = 1.0;
            }
            else
            {
                bool converged = 0;
                for(int j=0; !converged; j++)
                {
                    double f_q = (p*log(p/q) + (1-p)*log((1-p)/(1.0-q))) - (logterm / num_pulls[i]);
                    double f_dash_q = (q-p)/(q*(1.0-q));
                    if(abs(f_q) < 1e-6)
                    // if(abs(f_q) < 1e-3)
                    {
                        converged = 1;
                        break;
                    }
                    // q = min(1-interval_tolerable, q - f_q/f_dash_q);
                    q = min(1-interval_tolerable, max(q - f_q/f_dash_q, p + interval_tolerable)); // q should not be less than p
                }
                klucb[i] = q;
            }

            if(max_klucb < klucb[i])
            {
                max_klucb = klucb[i];
                // max_index = i;
                size_vec = equal_probs_index.size();
                for(int j=0; j<size_vec; j++)
                {
                  equal_probs_index.pop_back();
                }
                equal_probs_index.push_back(i);
            }
            else if(max_klucb == klucb[i])
            {
              equal_probs_index.push_back(i);
            }
        }
        // return max_index;

        // return by picking uniformly from the max prob arms
        double random_index = gsl_rng_uniform(var);
        random_index = int(floor(random_index * equal_probs_index.size()));
        return equal_probs_index[random_index];
  }
  else if(algorithm.compare("Thompson-Sampling") == 0){
        vector<double> ts = vector<double>(numArms, 0.0);
        double max_ts = 0.0;
        // int max_index = 0;
        for(int i=0; i<numArms; i++)
        {
            ts[i] = gsl_ran_beta(var, success[i], failures[i]);
            if(max_ts < ts[i])
            {
                max_ts = ts[i];
                // max_index = i;
                size_vec = equal_probs_index.size();
                for(int j=0; j<size_vec; j++)
                {
                  equal_probs_index.pop_back();
                }
                equal_probs_index.push_back(i);
            }
            else if(max_ts == ts[i])
            {
              equal_probs_index.push_back(i);
            }
        }
        // return max_index;

        // return by picking uniformly from the max prob arms
        double random_index = gsl_rng_uniform(var);
        random_index = int(floor(random_index * equal_probs_index.size()));
        return equal_probs_index[random_index];
  }
  else{
    return -1;
  }
}

/* ============================================================================= */


int main(int argc, char *argv[]){
  // Run Parameter defaults.
  // int numArms = 5;
  // int randomSeed = time(0);
  // unsigned long int horizon = 200;
  // string hostname = "localhost";
  // int port = 5000;
  // string algorithm="random";
  // double epsilon=0.0;

    int numArms;
    int randomSeed;
    unsigned long int horizon;
    string hostname;
    int port;
    string algorithm;
    double epsilon;

  //Set from command line, if any.
  if(!(setRunParameters(argc, argv, numArms, randomSeed, horizon, hostname, port, algorithm, epsilon, beta_value, p_tuned))){
    //Error parsing command line.
    options();
    return 1;
  }

    // num_pulls = new int[numArms];
    // rewards = new double[numArms];
    num_pulls = vector<double>(numArms, 0.0);
    rewards = vector<double>(numArms, 0.0);
    variances = vector<double>(numArms, 0.0);
    success = vector<double>(numArms, 1.0); // already adding the +1 term in the beta distribution here
    failures = vector<double>(numArms, 1.0);

    gsl_rng_env_setup();
    T = gsl_rng_default;
    var = gsl_rng_alloc(T);
    gsl_rng_set(var, randomSeed);

  struct sockaddr_in remoteSocketInfo;
  struct hostent *hPtr;
  int socketHandle;

  bzero(&remoteSocketInfo, sizeof(sockaddr_in));
  
  if((hPtr = gethostbyname((char*)(hostname.c_str()))) == NULL){
    cerr << "System DNS name resolution not configured properly." << "\n";
    cerr << "Error number: " << ECONNREFUSED << "\n";
    exit(EXIT_FAILURE);
  }

  if((socketHandle = socket(AF_INET, SOCK_STREAM, 0)) < 0){
    close(socketHandle);
    exit(EXIT_FAILURE);
  }

  memcpy((char *)&remoteSocketInfo.sin_addr, hPtr->h_addr, hPtr->h_length);
  remoteSocketInfo.sin_family = AF_INET;
  remoteSocketInfo.sin_port = htons((u_short)port);

  if(connect(socketHandle, (struct sockaddr *)&remoteSocketInfo, sizeof(sockaddr_in)) < 0){
    //code added
    cout<<"connection problem"<<".\n";
    close(socketHandle);
    exit(EXIT_FAILURE);
  }


  char sendBuf[256];
  char recvBuf[256];

  double reward = 0;
  unsigned long int pulls=0;
  int armToPull = sampleArm(algorithm, epsilon, pulls, reward, numArms);
  
  sprintf(sendBuf, "%d", armToPull);

  cout << "Sending action " << armToPull << ".\n";
  while(send(socketHandle, sendBuf, strlen(sendBuf)+1, MSG_NOSIGNAL) >= 0){

    char temp;
    recv(socketHandle, recvBuf, 256, 0);
    // sscanf(recvBuf, "%f %c %lu", &reward, &temp, &pulls); // For float reward
    sscanf(recvBuf, "%lf %c %lu", &reward, &temp, &pulls);
    cout << "Received reward " << reward << ".\n";
    cout<<"Num of  pulls "<<pulls<<".\n";
    cout<<endl;

    double old_mean = rewards[armToPull];
    double old_n = num_pulls[armToPull];
    num_pulls[armToPull] += 1;
    rewards[armToPull] += reward;
    if(reward)
    {
        success[armToPull] += 1;
    }
    else
    {
        failures[armToPull] += 1;
    }
    variances[armToPull] = (old_n/(old_n + 1))*(variances[armToPull] + ((old_mean - reward)*(old_mean - reward)/(old_n + 1)));

    armToPull = sampleArm(algorithm, epsilon, pulls, reward, numArms);

    sprintf(sendBuf, "%d", armToPull);
    cout << "Sending action " << armToPull << ".\n";
  }
  
  close(socketHandle);

  cout << "Terminating.\n";
    gsl_rng_free(var);
  return 0;
}
          
