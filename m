Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3575C6FD19
	for <linux-hwmon@archiver.kernel.org>; Sun, 12 Mar 2023 04:37:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjCLEhO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 11 Mar 2023 23:37:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCLEhN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 11 Mar 2023 23:37:13 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 11C5D59E62
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Mar 2023 20:37:11 -0800 (PST)
IronPort-SDR: 640d55c2_Bec6gPmH2KrnnduYGSammt0anZz1Amiv29RG8Ubo1g38c6x
 zmq8m1mVOy6jDCKOMNawpEeoX7cxc24OEYNUy5Q==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2BTAgAwVA1kjPQc8jxaHgEBCxIMSYE7C4Iugk+zUIF+D?=
 =?us-ascii?q?wEPAQFEBAEBhQUChTMmNAkOAQIEAQEBAQMCAwEBAQEBAQMBAQYBAQEBAQEGB?=
 =?us-ascii?q?BQBAQEBQEWFaA2GVgIBAycLAQ0BATcBDxk4VwYBEoJ+gl2wRjOBAYIIAQEGg?=
 =?us-ascii?q?mKaaIFeCYFAi22BFoM2ekI/gU6BFYJ6boQ3hkyYPgqBNHWBIA5Kc4EGAgkCE?=
 =?us-ascii?q?WuBEghogX5BAg1lCw50gWACgQkDCQMHBUlAAwsYDRY6Eyw1FCFebC4SEgUDC?=
 =?us-ascii?q?xUqRwQIOQYbNBECCA8SDyxEDkI3NBMGXAEpCw4RA09CGWwEgg4GASgknDlTK?=
 =?us-ascii?q?BNylGOwcYQEgVefE0yBRqd5l2YgoyOEKwIKBxaBYoIVTR8ZgyJPAxkPjiAZg?=
 =?us-ascii?q?hORU2E7AgcLAQEDCYtDAQE?=
IronPort-PHdr: A9a23:mbHjQBVbIUfF2aBfAq/nTYBsCZzV8K3KAWYlg6HPw5pEc7i4uZ/4N
 VPR4u9hylLMQMPa57RNlrmeurrrDGoH55vJq3UeaNpWWhoClchTnhR1DsKJUx+kJffmPSBmQ
 5QQDQ039HviaRpeE56hD2A=
IronPort-Data: A9a23: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
 8QrkpEq0sNdHrkyLQrL2sGGvA==
IronPort-HdrOrdr: A9a23:8iEumag5amtCP1D7krYhlPxucXBQXgAji2hC6mlwRA09TyX5ra
 qTdTogtCMc7wxhIU3J+7i7VZVoJEmxyXcb2/hzAV7PZmbbUS6TXeVfBOjZslvd8lPFh4xgPM
 5bGsAUNDSzNykcsS+Q2mmF+rgbruVuf82T9J/jJg9WPGRXgrlbnntE4xigYzBLrdZ9dOEE/E
 v13Ls8mwad
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 12 Mar 2023 15:02:01 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 32C4VeSK3479492
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 12 Mar 2023 15:31:57 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 32C4VeSK3479492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1678595518; bh=csh4yILaXByk+BmlKyVMAylrDHSNbNk98uAL9wEBXYY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rt7uRzQqkngDBMklk/4oPaDtcfuXCF6ATnZqqCPX2iCQxMfYRL5vvpgoRhCTCjvtV
         +hNQvLc3d7OfyuZ95h+qpQoaeF+w54ooikQ79suE+dfFJPX2T06PtCrycaprfC3Z8f
         dcgN16wVKTamwGA+vqkSMnWUo1Ed2kdGIe21520DxSWmoJTVSv9RQqP603MY50PWMv
         yvWa6ZJVtOESLoIpd3Mro7lXONs5XGYNrOx+ptukQcxnde7wUNPBVguzOIp32HRL2u
         AGrgjG/VXUPciXXwYP+IKtKQ1BFherXvFMW8ixXi/Mr7qn8gOXUOfsE/j8vfRJEFlC
         pSyiiEB0TXdZw==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 2/3] hwmon (it87): Add scaling macro for recent ADC voltages
Date:   Sun, 12 Mar 2023 15:31:36 +1100
Message-Id: <20230312043137.1744885-3-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312043137.1744885-1-frank@crawford.emu.id.au>
References: <20230312043137.1744885-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 12 Mar 2023 15:31:58 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Generalise scaling to include all recent ADC values and match the labels
for internal voltage sensor to match.

This includes correction of an existing error for voltage scaling for
chips that have 10.9mV ADCs, where scaling was not performed.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index fe1291d5be4b..ca4b79839d98 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -517,6 +517,9 @@ static const struct it87_devices it87_devices[] = {
 #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
 #define has_conf_noexit(data)	((data)->features & FEAT_CONF_NOEXIT)
 #define has_11mv_adc(data)	((data)->features & FEAT_11MV_ADC)
+#define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
+						     FEAT_10_9MV_ADC | \
+						     FEAT_11MV_ADC))
 
 struct it87_sio_data {
 	int sioaddr;
@@ -2006,8 +2009,7 @@ static ssize_t show_label(struct device *dev, struct device_attribute *attr,
 
 	if (has_vin3_5v(data) && nr == 0)
 		label = labels[0];
-	else if (has_12mv_adc(data) || has_10_9mv_adc(data) ||
-			has_11mv_adc(data))
+	else if (has_scaling(data))
 		label = labels_it8721[nr];
 	else
 		label = labels[nr];
@@ -3139,7 +3141,7 @@ static int it87_probe(struct platform_device *pdev)
 			 "Detected broken BIOS defaults, disabling PWM interface\n");
 
 	/* Starting with IT8721F, we handle scaling of internal voltages */
-	if (has_12mv_adc(data)) {
+	if (has_scaling(data)) {
 		if (sio_data->internal & BIT(0))
 			data->in_scaled |= BIT(3);	/* in3 is AVCC */
 		if (sio_data->internal & BIT(1))
-- 
2.39.2

