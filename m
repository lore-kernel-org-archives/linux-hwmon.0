Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E245C6FA99
	for <linux-hwmon@archiver.kernel.org>; Sun, 12 Mar 2023 04:37:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjCLEhI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 11 Mar 2023 23:37:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCLEhH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 11 Mar 2023 23:37:07 -0500
X-Greylist: delayed 302 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 11 Mar 2023 20:37:04 PST
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8817B591F2
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Mar 2023 20:37:04 -0800 (PST)
IronPort-SDR: 640d55be_8CZrL38BEd1QqhUnvy3PcnG0lA9rzJTA9jBapA0+8lq4ac3
 B9Dym/grMN7op+E+MQlEB0rU6R65SZnZYv/ixeA==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2BUAgAwVA1kjPQc8jxagRKBRoIugk+Vf51RgX4PAQ8BA?=
 =?us-ascii?q?UQEAQGFBQKFMyY0CQ4BAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEFAEBA?=
 =?us-ascii?q?QFARYVoDYZWAgEDJwsBDQEBNwEPGThXBgESgn6CXbBGM4EBgggBAQaCYppog?=
 =?us-ascii?q?V4JgUCLbYEWgzZ6Qj+BToR9hAuGeJg+CoE0dYEgDkpzgQYCCQIRa4ESCGiBf?=
 =?us-ascii?q?kECDWULDnSBYAKBCQMJAwcFSUADCxgNFjoTLDUUIV5sLhISBQMLFSpHBAg5B?=
 =?us-ascii?q?hs0EQIIDxIPLEQOQjc0EwZcASkLDhEDT0IZbASCDgYBKCScOYEOcn94kkixF?=
 =?us-ascii?q?YQEgVefE0yBRqd5l2YgoyOEKwIKBxaBYoIVTR8ZgyJPAxkPjjmCE5FTYTsCB?=
 =?us-ascii?q?wsBAQMJiGqCWQEB?=
IronPort-PHdr: A9a23:rbIhihY0m+9z32HdbAMHQTH/LTAZhN3EVzX9orItiq5VNK+59ovsO
 1bTo/hokRnIUcPS9qEMgvDd5qbnX2FI+pOdqDYYfZlLSxJAiN1DkQAsWpzaAET3fvK2MHxoR
 ZYQX1U8pyOwOhAKcPs=
IronPort-Data: A9a23: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
 8QrkpEq0sNdHrkyLQrL2sGGvA==
IronPort-HdrOrdr: A9a23:NptCH64D/yeTr663wgPXwBLXdLJyesId70hD6qkQc3ZomwKj9v
 xG+85rrCMd6l4qNU3I/OrtBEDuewK+yXcY2+Ys1PKZLW3bUQiTXedfBPXZsl/d8kTFn4Y36U
 4jSdkYNDSaNzhHZKjBjjVRnLsbsaG6GdiT9ILjJm9WPH1Xgr9bnnpE49mgYzZLrNgvP+tCKK
 ah
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 12 Mar 2023 15:01:58 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 32C4VeSJ3479492
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 12 Mar 2023 15:31:54 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 32C4VeSJ3479492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1678595514; bh=DU+Xftfb7lcjjyP8d/5ETdYh91GfD9FO/DD0RbJwLdI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hEgI9ZIZ9vF07vBTlru+DvfxnAyGNLq2X9XQv5BzA2vKgCLI4F/xouYrU/ppDYvuT
         gAN87Vl2vMpmK1JzGJdmqtfuu6MwDg4Ck0GPIIw4wn2XRTEbs4T2iDv3P31+sB8VA7
         0vqNdgmZ8gL6MkTU/exv42zfqHvK9D8bHjqiziHyOFs3Oq3iEi2BGWt4QtlEMEwHFu
         rFbvN5UmeA5LqbyA7tJ2kM2nWuepZr3rhAvXeux90W5NAJe4ffkq8XBkZs2DdSU/2D
         tKIgatQXFm2tr8AEYyfjig3ZcwINy+syb4B2P50/dft28vRXvsf1rtBw6aUnplnrXU
         +kooA+ZG8hKzA==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 1/3] hwmon (it87): Added support for 11mV ADC
Date:   Sun, 12 Mar 2023 15:31:35 +1100
Message-Id: <20230312043137.1744885-2-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312043137.1744885-1-frank@crawford.emu.id.au>
References: <20230312043137.1744885-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 12 Mar 2023 15:31:54 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support of all know ADC values currently identified for it87 chips.
Includes adding support for 11mV ADC reported on IT8613E and IT8625E.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 66f7ceaa7c3f..fe1291d5be4b 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -312,6 +312,7 @@ struct it87_devices {
  * chips to avoid the problem.
  */
 #define FEAT_CONF_NOEXIT	BIT(19)	/* Chip should not exit conf mode */
+#define FEAT_11MV_ADC		BIT(20)
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -515,6 +516,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_six_temp(data)	((data)->features & FEAT_SIX_TEMP)
 #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
 #define has_conf_noexit(data)	((data)->features & FEAT_CONF_NOEXIT)
+#define has_11mv_adc(data)	((data)->features & FEAT_11MV_ADC)
 
 struct it87_sio_data {
 	int sioaddr;
@@ -608,6 +610,8 @@ static int adc_lsb(const struct it87_data *data, int nr)
 		lsb = 120;
 	else if (has_10_9mv_adc(data))
 		lsb = 109;
+	else if (has_11mv_adc(data))
+		lsb = 110;
 	else
 		lsb = 160;
 	if (data->in_scaled & BIT(nr))
@@ -2002,7 +2006,8 @@ static ssize_t show_label(struct device *dev, struct device_attribute *attr,
 
 	if (has_vin3_5v(data) && nr == 0)
 		label = labels[0];
-	else if (has_12mv_adc(data) || has_10_9mv_adc(data))
+	else if (has_12mv_adc(data) || has_10_9mv_adc(data) ||
+			has_11mv_adc(data))
 		label = labels_it8721[nr];
 	else
 		label = labels[nr];
-- 
2.39.2

