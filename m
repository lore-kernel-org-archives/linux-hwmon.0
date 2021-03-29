Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAE2C433E6
	for <linux-hwmon@archiver.kernel.org>; Mon, 29 Mar 2021 08:23:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2A2261581
	for <linux-hwmon@archiver.kernel.org>; Mon, 29 Mar 2021 08:23:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbhC2IXY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 29 Mar 2021 04:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233952AbhC2IWi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Mar 2021 04:22:38 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE09C061756
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Mar 2021 01:22:38 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id cx5so6033013qvb.10
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Mar 2021 01:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protocubo.io; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pFX+Tz+rEN0+9Vsov9EqDkuW92yjtKRmUMQ/vRcw69s=;
        b=Xf2NpZDiG1wAEvcMjalq9edHulvwkltxcQaZq+RVUr3/GEH4KDqHbcuTPmM3ADB5gz
         lfEMKL3HctEy+/t5GXwTUJos8dVAEud5Xh6mUEEQcyDy7CjQKaekZbQImQ6MHlrVLDwP
         6ubpxpJjUdQ/ptgdqulRAK/XFOYMv69712wUXrqJoho9S6WQ8tN9S27DbY76ULn14+yV
         Odba+dYOZ6cQVc5925jEUBTiSlheezwseWthHAF2S7FJeLfoXwsOfIe1gahFmZ5Ii8YW
         8e/fAD9xGX7+VsQcE0QWE8P5WeJ5jb1X0e2EssZSCyJhrcxfZ3sfgIFsd3VRGlRqxmG2
         wXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pFX+Tz+rEN0+9Vsov9EqDkuW92yjtKRmUMQ/vRcw69s=;
        b=DLHPQj/cQgN6FBuUNZZKVI1rqKxa4+HHMTxcSfeOsh//HLdUEdDIq5+d828pdW0j7D
         wTBmUWZkew1tESb6BldhyCdWceT9o08/gyijkBiYQiGV1wm+Aq/VjFSuqfLcjj+qzzSr
         wzBR5xgZVbDWX0RJOqiuK4OCd5y7Lp60qqjKHphbIVwBtBTFaPQpmiOY9BBzEXhnfqE8
         k+ByI7xSU5I1KT6tp7CpDRzCrxERHybLYOPZBMNI/Yds90Je/5QBxWgiQ7sKWyoYY3A2
         atbz7+wcyYNnPKSZFULsXVSo6nZnUsQt5RWwCIzgBTh6AWqGE0ELuIlAkNFhQxjFO/lq
         kM3A==
X-Gm-Message-State: AOAM533fP50nMGEfJEoarUPzxCi8BwnnTMisxiT+XXxJAQ4VjXDnna4j
        fxEeMjxgqsy81rX3ZeTYv74LBw==
X-Google-Smtp-Source: ABdhPJxvfWope6tzVCK0RePEwSgpVm61Rwt6KBlNGoVj+R5g54jCcLI20dGEV8NPkCs0CLWxqrFanQ==
X-Received: by 2002:ad4:4e53:: with SMTP id eb19mr24598391qvb.8.1617006157635;
        Mon, 29 Mar 2021 01:22:37 -0700 (PDT)
Received: from calvin.localdomain ([2804:14d:5c5a:802e:bdc9:ded9:cc08:a4e9])
        by smtp.gmail.com with ESMTPSA id n1sm5323412qtp.76.2021.03.29.01.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 01:22:37 -0700 (PDT)
From:   Jonas Malaco <jonas@protocubo.io>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Jonas Malaco <jonas@protocubo.io>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (nzxt-kraken2) mark and order concurrent accesses
Date:   Mon, 29 Mar 2021 05:22:01 -0300
Message-Id: <20210329082211.86716-1-jonas@protocubo.io>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

To avoid a spinlock, the driver explores concurrent memory accesses
between _raw_event and _read, having the former updating fields on a
data structure while the latter could be reading from them.  Because
these are "plain" accesses, those are data races according to the Linux
kernel memory model (LKMM).

Data races are undefined behavior in both C11 and LKMM.  In practice,
the compiler is free to make optimizations assuming there is no data
race, including load tearing, load fusing and many others,[1] most of
which could result in corruption of the values reported to user-space.

Prevent undesirable optimizations to those concurrent accesses by
marking them with READ_ONCE() and WRITE_ONCE().  This also removes the
data races, according to the LKMM, because both loads and stores to each
location are now "marked" accesses.

As a special case, use smp_load_acquire() and smp_load_release() when
loading and storing ->updated, as it is used to track the validity of
the other values, and thus has to be stored after and loaded before
them.  These imply READ_ONCE()/WRITE_ONCE() but also ensure the desired
order of memory accesses.

[1] https://lwn.net/Articles/793253/

Signed-off-by: Jonas Malaco <jonas@protocubo.io>
---
 drivers/hwmon/nzxt-kraken2.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/nzxt-kraken2.c b/drivers/hwmon/nzxt-kraken2.c
index 89f7ea4f42d4..f4fbc8771930 100644
--- a/drivers/hwmon/nzxt-kraken2.c
+++ b/drivers/hwmon/nzxt-kraken2.c
@@ -46,16 +46,22 @@ static int kraken2_read(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long *val)
 {
 	struct kraken2_priv_data *priv = dev_get_drvdata(dev);
+	unsigned long expires;
 
-	if (time_after(jiffies, priv->updated + STATUS_VALIDITY * HZ))
+	/*
+	 * Order load from ->updated before the data it refers to.
+	 */
+	expires = smp_load_acquire(&priv->updated) + STATUS_VALIDITY * HZ;
+
+	if (time_after(jiffies, expires))
 		return -ENODATA;
 
 	switch (type) {
 	case hwmon_temp:
-		*val = priv->temp_input[channel];
+		*val = READ_ONCE(priv->temp_input[channel]);
 		break;
 	case hwmon_fan:
-		*val = priv->fan_input[channel];
+		*val = READ_ONCE(priv->fan_input[channel]);
 		break;
 	default:
 		return -EOPNOTSUPP; /* unreachable */
@@ -119,12 +125,15 @@ static int kraken2_raw_event(struct hid_device *hdev,
 	 * and that the missing steps are artifacts of how the firmware
 	 * processes the raw sensor data.
 	 */
-	priv->temp_input[0] = data[1] * 1000 + data[2] * 100;
+	WRITE_ONCE(priv->temp_input[0], data[1] * 1000 + data[2] * 100);
 
-	priv->fan_input[0] = get_unaligned_be16(data + 3);
-	priv->fan_input[1] = get_unaligned_be16(data + 5);
+	WRITE_ONCE(priv->fan_input[0], get_unaligned_be16(data + 3));
+	WRITE_ONCE(priv->fan_input[1], get_unaligned_be16(data + 5));
 
-	priv->updated = jiffies;
+	/*
+	 * Order store to ->updated after the data it refers to.
+	 */
+	smp_store_release(&priv->updated, jiffies);
 
 	return 0;
 }

base-commit: 644b9af5c605762feffac96bd7ea2499e0197656
-- 
2.31.1

