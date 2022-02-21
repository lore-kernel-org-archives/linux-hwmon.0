Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79773C4167B
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Feb 2022 18:27:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbiBUS1g (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Feb 2022 13:27:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233378AbiBUS0N (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Feb 2022 13:26:13 -0500
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E375E03B
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Feb 2022 10:22:13 -0800 (PST)
Received: by mail-qv1-xf30.google.com with SMTP id p7so33996148qvk.11
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Feb 2022 10:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qV8Fvk7GX8DSvIPIISPlykRoo2wOnYU4EenOrIcODMc=;
        b=DtNzAdNZOMM7vYgLI/XDNkjPlGyO5KkxcuD952nGflANTrAYH6Vd3uH90nSlL6lBcq
         cujW+BZbylLhficHJz01pveXK5Z0QDd4ACjuYhh9j7PcnWOuDuasR1TX7zOMwXFDddpS
         jIU95RqtLzA1JJasvLJ8pHdCqMWNr7yO5PP3ydcJBLyfIagq1AoH5g4XXrJA7NaiX0of
         xQi7X8Bjpdfgkq+ASof9h+x43BX9eEueCrwx/ymGaY9dyC9t7D1HyQxraaw9dwvTfYkM
         xZez7tASwoNz1ai6QUJSU64XxeeZjlcN+z46RgzHyfsvmQMpJW74eiQkb5/BTDnG/vhj
         Amfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=qV8Fvk7GX8DSvIPIISPlykRoo2wOnYU4EenOrIcODMc=;
        b=ilvowdPPWVE4AYML/CCZ0Sx2+O1rBlRsbVwHuKVoscy+b1u1v0koTQZp3qXxxtxay1
         cGC3KnEqDidYrNxUJjHJfwHxk3h54leg22gtFBVPPRIWvzl4BfJSgVKdf4VYtC492pt9
         14asZ0Dwg/tJYISsoQqhg4SFr4ZHBRlhS1S3b+39HCxuZprGzvHD/jhexoud1QebPf31
         qmxMN7Ow6Uxs06A1MghNXZVtUYq6LAThcv67I8MSlWAH4K+hvosj0tuoilMs2P/67soW
         d4Za2bXAJPGXtS5WUicSGKjLnpAnXmJD9Rf95AUwmdFF1OU0t7LiOuHHdIyo6c1rAEym
         YQhw==
X-Gm-Message-State: AOAM5311d2I4DN6DqOSZPya92aVgQ7PuhpDgMJcCPrHQ2imBHnNIeFNR
        I3IpCoPGEHOWMytIt9/WSFXK6pzXOUy5cA==
X-Google-Smtp-Source: ABdhPJzoZLtE0sXcpWn6YvCuIsQzSMybgBCdCgUxc+OdrSbzH5rhzxQaY+j3C7XegRXz7AzBokZZRA==
X-Received: by 2002:a05:622a:64f:b0:2de:4ac9:6c82 with SMTP id a15-20020a05622a064f00b002de4ac96c82mr2080457qtb.447.1645467732292;
        Mon, 21 Feb 2022 10:22:12 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y15sm28729010qkp.22.2022.02.21.10.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 10:22:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2] hwmon: Handle failure to register sensor with thermal zone correctly
Date:   Mon, 21 Feb 2022 10:22:09 -0800
Message-Id: <20220221182209.1795242-1-linux@roeck-us.net>
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
with -ENODEV, report that the sensor was not attached to a
thermal zone  but continue to register the hwmon device.

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>
Fixes: 1597b374af222 ("hwmon: Add notification support")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Use dev_info instead of dev_warn, and change message to be
    less alarming.

 drivers/hwmon/hwmon.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 3501a3ead4ba..3ae961986fc3 100644
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
+		dev_info(dev, "temp%d_input not attached to any thermal zone\n",
+			 index + 1);
+		devm_kfree(dev, tdata);
+		return 0;
+	}
 
 	err = devm_add_action(dev, hwmon_thermal_remove_sensor, &tdata->node);
 	if (err)
-- 
2.35.1

