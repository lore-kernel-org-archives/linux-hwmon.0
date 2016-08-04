Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35434 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751549AbcHDIIC (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Aug 2016 04:08:02 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (nct6775) Do not accept force_id unless chip is found
Date: Wed,  3 Aug 2016 22:15:37 -0700
Message-Id: <1470287737-1212-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Since commit 698a7c24a544 ("hwmon: (nct6775) Support two SuperIO chips
in the same system"), the driver supports two Super-IO chips. This has
the undesirable side effect that force_id always detects a second chip
at address 0xfff8, even if no chip exists at that address.

nct6775: Found NCT6793D or compatible chip at 0x4e:0xfff8

If no chip at all is found at a given SIO address, it does not make sense
to instantiate it. Limit force_id to only work if some chip is found,
that is if the chip ID returns a value other than 0xffff.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index d087a8e00cf5..7859a30ce31e 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -4232,11 +4232,11 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 	if (err)
 		return err;
 
-	if (force_id)
+	val = (superio_inb(sioaddr, SIO_REG_DEVID) << 8) |
+		superio_inb(sioaddr, SIO_REG_DEVID + 1);
+	if (force_id && val != 0xffff)
 		val = force_id;
-	else
-		val = (superio_inb(sioaddr, SIO_REG_DEVID) << 8)
-		    | superio_inb(sioaddr, SIO_REG_DEVID + 1);
+
 	switch (val & SIO_ID_MASK) {
 	case SIO_NCT6106_ID:
 		sio_data->kind = nct6106;
-- 
2.5.0

