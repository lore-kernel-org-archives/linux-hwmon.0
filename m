Return-Path: <SRS0=Zrk+=AG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA15C433E0
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Jun 2020 07:32:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17CC82076E
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Jun 2020 07:32:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390182AbgFYHcR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 25 Jun 2020 03:32:17 -0400
Received: from mgwym04.jp.fujitsu.com ([211.128.242.43]:26247 "EHLO
        mgwym04.jp.fujitsu.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727829AbgFYHcR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 25 Jun 2020 03:32:17 -0400
X-Greylist: delayed 677 seconds by postgrey-1.27 at vger.kernel.org; Thu, 25 Jun 2020 03:32:16 EDT
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by mgwym04.jp.fujitsu.com with smtp
         id 5ded_28c3_a367087f_f1fe_4778_bf68_358065366327;
        Thu, 25 Jun 2020 16:20:51 +0900
Received: from g01jpfmpwkw01.exch.g01.fujitsu.local (g01jpfmpwkw01.exch.g01.fujitsu.local [10.0.193.38])
        by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 44747AC0065
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2020 16:20:51 +0900 (JST)
Received: from G01JPEXCHKW13.g01.fujitsu.local (G01JPEXCHKW13.g01.fujitsu.local [10.0.194.52])
        by g01jpfmpwkw01.exch.g01.fujitsu.local (Postfix) with ESMTP id 681346926E4;
        Thu, 25 Jun 2020 16:20:50 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 G01JPEXCHKW13.g01.fujitsu.local (10.0.194.52) with Microsoft SMTP Server id
 14.3.487.0; Thu, 25 Jun 2020 16:20:50 +0900
From:   Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>
CC:     <misono.tomohiro@jp.fujitsu.com>
Subject: [PATCH] hwmon: (acpi_power_meter) Convert to use hwmon_device_register_with_info() API
Date:   Thu, 25 Jun 2020 16:31:09 +0900
Message-ID: <20200625073109.13993-1-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Since hwmon_device_register() has been deprecated and gives warning in
dmesg, just convert it to hwmon_device_register_with_info() with name
strings.

Only difference is that now name sysfs file is created under top hwmon
directory. i.e.:
 $ cat /sys/class/hwmon/hwmonX/name
 $ power_meter

Other than that, nothing has changed.

Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
---
 drivers/hwmon/acpi_power_meter.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index a270b975e90b..d93a5423d7ae 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -885,7 +885,8 @@ static int acpi_power_meter_add(struct acpi_device *device)
 	if (res)
 		goto exit_free_capability;
 
-	resource->hwmon_dev = hwmon_device_register(&device->dev);
+	resource->hwmon_dev = hwmon_device_register_with_info(&device->dev,
+					ACPI_POWER_METER_NAME, NULL, NULL, NULL);
 	if (IS_ERR(resource->hwmon_dev)) {
 		res = PTR_ERR(resource->hwmon_dev);
 		goto exit_remove;
-- 
2.21.3

