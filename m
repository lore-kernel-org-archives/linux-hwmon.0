Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5960AC433DB
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 Jan 2021 02:06:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B8CF20784
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 Jan 2021 02:06:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbhADCGf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 3 Jan 2021 21:06:35 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9709 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbhADCGf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 3 Jan 2021 21:06:35 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D8Jpx2c0Wzl0nP;
        Mon,  4 Jan 2021 10:04:41 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Mon, 4 Jan 2021 10:05:47 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <p.zabel@pengutronix.de>
CC:     <linux-hwmon@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH] hwmon: (aspeed-pwm-tacho): Switch to using the new API kobj_to_dev()
Date:   Mon, 4 Jan 2021 10:05:45 +0800
Message-ID: <1609725945-13895-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

fixed the following coccicheck:
drivers/hwmon/aspeed-pwm-tacho.c:634:60-61: WARNING opportunity for
kobj_to_dev()
drivers/hwmon/aspeed-pwm-tacho.c:623:60-61: WARNING opportunity for
kobj_to_dev()

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index 3d8239f..3cb88d6 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -620,7 +620,7 @@ static ssize_t rpm_show(struct device *dev, struct device_attribute *attr,
 static umode_t pwm_is_visible(struct kobject *kobj,
 			      struct attribute *a, int index)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct aspeed_pwm_tacho_data *priv = dev_get_drvdata(dev);
 
 	if (!priv->pwm_present[index])
@@ -631,7 +631,7 @@ static umode_t pwm_is_visible(struct kobject *kobj,
 static umode_t fan_dev_is_visible(struct kobject *kobj,
 				  struct attribute *a, int index)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct aspeed_pwm_tacho_data *priv = dev_get_drvdata(dev);
 
 	if (!priv->fan_tach_present[index])
-- 
2.7.4

