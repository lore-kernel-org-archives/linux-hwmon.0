Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274C4C433ED
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Apr 2021 17:49:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD850610A6
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Apr 2021 17:48:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234250AbhDIRtM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 9 Apr 2021 13:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234133AbhDIRtM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Apr 2021 13:49:12 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFF23C061761
        for <linux-hwmon@vger.kernel.org>; Fri,  9 Apr 2021 10:48:58 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id t140-20020a4a3e920000b02901e5c1add773so274586oot.1
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Apr 2021 10:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BAW0K4xl1wmVrYCrCz7cuSuUc5lAanTeBKtE/rjI+tA=;
        b=LJ8BcoV58EZMErJkg57BcVzP7mBHtMZSy5NbTMoWFO+wSTCrKOHDSk9pN80IhEjQsT
         HbvblVKPikbBF+YXJ6dhaLC/Rr/PHyAjW7SrtyVmtjOXTlU/FmtkJi6zeztjH5hs01w+
         8dxbgMoebNihJ8jBkpuozgI8e3JrKmqNDkkyvDwBtNDTpe1HNaohy3kBV4xFpHrTwofR
         uRlsUYabIeTTrqcrQV4qP7ZTJ4OyStHEu3X3GeYGBI48OVB+2ClCsh3r+LbBH3aPOCRp
         dRhNWrOo3TjRxKvl6/66o7SzH6pY12YDfGwsx83F/j91F8cE6YCywKmCB1hGAIC/lJXJ
         NYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=BAW0K4xl1wmVrYCrCz7cuSuUc5lAanTeBKtE/rjI+tA=;
        b=LQbAXYw0NapM2D6jvGtta1Gsnf1avrSoIMtHLsVsvOEFJShVdcydtWy3fTg1+3/rsE
         379xchO6c2H1U1ETOlJM+UK7ga0bhYTvrSHeraLajgHb1Q/gdhrEOpxevLsQLDJ/+fmi
         oL63NRVuxnLd+wDZTUgnpCeYBxR5l/K3kbas/PbWDRVsdcOXNBZok2yP/PtAS5DAa0Vv
         3PTvvtiuZK7JNqgHHbnaSDEfT6m0HhdFnQsPNql4GxfY8b9qgJR5oVB48jDgc/Q7HVE0
         7U/EkFR6hYpGLS3abbCtDTpzyi9xvGz3Pi0/i/k1mKKST63IoYN2bdhsU8KrU5+/ZagB
         SZ1w==
X-Gm-Message-State: AOAM532moOEe1oUlTq4lPAqWOKA5cNM6nd+fKu2EKVHjCI7lCwRC2Tdh
        jjm8AdLjbQIwS3BRp0KqOQt0G+CcH/w=
X-Google-Smtp-Source: ABdhPJyGKeDowve9YhzqmCNkOZ6rDl/5K50W7UKKYOVpHVACahGVSw+W0WzmH3mw3V97V3XL6nmLPg==
X-Received: by 2002:a05:6820:296:: with SMTP id q22mr1709884ood.10.1617990538050;
        Fri, 09 Apr 2021 10:48:58 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p3sm624979oif.53.2021.04.09.10.48.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 10:48:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 1/2] hwmon: (amd_energy) Use unified function to read energy data
Date:   Fri,  9 Apr 2021 10:48:51 -0700
Message-Id: <20210409174852.4585-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The driver implements two separate functions to read and update
energy values. One function is called periodically and updates
cached enery information to avoid loss of data, the other reads
energy data on demand to report it to userspace. The second
function reads current energy data, adds the difference to the
data previously obtained by the first function, and then discards
the updated data.

Simplify the code and always call the first function, then report
the energy data obtained by this function to userspace.

Cc: Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added patch, simplification

 drivers/hwmon/amd_energy.c | 31 ++++++-------------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
index a86cc8d6d93d..93bad64039f1 100644
--- a/drivers/hwmon/amd_energy.c
+++ b/drivers/hwmon/amd_energy.c
@@ -118,35 +118,12 @@ static void read_accumulate(struct amd_energy_data *data)
 	data->core_id++;
 }
 
-static void amd_add_delta(struct amd_energy_data *data, int ch,
-			  int cpu, long *val, u32 reg)
-{
-	struct sensor_accumulator *accum;
-	u64 input;
-
-	mutex_lock(&data->lock);
-	rdmsrl_safe_on_cpu(cpu, reg, &input);
-	input &= AMD_ENERGY_MASK;
-
-	accum = &data->accums[ch];
-	if (input >= accum->prev_value)
-		input += accum->energy_ctr -
-				accum->prev_value;
-	else
-		input += UINT_MAX - accum->prev_value +
-				accum->energy_ctr;
-
-	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) μJoules */
-	*val = div64_ul(input * 1000000UL, BIT(data->energy_units));
-
-	mutex_unlock(&data->lock);
-}
-
 static int amd_energy_read(struct device *dev,
 			   enum hwmon_sensor_types type,
 			   u32 attr, int channel, long *val)
 {
 	struct amd_energy_data *data = dev_get_drvdata(dev);
+	struct sensor_accumulator *accum;
 	u32 reg;
 	int cpu;
 
@@ -162,7 +139,11 @@ static int amd_energy_read(struct device *dev,
 
 		reg = ENERGY_CORE_MSR;
 	}
-	amd_add_delta(data, channel, cpu, val, reg);
+
+	accumulate_delta(data, channel, cpu, reg);
+	accum = &data->accums[channel];
+
+	*val = div64_ul(accum->energy_ctr * 1000000UL, BIT(data->energy_units));
 
 	return 0;
 }
-- 
2.17.1

