Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57293 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933174AbdCLO0i (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Mar 2017 10:26:38 -0400
Date: Sun, 12 Mar 2017 07:26:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: it87 causes VIA hardware to lockup
Message-ID: <20170312142634.GA1917@roeck-us.net>
References: <20170312103413.GJ21222@n2100.armlinux.org.uk>
 <20170312132544.GA17687@roeck-us.net>
 <20170312141522.GL21222@n2100.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170312141522.GL21222@n2100.armlinux.org.uk>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, Mar 12, 2017 at 02:15:22PM +0000, Russell King - ARM Linux wrote:
> On Sun, Mar 12, 2017 at 06:25:44AM -0700, Guenter Roeck wrote:
> > I found some reference suggesting that The IT8705F may respond on
> > both SIO addresses. Can you try the following patch ?
> 
> Thanks for the patch - it'll take about a week or so for me to test,
> as I can only risk testing it when I'm physically at the machine.
> 

My pleasure. Sorry for the trouble. I attached a more comprehensive version
of the patch.

Thanks,
Guenter

---
>From 5b3f92a9e0df49a111a96f43130d2cee370e4c7a Mon Sep 17 00:00:00 2001
From: Guenter Roeck <linux@roeck-us.net>
Date: Sun, 12 Mar 2017 06:18:58 -0700
Subject: [PATCH] hwmon: (it87) Avoid registering the same chip on both SIO
 addresses

IT8705F is known to respond on both SIO addresses. Other chips may have
the same behavior. Add checks to avoid registering the same chip twice.

Fixes: e84bd9535e2b ("hwmon: (it87) Add support for second Super-IO chip")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/it87.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 3e57a6120551..7053968fe0d3 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -3197,7 +3197,7 @@ static int __init sm_it87_init(void)
 {
 	int sioaddr[2] = { REG_2E, REG_4E };
 	struct it87_sio_data sio_data;
-	unsigned short isa_address;
+	unsigned short isa_address[2];
 	bool found = false;
 	int i, err;
 
@@ -3207,15 +3207,29 @@ static int __init sm_it87_init(void)
 
 	for (i = 0; i < ARRAY_SIZE(sioaddr); i++) {
 		memset(&sio_data, 0, sizeof(struct it87_sio_data));
-		isa_address = 0;
-		err = it87_find(sioaddr[i], &isa_address, &sio_data);
-		if (err || isa_address == 0)
+		isa_address[i] = 0;
+		err = it87_find(sioaddr[i], &isa_address[i], &sio_data);
+		if (err || isa_address[i] == 0)
 			continue;
+		/*
+		 * Don't register second chip if its ISA address matches
+		 * the first chip's ISA address.
+		 */
+		if (i && isa_address[i] == isa_address[0])
+			break;
 
-		err = it87_device_add(i, isa_address, &sio_data);
+		err = it87_device_add(i, isa_address[i], &sio_data);
 		if (err)
 			goto exit_dev_unregister;
+
 		found = true;
+
+		/*
+		 * IT8705F may respond on both SIO addresses.
+		 * Stop probing after finding one.
+		 */
+		if (sio_data.type == it87)
+			break;
 	}
 
 	if (!found) {
-- 
2.7.4

