Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D42AC433DB
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Dec 2020 01:20:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C9EE21973
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Dec 2020 01:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgLaBTo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Dec 2020 20:19:44 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10013 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgLaBTo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Dec 2020 20:19:44 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D5qz512wmzj1bC;
        Thu, 31 Dec 2020 09:18:09 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Thu, 31 Dec 2020 09:18:55 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>
Subject: [PATCH] hwmon: (it87): Switch to using the new API kobj_to_dev()
Date:   Thu, 31 Dec 2020 09:18:55 +0800
Message-ID: <1609377535-29964-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Switch to using the new API kobj_to_dev() to fix the below warnning:
drivers/hwmon/it87.c:2293:60-61: WARNING opportunity for kobj_to_dev()
drivers/hwmon/it87.c:2161:60-61: WARNING opportunity for kobj_to_dev()
drivers/hwmon/it87.c:1984:60-61: WARNING opportunity for kobj_to_dev()
drivers/hwmon/it87.c:2129:60-61: WARNING opportunity for kobj_to_dev()
drivers/hwmon/it87.c:2232:60-61: WARNING opportunity for kobj_to_dev()
drivers/hwmon/it87.c:2068:60-61: WARNING opportunity for kobj_to_dev()

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/hwmon/it87.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index fac9b5c..418a177 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -1981,7 +1981,7 @@ static SENSOR_DEVICE_ATTR(in9_label, S_IRUGO, show_label, NULL, 3);
 static umode_t it87_in_is_visible(struct kobject *kobj,
 				  struct attribute *attr, int index)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct it87_data *data = dev_get_drvdata(dev);
 	int i = index / 5;	/* voltage index */
 	int a = index % 5;	/* attribute index */
@@ -2065,7 +2065,7 @@ static const struct attribute_group it87_group_in = {
 static umode_t it87_temp_is_visible(struct kobject *kobj,
 				    struct attribute *attr, int index)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct it87_data *data = dev_get_drvdata(dev);
 	int i = index / 7;	/* temperature index */
 	int a = index % 7;	/* attribute index */
@@ -2126,7 +2126,7 @@ static const struct attribute_group it87_group_temp = {
 static umode_t it87_is_visible(struct kobject *kobj,
 			       struct attribute *attr, int index)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct it87_data *data = dev_get_drvdata(dev);
 
 	if ((index == 2 || index == 3) && !data->has_vid)
@@ -2158,7 +2158,7 @@ static const struct attribute_group it87_group = {
 static umode_t it87_fan_is_visible(struct kobject *kobj,
 				   struct attribute *attr, int index)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct it87_data *data = dev_get_drvdata(dev);
 	int i = index / 5;	/* fan index */
 	int a = index % 5;	/* attribute index */
@@ -2229,7 +2229,7 @@ static const struct attribute_group it87_group_fan = {
 static umode_t it87_pwm_is_visible(struct kobject *kobj,
 				   struct attribute *attr, int index)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct it87_data *data = dev_get_drvdata(dev);
 	int i = index / 4;	/* pwm index */
 	int a = index % 4;	/* attribute index */
@@ -2290,7 +2290,7 @@ static const struct attribute_group it87_group_pwm = {
 static umode_t it87_auto_pwm_is_visible(struct kobject *kobj,
 					struct attribute *attr, int index)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = konj_to_dev(kobj);
 	struct it87_data *data = dev_get_drvdata(dev);
 	int i = index / 11;	/* pwm index */
 	int a = index % 11;	/* attribute index */
-- 
2.7.4

