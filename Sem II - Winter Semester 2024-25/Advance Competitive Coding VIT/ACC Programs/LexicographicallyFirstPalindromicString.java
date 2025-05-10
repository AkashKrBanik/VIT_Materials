public class LexicographicallyFirstPalindromicString {
    public static void main(String[] args) {
        String str = "malayalam";
        System.out.println("Lexicographically First Palindromic String: "+lexicographicallyFirstPalindromicString(str));
    }

    public static String lexicographicallyFirstPalindromicString(String str) {
        int[] freq = new int[26];
        for(int i = 0; i < str.length(); i++) {
            freq[str.charAt(i) - 'a']++;
        }
        int odd = 0;
        for(int i = 0; i < 26; i++) {
            if(freq[i] % 2 != 0) {
                odd++;
            }
        }
        if(odd > 1) {
            return "Not Possible";
        }
        int[] ans = new int[str.length()];
        int start = 0;
        int end = str.length() - 1;
        for(int i = 0; i < 26; i++) {
            while(freq[i] > 1) {
                ans[start] = i;
                ans[end] = i;
                start++;
                end--;
                freq[i] -= 2;
            }
        }
        int mid = start;
        for(int i = 0; i < 26; i++) {
            if(freq[i] == 1) {
                ans[mid] = i;
                freq[i]--;
                break;
            }
        }
        start = 0;
        end = str.length() - 1;
        while(start < end) {
            ans[end] = ans[start];
            start++;
            end--;
        }
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i < str.length(); i++) {
            sb.append((char)(ans[i] + 'a'));
        }
        return sb.toString();
    }
}
