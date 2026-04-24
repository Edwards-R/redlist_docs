# Friendly version of sql model-assessments
def FriendlyMA(model_assessment):
    match model_assessment:
        case 'A2_dEoO':
            return 'discrete Extent of Occurrence'
        case 'a2_count':
            return 'absolute record count'
        case 'a2_AoO':
            return 'tetrad area'
        case 'A2_Bayesian':
            return 'Bayesian upper 95% CI'
        case _:
            raise ValueError("Invalid value supplied")

# Get statistical A outputs
def GetAStats(nik, con):
    query = "SELECT nik, model_assessment, value FROM a2_stat_picked WHERE nik = ?"
    cur = con.cursor()
    cur.execute(query, [nik])
    return cur.fetchone()

def WriteAStats(data):
    if data != None:
        return(f'The most threatening accepted population change estimate is {data[2]}% ({FriendlyMA(data[1])}), which does not exceed the 30% decline required for qualification as VU under Criterion A')
    else:
        return('No statistical metrics for A were accepted')

# Get expert inference A outputs
def GetAInf(nik, con):
    # Get the stats
    query = "SELECT a.expert_a2, a.expert_a3, aa.expert_a2 a2_accept, aa.expert_a3 a3_accept FROM assessment a JOIN assessment_acceptance aa ON a.nik = aa.nik WHERE a.nik = ? AND (aa.expert_a2 = 'Yes' OR aa.expert_a3 = 'Yes')"
    cur = con.cursor()
    cur.execute(query, [nik])
    return cur.fetchone()

def ProcessA(nik, con):
    ### Look for a statistical A2 that is accepted
    a_stat = GetAStats(nik, con)
    ### If the result isn't empty, format and return it
    if (a_stat != None):
        return WriteAStats(a_stat)

    ### If no, look for an inference A that is accepted
    a_inf = GetAInf(nik, con)
    ### If one was found, identify and return it
    if (a_inf != None):
        ## Look and see which one it is
        if (a_inf[2] == 'Yes'):
            return f'The most threatening accepted population change was inferred at > -30% using expert inference (A2). This does not exceed the 30% decline required for qualification as VU'
        else:
            return f'The most threatening accepted population change was inferred at > -30% using expert inference (A3 - future threat scenario). This does not exceed the 30% decline required for qualification as VU'

    ### If no, return A rejection
    else:
        return f'No assessments using criterion A were possible.'