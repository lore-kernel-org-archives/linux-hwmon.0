Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from userp2130.oracle.com ([156.151.31.86]:33733 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752785AbdLEOiU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 5 Dec 2017 09:38:20 -0500
Date: Tue, 5 Dec 2017 17:37:26 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jean Delvare <jdelvare@suse.com>, Lei YU <mine260309@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] hwmon: (w83773g) Fix a precedence bug in get_fault()
Message-ID: <20171205143726.d3tziwhjboyfxmgi@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Shift has higher precedence than mask but presumably we wanted to set
*val to 1 if BIT(2) was set or 0 if the bit was clear.

Fixes: de0a524e3e09 ("hwmon: Add W83773G driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hwmon/w83773g.c b/drivers/hwmon/w83773g.c
index 0b97c285b049..e858093ac806 100644
--- a/drivers/hwmon/w83773g.c
+++ b/drivers/hwmon/w83773g.c
@@ -102,7 +102,7 @@ static int get_fault(struct regmap *regmap, int index, long *val)
 	if (ret < 0)
 		return ret;
 
-	*val = (u8)regval & 0x04 >> 2;
+	*val = (regval & 0x04) >> 2;
 	return 0;
 }
 
