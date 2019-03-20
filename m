Return-Path: <SRS0=9YG5=RX=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEF1C43381
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Mar 2019 17:37:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0EF3221873
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Mar 2019 17:37:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSAKyGOL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfCTRhq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 Mar 2019 13:37:46 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39068 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfCTRhq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Mar 2019 13:37:46 -0400
Received: by mail-pg1-f193.google.com with SMTP id h8so2304282pgp.6
        for <linux-hwmon@vger.kernel.org>; Wed, 20 Mar 2019 10:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=DrzHTIMRuqG6UCWyxPGLz4xDS5FGMsFVoEzXETXAk+M=;
        b=ZSAKyGOLVzcp89D8Pt6EuS9tzIb7o5xU+IO1GJpUI7X/cMAIKPsiLyfzmvrp2XkyqY
         vdILHyxRjBBwm0KaFqWEJ/Yp0duNdKM7U/RJKZ48V1oLfRqRUA62G/pf8ekC3pQVqQdQ
         AmHJtIva4DZTSeIj/dmRtqYVSCJWG3l1PBRZc5S8a6qKLIPz+t7PqcqLDoOEp98vQtbL
         R6r3TKmWn0epHW91KvNUg8IB/iMOW9x1eqQCV1XfI1eO6QND4TCIcPg8P5H6k9kJUfzj
         DNKcbkWcFfP1WlDn8wUenC6i5QMgZH3fzEyPf2dI6X2s04h6OeSS6r/EbhWirbyRBPcj
         nU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=DrzHTIMRuqG6UCWyxPGLz4xDS5FGMsFVoEzXETXAk+M=;
        b=PwyQz04N39NHLJ7fr9GNQe9KsrcO04BrqLtmb0FCfmGR2KkoCbsTwJMb/i4DHOy5Rf
         x8CL5D/zZKSKUBSaXqqWAOILIpune1VDhxUibi9Zvx7tJH4fWy+oNB4oozEmebgL17RJ
         LDLO21gVpNxSkRyDR0YmSfkLyOklXF8mxAd7/30f++DHt7NGB4r0XY3vQ/DdE9qLzrzn
         7C3rMC5pLjsPA2wUqYEQ0SkiiRaBr4ON/gXWvVW7ii4uU5J3YLWSL5iJhiAQqKQRJlRW
         7gI8DCP+xEIbXSrJneVZZ1XJe9F3p4QD9b99E9cGZzks3yUzQwuxvzobLVEezn8o35ga
         KRnQ==
X-Gm-Message-State: APjAAAWRTNKnGfFO3gSPbUTw95Gk3pZNOKNIeyQgTxvICRghY6fem+Qd
        hbAwCh/cIXprv1JJYfORzgbT0tu3
X-Google-Smtp-Source: APXvYqw6d0zU1SkY8h3WHN+7XBp7WjDRIRIdMg4KykxG22Gb9eE3V5dmVi5hH9sbIg/K1bxuw/8dcQ==
X-Received: by 2002:a63:ee58:: with SMTP id n24mr29110755pgk.247.1553103465489;
        Wed, 20 Mar 2019 10:37:45 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n15sm7310418pgc.92.2019.03.20.10.37.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Mar 2019 10:37:44 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (ntc_thermistor) Fix temperature type reporting
Date:   Wed, 20 Mar 2019 10:37:42 -0700
Message-Id: <1553103462-22902-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Commit 7cc7de93fad4 ("hwmon: (ntc_thermistor) Convert to new hwmon API")
converted the driver to use the new hwmon API, but introduced a subtle
error: The temperature type is no longer reported as temp1_type, but as
temp2_type.

Fixes: 7cc7de93fad4 ("hwmon: (ntc_thermistor) Convert to new hwmon API")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ntc_thermistor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index e4f9f7ce92fa..f9abeeeead9e 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -640,7 +640,7 @@ static const struct hwmon_channel_info ntc_chip = {
 };
 
 static const u32 ntc_temp_config[] = {
-	HWMON_T_INPUT, HWMON_T_TYPE,
+	HWMON_T_INPUT | HWMON_T_TYPE,
 	0
 };
 
-- 
2.7.4

