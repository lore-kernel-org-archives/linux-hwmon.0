Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA1FC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Feb 2022 16:44:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380995AbiBUQpI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Feb 2022 11:45:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381089AbiBUQpH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Feb 2022 11:45:07 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEBFD240AF
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Feb 2022 08:44:38 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id j78so12784365qke.2
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Feb 2022 08:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6vvQxq1xnuj8KvfPAdfb872fhC2WQUbInQxgDyjBI3M=;
        b=AXWxD9Ez5j3R4o46xqz6qve3oLMr2GIDiFWiqj1XDTQ3YuypoOvSmCSEGsS4+1mymv
         cz5io894kU+qKG4k4uxpq8jQo2sTVlyA2NvhKNU7zXPmex2l6t8NqpkABAkTAq79IDh5
         ITU6uH3YVxD/qBK/to8bQB5oILO24jlkn/m0D9m2nfdSgVrDdw9C9tmTQW0AsACJcDSx
         CNYI4zPsdz+EBUyRIKjPqZvH4u3MXg0uuJ/ENp4un2zu3GOwxuW4UjQW0GJXFRJ4wZy4
         TZbooMxrDFsRkjzYpStYjMm1QezwIlfp/vLheCjuQvufWBIZJbX95jgRtvKrcIBfCknQ
         zwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=6vvQxq1xnuj8KvfPAdfb872fhC2WQUbInQxgDyjBI3M=;
        b=Qdi16mr9BLCN/7VHr627DKKdeM6co4huKJxf8tdJv9hVeOTsZin9ORGe5T0EbGEUHx
         XB1H5Q0UclwWAGxLWINuBqiYeoNpmKHbI0hu78HoE6w3CJ9CXCMujtknBnEKWPnxrv4I
         XXF0wZ+3KenT5RLcjdq//bq7k1wdj7eR1yfDwbiHpPLJqJUxyKoXMmDO03P6Uh2ajCqM
         yzmadRzct4onAWlCafgOlkkbtAuRDD7db9aFsU1MiJnILGFgGjmkAGoItTfnnCIA9B0+
         YyaZDP1AGgtqGjjKUIzv1k5w7oYvWgHxM2zxZoHtFEP5rL+I6pSd9c+BD2pY5AhoyoMc
         KHYQ==
X-Gm-Message-State: AOAM531TXSjkHGIm7/lM/uEdAgEPvbhtzvCLts7StVWqY+XXMfd456/7
        srWW2lH9MK1oUaaOyGYPP9KUT2dWTfjR2A==
X-Google-Smtp-Source: ABdhPJwVs7/rQdqeP/IQVvp8rz7LZwF5ZLCJuOTPVwN+tX0LrlcGF94v839wbZ4l63njSWY7m16E7w==
X-Received: by 2002:a37:2ec2:0:b0:47e:cdef:3e1e with SMTP id u185-20020a372ec2000000b0047ecdef3e1emr12271538qkh.125.1645461877593;
        Mon, 21 Feb 2022 08:44:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e1sm22345345qtw.71.2022.02.21.08.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 08:44:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH] hwmon: Handle failure to register sensor with thermal zone correctly
Date:   Mon, 21 Feb 2022 08:44:34 -0800
Message-Id: <20220221164434.4169560-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

If an attempt is made to a sensor with a thermal zone and it fails,
the call to devm_thermal_zone_of_sensor_register() may return -ENODEV.
This may result in crashes similar to the following.

Unable to handle kernel NULL pointer dereference at virtual address 00000000000003cd
...
Internal error: Oops: 96000021 [#1] PREEMPT SMP
...
pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : mutex_lock+0x18/0x60
lr : thermal_zone_device_update+0x40/0x2e0
sp : ffff800014c4fc60
x29: ffff800014c4fc60 x28: ffff365ee3f6e000 x27: ffffdde218426790
x26: ffff365ee3f6e000 x25: 0000000000000000 x24: ffff365ee3f6e000
x23: ffffdde218426870 x22: ffff365ee3f6e000 x21: 00000000000003cd
x20: ffff365ee8bf3308 x19: ffffffffffffffed x18: 0000000000000000
x17: ffffdde21842689c x16: ffffdde1cb7a0b7c x15: 0000000000000040
x14: ffffdde21a4889a0 x13: 0000000000000228 x12: 0000000000000000
x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
x8 : 0000000001120000 x7 : 0000000000000001 x6 : 0000000000000000
x5 : 0068000878e20f07 x4 : 0000000000000000 x3 : 00000000000003cd
x2 : ffff365ee3f6e000 x1 : 0000000000000000 x0 : 00000000000003cd
Call trace:
 mutex_lock+0x18/0x60
 hwmon_notify_event+0xfc/0x110
 0xffffdde1cb7a0a90
 0xffffdde1cb7a0b7c
 irq_thread_fn+0x2c/0xa0
 irq_thread+0x134/0x240
 kthread+0x178/0x190
 ret_from_fork+0x10/0x20
Code: d503201f d503201f d2800001 aa0103e4 (c8e47c02)

Jon Hunter reports that the exact call sequence is:

hwmon_notify_event()
  --> hwmon_thermal_notify()
    --> thermal_zone_device_update()
      --> update_temperature()
        --> mutex_lock()

The hwmon core needs to handle all errors returned from calls
to devm_thermal_zone_of_sensor_register(). If the call fails
with -ENODEV, report the problem as warning but continue to
register the hwmon device.

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>
Fixes: 1597b374af222 ("hwmon: Add notification support")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 3501a3ead4ba..4bfe3791a5ba 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -214,12 +214,14 @@ static int hwmon_thermal_add_sensor(struct device *dev, int index)
 
 	tzd = devm_thermal_zone_of_sensor_register(dev, index, tdata,
 						   &hwmon_thermal_ops);
-	/*
-	 * If CONFIG_THERMAL_OF is disabled, this returns -ENODEV,
-	 * so ignore that error but forward any other error.
-	 */
-	if (IS_ERR(tzd) && (PTR_ERR(tzd) != -ENODEV))
-		return PTR_ERR(tzd);
+	if (IS_ERR(tzd)) {
+		if (PTR_ERR(tzd) != -ENODEV)
+			return PTR_ERR(tzd);
+		dev_warn(dev, "Failed to register temp%d_input with thermal zone\n",
+			 index + 1);
+		devm_kfree(dev, tdata);
+		return 0;
+	}
 
 	err = devm_add_action(dev, hwmon_thermal_remove_sensor, &tdata->node);
 	if (err)
-- 
2.35.1

