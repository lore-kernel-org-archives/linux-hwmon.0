Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8397AC636BD
	for <linux-hwmon@archiver.kernel.org>; Sat, 28 Jan 2023 06:04:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbjA1GEL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 28 Jan 2023 01:04:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjA1GEK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 28 Jan 2023 01:04:10 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CBBB17C31E
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Jan 2023 22:04:08 -0800 (PST)
IronPort-SDR: 8iyiRMRH7CmGWWsbgXgldHTOHujMgD8EsaMiwgoWUY492xGpgc+RLdpC1BwX00nc6ZZtkOahcZ
 39LexIY8M/ZOqScD9//pkPM0mUsF9yWI3t+HdacfcWn2mXBQUiSbgTqG6fGJljIk5TOVKeweDs
 nQnfvdpEaNnXyG4SWi3zN5JY6ZG+1txA6qDM2wlvDld3Gi2wzVDO6aI6GLGMOHyxWCaq5eQ6Bj
 A1R5wxLjPUA0V3BMh69iV8Da/u/V8emcjltzgmnIknHWW0Y2O6s8Gs4vpeU7VUi9rRszCprttr
 VlUw8/Y/f2IfQU3iqwtbEu1J
X-SMTP-MATCH: 0
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 28 Jan 2023 16:33:35 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30S63ChA2973396
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 28 Jan 2023 17:03:31 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30S63ChA2973396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674885811; bh=dg1dAC8dD4EckFsTst6KvtVKV8v6tNTzYnVpwBZwiYw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CUdApOC7F1e8ttVptTP52P2KqBLHocL0bKHLUHnPYZpBPV8zdjxKGcFOzq1F8oDqA
         tm+lIt2UHSNKs/w0Ci4VXnF4+OESdVZRLrTJBfcBwXTnI1ZjjDwXfM621N+X1maaoU
         IN5OZGYb4kn9+ciTKvz+QbT7qj/1S1UFS83qHHcxRvpqxKCA0mUH82AZ3xb8DhV6sy
         Oo8AIaCvImghzhqU7xKbxvrP4iNvUNQKPtQsoRCrOKr9VdYsuOCCiNToLf3NLWPhoU
         7taLm+d7yxsKiWptrvzvqIeY5CjoEpU6UvYoGr3syE5IgErmKTddT+9SiDT48AKxzL
         pWi0zJTz9n1VQ==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v3 2/7] hwmon: (it87) Disable configuration exit for certain chips
Date:   Sat, 28 Jan 2023 17:03:03 +1100
Message-Id: <20230128060308.1549707-3-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230128060308.1549707-1-frank@crawford.emu.id.au>
References: <20230128060308.1549707-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 28 Jan 2023 17:03:31 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

IT8790E and IT8792E/IT8795E have been identified as chips that can have
issues when disabling configuration mode.

Set to never exit configuration mode.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v3:
 * No change.

v2:
 * Make use of new feature flag rather than separate field.

---
 drivers/hwmon/it87.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 923a9563be92..45d4b5ee3701 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -429,7 +429,7 @@ static const struct it87_devices it87_devices[] = {
 		.suffix = "E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
-		  | FEAT_PWM_FREQ2,
+		  | FEAT_PWM_FREQ2 | FEAT_CONF_NOEXIT,
 		.peci_mask = 0x07,
 	},
 	[it8792] = {
@@ -437,7 +437,7 @@ static const struct it87_devices it87_devices[] = {
 		.suffix = "E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
-		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL,
+		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_CONF_NOEXIT,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
-- 
2.39.1

