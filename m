Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3139C61DA4
	for <linux-hwmon@archiver.kernel.org>; Sat, 18 Mar 2023 08:06:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjCRIGJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 18 Mar 2023 04:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjCRIGH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 18 Mar 2023 04:06:07 -0400
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9F02119F27
        for <linux-hwmon@vger.kernel.org>; Sat, 18 Mar 2023 01:06:03 -0700 (PDT)
IronPort-SDR: 641570ea_Zn9il6C0LMUm9ibvJPEZuUqr38CqZEiFDrDwCIX1pRE+stx
 JeNjFrXl9QWmr4fcO5/Z9h51uxApEsnxYZFvYEQ==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2DYAgB4bxVkjPQc8jxaHgEBCxIMSYE7C4Iugk+zWIF+D?=
 =?us-ascii?q?wEPAQFEBAEBhQUChTUmNQgOAQIEAQEBAQMCAwEBAQEBAQMBAQYBAQEBAQEGB?=
 =?us-ascii?q?BQBAQEBQEWFaA2GVgIBAycLAQ0BATcBDxk4VwYBEoJ+gl21YTOBAYIIAQEGg?=
 =?us-ascii?q?mKaaIFeCYFAi26BFoM2ekI/gU6BFYJ6boQLLIZMmRcKgTR2gSAOSnOBBAIJA?=
 =?us-ascii?q?hFrgRIIa4F9QQINZQsOdoFMAoISAwkDBwVJQAMLGA0WOhMsNRQhXmwtEhIFA?=
 =?us-ascii?q?wsVKkcECDkGHDQRAggPEg8sQw5CNzQTBlwBKQsOEQNPQhlsBIIJCgYBJiSdE?=
 =?us-ascii?q?AFTKBOVVbB7hASBWZ8TTIFGp3mXaiCjJYQsAgoHFoFjAYITTR8ZgyJPAxkPj?=
 =?us-ascii?q?iAZghORU2E7AgcLAQEDCYhqglkBAQ?=
IronPort-PHdr: A9a23:0TRTvBXyMXazUKXkGtrVZS0UbUXV8K3KAWYlg6HPw5pEc7i4uZ/4N
 VPR4u9hylLMQMPa57RNlrmeurrrDGoH55vJq3UeaNpWWhoClchTnhR1DsKJUx+kJffmPSBmQ
 5QQDQ039HviaRpeE56hD2A=
IronPort-Data: A9a23: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
 z3FFqHYZXBdGq1UeNs=
IronPort-HdrOrdr: A9a23:hcu2lqwM5mIzLV699RYAKrPw9r1zdoMgy1knxilNoHxuGPBwWf
 rOoB19726MtN5yMEtMpTnkAsW9qBznhP1ICOUqUotKGTOW3FdAT7sSi7cKvQeQeREWn9Q1vc
 xdmupFebrN5DNB7foSjjPXLz6ureP3iJxA/d2uqkuFVTsaF52I8T0JdzpzzXcGPzWv1PICZe
 Ch2vY=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 18 Mar 2023 18:36:02 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 32I85iJZ2991191
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 18 Mar 2023 19:05:58 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 32I85iJZ2991191
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1679126758; bh=kIFYBqrfAvOh5cAF9JdOqZwAcJ73eKRXusAW6HIbx7k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fdcj+zrHD0xFHEOF+kt0BBYPO9ViGmgewmotMzVteX1rIN/fU2asuPfZl1SBW0JG5
         iRTWWqbt6PtRqp3xcLFf53j+FdmM2idWU7qiIWAmkQBQJQsFbW0ISi2DbIREtEg+Ce
         Xb7cdWkLTRS2w8t0YYyFeqCFY3sZcqqQOEOVIKM/pry9AUTX9k66nUyMd86VDFI2UX
         pUY64SIbSHG/quaBjGb6ctj8UfWniak+m/P0Gb+9tEwgo7pBfRT8rrx5tTAwbeABI5
         eglgjetq+ZIt+5ZzPduiuTlhSDAXOImP/yXjQsFAiiWlTCj7AUMj645G/LjHsWiW95
         m3GRXDAgb96fQ==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 1/2] hwmon (it87): Add scaling macro for recent ADC voltages
Date:   Sat, 18 Mar 2023 19:05:42 +1100
Message-Id: <20230318080543.1226700-2-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318080543.1226700-1-frank@crawford.emu.id.au>
References: <20230318080543.1226700-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 18 Mar 2023 19:05:58 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Generalise scaling to include all recent ADC values.

This includes correction of an existing error for voltage scaling for
chips that have 10.9mV ADCs, where scaling was not performed.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v2:
 * Split out the change to the scaling in a separate patch.

---
 drivers/hwmon/it87.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 66f7ceaa7c3f..e9614eb557d4 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -515,6 +515,8 @@ static const struct it87_devices it87_devices[] = {
 #define has_six_temp(data)	((data)->features & FEAT_SIX_TEMP)
 #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
 #define has_conf_noexit(data)	((data)->features & FEAT_CONF_NOEXIT)
+#define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
+						     FEAT_10_9MV_ADC))
 
 struct it87_sio_data {
 	int sioaddr;
@@ -3134,7 +3136,7 @@ static int it87_probe(struct platform_device *pdev)
 			 "Detected broken BIOS defaults, disabling PWM interface\n");
 
 	/* Starting with IT8721F, we handle scaling of internal voltages */
-	if (has_12mv_adc(data)) {
+	if (has_scaling(data)) {
 		if (sio_data->internal & BIT(0))
 			data->in_scaled |= BIT(3);	/* in3 is AVCC */
 		if (sio_data->internal & BIT(1))
-- 
2.39.2

