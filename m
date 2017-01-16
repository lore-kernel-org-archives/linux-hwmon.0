Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:58850
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750831AbdAPOwk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Jan 2017 09:52:40 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (ltc4151) Export OF device ID table as module aliases
Date: Mon, 16 Jan 2017 11:52:27 -0300
Message-Id: <1484578347-12352-1-git-send-email-javier@osg.samsung.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The I2C core always reports a MODALIAS of the form i2c:<foo> even if the
device was registered via OF, this means that exporting the OF device ID
table device aliases in the module is not needed. But in order to change
how the core reports modaliases to user-space, it's better to export it.

Before this patch:

$ modinfo drivers/hwmon/ltc4151.ko | grep alias
alias:          i2c:ltc4151

After this patch:

$ modinfo drivers/hwmon/ltc4151.ko | grep alias
alias:          i2c:ltc4151
alias:          of:N*T*Clltc,ltc4151C*
alias:          of:N*T*Clltc,ltc4151

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/hwmon/ltc4151.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/ltc4151.c b/drivers/hwmon/ltc4151.c
index 8445c9fd946b..b904cb547ffb 100644
--- a/drivers/hwmon/ltc4151.c
+++ b/drivers/hwmon/ltc4151.c
@@ -215,6 +215,7 @@ static const struct of_device_id ltc4151_match[] = {
 	{ .compatible = "lltc,ltc4151" },
 	{},
 };
+MODULE_DEVICE_TABLE(of, ltc4151_match);
 
 /* This is the driver that will be inserted */
 static struct i2c_driver ltc4151_driver = {
-- 
2.7.4

