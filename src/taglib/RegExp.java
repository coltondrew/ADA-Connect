package taglib;
import java.util.regex.Pattern;

public class RegExp {
	public static boolean matches(String pattern, String str) {
		return Pattern.compile(pattern).matcher(str).matches();
	}

}
