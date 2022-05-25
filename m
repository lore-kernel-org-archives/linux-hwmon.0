Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29CFC433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 May 2022 14:20:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235286AbiEYOU0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 May 2022 10:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233950AbiEYOUX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 May 2022 10:20:23 -0400
X-Greylist: delayed 1384 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 25 May 2022 07:20:23 PDT
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com [192.185.46.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43DCD9C2D2
        for <linux-hwmon@vger.kernel.org>; Wed, 25 May 2022 07:20:23 -0700 (PDT)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway22.websitewelcome.com (Postfix) with ESMTP id 87ACA138EC
        for <linux-hwmon@vger.kernel.org>; Wed, 25 May 2022 08:57:18 -0500 (CDT)
Received: from 162-215-252-169.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id trVmnCR9o7PdJtrVmnsURM; Wed, 25 May 2022 08:57:18 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=d1b5nILyGqqpNbh83B6jQJVoKjYjPJ5yWnONtHERzTk=; b=pQlJ3e5PcDe4A5ueNDoqI7BkQi
        2yEaxbPAluzHtnsCga8UgsQXNCaigGQ7aN1qvx162RxRJO6xUeA84kpL2J7XFKjXHcyVeSkkUtCwh
        bUQXtcFU17+aRcHTyRDOLH1lhWAI2dDlo9AanGp0HL3EGsGNDGtEtzFew8J6mtHl4IJWII6ZL9boi
        8+hMDZpNa1beELrVZR1JWRfB0RqDKw25vtfQp6qlTzSpgX2IsHrS8kRynVRT4oiKdxs3p47OQT5xT
        PyvxnJVY/3+lAdkrqr3RSNsU2hizxouxNeeQ4sjpZpYX9am4suXFsXBAha+ez3Lnl63LhN0pWnEEd
        wpStdYIg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:58266 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1ntrVl-000P4b-UR; Wed, 25 May 2022 13:57:18 +0000
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Slawomir Stepien <sst@poczta.fm>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 01/40] hwmon: (lm90) Generate sysfs and udev events for all alarms
Date:   Wed, 25 May 2022 06:56:30 -0700
Message-Id: <20220525135709.2899592-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525135709.2899592-1-linux@roeck-us.net>
References: <20220525135709.2899592-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1ntrVl-000P4b-UR
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:58266
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 8
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

So far the driver only generated sysfs and udev events for minimum and
maximum alarms. Also generate events for critical and emergency alarms.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 3820f0e61510..83d027c134be 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -1829,6 +1829,26 @@ static bool lm90_is_tripped(struct i2c_client *client, u16 *status)
 		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
 				   hwmon_temp_max_alarm, 2);
 
+	if (st & LM90_STATUS_LTHRM)
+		hwmon_notify_event(hwmon_dev, hwmon_temp,
+				   hwmon_temp_crit_alarm, 0);
+	if (st & LM90_STATUS_RTHRM)
+		hwmon_notify_event(hwmon_dev, hwmon_temp,
+				   hwmon_temp_crit_alarm, 1);
+	if (st2 & MAX6696_STATUS2_R2THRM)
+		hwmon_notify_event(hwmon_dev, hwmon_temp,
+				   hwmon_temp_crit_alarm, 2);
+
+	if (st2 & MAX6696_STATUS2_LOT2)
+		hwmon_notify_event(hwmon_dev, hwmon_temp,
+				   hwmon_temp_emergency_alarm, 0);
+	if (st2 & MAX6696_STATUS2_ROT2)
+		hwmon_notify_event(hwmon_dev, hwmon_temp,
+				   hwmon_temp_emergency_alarm, 1);
+	if (st2 & MAX6696_STATUS2_R2OT2)
+		hwmon_notify_event(hwmon_dev, hwmon_temp,
+				   hwmon_temp_emergency_alarm, 2);
+
 	return true;
 }
 
-- 
2.35.1

