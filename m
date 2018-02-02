Return-Path: <mail@dbrgn.ch>
Return-path: <mail@dbrgn.ch>
Date: Fri, 2 Feb 2018 11:42:35 +0100
From: Danilo Bargen <mail@dbrgn.ch>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 andreas.brauchli@sensirion.com
Subject: [PATCH v2 2/2] hwmon: (sht3x) Update data sheet URL
Message-ID: <20180202114235.19da068a@x2000>
In-Reply-To: <20180202111306.6699fb4d@x2000>
References: <20180126233100.17995-1-mail@dbrgn.ch>
	<8168b9b5-66c4-a6be-07d7-67eee60f9471@roeck-us.net>
	<20180202111306.6699fb4d@x2000>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

The previously used URL is dead.

Sensirion provides permalinks for their product datasheets at
https://www.sensirion.com/en/about-us/links/.

Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
---
 Documentation/hwmon/sht3x | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/sht3x b/Documentation/hwmon/sht3x
index b0d88184f48e..d9daa6ab1e8e 100644
--- a/Documentation/hwmon/sht3x
+++ b/Documentation/hwmon/sht3x
@@ -5,7 +5,7 @@ Supported chips:
   * Sensirion SHT3x-DIS
     Prefix: 'sht3x'
     Addresses scanned: none
-    Datasheet: http://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/Humidity/Sensirion_Humidity_Datasheet_SHT3x_DIS.pdf
+    Datasheet: https://www.sensirion.com/file/datasheet_sht3x_digital
 
 Author:
   David Frey <david.frey@sensirion.com>
-- 
2.16.1
