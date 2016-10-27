Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:31052 "EHLO
        mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S942773AbcJ0WiE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Oct 2016 18:38:04 -0400
From: Clemens Gruber <clemens.gruber@pqgruber.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: [PATCH v2 3/3] hwmon: (mcp3021) replace S_IRUGO with 0444
Date: Fri, 28 Oct 2016 00:33:45 +0200
Message-Id: <20161027223345.16733-3-clemens.gruber@pqgruber.com>
In-Reply-To: <20161027223345.16733-1-clemens.gruber@pqgruber.com>
References: <20161027223345.16733-1-clemens.gruber@pqgruber.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Replace S_IRUGO with the better readable 0444.
This fixes a checkpatch warning.

Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>
---
 drivers/hwmon/mcp3021.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/mcp3021.c b/drivers/hwmon/mcp3021.c
index a8cf97f..97c832d 100644
--- a/drivers/hwmon/mcp3021.c
+++ b/drivers/hwmon/mcp3021.c
@@ -120,7 +120,7 @@ static ssize_t show_in_input(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", in_input);
 }
 
-static DEVICE_ATTR(in0_input, S_IRUGO, show_in_input, NULL);
+static DEVICE_ATTR(in0_input, 0444, show_in_input, NULL);
 
 #ifdef CONFIG_OF
 static int mcp3021_probe_dt(struct i2c_client *client,
-- 
2.10.1

