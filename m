Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE0CEEB590
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Sep 2023 03:42:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231423AbjIKDmQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 10 Sep 2023 23:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjIKDmO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 10 Sep 2023 23:42:14 -0400
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E00521AE
        for <linux-hwmon@vger.kernel.org>; Sun, 10 Sep 2023 20:42:09 -0700 (PDT)
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
        by cmsmtp with ESMTP
        id fSFIq5aX5yYOwfXoPqEUMV; Mon, 11 Sep 2023 03:42:09 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTPS
        id fXoNqLoJNgplGfXoOqyM59; Mon, 11 Sep 2023 03:42:09 +0000
X-Authority-Analysis: v=2.4 cv=Tob1ORbh c=1 sm=1 tr=0 ts=64fe8c91
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=CKMxHAookNUaJbGn3r6bzg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=zNV7Rl7Rt7sA:10 a=oz0wMknONp8A:10 a=vU9dKmh3AAAA:8 a=jE1H5azQshHf5kA64NAA:9
 a=rsP06fVo5MYu2ilr0aT5:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=MuNSiSam9s9sOHsuZDhJYrPrBgShwLml5HSi7hbqpw4=; b=b32ScKqw/7yCdjy8/B/mrZ8g8o
        MAtzuaqG4ae0v02+IHH07CiWumFS77793RrGKBjsX2BifxvZAE9+YABtjZPvinSb0dTxn6vqvSnoq
        vTDyOd/3mAD2QWoacBDtXNABu83HK8Ka335FBnXMNKlWW0NZkcUtYCqOytIC10T98UgLZ1AVYfG5t
        15KJsMQOBZhfPYs3Ua4BGdZhAMZgUhd2kgPzbgwvEpvZQYNNFhzp0301VIoI2dcfNc5CNjrDPiIz6
        HemNz6NG+0wH/fM3tAeIWby9UNrxDElpSwnZgUUwwyIK5ro7UPRwDGppxkwQBOXEP4bHNet7Okg0a
        36ZY9uGg==;
Received: from [103.163.95.214] (port=46382 helo=discovery..)
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <saravanan@linumiz.com>)
        id 1qfXoJ-002lKM-2L;
        Mon, 11 Sep 2023 09:12:03 +0530
From:   Saravanan Sekar <saravanan@linumiz.com>
To:     sravanhome@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Saravanan Sekar <saravanan@linumiz.com>
Subject: [PATCH 3/3] hwmon: (pmbus/mpq2286) Add a support for mpq2286 Power Management IC
Date:   Mon, 11 Sep 2023 09:11:50 +0530
Message-Id: <20230911034150.181880-4-saravanan@linumiz.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230911034150.181880-1-saravanan@linumiz.com>
References: <20230911034150.181880-1-saravanan@linumiz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 103.163.95.214
X-Source-L: No
X-Exim-ID: 1qfXoJ-002lKM-2L
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (discovery..) [103.163.95.214]:46382
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 34
X-Org:  HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCteY/BK9rlcBsiqKv/wFgkTwqkLxKuaENRTrtGMisPa1VowBKhe6u8P/ZE7aN0nB+LP5rhPGp+VnMxBZtvP0YD2ZJ3an1iijVVVCr82iek7o7QkUQXF
 2G8enyhu+qSHBwPWXAK1ucEzgalStHQPA39xdoClzV1J3u2csYc1Ad5zeT7UoBgY2n7KSHzp8bh1qKzFfACScw4HSn00fMNdyhw=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The MPQ2286 is a programmable, high frequency synchronous buck regulator
designed to power a variety of Automotive system peripherals. Single buck
converters with hardware monitoring capability is configurable over PMBus
interface.

Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
---
 drivers/hwmon/pmbus/mpq7932.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/pmbus/mpq7932.c b/drivers/hwmon/pmbus/mpq7932.c
index af3e5e9590c8..3ffeece28e2d 100644
--- a/drivers/hwmon/pmbus/mpq7932.c
+++ b/drivers/hwmon/pmbus/mpq7932.c
@@ -21,6 +21,7 @@
 #define MPQ7932_N_VOLTAGES		256
 #define MPQ7932_VOUT_MAX		0xFF
 #define MPQ7932_NUM_PAGES		6
+#define MPQ2286_NUM_PAGES		1
 
 #define MPQ7932_TON_DELAY		0x60
 #define MPQ7932_VOUT_STARTUP_SLEW	0xA3
@@ -130,12 +131,14 @@ static int mpq7932_probe(struct i2c_client *client)
 
 static const struct of_device_id mpq7932_of_match[] = {
 	{ .compatible = "mps,mpq7932", .data = (void *)MPQ7932_NUM_PAGES },
+	{ .compatible = "mps,mpq2286", .data = (void *)MPQ2286_NUM_PAGES },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mpq7932_of_match);
 
 static const struct i2c_device_id mpq7932_id[] = {
 	{ "mpq7932", },
+	{ "mpq2286", },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, mpq7932_id);
-- 
2.34.1

