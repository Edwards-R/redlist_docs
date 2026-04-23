import os

# A collection of functions to help when writing to markdown

# OS-safe names. Removes : from Understandings
def nameify(input):
    out = input.replace(":", "")
    return out

def write_markdown_ant(cur):
    os.makedirs("out/ant")
    with open("out/ant/index.md", "w") as file:
        file.write(r"""---
parent: 1992-2021 GB Aculeate Hymenoptera Red List
title: Ant
---

# Ant taxa
""")

        query = r"""SELECT full_jeykll, n.binomial
    FROM markdown m
    JOIN major_grouping g ON m.nik = g.nik
    JOIN nomenclature n ON m.nik = n.nik
    WHERE g.grouping = 'ant'"""
    result = cur.execute(query)
    for i in result:
        filename = nameify(i[1])
        with open("out/ant/"+filename+".md", "w") as file:
            # Write the Jeykll header
            file.write(r"""---
parent: Ant
---

""")
            file.write(i[0]) # Write the markdown

def write_markdown_wasp(cur):
    os.makedirs("out/wasp")
    with open("out/wasp/index.md", "w") as file:
        file.write(r"""---
parent: 1992-2021 GB Aculeate Hymenoptera Red List
title: Wasp
---

# Wasp taxa
""")

    query = r"""SELECT full_jeykll, n.binomial
    FROM markdown m
    JOIN major_grouping g ON m.nik = g.nik
    JOIN nomenclature n ON m.nik = n.nik
    WHERE g.grouping = 'wasp'"""
    result = cur.execute(query)
    for i in result:
        filename = nameify(i[1])
        with open("out/wasp/"+filename+".md", "w") as file:
            # Write the Jeykll header
            file.write(r"""---
parent: Wasp
---

""")
            file.write(i[0]) # Write the markdown

def write_markdown_bee(cur):
    os.makedirs("out/bee")
    with open("out/bee/index.md", "w") as file:
        file.write(r"""---
parent: 1992-2021 GB Aculeate Hymenoptera Red List
title: Bee
---

# Bee taxa
""")

    query = r"""SELECT full_jeykll, n.binomial
    FROM markdown m
    JOIN major_grouping g ON m.nik = g.nik
    JOIN nomenclature n ON m.nik = n.nik
    WHERE g.grouping = 'bee'"""
    result = cur.execute(query)
    for i in result:
        filename = nameify(i[1])
        with open("out/bee/"+filename+".md", "w") as file:
            # Write the Jeykll header
            file.write(r"""---
parent: Bee
---

""")
            file.write(i[0]) # Write the markdown
