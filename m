Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Thilo Cestonaro <thilo@cestona.ro>
Subject: [PATCH] hwmon: (ftsteutates) Fix potential memory access error
Date: Tue, 26 Jul 2016 08:19:45 -0700
Message-Id: <1469546388-29907-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Using set_bit() to set a bit in an integer is not a good idea, since
the function expects an unsigned long as argument, which can be 64 bit
wide. Coverity reports this problem as

>>>     CID 1364488:  Memory - illegal accesses  (INCOMPATIBLE_CAST)
>>>     Pointer "&ret" points to an object whose effective type is "int"
>>>	(32 bits, signed) but is dereferenced as a wider "unsigned
+long" (64 bits, unsigned).  This may lead to memory corruption.
245                     set_bit(1, (unsigned long *)&ret);

Just use BIT instead.

Cc: Thilo Cestonaro <thilo@cestona.ro>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ftsteutates.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ftsteutates.c b/drivers/hwmon/ftsteutates.c
index 2b2ff67026be..48633e541dc3 100644
--- a/drivers/hwmon/ftsteutates.c
+++ b/drivers/hwmon/ftsteutates.c
@@ -242,7 +242,7 @@ static int fts_wd_set_resolution(struct fts_data *data,
 	}
 
 	if (resolution == seconds)
-		set_bit(1, (unsigned long *)&ret);
+		ret |= BIT(1);
 	else
 		ret &= ~BIT(1);
 
-- 
2.5.0
