Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BC2C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Dec 2021 20:01:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243110AbhLJUFX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Dec 2021 15:05:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240266AbhLJUFX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Dec 2021 15:05:23 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECD1FC061746
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Dec 2021 12:01:47 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id t19so14735764oij.1
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Dec 2021 12:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ffwWNqDP2HZVSmFNMnkPXbuxKunkVFyJ7rjF1atSMSU=;
        b=Y+tepQTm62LmlGDhvTWUaOvTexeCVOOXZawJX4I+ZFwOjz5LF/AwpqtLessZeQmZU3
         El0Z4M7uCWj4WGIOiM0HUSqb1RwwWnHLaJlWeJfbD55Rd6QJaudvFv9cFWz97T7KHSss
         yG9x0JjyUF2rWKaPU1vdfXb/2x+DzUAJXdRWTEWr31Xi4nqKVhSBJqkuAtTq3eojvN3K
         QHNFpPwlAMDyQR9TIFJ2Wkz5Q9stIprY1Qd01lfMZFs58tEZLTb9+p+HmjeGTvT84WCL
         zPTpeueS2gYEeFoLvEqh+C/HU1UJ50xDXA3o8w9PtpxB4rFXV8PMYnssG5lzry39tHZ4
         FFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=ffwWNqDP2HZVSmFNMnkPXbuxKunkVFyJ7rjF1atSMSU=;
        b=wFAwvNCYOImD6Ym3JR4PJpSLAIV64PDIIulV4CYBQxwOPNnLjxD+Vkn7bRkyONoBvf
         YtmeaeYaTX9LZS/Rm90tsOjDnrRG7CiJPHEVpNewQpBRlLQh4rI2zaS4JS3hEXsx52Ug
         QT/kZa2th6Kx2//oGMmHP3ubGNnkrD/G1vIX9i2XXWByP8fHSnbkB48vcO7bK5/DaXAl
         0f7zWGX97YxH9rIhd3WGoHYKVze1jdOncVlEFHJst7+A2JLPnHD7K31RsEzZYk4oeWIs
         46oJzIEZFE89HS9JCptQlc5VW+0iwRkqRAHOAIUbxoZl01s+Io5ROhU+/iDkYS0uG1J4
         9eIQ==
X-Gm-Message-State: AOAM531digVRaXNJZcEepxNqy/uqX1Te1lIjCBl0w99BlNoyPeHcM5ze
        9D8xyRE15+RQfe/VS8UxomvyPaTJNp8=
X-Google-Smtp-Source: ABdhPJzsd9k7GB7kHLZVOvMt8aMNubVpll8/wgXL316WB2TEmBnVcBmNIu9A5xY4CEbVpjoxIGvpnA==
X-Received: by 2002:a05:6808:f01:: with SMTP id m1mr14995645oiw.166.1639166507052;
        Fri, 10 Dec 2021 12:01:47 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e26sm674971oog.46.2021.12.10.12.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 12:01:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/5] hwmom: (lm90) Fix citical alarm status for MAX6680/MAX6681
Date:   Fri, 10 Dec 2021 12:01:35 -0800
Message-Id: <20211210200136.1662127-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211210200136.1662127-1-linux@roeck-us.net>
References: <20211210200136.1662127-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Tests with a real chip and a closer look into the datasheet reveals
that the local and remote critical alarm status bits are swapped for
MAX6680/MAX6681.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 6597d055e09d..dd8612a9d536 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -190,6 +190,7 @@ enum chips { lm90, adm1032, lm99, lm86, max6657, max6659, adt7461, max6680,
 #define LM90_HAVE_EXTENDED_TEMP	(1 << 8) /* extended temperature support*/
 #define LM90_PAUSE_FOR_CONFIG	(1 << 9) /* Pause conversion for config	*/
 #define LM90_HAVE_CRIT		(1 << 10)/* Chip supports CRIT/OVERT register	*/
+#define LM90_HAVE_CRIT_ALRM_SWP	(1 << 11)/* critical alarm bits swapped	*/
 
 /* LM90 status */
 #define LM90_STATUS_LTHRM	(1 << 0) /* local THERM limit tripped */
@@ -415,7 +416,8 @@ static const struct lm90_params lm90_params[] = {
 		.reg_local_ext = MAX6657_REG_R_LOCAL_TEMPL,
 	},
 	[max6680] = {
-		.flags = LM90_HAVE_OFFSET | LM90_HAVE_CRIT,
+		.flags = LM90_HAVE_OFFSET | LM90_HAVE_CRIT
+		  | LM90_HAVE_CRIT_ALRM_SWP,
 		.alert_alarms = 0x7c,
 		.max_convrate = 7,
 	},
@@ -1201,6 +1203,7 @@ static const u8 lm90_temp_emerg_index[3] = {
 static const u8 lm90_min_alarm_bits[3] = { 5, 3, 11 };
 static const u8 lm90_max_alarm_bits[3] = { 6, 4, 12 };
 static const u8 lm90_crit_alarm_bits[3] = { 0, 1, 9 };
+static const u8 lm90_crit_alarm_bits_swapped[3] = { 1, 0, 9 };
 static const u8 lm90_emergency_alarm_bits[3] = { 15, 13, 14 };
 static const u8 lm90_fault_bits[3] = { 0, 2, 10 };
 
@@ -1226,7 +1229,10 @@ static int lm90_temp_read(struct device *dev, u32 attr, int channel, long *val)
 		*val = (data->alarms >> lm90_max_alarm_bits[channel]) & 1;
 		break;
 	case hwmon_temp_crit_alarm:
-		*val = (data->alarms >> lm90_crit_alarm_bits[channel]) & 1;
+		if (data->flags & LM90_HAVE_CRIT_ALRM_SWP)
+			*val = (data->alarms >> lm90_crit_alarm_bits_swapped[channel]) & 1;
+		else
+			*val = (data->alarms >> lm90_crit_alarm_bits[channel]) & 1;
 		break;
 	case hwmon_temp_emergency_alarm:
 		*val = (data->alarms >> lm90_emergency_alarm_bits[channel]) & 1;
-- 
2.33.0

