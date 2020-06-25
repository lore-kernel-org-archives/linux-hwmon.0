Return-Path: <SRS0=Zrk+=AG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4433CC433DF
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Jun 2020 04:34:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A7122072E
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Jun 2020 04:34:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389410AbgFYEeN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 25 Jun 2020 00:34:13 -0400
Received: from mgwkm04.jp.fujitsu.com ([202.219.69.171]:36316 "EHLO
        mgwkm04.jp.fujitsu.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgFYEeN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 25 Jun 2020 00:34:13 -0400
X-Greylist: delayed 675 seconds by postgrey-1.27 at vger.kernel.org; Thu, 25 Jun 2020 00:34:12 EDT
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by mgwkm04.jp.fujitsu.com with smtp
         id 5adb_4ddf_385b131f_5122_4908_a535_d89ea16cb725;
        Thu, 25 Jun 2020 13:22:53 +0900
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local (g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
        by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D559AC0060
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2020 13:22:52 +0900 (JST)
Received: from g01jpexchyt33.g01.fujitsu.local (unknown [10.128.193.4])
        by g01jpfmpwyt02.exch.g01.fujitsu.local (Postfix) with ESMTP id 7823258435C;
        Thu, 25 Jun 2020 13:22:51 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 g01jpexchyt33.g01.fujitsu.local (10.128.193.36) with Microsoft SMTP Server id
 14.3.487.0; Thu, 25 Jun 2020 13:22:51 +0900
From:   Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>
CC:     <misono.tomohiro@jp.fujitsu.com>
Subject: [PATCH] hwmon: (acpi_power_meter) Fix potential memory leak in acpi_power_meter_add()
Date:   Thu, 25 Jun 2020 13:32:42 +0900
Message-ID: <20200625043242.31175-1-misono.tomohiro@jp.fujitsu.com>
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

Although it rarely happens, we should call free_capabilities()
if error happens after read_capabilities() to free allocated strings.

Fixes: commit de584afa5e188 ("hwmon driver for ACPI 4.0 power meters")
Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
---
 drivers/hwmon/acpi_power_meter.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 0db8ef4fd6e1..a270b975e90b 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -883,7 +883,7 @@ static int acpi_power_meter_add(struct acpi_device *device)
 
 	res = setup_attrs(resource);
 	if (res)
-		goto exit_free;
+		goto exit_free_capability;
 
 	resource->hwmon_dev = hwmon_device_register(&device->dev);
 	if (IS_ERR(resource->hwmon_dev)) {
@@ -896,6 +896,8 @@ static int acpi_power_meter_add(struct acpi_device *device)
 
 exit_remove:
 	remove_attrs(resource);
+exit_free_capability:
+	free_capabilities(resource);
 exit_free:
 	kfree(resource);
 exit:
-- 
2.21.3

