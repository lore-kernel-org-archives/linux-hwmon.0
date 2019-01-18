Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E54C5ACD5
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 385BD20850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvV5+8Es"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728582AbfARRPe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:34 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38908 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728574AbfARRPd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:33 -0500
Received: by mail-pf1-f193.google.com with SMTP id q1so6901454pfi.5
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XlcON0Xt+ZHI5M/yS9WECvetTcYONVXw87YOa8H/o8U=;
        b=RvV5+8EsSvcVGdItyuOe3Yt2FvxF1AW1Aq3Vih6WV7XFkEhQuLPfTTd1RBcw1D1JWX
         PzyCKaxkQ8V+VcV/I6Ib04IgIcKJfoY3Pax0f5LzQDHEK3hbWsUK9t3WbCpKXmnsEv0n
         LtuK088F4/DHrRlP+V+5r2Gn8+4wrqGqcqP9bYTsdbk+LAgi1s/jWo7ImWvVYTX96jy5
         mfadNnYvbgIvP7+klTuJRY/p0LRouBDLUk3lcIc9UXG+0ahYsA59tJDypOH8wkwbUnX3
         tMNkTtKb5xk5ZEDFyCrKW5CX5XGSB3VXn1Cf0jtIV0VjE5iLL8uo0MccG5x4lI1EAHUe
         7NoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=XlcON0Xt+ZHI5M/yS9WECvetTcYONVXw87YOa8H/o8U=;
        b=qgRknBwSW5LAbs4VywxJ8o5lkmp7T1bYkvvo0KOyMk30VqNieNGUXnTlOlyCGN+Cn3
         wg7LFihbb59L9JQJjkW6cYKQyCdFyIhnyVvL3VAe47KGR7Gk/lBA9AL5YT4iL79GIKL3
         8r5Tb5YtgnTw54+Swdeaap2tWyzIAqyxY1bZloXjiADquZ0qDEIU3faHUIxeSrE1KwRO
         k1YSnf5cAHqeEmsaONsJhxHyafzVugxX1Mn0FTpjJbjhg/7Ts/p2e+/jezEWxrM31M7i
         RLv6N3Gigsr9z5TA2pWCl4Ntm2BXA+9pLAger3ReEwKQAKia7QNobQQ8Wip5gc8pEoGR
         bAdg==
X-Gm-Message-State: AJcUukcY1aGeK4pKNkD0vnpzYA7kuimGN3ZbXQpG23WIz2YVSY6DsIeE
        csJs6RyNTx5COM3pemsCmJzSxFup
X-Google-Smtp-Source: ALg8bN6hn92jNMUwcHRL9NrNH+jXDNTQMQ7xsft42z17HBPiXMWYz3EOaFbpR08bHwV62fgpzgF+kQ==
X-Received: by 2002:a63:6442:: with SMTP id y63mr18371439pgb.450.1547831732709;
        Fri, 18 Jan 2019 09:15:32 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e187sm7209932pfa.130.2019.01.18.09.15.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:32 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 17/30] hwmon: (scmi-hwmon) Replace S_<PERMS> with octal values
Date:   Fri, 18 Jan 2019 09:14:47 -0800
Message-Id: <1547831700-15865-18-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
References: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Replace S_<PERMS> with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/scmi-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
index 2e005edee0c9..a80183a488c5 100644
--- a/drivers/hwmon/scmi-hwmon.c
+++ b/drivers/hwmon/scmi-hwmon.c
@@ -57,7 +57,7 @@ scmi_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 
 	sensor = *(scmi_sensors->info[type] + channel);
 	if (sensor)
-		return S_IRUGO;
+		return 0444;
 
 	return 0;
 }
-- 
2.7.4

