Return-Path: <SRS0=HrQm=2P=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABAFC2D0C3
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Dec 2019 02:34:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 71AFE206B7
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Dec 2019 02:34:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="RW3W9p0s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbfLYCeQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Dec 2019 21:34:16 -0500
Received: from mx.treblig.org ([46.43.15.161]:58008 "EHLO mx.treblig.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726258AbfLYCeQ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Dec 2019 21:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
        ; s=bytemarkmx; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZWpHKwv+9uKw0MKy2i7SjAbBkUplalds5upmRXOFTiQ=; b=RW3W9p0sBgcXYfNCjq//Rqv3dI
        v4Hf7OvH7Ci7VI11CjuHMVj8sZE1EMDAPQqfdWFiV3w3piEkGPpGKr/uXO2ws+NQ/uopcBQ3sEDYA
        PMYJv3bhNM/F/V121Kgjm9l61/M4pnv5uT7eomFIl+ByBRJJQzhEKivAGxxZpVNAN0cTRqaHJBHeo
        XKI4EgE2SBBZObxWCGu4o9rIh8MQ3S7xTRO6E1UynH+a2x4S+1kBQamsicNGyjp6JUaaXbSQAkEjB
        C8PvbxOob17ikhYA6DmUsR7LhQpnyTK6OEMepJgdR8Rqqw166obPTkiJB5GYuYqF7dQZ40DVpNINp
        DmnbTNiA==;
Received: from localhost ([127.0.0.1] helo=major.home.treblig.org)
        by mx.treblig.org with esmtp (Exim 4.92)
        (envelope-from <linux@treblig.org>)
        id 1ijwUk-0000lw-76; Wed, 25 Dec 2019 02:33:54 +0000
From:   "Dr. David Alan Gilbert" <linux@treblig.org>
To:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Cc:     "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/3] hwmon: (w83627ehf) Now only one intrusion channel
Date:   Wed, 25 Dec 2019 02:32:25 +0000
Message-Id: <20191225023225.2785-4-linux@treblig.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191225023225.2785-1-linux@treblig.org>
References: <20191225023225.2785-1-linux@treblig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The 2nd intrusion channel was only used on the nct6776

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/hwmon/w83627ehf.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index e13bec80af0b..5a7239eb1c15 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -1091,14 +1091,12 @@ static int
 clear_caseopen(struct device *dev, struct w83627ehf_data *data, int channel,
 	       long val)
 {
-	u16 masks[] = { 0x80, 0x40 };
-	u16 reg, mask;
+	const u16 mask = 0x80;
+	u16 reg;
 
-	if (val != 0 || channel > 1)
+	if (val != 0 || channel != 0)
 		return -EINVAL;
 
-	mask = masks[channel];
-
 	mutex_lock(&data->update_lock);
 	reg = w83627ehf_read_value(data, W83627EHF_REG_CASEOPEN_CLR);
 	w83627ehf_write_value(data, W83627EHF_REG_CASEOPEN_CLR, reg | mask);
@@ -1418,9 +1416,7 @@ w83627ehf_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		break;
 
 	case hwmon_intrusion:
-		if (channel == 0)
-			return 0644;
-		return 0;
+		return 0644;
 
 	default: /* Shouldn't happen */
 		return 0;
@@ -1545,12 +1541,10 @@ static int
 w83627ehf_do_read_intrusion(struct w83627ehf_data *data, u32 attr,
 			    int channel, long *val)
 {
-	unsigned int masks[] = { 0x10, 0x40 };
-
-	if (attr != hwmon_intrusion_alarm || channel > 1)
+	if (attr != hwmon_intrusion_alarm || channel != 0)
 		return -EOPNOTSUPP; /* shouldn't happen */
 
-	*val = !!(data->caseopen & masks[channel]);
+	*val = !!(data->caseopen & 0x10);
 	return 0;
 }
 
@@ -1688,7 +1682,6 @@ static const struct hwmon_channel_info *w83627ehf_info[] = {
 		HWMON_T_ALARM | HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX |
 			HWMON_T_MAX_HYST | HWMON_T_OFFSET | HWMON_T_TYPE),
 	HWMON_CHANNEL_INFO(intrusion,
-		HWMON_INTRUSION_ALARM,
 		HWMON_INTRUSION_ALARM),
 	NULL
 };
-- 
2.24.1

