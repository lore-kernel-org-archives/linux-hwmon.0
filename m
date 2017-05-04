Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:35423 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752300AbdEDJfJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 4 May 2017 05:35:09 -0400
Date: Thu, 4 May 2017 11:35:06 +0200
From: Jean Delvare <jdelvare@suse.de>
To: linux-hwmon@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (it87) Remove useless test during device detection
Message-ID: <20170504113506.1665ecd7@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

There is no reason to treat the IT8705F differently during device
detection. If a single IT8705F chip indeed answers to both Super-IO
addresses, we have code in place to detect the duplicate device
address and skip the second one.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/it87.c |    7 -------
 1 file changed, 7 deletions(-)

--- linux-4.11.orig/drivers/hwmon/it87.c	2017-05-01 04:47:48.000000000 +0200
+++ linux-4.11/drivers/hwmon/it87.c	2017-05-04 11:17:49.868328706 +0200
@@ -3224,13 +3224,6 @@ static int __init sm_it87_init(void)
 			goto exit_dev_unregister;
 
 		found = true;
-
-		/*
-		 * IT8705F may respond on both SIO addresses.
-		 * Stop probing after finding one.
-		 */
-		if (sio_data.type == it87)
-			break;
 	}
 
 	if (!found) {


-- 
Jean Delvare
SUSE L3 Support
