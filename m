Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4B5C74A5B
	for <linux-hwmon@archiver.kernel.org>; Sat, 18 Mar 2023 08:06:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjCRIGh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 18 Mar 2023 04:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjCRIGg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 18 Mar 2023 04:06:36 -0400
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CAB591205A
        for <linux-hwmon@vger.kernel.org>; Sat, 18 Mar 2023 01:06:34 -0700 (PDT)
IronPort-SDR: 641570ee_wks+GBu8FazlWHN8+pIZ109Id7DnrmTR1xIm4lyy2ATzDVv
 /XQS9uRDWIHeoYi45hdW1Sf507g3D502ZLIfyuA==
X-SMTP-MATCH: 0
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 18 Mar 2023 18:36:06 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 32I85iJa2991191
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 18 Mar 2023 19:06:01 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 32I85iJa2991191
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1679126762; bh=5KnocM6tvyAOQmZTCDe5S8EqWUci3Y4pOhixi3kI3BY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TJqp2aUCOy8+U0vZomCPwjHVtIP1rQIEzBErt1VpfBaC7C5lWUvVtzcq5j0UT8KWF
         3WLXVInCK2oWsni4F/TflDoMZPS2taJ+zRxDvuXvKB4l0i78ND+w92CUP8EbUj5whz
         +K+4lM7AsKaRgWVkv+cNOzUFO0ZTBY2lalvnRN58sSL+YMR+cSl5z1Ly1BJHiInko1
         5BscVCWU8Mu20XduRyoOXHL9aiJsO0kDTX2wR7h5ldv9uLBr7qRIVOHyt3q3IYT0vN
         +9VQINY+o4tRrfCwV4oijF5Sc1eVRWlvcMJg30s/RhGTL6Ngugnqvw2LgY9khoFOfm
         rTzdBQrDbq+bg==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 2/2] hwmon (it87): Generalise matching labels
Date:   Sat, 18 Mar 2023 19:05:43 +1100
Message-Id: <20230318080543.1226700-3-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318080543.1226700-1-frank@crawford.emu.id.au>
References: <20230318080543.1226700-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 18 Mar 2023 19:06:02 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Apply scaling macro to match the labels for internal voltage sensors.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v2:
 * Split out the change to match labels to a separate patch.

---
 drivers/hwmon/it87.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index e9614eb557d4..f774a0732a7c 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -2004,7 +2004,7 @@ static ssize_t show_label(struct device *dev, struct device_attribute *attr,
 
 	if (has_vin3_5v(data) && nr == 0)
 		label = labels[0];
-	else if (has_12mv_adc(data) || has_10_9mv_adc(data))
+	else if (has_scaling(data))
 		label = labels_it8721[nr];
 	else
 		label = labels[nr];
-- 
2.39.2

