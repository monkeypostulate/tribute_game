
<a href="introduction"> Introduction </a>

<a href="application"> Dynamics </a>

<a href="application"> Application </a>


<h2 id="introduction"> Tribute Game </h2>
In this project, we create a shiny app to simulate the tribute game proposed by Robert Axelrod [1].

One of the goals in the Tribute game is to answer the question:
<h4>How can new political actors emerge from an aggregation of smaller political actors? </h4>
Actors compete for resources using heursitic rules and the result is the formation of new global actors.

<h2 id="dynamics"> Dynamics of the game  </h2>
Initial conditions:
<ul>
<li>N actors are organised in a ring. </li>
<li>An  actor i has an initial wealth of Wi with Wi a random number between 300 and 500. </li>
</ul>
<ol>
<li> Each Period, three actors A1,A2, A3 are chosen at random. </li>
<li> Actor Ai choose an neighbour actor Bi and demands a tribute of 250. </li>
<li> Actor Bi choose to pay or go to war, dependening on which will cause less loss of wealth. </li>
</ol>

<p> If  actor Bi pays the tribute, then the commitments between actor Ai and Bi increase by 10% (the maximum value is 100%).</p>
<p> If they fight, their commitment decrease by 10% (minimum value 0%). </p>

<p> An actor C  supports actor Ai if the commitment between them is larger than the commitment between C and Bi; 
and there is a sequence of actors supporting Ai from C to Ai. </p>
<p> In the same way, the target actor may receive the support from other actors. </p>

![Screenshot](Period2997.png)
<p> For instance, actor 16 demands a tribute from actor 17; and actor 7 supports actor 16,
because actors 9-15 support actor 16 and its commitment to actor 17 is stronger than to actor 16. </p>


<p> If actor Bi decides to go to war, then actors supporting Ai lose 25% of the  total wealth of the actors supporting Bi times the commitment to actor Ai. </p>
<p> In the same manner, actors supporting actor Bi lose wealth if actor Bi decides to go to war.
<p> If there is a war, the commitment between actors fighting in the same side is increase by $10%, 
and between actors in opposite side is decreased by  10%.</p>




<h2>Questions:</h2>
<ol>
<li> How does the cost of war affects the formation of alliances? </li>
</li> Do alliances last for long period of time? </li>
<li> How is the distribution of wealth after 100 periods, 1000 periods?   </li>
<li> How does war affects the wealth of the richest actor? </li>

</ol>

<h2 id="#application"> Download simulations and do your own data analysis</h2>
<p> We add the feature to download the simulated data to perform your own data analysis. </p>
For instance, you can check how war affects the wealth of the actors.

![Screenshot](actor1_war.png)

![Screenshot](actor4_war.png)
<h3> Why does the wealth of actor 4 decreases in period 83?</h3>
<ol>
<li> The richest actor 4 targets one of the poorest actors, actor 1. </li>
<li> For actor 1 it is more expensive to go to war, it has nothing to lose, than paying the tribute. </li>
<li> However, the rich actor 10 is commited to defend actor 1 </li>
<li> The war between actors 2-6 against actors 1 and 10 is an expensive war </li>
<li> After the war, actor 9 becomes the richest actor </li>
</ol>

<h3> Who targets the richest actor?  </h3>

<ol>
<li>The richest  actor 4 is never a target  </li>
<li> The poorest actor 1 is constantly being target </li>
</ol>


