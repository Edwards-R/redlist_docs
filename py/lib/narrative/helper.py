from lib.narrative.RedListStatus import RedListStatus

## Get list of names
def GetList(status, con):
    if not isinstance(status, RedListStatus):
        raise TypeError("Argument must be instance of RedListStatus enum")
    
    query = "SELECT nik FROM wider_review WHERE status = ?"
    cur = con.cursor()

    cur.execute(query, [status.name])
    return cur.fetchall()