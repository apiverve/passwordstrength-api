declare module '@apiverve/passwordstrength' {
  export interface passwordstrengthOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface passwordstrengthResponse {
    status: string;
    error: string | null;
    data: PasswordStrengthData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface PasswordStrengthData {
      strength:        null | string;
      score:           number | null;
      passwordInfo:    PasswordInfo;
      recommendations: (null | string)[];
      entropyBits:     number | null;
  }
  
  interface PasswordInfo {
      length:               number | null;
      hasSpecialCharacters: boolean | null;
      hasNumbers:           boolean | null;
      hasLowercase:         boolean | null;
      hasUppercase:         boolean | null;
      hasSpaces:            boolean | null;
      hasSequentialChars:   boolean | null;
      hasRepeatedChars:     boolean | null;
  }

  export default class passwordstrengthWrapper {
    constructor(options: passwordstrengthOptions);

    execute(callback: (error: any, data: passwordstrengthResponse | null) => void): Promise<passwordstrengthResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: passwordstrengthResponse | null) => void): Promise<passwordstrengthResponse>;
    execute(query?: Record<string, any>): Promise<passwordstrengthResponse>;
  }
}
