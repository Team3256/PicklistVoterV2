export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  public: {
    Tables: {
      "Leaderboard Voter": {
        Row: {
          admin_session_id: string | null
          leaderboard_code: number
          name: string | null
          submissions: Json[] | null
          teams: Json[] | null
        }
        Insert: {
          admin_session_id?: string | null
          leaderboard_code: number
          name?: string | null
          submissions?: Json[] | null
          teams?: Json[] | null
        }
        Update: {
          admin_session_id?: string | null
          leaderboard_code?: number
          name?: string | null
          submissions?: Json[] | null
          teams?: Json[] | null
        }
        Relationships: []
      }
      "Leaderboard Voter 1.1": {
        Row: {
          admin_session_id: string
          leaderboard_code: number
          name: string
          submissions: Database["public"]["CompositeTypes"]["submissions"][]
          teams: Database["public"]["CompositeTypes"]["teams"][]
        }
        Insert: {
          admin_session_id: string
          leaderboard_code: number
          name: string
          submissions: Database["public"]["CompositeTypes"]["submissions"][]
          teams: Database["public"]["CompositeTypes"]["teams"][]
        }
        Update: {
          admin_session_id?: string
          leaderboard_code?: number
          name?: string
          submissions?: Database["public"]["CompositeTypes"]["submissions"][]
          teams?: Database["public"]["CompositeTypes"]["teams"][]
        }
        Relationships: []
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      records: {
        ties: number
        wins: number
        losses: number
      }
      submissions: {
        id: string
        name: string
        picks: number[]
        weighting: number
      }
      teams: {
        dq: number
        rank: number
        record: Database["public"]["CompositeTypes"]["records"]
        team_key: string
        extra_stats: number[]
        sort_orders: number[]
        qual_average: number
        matches_played: number
      }
    }
  }
}

type PublicSchema = Database[Extract<keyof Database, "public">]

export type Tables<
  PublicTableNameOrOptions extends
    | keyof (PublicSchema["Tables"] & PublicSchema["Views"])
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
        Database[PublicTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
      Database[PublicTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : PublicTableNameOrOptions extends keyof (PublicSchema["Tables"] &
        PublicSchema["Views"])
    ? (PublicSchema["Tables"] &
        PublicSchema["Views"])[PublicTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  PublicEnumNameOrOptions extends
    | keyof PublicSchema["Enums"]
    | { schema: keyof Database },
  EnumName extends PublicEnumNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = PublicEnumNameOrOptions extends { schema: keyof Database }
  ? Database[PublicEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : PublicEnumNameOrOptions extends keyof PublicSchema["Enums"]
    ? PublicSchema["Enums"][PublicEnumNameOrOptions]
    : never
