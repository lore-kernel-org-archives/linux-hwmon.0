Return-Path: <mail@dbrgn.ch>
Return-path: <mail@dbrgn.ch>
Date: Fri, 2 Feb 2018 11:40:52 +0100
From: Danilo Bargen <mail@dbrgn.ch>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 andreas.brauchli@sensirion.com
Subject: [PATCH v2 1/2] hwmon: (sht21) Update data sheet URLs
Message-ID: <20180202114052.065b6d08@x2000>
In-Reply-To: <20180202111306.6699fb4d@x2000>
References: <20180126233100.17995-1-mail@dbrgn.ch>
	<8168b9b5-66c4-a6be-07d7-67eee60f9471@roeck-us.net>
	<20180202111306.6699fb4d@x2000>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

The previously used URLs are dead.

Sensirion provides permalinks for their product datasheets at
https://www.sensirion.com/en/about-us/links/.

Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
---
 Documentation/hwmon/sht21 | 6 +++---
 drivers/hwmon/sht21.c     | 3 +--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/sht21 b/Documentation/hwmon/sht21
index 47f4765db256..8b3cdda541c1 100644
--- a/Documentation/hwmon/sht21
+++ b/Documentation/hwmon/sht21
@@ -6,13 +6,13 @@ Supported chips:
     Prefix: 'sht21'
     Addresses scanned: none
     Datasheet: Publicly available at the Sensirion website
-    http://www.sensirion.com/en/pdf/product_information/Datasheet-humidity-sensor-SHT21.pdf
+    http://www.sensirion.com/file/datasheet_sht21
 
   * Sensirion SHT25
-    Prefix: 'sht21'
+    Prefix: 'sht25'
     Addresses scanned: none
     Datasheet: Publicly available at the Sensirion website
-    http://www.sensirion.com/en/pdf/product_information/Datasheet-humidity-sensor-SHT25.pdf
+    http://www.sensirion.com/file/datasheet_sht25
 
 Author:
   Urs Fleisch <urs.fleisch@sensirion.com>
diff --git a/drivers/hwmon/sht21.c b/drivers/hwmon/sht21.c
index 06706d288355..e23736e21422 100644
--- a/drivers/hwmon/sht21.c
+++ b/drivers/hwmon/sht21.c
@@ -16,8 +16,7 @@
  * along with this program; if not, write to the Free Software
  * Foundation, Inc., 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA
  *
- * Data sheet available (5/2010) at
- * http://www.sensirion.com/en/pdf/product_information/Datasheet-humidity-sensor-SHT21.pdf
+ * Data sheet available at http://www.sensirion.com/file/datasheet_sht21
  */
 
 #include <linux/module.h>
-- 
2.16.1
