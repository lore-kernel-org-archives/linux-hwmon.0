Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.andi.de1.cc ([85.214.239.24]:60230 "EHLO
        h2641619.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731151AbeL0POW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Dec 2018 10:14:22 -0500
From: Andreas Kemnade <andreas@kemnade.info>
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 1/2] hwmon: (hih6130) add dtb compatibility tables
Date: Thu, 27 Dec 2018 16:13:48 +0100
Message-Id: <20181227151349.29753-2-andreas@kemnade.info>
In-Reply-To: <20181227151349.29753-1-andreas@kemnade.info>
References: <20181227151349.29753-1-andreas@kemnade.info>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This allows the hih6130 to be used in devicetree files and auto-probed
that way.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/hwmon/hih6130.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/hih6130.c b/drivers/hwmon/hih6130.c
index 0ae1ee1dbf76..de1b50ddc740 100644
--- a/drivers/hwmon/hih6130.c
+++ b/drivers/hwmon/hih6130.c
@@ -254,8 +254,17 @@ static const struct i2c_device_id hih6130_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, hih6130_id);
 
+static const struct of_device_id hih6130_of_match[] = {
+	{ .compatible = "honeywell,hih6130", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, hih6130_of_match);
+
 static struct i2c_driver hih6130_driver = {
-	.driver.name = "hih6130",
+	.driver = {
+		.name = "hih6130",
+		.of_match_table = of_match_ptr(hih6130_of_match),
+	},
 	.probe       = hih6130_probe,
 	.id_table    = hih6130_id,
 };
-- 
2.11.0
