export type Team =  {
    dq: number;
    rank: number;
    record: {
        ties: number;
        losses: number;
        wins: number;
    };
    team_key: string;
    extra_stats: number[];
    sort_orders: number[];
    qual_average: number;
    matches_played: number;
  }