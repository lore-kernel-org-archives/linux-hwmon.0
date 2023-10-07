Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EDE7E95A6A
	for <linux-hwmon@archiver.kernel.org>; Sat,  7 Oct 2023 16:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344114AbjJGQ6d (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 7 Oct 2023 12:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344103AbjJGQ6c (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 7 Oct 2023 12:58:32 -0400
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8060BC
        for <linux-hwmon@vger.kernel.org>; Sat,  7 Oct 2023 09:58:31 -0700 (PDT)
Received: from eig-obgw-5003a.ext.cloudfilter.net ([10.0.29.159])
        by cmsmtp with ESMTP
        id p1zjqmlEvMZBkpAdLq0xv3; Sat, 07 Oct 2023 16:58:31 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTPS
        id pAdJq5QpPjoWdpAdKqY8ZI; Sat, 07 Oct 2023 16:58:31 +0000
X-Authority-Analysis: v=2.4 cv=BenLb5h2 c=1 sm=1 tr=0 ts=65218e37
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=J9R/PiKqv2o3jGxbVGXx4w==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=bhdUkHdE2iEA:10 a=oz0wMknONp8A:10 a=vU9dKmh3AAAA:8 a=vkTJ7md9u3ILQXjsLOgA:9
 a=rsP06fVo5MYu2ilr0aT5:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=S1mEjXE9swMM771o0bc5Hhhx27byeazfVy5HXq2TuqY=; b=R0lG7n9Ioab8QJiKp1o0i3AjkG
        SATpEyfgfQ9QZo/o4C3HGvE9AGqmMCxmLzW5/wY61h6HlxtrGS3l+jRnt7YkiPaARUmqLUSfq6/r/
        A1CI4JuyONg06/SyiT+zjZqwUNoqqXbq23uv6O8W1Z91huuXp4gPXC8vg96sF42O4h5wLavxTUuGS
        VCAK56Zekr3QOSD09H7tyL/mcp3zAmIu7YzFVAwAKlao7Yo1RH+XZhGGbHg7AklfnYlD8Bm8ANN+W
        ny8/yqXiKnN3PgQwgVIGiGz9Nu7uTDRr2gqRKlBHIdTy4sIJfHhF0Y/u0UhqNQ3lRSlwhNYXRs50d
        XLbdMA5Q==;
Received: from [103.186.120.251] (port=39748 helo=discovery..)
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96.1)
        (envelope-from <saravanan@linumiz.com>)
        id 1qpAdF-002Tlj-1s;
        Sat, 07 Oct 2023 22:28:25 +0530
From:   Saravanan Sekar <saravanan@linumiz.com>
To:     sravanhome@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Saravanan Sekar <saravanan@linumiz.com>
Subject: [PATCH v3 3/3] hwmon: (pmbus/mpq2286) Add a support for mpq2286 Power Management IC
Date:   Sat,  7 Oct 2023 22:28:03 +0530
Message-Id: <20231007165803.239718-4-saravanan@linumiz.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231007165803.239718-1-saravanan@linumiz.com>
References: <20231007165803.239718-1-saravanan@linumiz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 103.186.120.251
X-Source-L: No
X-Exim-ID: 1qpAdF-002Tlj-1s
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (discovery..) [103.186.120.251]:39748
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 34
X-Org:  HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDON4SLP/hBlc0+rucuJrgpIk8RhGMrfsAHuNZ5w0GBqcwYAtMuhKWBFc8yJg4xiAUlsHXoSNItNtQn+dJJhZ574U8XLIgzMqa/KAHLTJzqP2aGZXq06
 yFIONCgNHMJ4MU+YtEMElMLjFnRTFT7mHHdTamh64/ejm4TdabskggqTH1q1i2M3gaZ8nhgLvRsqdr3yCOYTW5nYf4KLM9FGs3U=
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

