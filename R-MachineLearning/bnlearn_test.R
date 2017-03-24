#modity from bnlearn documentation
#YY, April 18, 2013 for I529

library(bnlearn)
data(learning.test)

## Simple learning
# first try the Grow-Shrink algorithm
bn.gs = gs(learning.test)
# plot the network structure.
dev.new()
plot(bn.gs, main="1: Grow-Shrink algorithm")

# now try the Incremental Association algorithm.
bn.iamb = iamb(learning.test)
# plot the new network structure.
dev.new()
plot(bn.iamb, main="2: Incremental Association algorithm")
# the network structures seem to be identical, don't they?
compare(bn.gs, bn.iamb)

## Greedy search
bn.hc = hc(learning.test)
dev.new()
plot(bn.hc, main="3: Greedy search")

## Blacklist and whitelist use
# the arc A - B should not be there?
blacklist = data.frame(from = c("A"), to = c("B"))
bn.black = gs(learning.test, blacklist = blacklist)
dev.new()
plot(bn.black, main="4: GS using blacklist")

# force E - F direction (E -> F).
whitelist = data.frame(from = c("E"), to = c("F"))
bn.white = gs(learning.test, whitelist = whitelist)
dev.new()
plot(bn.white, main="5: GS using whitelist")

# use both blacklist and whitelist.
bn.both = gs(learning.test, whitelist = whitelist, blacklist = blacklist)
dev.new()
plot(bn.both, main="6: GS using whitelist & blacklist")


# fitting a graph

data(asia)
bn.asia <- empty.graph(names(asia))
modelstring(bn.asia)="[A][S][T|A][L|S][B|S][D|B:E][E|T:L][X|E]"
plot(bn.asia)
fitted = bn.fit(bn.asia, asia, method="mle")
fitted
