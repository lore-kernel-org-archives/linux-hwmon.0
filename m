Return-Path: <danilo@dbrgn.ch>
Return-path: <danilo@dbrgn.ch>
From: "Danilo Bargen" <danilo@dbrgn.ch>
To: linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	andreas.brauchli@sensirion.com,
	Danilo Bargen <mail@dbrgn.ch>
Subject: [PATCH] hwmon: (sht21) Update data sheet URLs
Date: Sat, 27 Jan 2018 00:31:00 +0100
Message-Id: <20180126233100.17995-1-mail@dbrgn.ch>
List-ID: <linux-hwmon@vger.kernel.org>

Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
---
 Documentation/hwmon/sht21 | 6 +++---
 drivers/hwmon/sht21.c     | 7 +------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/Documentation/hwmon/sht21 b/Documentation/hwmon/sht21
index 47f4765db256..e913605e1d70 100644
--- a/Documentation/hwmon/sht21
+++ b/Documentation/hwmon/sht21
@@ -6,13 +6,13 @@ Supported chips:
     Prefix: 'sht21'
     Addresses scanned: none
     Datasheet: Publicly available at the Sensirion website
-    http://www.sensirion.com/en/pdf/product_information/Datasheet-humidity-sensor-SHT21.pdf
+    https://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/2_Humidity_Sensors/Sensirion_Humidity_Sensors_SHT21_Datasheet.pdf
 
   * Sensirion SHT25
-    Prefix: 'sht21'
+    Prefix: 'sht25'
     Addresses scanned: none
     Datasheet: Publicly available at the Sensirion website
-    http://www.sensirion.com/en/pdf/product_information/Datasheet-humidity-sensor-SHT25.pdf
+    https://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/2_Humidity_Sensors/Sensirion_Humidity_Sensors_SHT25_Datasheet.pdf
 
 Author:
   Urs Fleisch <urs.fleisch@sensirion.com>
diff --git a/drivers/hwmon/sht21.c b/drivers/hwmon/sht21.c
index 06706d288355..984f14b3e89a 100644
--- a/drivers/hwmon/sht21.c
+++ b/drivers/hwmon/sht21.c
@@ -12,12 +12,7 @@
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA
- *
- * Data sheet available (5/2010) at
- * http://www.sensirion.com/en/pdf/product_information/Datasheet-humidity-sensor-SHT21.pdf
+ * Data sheet available at https://www.sensirion.com/sht2x/
  */
 
 #include <linux/module.h>
-- 
2.15.1
