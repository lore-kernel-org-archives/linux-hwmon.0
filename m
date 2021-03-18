Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA258C433E0
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Mar 2021 19:09:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1CEE64EFC
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Mar 2021 19:09:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbhCRTJB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Mar 2021 15:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232814AbhCRTIu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Mar 2021 15:08:50 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46548C06174A
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Mar 2021 12:08:50 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id m13so2092592oiw.13
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Mar 2021 12:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=9I4r2OcfTv/qNZ3zNWdpHR2WfEfuTKeMdVcdeJNCuC0=;
        b=PDVjMuDGMLQy/VgH4WQG7DBCCquUGNnsJIL0+vV7/Ng0ur4H7JKf74+iOywXogWatF
         N7VO+3wh10AiD3t+2wT9WJUkTIKO39pxieBHVb0XBgfOYrhtcLz6JGUwbCNqNSRYeS9R
         RlQpn7I6+/nc5wWDb/HL8pakl7aOn+NIWS7OPtyWYsitkutnuqP9OHsNoryWldJz68aO
         +3e+Voznw76Qgi8N5DuKsFHRWxfefRd2O5GTCd0GlUJheiAlYBcNcZoidrTC2AH+qSmH
         dlabshBVjkFhZl0TGB+F3dWabvnwG6F+Wx6guFH/ngnl14KKQG2nm7OQ7mPIg3ysDNQ8
         qIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=9I4r2OcfTv/qNZ3zNWdpHR2WfEfuTKeMdVcdeJNCuC0=;
        b=WgvAJBBUa96Q8fUDZUVWGTE2eTiqY5LAhSaLesR5irotFuN5YIbQ1f3HD2GqbsNBQ7
         8mqVlkLu0OQkyfOi/ZqEdsI12gH/m9sUQllR8oJhj0FHdnenkgcNBwLOiSjN4Y1Ki09u
         qqZ2/p/bWwTQgDUokxJZk87MSPR7ji9RJ3mfHQ6Bsu1RRx4mPtBgTab8qk59dQH4U4j1
         zTGllvb1dBHkH4b4OV473p7fmXoyzw31f+xraGraLQ6pksuBD93nyuZ6zo/3begssa9u
         7Hx0psUpHQWdxX2WpgtJbXu27L8vU5Ogbyj9fbXlJrgEchAetBf2I+pj+/l5x/TbOtQQ
         7V8A==
X-Gm-Message-State: AOAM530fq8Ajy0MgnS+zf9Bq1paQ/wr5twiztiG+2D6Fq7fSPvnz0cTW
        txbfX8s71u91hWTJNFArdgCvBvO7YgI=
X-Google-Smtp-Source: ABdhPJz4SWQ9cW0EMsdUINmyHpM1IMHLl/034t/Mgz4y+kFq0F0NykcdEa3NFusv4Btqt2aPG7nNfA==
X-Received: by 2002:aca:3654:: with SMTP id d81mr1923642oia.118.1616094529336;
        Thu, 18 Mar 2021 12:08:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k11sm684035otp.28.2021.03.18.12.08.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Mar 2021 12:08:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: Use kobj_to_dev()
Date:   Thu, 18 Mar 2021 12:08:46 -0700
Message-Id: <20210318190846.214295-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

coccinelle complains about

WARNING opportunity for kobj_to_dev()

in several files, resulting in one-by-one patch submissions.
Handle all remaining instances in one go.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adc128d818.c |  2 +-
 drivers/hwmon/it87.c       | 12 ++++++------
 drivers/hwmon/lm63.c       |  2 +-
 drivers/hwmon/ltc2990.c    |  2 +-
 drivers/hwmon/max16065.c   |  4 ++--
 drivers/hwmon/max6697.c    |  2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
index 6c9a906631b8..fd938c70293f 100644
--- a/drivers/hwmon/adc128d818.c
+++ b/drivers/hwmon/adc128d818.c
@@ -248,7 +248,7 @@ static ssize_t adc128_alarm_show(struct device *dev,
 static umode_t adc128_is_visible(struct kobject *kobj,
 				 struct attribute *attr, int index)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct adc128_data *data = dev_get_drvdata(dev);
 
 	if (index < ADC128_ATTR_NUM_VOLT) {
diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index fac9b5c68a6a..1f93134afcb9 100644
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
+	struct device *dev = kobj_to_dev(kobj);
 	struct it87_data *data = dev_get_drvdata(dev);
 	int i = index / 11;	/* pwm index */
 	int a = index % 11;	/* attribute index */
diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
index 50f67265c71d..c8f93c5d1ccc 100644
--- a/drivers/hwmon/lm63.c
+++ b/drivers/hwmon/lm63.c
@@ -931,7 +931,7 @@ static const struct attribute_group lm63_group_extra_lut = {
 static umode_t lm63_attribute_mode(struct kobject *kobj,
 				   struct attribute *attr, int index)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct lm63_data *data = dev_get_drvdata(dev);
 
 	if (attr == &sensor_dev_attr_temp2_crit.dev_attr.attr
diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
index 78b191b26bb2..fcd31c4fc15e 100644
--- a/drivers/hwmon/ltc2990.c
+++ b/drivers/hwmon/ltc2990.c
@@ -153,7 +153,7 @@ static ssize_t ltc2990_value_show(struct device *dev,
 static umode_t ltc2990_attrs_visible(struct kobject *kobj,
 				     struct attribute *a, int n)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct ltc2990_data *data = dev_get_drvdata(dev);
 	struct device_attribute *da =
 			container_of(a, struct device_attribute, attr);
diff --git a/drivers/hwmon/max16065.c b/drivers/hwmon/max16065.c
index a26226e7bc37..0de2da3e5c46 100644
--- a/drivers/hwmon/max16065.c
+++ b/drivers/hwmon/max16065.c
@@ -454,7 +454,7 @@ static struct attribute *max16065_max_attributes[] = {
 static umode_t max16065_basic_is_visible(struct kobject *kobj,
 					 struct attribute *a, int n)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct max16065_data *data = dev_get_drvdata(dev);
 	int index = n / 4;
 
@@ -466,7 +466,7 @@ static umode_t max16065_basic_is_visible(struct kobject *kobj,
 static umode_t max16065_secondary_is_visible(struct kobject *kobj,
 					     struct attribute *a, int index)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct max16065_data *data = dev_get_drvdata(dev);
 
 	if (index >= data->num_adc)
diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index fc3241101178..2895cea54193 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -460,7 +460,7 @@ static DEVICE_ATTR(dummy, 0, NULL, NULL);
 static umode_t max6697_is_visible(struct kobject *kobj, struct attribute *attr,
 				  int index)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct max6697_data *data = dev_get_drvdata(dev);
 	const struct max6697_chip_data *chip = data->chip;
 	int channel = index / 7;	/* channel number */
-- 
2.17.1

