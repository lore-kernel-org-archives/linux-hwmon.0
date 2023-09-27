Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A32E7E62B
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Sep 2023 04:29:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbjI0E3C (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Sep 2023 00:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjI0E16 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Sep 2023 00:27:58 -0400
Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B715D5FD6
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Sep 2023 20:40:21 -0700 (PDT)
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
        by cmsmtp with ESMTP
        id lLDHqWjhlez0ClLP1qehk8; Wed, 27 Sep 2023 03:39:56 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTPS
        id lLPOqiDNtAtNplLPPqQrw1; Wed, 27 Sep 2023 03:40:20 +0000
X-Authority-Analysis: v=2.4 cv=WbAf1mtX c=1 sm=1 tr=0 ts=6513a424
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=CKMxHAookNUaJbGn3r6bzg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=zNV7Rl7Rt7sA:10 a=oz0wMknONp8A:10 a=vU9dKmh3AAAA:8 a=vkTJ7md9u3ILQXjsLOgA:9
 a=rsP06fVo5MYu2ilr0aT5:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=S1mEjXE9swMM771o0bc5Hhhx27byeazfVy5HXq2TuqY=; b=Sm5U0U0mYziQ4reFBOA7z6Co8F
        g4FLoe7NHdYiBAmuvvm1z4tUzIXOoZU/o3TMZOUrsFBNm8UJOwcoXV8Ov+7iUQbUkfyfmZxm7FwIX
        Biw08wTzepBQ7x6GDAt/nRt1aoRL4/Cu6IwHMLLoQ+VNVl6o02i74+5vsNfkwuTXphOlDBi8FQ9Ck
        9BPyJu9N3Q6QCKMsYYSqNHrpHptu8zjcaglhceJrgzH4r2K1CsWReoRxiohkOE8A/PhqIbI3qbIOY
        RkacdfWeZulsuALrHgmOaWOvZSdlT0REAQBLzEmzT7xODQW1IxAugg2c8oWDAbGHmxGnNt+mWa0IK
        2YW0oyxQ==;
Received: from [103.163.95.214] (port=59728 helo=discovery..)
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <saravanan@linumiz.com>)
        id 1qlLPK-000tFx-2A;
        Wed, 27 Sep 2023 09:10:14 +0530
From:   Saravanan Sekar <saravanan@linumiz.com>
To:     sravanhome@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Saravanan Sekar <saravanan@linumiz.com>
Subject: [PATCH v2 3/3] hwmon: (pmbus/mpq2286) Add a support for mpq2286 Power Management IC
Date:   Wed, 27 Sep 2023 09:09:53 +0530
Message-Id: <20230927033953.1503440-4-saravanan@linumiz.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927033953.1503440-1-saravanan@linumiz.com>
References: <20230927033953.1503440-1-saravanan@linumiz.com>
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
X-Exim-ID: 1qlLPK-000tFx-2A
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (discovery..) [103.163.95.214]:59728
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 34
X-Org:  HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAAYRFwzJDg+VxthoW/rzwSyPsJJnzT/u1T2t1RpxUf9J7pr8UJpducIHjXp+mZ4Qr6RqHvKowYwSPUTss99vrEh9NOLQJC0djqslJwmNccq5rJrFVPS
 CHcSQ62JN/6MpTMIIlfruTRlc++njyKg5XpSgGefRsYIZ+ChtyChcrOzNMv2bcqBSoKvcRxbHjrEAVd3/XbV0wsJb3zZU5zLy50=
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
index 723c314a57a2..60d7b8aec05a 100644
--- a/drivers/hwmon/pmbus/mpq7932.c
+++ b/drivers/hwmon/pmbus/mpq7932.c
@@ -21,6 +21,7 @@
 #define MPQ7932_N_VOLTAGES		256
 #define MPQ7932_VOUT_MAX		0xFF
 #define MPQ7932_NUM_PAGES		6
+#define MPQ2286_NUM_PAGES		1
 
 #define MPQ7932_TON_DELAY		0x60
 #define MPQ7932_VOUT_STARTUP_SLEW	0xA3
@@ -129,12 +130,14 @@ static int mpq7932_probe(struct i2c_client *client)
 }
 
 static const struct of_device_id mpq7932_of_match[] = {
+	{ .compatible = "mps,mpq2286", .data = (void *)MPQ2286_NUM_PAGES },
 	{ .compatible = "mps,mpq7932", .data = (void *)MPQ7932_NUM_PAGES },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mpq7932_of_match);
 
 static const struct i2c_device_id mpq7932_id[] = {
+	{ "mpq2286", },
 	{ "mpq7932", },
 	{ },
 };
-- 
2.34.1

