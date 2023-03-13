Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57869C6FD19
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Mar 2023 11:57:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjCML5K (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Mar 2023 07:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbjCML4v (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Mar 2023 07:56:51 -0400
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0A8C12005F
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Mar 2023 04:56:19 -0700 (PDT)
IronPort-SDR: 640f0ee7_jfp66XJlGrJxGx6spuGJk75f5BECfY9TH1BGYYPP7YHYzyo
 ti2ywTLOdMxfksKrGJp4XtrsWWnGhuoe+Rl5Vng==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2BQAgDDDQ9kjPQc8jxagRKBRoIugk+zUIF+DwEPAQFEB?=
 =?us-ascii?q?AEBhQWFNSY0CQ4BAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEFAEBAQFAR?=
 =?us-ascii?q?YVoDYZYKwsBDQEBNwEogRUBEoJ+gl2wMjOBAYIIAQEGgmKaaIFeCYFAi22BF?=
 =?us-ascii?q?oM2gTw/gU6BFYJ6boQ3hkyYKwqBNHWBIA5Kc4EGAgkCEWuBEghrgX5BAg1kC?=
 =?us-ascii?q?w52gVcCgQkDCQMHBUlAAwsYDRY6Eyw1FCNebC4SEgUDCxUqRwQIOQZQEQIID?=
 =?us-ascii?q?xIPLEMOQjc0EwZcASkLDhEDT0EZbASCCQoHKCScL1MoE3KUY7ByhASBV58TT?=
 =?us-ascii?q?IFGp3mXZiCjI4QrAgoHFoFighVNHxmDIk8DGQ+OOYITkVNhOwIHCwEBAwmLQ?=
 =?us-ascii?q?wEB?=
IronPort-PHdr: A9a23:aWrg+RTwxVPJFq+G8vvfgmVeJdpso4vLVj580XJvo7hPbr/l9I7rI
 0LY//krgVrUG4TXrftZ2KLfqau1X2sG7N6atWwaNoZBUhgZhIAXh1kuDMLfWxLyJfK4Y3BlT
 JYbBg1u9SjjY0NeQJmWWg==
IronPort-Data: A9a23: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
 swa5ma6Ky3ZLkuFngrPzqfTbT9b+87n
IronPort-HdrOrdr: A9a23:wmafd6wNyULNkDS2/oy1KrPwAr1zdoMgy1knxilNoHxuGPBwWf
 rOoB19726StN5yMEtMpTnkAsW9qBznhP1ICOUqUotKPzOW3FdAUrsSj7cKqgeIc0bDH4VmtZ
 uIHZIRNDV+YGIK6/oSmDPIdurI2OP3ipxAm92utEuFkjsaEp2JPm9Ce36mLnE=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 13 Mar 2023 22:24:15 +1030
Received: from agc.com.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 32DBs0ES499900
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Mon, 13 Mar 2023 22:54:09 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 32DBs0ES499900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1678708449; bh=medmSZlHHHPEJAW3ISSbufI4iS9PtMbpl7Tzo1Tl+Q0=;
        h=From:To:Cc:Subject:Date:From;
        b=L/0z/UXOVza7LEPPmyqDC+fpyO2N+XdMcZ6NsqYcmlTMkYprWETfDtlbeVQcUItwi
         OdNhRWbgYDZeQwngmOnQIY6X1YGKzmUIirJro4OlZFnLnryQlhHpxYpoDtm+7VL8gH
         Ae+AUZJErMIVkVQMXW9HqjPe5LMdgQ8zEy0r2BWHwyZXoTX7BR8UMR/UlLr079Ygon
         jPtSfOLhDebSJb48PUctFJdOAdHF16eqaDQESVJR6JM5uJJdtmlXEnobwFAp0AEcwF
         uLLBH3C4nVawWUiPtBgNNkzhyg/snVME2Cj57kg7ZL2rI2SQ7F/9JQfoAxuIa93T6M
         v95UbkDorx62A==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1] hwmon (it87): Add scaling macro for recent ADC voltages
Date:   Mon, 13 Mar 2023 22:53:56 +1100
Message-Id: <20230313115356.334937-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Mon, 13 Mar 2023 22:54:09 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Generalise scaling to include all recent ADC values and match the labels
for internal voltage sensors.

This includes correction of an existing error for voltage scaling for
chips that have 10.9mV ADCs, where scaling was not performed.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 66f7ceaa7c3f..f774a0732a7c 100644
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
@@ -2002,7 +2004,7 @@ static ssize_t show_label(struct device *dev, struct device_attribute *attr,
 
 	if (has_vin3_5v(data) && nr == 0)
 		label = labels[0];
-	else if (has_12mv_adc(data) || has_10_9mv_adc(data))
+	else if (has_scaling(data))
 		label = labels_it8721[nr];
 	else
 		label = labels[nr];
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

