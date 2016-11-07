Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:32871
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751592AbcKGUb4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Nov 2016 15:31:56 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (scpi) Fix module autoload
Date: Mon,  7 Nov 2016 17:31:44 -0300
Message-Id: <1478550704-20825-1-git-send-email-javier@osg.samsung.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

If the driver is built as a module, autoload won't work because the module
alias information is not filled. So user-space can't match the registered
device with the corresponding module.

Export the module alias information using the MODULE_DEVICE_TABLE() macro.

Before this patch:

$ modinfo drivers/hwmon/scpi-hwmon.ko | grep alias
$

After this patch:

$ modinfo drivers/hwmon/scpi-hwmon.ko | grep alias
alias:          of:N*T*Carm,scpi-sensorsC*
alias:          of:N*T*Carm,scpi-sensors

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/hwmon/scpi-hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/scpi-hwmon.c b/drivers/hwmon/scpi-hwmon.c
index 559a3dcd64d8..094f948f99ff 100644
--- a/drivers/hwmon/scpi-hwmon.c
+++ b/drivers/hwmon/scpi-hwmon.c
@@ -251,6 +251,7 @@ static const struct of_device_id scpi_of_match[] = {
 	{.compatible = "arm,scpi-sensors"},
 	{},
 };
+MODULE_DEVICE_TABLE(of, scpi_of_match);
 
 static struct platform_driver scpi_hwmon_platdrv = {
 	.driver = {
-- 
2.7.4

