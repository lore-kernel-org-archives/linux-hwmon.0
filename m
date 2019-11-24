Return-Path: <SRS0=GWx2=ZQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10FEC432C0
	for <linux-hwmon@archiver.kernel.org>; Sun, 24 Nov 2019 20:39:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 554ED2068F
	for <linux-hwmon@archiver.kernel.org>; Sun, 24 Nov 2019 20:39:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Fj5nv1H6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbfKXUjR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 24 Nov 2019 15:39:17 -0500
Received: from mx.treblig.org ([46.43.15.161]:40780 "EHLO mx.treblig.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726875AbfKXUjQ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 24 Nov 2019 15:39:16 -0500
X-Greylist: delayed 1094 seconds by postgrey-1.27 at vger.kernel.org; Sun, 24 Nov 2019 15:39:15 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
        ; s=bytemarkmx; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=UKLzk9+aMkg25pVRQrTUINUs/64+b9TFPz/CKbdrwpw=; b=Fj5nv1H6gmI82htM8KYzvx+mu2
        skdw2C4PzjCAw5I4AsO4CUAndZW9O2UQ+13XxH7O7i5FXq6QXrZa/D9wLVjA3MK8A432sfpws0+tC
        Xc0YS86d1Nc7tb3BshljVbPBeCO+QvQctgdkpYG7mKqajj5ZcTCZWTzC4WogEkfg4Jl8oYDTorezS
        i/bmzCjtc5BiAHM+tpNOFwmmjWrMLoe5I6r4+pUiEKDghHIGwaWdqVETAzhsKNaORdgbfyf/cneA7
        vqDA3ZBwwC1vrimMSU7P+eqavjv+7RiYJVvvqM1gmf/ywrZ4s/GW9YJIM1d/znrpkSpKIsF0NBsfT
        fbqfh8YQ==;
Received: from localhost ([127.0.0.1] helo=major.home.treblig.org)
        by mx.treblig.org with esmtp (Exim 4.92)
        (envelope-from <linux@treblig.org>)
        id 1iYyNB-0000js-NE; Sun, 24 Nov 2019 20:20:45 +0000
From:   "Dr. David Alan Gilbert" <linux@treblig.org>
To:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Cc:     "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/2] hwmon: Add intrusion templates
Date:   Sun, 24 Nov 2019 20:20:29 +0000
Message-Id: <20191124202030.45360-2-linux@treblig.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191124202030.45360-1-linux@treblig.org>
References: <20191124202030.45360-1-linux@treblig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add templates for intrusion%d_alarm and intrusion%d_beep.
Note, these start at 0.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/hwmon/hwmon.c | 9 ++++++++-
 include/linux/hwmon.h | 8 ++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 1f3b30b085b9..95a1ae178213 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -171,7 +171,7 @@ static int hwmon_thermal_add_sensor(struct device *dev,
 
 static int hwmon_attr_base(enum hwmon_sensor_types type)
 {
-	if (type == hwmon_in)
+	if (type == hwmon_in || type == hwmon_intrusion)
 		return 0;
 	return 1;
 }
@@ -458,6 +458,11 @@ static const char * const hwmon_pwm_attr_templates[] = {
 	[hwmon_pwm_freq] = "pwm%d_freq",
 };
 
+static const char * const hwmon_intrusion_attr_templates[] = {
+	[hwmon_intrusion_alarm] = "intrusion%d_alarm",
+	[hwmon_intrusion_beep]  = "intrusion%d_beep",
+};
+
 static const char * const *__templates[] = {
 	[hwmon_chip] = hwmon_chip_attrs,
 	[hwmon_temp] = hwmon_temp_attr_templates,
@@ -468,6 +473,7 @@ static const char * const *__templates[] = {
 	[hwmon_humidity] = hwmon_humidity_attr_templates,
 	[hwmon_fan] = hwmon_fan_attr_templates,
 	[hwmon_pwm] = hwmon_pwm_attr_templates,
+	[hwmon_intrusion] = hwmon_intrusion_attr_templates,
 };
 
 static const int __templates_size[] = {
@@ -480,6 +486,7 @@ static const int __templates_size[] = {
 	[hwmon_humidity] = ARRAY_SIZE(hwmon_humidity_attr_templates),
 	[hwmon_fan] = ARRAY_SIZE(hwmon_fan_attr_templates),
 	[hwmon_pwm] = ARRAY_SIZE(hwmon_pwm_attr_templates),
+	[hwmon_intrusion] = ARRAY_SIZE(hwmon_intrusion_attr_templates),
 };
 
 static int hwmon_num_channel_attrs(const struct hwmon_channel_info *info)
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 72579168189d..dcda9589cdaf 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -27,6 +27,7 @@ enum hwmon_sensor_types {
 	hwmon_humidity,
 	hwmon_fan,
 	hwmon_pwm,
+	hwmon_intrusion,
 	hwmon_max,
 };
 
@@ -306,6 +307,13 @@ enum hwmon_pwm_attributes {
 #define HWMON_PWM_MODE			BIT(hwmon_pwm_mode)
 #define HWMON_PWM_FREQ			BIT(hwmon_pwm_freq)
 
+enum hwmon_intrusion_attributes {
+	hwmon_intrusion_alarm,
+	hwmon_intrusion_beep,
+};
+#define HWMON_INTRUSION_ALARM		BIT(hwmon_intrusion_alarm)
+#define HWMON_INTRUSION_BEEP		BIT(hwmon_intrusion_beep)
+
 /**
  * struct hwmon_ops - hwmon device operations
  * @is_visible: Callback to return attribute visibility. Mandatory.
-- 
2.23.0

