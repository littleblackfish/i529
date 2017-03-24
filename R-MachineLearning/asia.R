data(asia)
bn.asia <- empty.graph(names(asia))
modelstring(bn.asia)="[A][S][T|A][L|S][B|S][D|B:E][E|T:L][X|E]"
plot(bn.asia)
fitted = bn.fit(bn.asia, asia, method="mle")
fitted
