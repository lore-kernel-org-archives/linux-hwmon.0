Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6FDC27C76
	for <linux-hwmon@archiver.kernel.org>; Sat, 28 Jan 2023 06:04:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbjA1GEJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 28 Jan 2023 01:04:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbjA1GEI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 28 Jan 2023 01:04:08 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 79EF47C31E
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Jan 2023 22:04:02 -0800 (PST)
IronPort-SDR: 5GJXiDvZ7Ga4AQoHhMbAYtDDSLKCRvEI228wpHiwhVYLbxnj08iyo4SK+xbN4HSXLThKOHd6SY
 rVwLlBQXgRs2KA0ia4o0Duj0mZb2Dsfw/0X3QfSkb+kYDDTkBD7/RxxZbaa27MhIVoN3IE2JA3
 Agvh0u09ZU6AuKcQaapkoNNd9B0m/lSazxobMuoA1e88whx6F7EbOyHc67aQGdfe4gdR21In++
 P3UHBfTVpU7J6LZIMauTkYEaXGQUYWuoag4eEo0eMOqeSKvV/IdvfEmKmg0JQYDK0dXBx3iat0
 cF9Eo+MGl4z4yGoczhf7NVt3
X-SMTP-MATCH: 0
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 28 Jan 2023 16:33:43 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30S63ChC2973396
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 28 Jan 2023 17:03:38 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30S63ChC2973396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674885818; bh=NWIca1sbonD927niJfu24oqRgmA86E1zonOsi8DPSKQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M0u5js9o3fFVSQlzFvp/Ls766HYiGvHa2lvUG0JCWKvT5oanWVuFov/JbXluGEBdW
         GUZ9kyNzGAxeS+sGXzJmP78HZC5vbSdDCuEOtF2sqIL7c/BFZkHfS3mUKxDzr4zIOt
         g2fnz0An2Ws0aSICU8vvL7znxLdKCUVB9lY3KQoGjPYjfb/xdHUrUROAa6fdmo7TM/
         QIDhaIDLYvo8KZV0DZ6qtQUWY5T4e43EcE2E8nyObfa7QCB01qLuFAU3oUb+UAoT1v
         q5ZN9IXtVAqgm1bgOtmOVUr7JSIkYhVRQ3EjHT4DI2Hui/4vmxHAM9c/XzxVU4eT1K
         51BmcFuB4Rq8w==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v3 4/7] hwmon: (it87) Add chip_id in some info message
Date:   Sat, 28 Jan 2023 17:03:05 +1100
Message-Id: <20230128060308.1549707-5-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230128060308.1549707-1-frank@crawford.emu.id.au>
References: <20230128060308.1549707-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 28 Jan 2023 17:03:38 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

In cases where there are multiple chips, print out which chip is
referred to, in the informational message.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v3:
 * No change.

v2:
 * Improved chip description following review.

---
 drivers/hwmon/it87.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 1d9f0c6dfeb9..450f0bfec328 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -2503,13 +2503,15 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 
 	superio_select(sioaddr, PME);
 	if (!(superio_inb(sioaddr, IT87_ACT_REG) & 0x01)) {
-		pr_info("Device not activated, skipping\n");
+		pr_info("Device (chip %s ioreg 0x%x) not activated, skipping\n",
+			config->model, sioaddr);
 		goto exit;
 	}
 
 	*address = superio_inw(sioaddr, IT87_BASE_REG) & ~(IT87_EXTENT - 1);
 	if (*address == 0) {
-		pr_info("Base address not set, skipping\n");
+		pr_info("Base address not set (chip %s ioreg 0x%x), skipping\n",
+			config->model, sioaddr);
 		goto exit;
 	}
 
-- 
2.39.1

