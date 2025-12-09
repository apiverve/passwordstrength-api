declare module '@apiverve/passwordstrength' {
  export interface passwordstrengthOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface passwordstrengthResponse {
    status: string;
    error: string | null;
    data: PasswordStrengthData;
    code?: number;
  }


  interface PasswordStrengthData {
      strength:     string;
      passwordInfo: PasswordInfo;
  }
  
  interface PasswordInfo {
      length:               number;
      hasSpecialCharacters: boolean;
      hasNumbers:           boolean;
      hasLowercase:         boolean;
      hasUppercase:         boolean;
      hasSpaces:            boolean;
  }

  export default class passwordstrengthWrapper {
    constructor(options: passwordstrengthOptions);

    execute(callback: (error: any, data: passwordstrengthResponse | null) => void): Promise<passwordstrengthResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: passwordstrengthResponse | null) => void): Promise<passwordstrengthResponse>;
    execute(query?: Record<string, any>): Promise<passwordstrengthResponse>;
  }
}
