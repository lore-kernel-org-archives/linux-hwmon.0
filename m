Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC366C43460
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Apr 2021 17:49:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 880A8610C8
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Apr 2021 17:49:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234049AbhDIRtO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 9 Apr 2021 13:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234278AbhDIRtN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Apr 2021 13:49:13 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7C5C061762
        for <linux-hwmon@vger.kernel.org>; Fri,  9 Apr 2021 10:49:00 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id a8so6569478oic.11
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Apr 2021 10:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uS7RFfWALLx1slSnuR6WSJI4tYmkC4uXEgPPfOUaF8k=;
        b=oeics08os0jjn5ll/kU2Dh6fW70oZPQ+WUQbHJAca63d59QIUvqyNvoxA99CSy2rp9
         DYh2cyRAB9kTKf89PTdno5litAfEAy+cCjAqQJS6xx9mm+nFmwQ55mR1I7yNFYGx9oKb
         nuYdvu7zJ/P3+lbSnW/nb2DyLWLQ7INTGgz/FQpfZvFJAjts9ARTTBaRB1NxdSZzEyh2
         7lza2akpdJL1LUn08LN/IrB1zKMyf4bLsTFqYktQV8eEI996o9gPbKHYYHPsFuRMhQzI
         j8qt6xBf3Z0DSuXJtlCAn/cBlX5K8Nvx/wQnU0e1T5WqJ0TjgxKzMZLN48TvrnHSrx5F
         OQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=uS7RFfWALLx1slSnuR6WSJI4tYmkC4uXEgPPfOUaF8k=;
        b=svVzz1mIwmTl6smIbsXurzLci1h0iBeFCutL357r7amn3BfVfNF3go/smAsRyzYeRd
         ZlUgL/vFqo4kzvS+tSAZzDW7P1amZSrDXfDwEyVqVNsNIzZ0PTXHV2dQ5ZnTO3rmFtHE
         J7T6nsXS62KExyBFUuxDAdNoq8DFddIKeYn0/FsHocnbwL4WyuputmZHNR7ZWB8OwaoM
         7RgIMors4TpS8fs6a6J8p035RiGcmJPDxlee6nP9bc/4Ho4kpZZWXu//zhaLjBWhF2RL
         xgdVRTnYaNBIHxR8aXGJES4ASJ+HG5kFSvwbRv5FR6zTOrEk5oyfIbA8rxnpchdFSO7i
         s81A==
X-Gm-Message-State: AOAM531tjV5IGvlhwPGt3fFmm+RzhJsKZ6jMKT10BGfNvBXJQfvTeSlD
        OUvlf+//l2Cfp90W9kEFTkJRAhYy/s8=
X-Google-Smtp-Source: ABdhPJzHxgbtZt8ZoNE+X3COSxvqnHD/yAzMbwswCOdowPNolqBQRwK12Wypp2HHg0jCl/+BM5tDQw==
X-Received: by 2002:aca:5fc2:: with SMTP id t185mr11189670oib.64.1617990539856;
        Fri, 09 Apr 2021 10:48:59 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 40sm729443otd.70.2021.04.09.10.48.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 10:48:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 2/2] hwmon: (amd_energy) Restore visibility of energy counters
Date:   Fri,  9 Apr 2021 10:48:52 -0700
Message-Id: <20210409174852.4585-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210409174852.4585-1-linux@roeck-us.net>
References: <20210409174852.4585-1-linux@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Commit 60268b0e8258 ("hwmon: (amd_energy) modify the visibility of
the counters") restricted visibility of AMD energy counters to work
around a side-channel attack using energy data to determine which
instructions are executed. The attack is described in 'PLATYPUS:
Software-based Power Side-Channel Attacks on x86'. It relies on quick
and accurate energy readings.

Limiting energy readings to privileged users is annoying. A much better
solution is to make energy readings unusable for attacks by randomizing
the time between updates. We can do that by caching energy values for
a short and randomized period of time.

Cc: Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Simplified code by using unified function to accumulate energy data

 drivers/hwmon/amd_energy.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
index 93bad64039f1..1bf0afc2740c 100644
--- a/drivers/hwmon/amd_energy.c
+++ b/drivers/hwmon/amd_energy.c
@@ -18,6 +18,7 @@
 #include <linux/mutex.h>
 #include <linux/processor.h>
 #include <linux/platform_device.h>
+#include <linux/random.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/topology.h>
@@ -35,6 +36,7 @@
 struct sensor_accumulator {
 	u64 energy_ctr;
 	u64 prev_value;
+	unsigned long cache_timeout;
 };
 
 struct amd_energy_data {
@@ -74,17 +76,14 @@ static void get_energy_units(struct amd_energy_data *data)
 	data->energy_units = (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
 }
 
-static void accumulate_delta(struct amd_energy_data *data,
-			     int channel, int cpu, u32 reg)
+static void __accumulate_delta(struct sensor_accumulator *accum,
+			       int cpu, u32 reg)
 {
-	struct sensor_accumulator *accum;
 	u64 input;
 
-	mutex_lock(&data->lock);
 	rdmsrl_safe_on_cpu(cpu, reg, &input);
 	input &= AMD_ENERGY_MASK;
 
-	accum = &data->accums[channel];
 	if (input >= accum->prev_value)
 		accum->energy_ctr +=
 			input - accum->prev_value;
@@ -93,6 +92,14 @@ static void accumulate_delta(struct amd_energy_data *data,
 			accum->prev_value + input;
 
 	accum->prev_value = input;
+	accum->cache_timeout = jiffies + HZ + get_random_int() % HZ;
+}
+
+static void accumulate_delta(struct amd_energy_data *data,
+			     int channel, int cpu, u32 reg)
+{
+	mutex_lock(&data->lock);
+	__accumulate_delta(&data->accums[channel], cpu, reg);
 	mutex_unlock(&data->lock);
 }
 
@@ -124,6 +131,7 @@ static int amd_energy_read(struct device *dev,
 {
 	struct amd_energy_data *data = dev_get_drvdata(dev);
 	struct sensor_accumulator *accum;
+	u64 energy;
 	u32 reg;
 	int cpu;
 
@@ -140,10 +148,15 @@ static int amd_energy_read(struct device *dev,
 		reg = ENERGY_CORE_MSR;
 	}
 
-	accumulate_delta(data, channel, cpu, reg);
 	accum = &data->accums[channel];
 
-	*val = div64_ul(accum->energy_ctr * 1000000UL, BIT(data->energy_units));
+	mutex_lock(&data->lock);
+	if (!accum->energy_ctr || time_after(jiffies, accum->cache_timeout))
+		__accumulate_delta(accum, cpu, reg);
+	energy = accum->energy_ctr;
+	mutex_unlock(&data->lock);
+
+	*val = div64_ul(energy * 1000000UL, BIT(data->energy_units));
 
 	return 0;
 }
@@ -152,7 +165,7 @@ static umode_t amd_energy_is_visible(const void *_data,
 				     enum hwmon_sensor_types type,
 				     u32 attr, int channel)
 {
-	return 0440;
+	return 0444;
 }
 
 static int energy_accumulator(void *p)
-- 
2.17.1

