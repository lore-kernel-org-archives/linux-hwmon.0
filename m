Return-Path: <colin.king@canonical.com>
Return-path: <colin.king@canonical.com>
From: Colin King <colin.king@canonical.com>
To: George Joseph <george.joseph@fairview5.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (asc7621): make several arrays static const
Date: Wed, 30 Aug 2017 09:32:25 +0100
Message-Id: <20170830083225.21390-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

From: Colin Ian King <colin.king@canonical.com>

Don't populate the arrays on the stack, instead make them static.
Makes the object code smaller by over 950 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  26144	  18768	    352	  45264	   b0d0	drivers/hwmon/asc7621.o

After:
   text	   data	    bss	    dec	    hex	filename
  25029	  18928	    352	  44309	   ad15	drivers/hwmon/asc7621.o

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hwmon/asc7621.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/asc7621.c b/drivers/hwmon/asc7621.c
index c77644d45a02..4875e99b59c9 100644
--- a/drivers/hwmon/asc7621.c
+++ b/drivers/hwmon/asc7621.c
@@ -512,7 +512,7 @@ static ssize_t show_pwm_ac(struct device *dev,
 {
 	SETUP_SHOW_DATA_PARAM(dev, attr);
 	u8 config, altbit, regval;
-	const u8 map[] = {
+	static const u8 map[] = {
 		0x01, 0x02, 0x04, 0x1f, 0x00, 0x06, 0x07, 0x10,
 		0x08, 0x0f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f
 	};
@@ -533,7 +533,7 @@ static ssize_t store_pwm_ac(struct device *dev,
 	SETUP_STORE_DATA_PARAM(dev, attr);
 	unsigned long reqval;
 	u8 currval, config, altbit, newval;
-	const u16 map[] = {
+	static const u16 map[] = {
 		0x04, 0x00, 0x01, 0xff, 0x02, 0xff, 0x05, 0x06,
 		0x08, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x0f,
 		0x07, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
-- 
2.14.1
