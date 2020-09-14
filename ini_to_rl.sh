cat << EOF
package net.dongliu.apk.parser.utils;

import android.util.SparseArray;

/**
 * methods for load resources.
 *
 * @author dongliu
 */
public class ResourceLoader {

    public static SparseArray<String> loadSystemAttrIds() {
        SparseArray<String> array = new SparseArray<>();
EOF
cat ./src/main/resources/r_values.ini | awk -F= '{ print "        array.put(" $2 ", \"" $1 "\");" }'
cat << EOF
        return array;
    }

    public static SparseArray<String> loadSystemStyles() {
        SparseArray<String> array = new SparseArray<>();
EOF
cat ./src/main/resources/r_styles.ini | awk -F" = " '{ print "        array.put(" $2 ", \"" $1 "\");" }'
cat << EOF
        return array;
    }
}
EOF
