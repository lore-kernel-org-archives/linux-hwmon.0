Return-path: <shidogra@cisco.com>
Date: Mon, 27 Mar 2017 16:16:44 -0700
From: Shikhar Dogra <shidogra@cisco.com>
To: linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Cc: xe-linux-external@cisco.com, linux-kernel@vger.kernel.org
Subject: [PATCH] driver: adm1275: set the m,b and R coefficients correctly
 for power
Message-ID: <20170327231644.GA6121@sjc-ads-4188.cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <linux-hwmon@vger.kernel.org>

Seems like coefficient values for m, b and R under power have been
put in the wrong order. Rearranging them properly to get correct
values of coefficients for power.

For specs, please refer to table 7 (page 35) on
http://www.analog.com/media/en/technical-documentation/data-sheets/ADM1075.pdf

Fixes: 904b296f308d ("hwmon: (adm1275) Introduce configuration data structure for coeffcients")
Signed-off-by: Shikhar Dogra <shidogra@cisco.com>
Cc: xe-linux-external@cisco.com
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/hwmon/pmbus/adm1275.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 188af4c..18477dd 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -95,8 +95,8 @@ static const struct coefficients adm1075_coefficients[] = {
 	[0] = { 27169, 0, -1 },		/* voltage */
 	[1] = { 806, 20475, -1 },	/* current, irange25 */
 	[2] = { 404, 20475, -1 },	/* current, irange50 */
-	[3] = { 0, -1, 8549 },		/* power, irange25 */
-	[4] = { 0, -1, 4279 },		/* power, irange50 */
+	[3] = { 8549, 0, -1 },		/* power, irange25 */
+	[4] = { 4279, 0, -1 },		/* power, irange50 */
 };
 
 static const struct coefficients adm1275_coefficients[] = {
-- 
2.5.0
