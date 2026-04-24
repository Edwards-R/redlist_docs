# Handling of stating criterion B and D
# Both use the same 'location' definition, so these are grouped

## Get stats for B (and D support)
def GetBDStats(nik, con):
    query = "SELECT c_eoo, aoo, b_locations, b2_support as b_support, b1_used, b2_used, d2_used FROM bd_summary WHERE nik = ?"
    cur = con.cursor()
    cur.execute(query, [nik])
    return cur.fetchone()

# Work out the correct threshold
def B1Threshold(data):
    if (data > 20000):
        return 'exceeds the 20,000 km^2 VU threshold for criterion B1'
    elif (data > 5000):
        return 'is below the 20,000 km^2 VU threshold for criterion B1'
    elif (data > 100):
        return 'is below the 5,000 km^2 EN threshold for criterion B1'
    elif (data > 0):
        return 'is below the 100 km^2 EN threshold for criterion B1'
    
# Handy swap for but vs and
def B1ButAnd(data):
    if (data > 20000):
        return 'and'
    else:
        return 'but'

# Write out B1's text    
def WriteB1(data):
    # If 'accepted' is not yes, void and exit
    if (data[4]!='Yes'):
        return 'The EoO was not accepted'
    fmt = f'The EoO ({data[0]:,} km^2) {B1Threshold(data[0])} {B1ButAnd(data[0])} does not satisfy sufficient subcriteria to reach a threat status'
    return fmt

# Work out the correct threshold
def B2Threshold(data):
    if (data > 2000):
        return 'exceeds the 2,000 km^2 VU threshold for criterion B2'
    elif (data > 500):
        return 'is below the 2,000 km^2 VU threshold for criterion B2'
    elif (data > 10):
        return 'is below the 500 km^2 EN threshold for criterion B2'
    elif (data > 0):
        return 'is below the 10 km^2 EN threshold for criterion B2'

# Handy swap for but vs and
def B2ButAnd(data):
    if (data > 2000):
        return 'and'
    else:
        return 'but'

# Write out B2's text
def WriteB2(data):
    # If 'accepted' is not yes, void and exit
    if (data[5]!='Yes'):
        return 'the AoO was not accepted'
    fmt = f'and the AoO ({data[1]:,} km^2) {B2Threshold(data[1])} {B2ButAnd(data[1])} does not satisfy sufficient subcriteria to reach a threat status'
    return fmt


## Write D2, start again here
def WriteD2(data):
    if (data[6]=='Yes'):
        # Are there >5 locations?
        output = 'For Criterion D2, the number of locations'
        if data[2] in ('>10','>10/NaN','<=10'):
            # Yes
            output = output + f' was greater than 5 and there is no plausible threat that could drive the taxon to CR or RE in a very short time'
        else:
            # No
            output = output + f' was less than or equal to 5 and there is no plausible threat that could drive the taxon to CR or RE in a very short time'
        return output
    else:
        return 'Criterion D2 was not assessable for this taxon'

## Wrap it all together
def ProcessBD(nik, con):
    bd_data = GetBDStats(nik, con)
    return f'{WriteB1(bd_data)}, {WriteB2(bd_data)}. {WriteD2(bd_data)}.'