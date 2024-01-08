import graphviz # https://graphviz.readthedocs.io/en/stable/index.html

def reflex(relat, elements):
    return all((e, e) in relat for e in elements)

def sym(relat):
    return all((b, a) in relat for a, b in relat)

def trans(relat):
    return all((a, c) in relat for a, b in relat for c, d in relat if b == c)

def analyze(val):
    
    relat = set(eval(val))
    elements = set(x for a, b in relat for x in (a, b))

    Reflexive = reflex(relat, elements)
    Symmetric = sym(relat)
    Transitive = trans(relat)

    return Reflexive, Symmetric, Transitive

def plot(relat):
    g = graphviz.Digraph('Figure', filename='Plot')
    g.attr(rankdir='LR')
    g.attr('node', shape='circle')

    for a, b in relat:
        g.edge(str(a), str(b))
    g.view()

def main():
    print("Hello World analyzing input!")
    val = input("Enter your set: ")
    print(val)
    relat = set(eval(val))
    Reflexive, Symmetric, Transitive = analyze(val)
    print(f"\
    1. Reflexive: {Reflexive} \
    2. Symmetric: {Symmetric} \
    3. Transitive: {Transitive}")
    plot(relat)

if __name__ == "__main__":
    main()

