Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F99C433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Dec 2021 20:01:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243134AbhLJUFZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Dec 2021 15:05:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240266AbhLJUFZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Dec 2021 15:05:25 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1286C061746
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Dec 2021 12:01:49 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id x3-20020a05683000c300b0057a5318c517so10647331oto.13
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Dec 2021 12:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oilA2TBjRF3Di23uPtnJJY9cvZw18ecRGUkDSA8T+KI=;
        b=HMKpr4vM1UAhsuGKg0Na0AW3j94xvmGhoo1p8IBsKct1fPSJyCc2lstrokCiY/n8cU
         I6XLv46/rGRT7qYyUwIC/h5ho5BuUXMa7WfcKIXXiLFAVPux6yR1IL8RveCTdQN7keDI
         wpzzSjGZzgC/Ot++3ww9Ze88nwOMDtuw2PkDnDeedbE5SsKrNIhrORIMAzZ5KXFatdPG
         NCB+NmovzfuAClj3EpQP+1mvAaWfWPJoG+01qYXFmbf14JUn9/G2Sy5O9H0M33hLBh/v
         dfoQBHZtMjPoCUTY98mnVXJ964n29+ppYicOd3/YfLtFh4845VUjEcBxCdZXwaJOggif
         5dnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=oilA2TBjRF3Di23uPtnJJY9cvZw18ecRGUkDSA8T+KI=;
        b=HhkFaqW/R2Entw4Z9xDNdCIjFBtxF059cVVNgwoHKxiy4wDDKKDyOpzVeIvEy2HiLR
         oW5pR9lvd500iNwQa6d4K+wEkNSNGm7P0q3GXpsKiXM3r/A41HuCBznQewSMbvjSM1eK
         ULKG1AusVNFqg20NP4W0eS588R80GnFWd7ieq9V5G6msEwQTdAFECOiMfndebysD2BHx
         NcJgJvUsmYF8uDeeNMKBzvjEeGOmiiIylnGecpqBvrgJBfODcVgVHwAoNQ5fo8orOIqJ
         NjGVdcSGuW050TgHQiNiDgK+TluF4Uzo7d6kJk6muy6a3hr/vL8ftRW18E9mZlX1OhaL
         exYA==
X-Gm-Message-State: AOAM5306WTv0lUSa0BvqTjxTMNgNKfKAMkEc8eAytxQy1DA1Gm6e1Bsj
        yGJiBfo49IH78qbDBt4cRb/gBDGN+4I=
X-Google-Smtp-Source: ABdhPJwdKgOr9HGjp494STi8jUJv2XBrOXDgBVREUhDz3rJE47+dyjSMCjqdiZR9+k0t2ZrL2IMsEA==
X-Received: by 2002:a9d:7454:: with SMTP id p20mr12267750otk.307.1639166508712;
        Fri, 10 Dec 2021 12:01:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d8sm972619oiw.24.2021.12.10.12.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 12:01:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/5] hwmon: (lm90) Do not report 'busy' status bit as alarm
Date:   Fri, 10 Dec 2021 12:01:36 -0800
Message-Id: <20211210200136.1662127-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211210200136.1662127-1-linux@roeck-us.net>
References: <20211210200136.1662127-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Bit 7 of the status register indicates that the chip is busy
doing a conversion. It does not indicate an alarm status.
Stop reporting it as alarm status bit.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index dd8612a9d536..74019dff2550 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -200,6 +200,7 @@ enum chips { lm90, adm1032, lm99, lm86, max6657, max6659, adt7461, max6680,
 #define LM90_STATUS_RHIGH	(1 << 4) /* remote high temp limit tripped */
 #define LM90_STATUS_LLOW	(1 << 5) /* local low temp limit tripped */
 #define LM90_STATUS_LHIGH	(1 << 6) /* local high temp limit tripped */
+#define LM90_STATUS_BUSY	(1 << 7) /* conversion is ongoing */
 
 #define MAX6696_STATUS2_R2THRM	(1 << 1) /* remote2 THERM limit tripped */
 #define MAX6696_STATUS2_R2OPEN	(1 << 2) /* remote2 is an open circuit */
@@ -820,7 +821,7 @@ static int lm90_update_device(struct device *dev)
 		val = lm90_read_reg(client, LM90_REG_R_STATUS);
 		if (val < 0)
 			return val;
-		data->alarms = val;	/* lower 8 bit of alarms */
+		data->alarms = val & ~LM90_STATUS_BUSY;
 
 		if (data->kind == max6696) {
 			val = lm90_select_remote_channel(data, 1);
-- 
2.33.0

