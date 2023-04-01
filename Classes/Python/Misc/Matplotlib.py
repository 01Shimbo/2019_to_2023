from matplotlib import pyplot as plt
import pandas as pd



def main():
    graph_misc_cost('Miscellaneous Costs.csv')
    graph_rent_overview('Housing Costs - Rent.csv')
    graph_rent_lowest_state('Housing Costs - Rent.csv')
    graph_transport_cost('Transportation Costs.csv')


def graph_transport_cost(filename):
    df = get_DataFrame(filename)
    df = df.drop(columns=['ExpenseName', 'Unnamed: 8',
                 'Unnamed: 9',  'Unnamed: 10'], axis=1)

    convert_dict = {
        'expense.transportation': float,
    }
    df = df.astype(convert_dict)
    filt = (df['stateAbbrev'] == 'ID') & (df['numadults'] == 1) & (
        df['numkids'] == 0) & (df['countyortownName'] != 'state.average') | (df['stateAbbrev'] == 'UT') & (df['numadults'] == 1) & (df['numkids'] == 0) & (df['countyortownName'] != 'state.average') | (df['stateAbbrev'] == 'CO') & (
        df['numadults'] == 1) & (df['numkids'] == 0) & (df['countyortownName'] != 'state.average')
    
    print(df[filt].head())


def graph_rent_lowest_state(filename):
    """
    Population in a county effect on price scatter plot for each state


    """
    df = get_DataFrame(filename)
    df = df.drop(columns=['ExpenseName', 'townFIPS'], axis=1)
    convert_dict = {'stateAbbrev': str,
                    'stateFIPS': str,
                    'countyortownName': str,
                    'countyFIPS': str,
                    'numadults': str,
                    'numkids': str,
                    'yearofdata': int,
                    'expense.rent': float,
                    'countyortownpop': float,
                    }
    df = df.astype(convert_dict)
    df['expense.rent'] = df['expense.rent'].apply(lambda x: x/12).round(0)

    filt = (df['stateAbbrev'] == 'ID') & (df['numadults'] == 1) & (
        df['numkids'] == '0') & (df['countyortownName'] != 'state.average') | (df['stateAbbrev'] == 'UT') & (df['numadults'] == '1') & (df['numkids'] == '0') & (df['countyortownName'] != 'state.average') | (df['stateAbbrev'] == 'CO') & (
        df['numadults'] == '1') & (df['numkids'] == '0') & (df['countyortownName'] != 'state.average')

    filt_df = df.loc[filt]
    print(filt_df.head())
    filt_df.plot.scatter(x='countyortownpop',
                         y='expense.rent')
    plt.ylabel('Population')
    plt.xlabel('Rent Expense (USD)')
    plt.title(
        'Rent Expense For 1 Adult based on population of County or City in UT, ID, CO')
    plt.show()


def graph_rent_overview(filename):

    df = get_DataFrame(filename)
    df = df.drop(columns=['ExpenseName', 'townFIPS'], axis=1)
    convert_dict = {'stateAbbrev': str,
                    'stateFIPS': str,
                    'countyortownName': str,
                    'countyFIPS': str,
                    'numadults': str,
                    'numkids': str,
                    'yearofdata': int,
                    'expense.rent': float,
                    'countyortownpop': float,
                    }
    df = df.astype(convert_dict)

    # stateAbbrev stateFIPS countyortownName countyFIPS numadults numkids  yearofdata  expense.rent  countyortownpop
    filt = (df['countyortownName'] == 'state.average') & (
        df['numadults'] == '1') & (df['numkids'] == '0')
    print(df.loc[filt].sort_values(by='expense.rent', ascending=False))
    filtered_df = df.loc[filt].sort_values(by='expense.rent', ascending=False)
    filtered_df.plot.bar(x='stateAbbrev', y='expense.rent', legend=None)
    plt.ylabel('State Average(USD)')
    plt.xlabel('State')
    plt.title('Rent by State in the US')
    plt.show()


def graph_misc_cost(filename):
    df = get_DataFrame(filename)
    df = df.drop(columns=['ExpenseName', 'Unnamed: 8', 'Unnamed: 9'], axis=1)
    convert_dict = {'stateAbbrev': str,
                    'stateFIPS': str,
                    'countyortownName': str,
                    'numadults': int,
                    'numkids': int,
                    'yearofdata': int,
                    'expense.misc': float,
                    }
    df = df.astype(convert_dict)

#   stateAbbrev,stateFIPS,countyortownName,numadults,numkids,yearofdata,expense.misc,
    filt = (df['countyortownName'] == 'state.average') & (
        df['numadults'] == 1) & (df['numkids'] == 0)
    print(df.loc[filt].sort_values(by='expense.misc', ascending=False))
    filtered_df = df.loc[filt].sort_values(by='expense.misc', ascending=False)
    filtered_df.plot.bar(x='stateAbbrev', y='expense.misc', legend=None)
    plt.ylabel('Avarage cost')
    plt.xlabel('State')
    plt.title('Miscellaneous Cost by State in the US')
    plt.show()


def get_DataFrame(filename):
    df = pd.read_csv(filename)
    df = df.dropna(how='all')
    df = df.replace(',', '', regex=True)
    return df


if __name__ == '__main__':
    main()
