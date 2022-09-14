Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956C8ECAAD3
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Sep 2022 10:48:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbiINKsZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Sep 2022 06:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbiINKsR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Sep 2022 06:48:17 -0400
X-Greylist: delayed 1213 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 14 Sep 2022 03:48:16 PDT
Received: from gateway31.websitewelcome.com (gateway31.websitewelcome.com [192.185.144.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 787F060515
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Sep 2022 03:48:16 -0700 (PDT)
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
        by gateway31.websitewelcome.com (Postfix) with ESMTP id 747331FD89
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Sep 2022 05:28:03 -0500 (CDT)
Received: from 162-215-252-169.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id YPcgonbUVSQZkYPchoGOsb; Wed, 14 Sep 2022 05:28:03 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=A2S4dR+8Kp5iQy6Y9kU/xD3NENSfCkstOu7cRUZu+Ys=; b=PS0VAPJNVqZNTFvYxXvFJIS3QY
        7/cJDI8UazRqwAfC+18XE5/i31amGxFvmoTSNsn9AzxHHFduvdQh4mo1p8BEKaCyYGYFc1YkP4fnk
        7ZTRx3lOdbe8g7cg87VAwEL4qW0EZILnDQbTG2E0UbyoOCwCWxiOBbMZFqwBsH4VuCCOfp7k6MCRn
        vW+V+HYID8EJDfSUC2Z0x0bvra1geD/lF43NJQ9tBRl8AaO6ffoO/ZZrkHM8TouMhLt/1Qo4qY3yG
        eddWY8vXKNqofYuiyiAARgwmA8QAoOq4bCbKcH96C3XvF5hIimClDNPpDxp6QyOprUpZTrJKVSnIF
        Wm/Fggig==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42516 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <linux@roeck-us.net>)
        id 1oYPcg-0045qb-Ed;
        Wed, 14 Sep 2022 10:28:02 +0000
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH] hwmon: (emc2305) Remove unnecessary range check
Date:   Wed, 14 Sep 2022 03:27:55 -0700
Message-Id: <20220914102755.1874266-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.36.2
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
X-Exim-ID: 1oYPcg-0045qb-Ed
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:42516
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 21
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Static analyzers report:

drivers/hwmon/emc2305.c:194 emc2305_set_cur_state()
	warn: impossible condition '(val > 255) => (0-255 > 255)'

'val' is u8 and thus can never be larger than 255. In theory
the operation calculating 'val' could result in a value larger
than 255, but this won't happen because its parameter has already
been range checked and it is guaranteed that the result never exceeds
255. Remove the unnecessary value check.

Cc: Michael Shych <michaelsh@nvidia.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/emc2305.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index ee5ed24feab5..bb32172e07e3 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -191,8 +191,6 @@ static int emc2305_set_cur_state(struct thermal_cooling_device *cdev, unsigned l
 	state = max_t(unsigned long, state, data->cdev_data[cdev_idx].last_hwmon_state);
 
 	val = EMC2305_PWM_STATE2DUTY(state, data->max_state, EMC2305_FAN_MAX);
-	if (val > EMC2305_FAN_MAX)
-		return -EINVAL;
 
 	data->cdev_data[cdev_idx].cur_state = state;
 	if (data->pwm_separate) {
-- 
2.36.2

