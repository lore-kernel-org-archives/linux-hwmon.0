Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:37648 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753821AbeDWB2E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 22 Apr 2018 21:28:04 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jonathan Sims <jonathan.625266@earthlink.net>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (nct6683) Enable EC access if disabled at boot
Date: Sun, 22 Apr 2018 18:27:59 -0700
Message-Id: <1524446879-26799-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Asrock Z370M Pro4, it was observed that EC access was disabled after
initially booting the system. As a result, the driver failed to load
with
	nct6683: EC is disabled
After a suspend/resume cycle, the driver loaded correctly.
	nct6683: Found NCT6683D or compatible chip at 0x2e:0xa20
	nct6683 nct6683.2592: NCT6683D EC firmware version 1.0 build 07/18/16

Enable EC access after identifying the chip if disabled to fix the problem.
Warn the user that the data it reports may be unusable, similar to other
drivers for chips from Nuvoton.

Fixes: 41082d66bfd6f ("hwmon: Driver for NCT6683D")
Reported-by: Jonathan Sims <jonathan.625266@earthlink.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6683.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 8b0bc4fc06e8..b0bc77bf2cd9 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -1380,8 +1380,8 @@ static int __init nct6683_find(int sioaddr, struct nct6683_sio_data *sio_data)
 	/* Activate logical device if needed */
 	val = superio_inb(sioaddr, SIO_REG_ENABLE);
 	if (!(val & 0x01)) {
-		pr_err("EC is disabled\n");
-		goto fail;
+		pr_warn("Forcibly enabling EC access. Data may be unusable.\n");
+		superio_outb(sioaddr, SIO_REG_ENABLE, val | 0x01);
 	}
 
 	superio_exit(sioaddr);
-- 
2.7.4

