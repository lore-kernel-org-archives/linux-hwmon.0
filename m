Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83975CDB46B
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Oct 2023 16:48:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376265AbjJKQsc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Oct 2023 12:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347015AbjJKQs2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Oct 2023 12:48:28 -0400
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D268A4
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Oct 2023 09:48:27 -0700 (PDT)
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
        by cmsmtp with ESMTP
        id qZqiq5LM1MZBkqcNmqXoBd; Wed, 11 Oct 2023 16:48:26 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTPS
        id qcNkqeqNW9LbzqcNlq8njY; Wed, 11 Oct 2023 16:48:26 +0000
X-Authority-Analysis: v=2.4 cv=X7VBlUfe c=1 sm=1 tr=0 ts=6526d1da
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=J9R/PiKqv2o3jGxbVGXx4w==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=bhdUkHdE2iEA:10 a=oz0wMknONp8A:10 a=vU9dKmh3AAAA:8 a=IAJAY4PeTjA2mm825RAA:9
 a=rsP06fVo5MYu2ilr0aT5:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=tFyva4Q9jWPeOZMrGywen6tgCDCkf6/RuFRJk5iEinI=; b=hQRDnBeeRKphaGpWKMTzJSa93B
        oBwtFjUmCPot+IA3es+n7mk+w3j4dTcYzFAMk0CjtMgZOa9UFz+RH6GOmX42+4ntBJQ2o72CAKKkg
        I4pe76D41p76QaTlW5vXkJ21dhymk6/rim/LO9cc6trIHJ0LSTMLbA8Qj21ir2kJuO5vM79LtJgg1
        M0wUvXlLcJSvPo23qDSoom1S9UAe4aGHU5+sm/+DhGzqP7I4xvrlxeFGUYSFZBvkCZ5xgzanTtUg3
        GbTWcLmIvgAf8UzIS2DugHzzxAkSwxkyW04vEEOZtZ7/8wXL+aYLg4zuz30MPotr7HxIpLDWD8bYh
        fUdeINuw==;
Received: from [103.186.120.251] (port=36530 helo=discovery..)
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96.1)
        (envelope-from <saravanan@linumiz.com>)
        id 1qqcNg-002Xlh-0u;
        Wed, 11 Oct 2023 22:18:20 +0530
From:   Saravanan Sekar <saravanan@linumiz.com>
To:     sravanhome@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Saravanan Sekar <saravanan@linumiz.com>
Subject: [PATCH v4 4/4] hwmon: (pmbus/mpq2286) Add a support for mpq2286 Power Management IC
Date:   Wed, 11 Oct 2023 22:17:54 +0530
Message-Id: <20231011164754.449399-5-saravanan@linumiz.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011164754.449399-1-saravanan@linumiz.com>
References: <20231011164754.449399-1-saravanan@linumiz.com>
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
X-Exim-ID: 1qqcNg-002Xlh-0u
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (discovery..) [103.186.120.251]:36530
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 45
X-Org:  HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfK00d3GKnZShjxc8qeGHsVffNLzJJcE7lnkgFFzIWt1MmSjBSjHcqaRlGIg7hsirHcYwSEP1d7RQLdVmARM0//mroyZUKHuj5v9ksBOTahh4MqXAyLPJ
 t98geFwZU0w9ySprP9dZz/PPrdiIwMx0Q45i2JsfhMG64YpzSzTsZDdvtzz6DG9i6FH0ZwYnTvfRJRueBw3FX5EZfjx4g4uvwtA=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The MPQ2286 is a programmable, high frequency synchronous buck regulator
designed to power a variety of Automotive system peripherals. Single buck
converters with hardware monitoring capability is configurable over PMBus
interface.

Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
---
 drivers/hwmon/pmbus/mpq7932.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/mpq7932.c b/drivers/hwmon/pmbus/mpq7932.c
index 723c314a57a2..67487867c70f 100644
--- a/drivers/hwmon/pmbus/mpq7932.c
+++ b/drivers/hwmon/pmbus/mpq7932.c
@@ -21,6 +21,7 @@
 #define MPQ7932_N_VOLTAGES		256
 #define MPQ7932_VOUT_MAX		0xFF
 #define MPQ7932_NUM_PAGES		6
+#define MPQ2286_NUM_PAGES		1
 
 #define MPQ7932_TON_DELAY		0x60
 #define MPQ7932_VOUT_STARTUP_SLEW	0xA3
@@ -48,6 +49,11 @@ static struct regulator_desc mpq7932_regulators_desc[] = {
 	PMBUS_REGULATOR_STEP("buck", 5, MPQ7932_N_VOLTAGES,
 			     MPQ7932_UV_STEP, MPQ7932_BUCK_UV_MIN),
 };
+
+static const struct regulator_desc mpq7932_regulators_desc_one[] = {
+	PMBUS_REGULATOR_STEP_ONE("buck", MPQ7932_N_VOLTAGES,
+				 MPQ7932_UV_STEP, MPQ7932_BUCK_UV_MIN),
+};
 #endif
 
 static int mpq7932_write_word_data(struct i2c_client *client, int page, int reg,
@@ -116,7 +122,10 @@ static int mpq7932_probe(struct i2c_client *client)
 
 #if IS_ENABLED(CONFIG_SENSORS_MPQ7932_REGULATOR)
 	info->num_regulators = info->pages;
-	info->reg_desc = mpq7932_regulators_desc;
+	if (info->num_regulators == 1)
+		info->reg_desc = mpq7932_regulators_desc_one;
+	else
+		info->reg_desc = mpq7932_regulators_desc;
 #endif
 
 	info->read_word_data = mpq7932_read_word_data;
@@ -129,12 +138,14 @@ static int mpq7932_probe(struct i2c_client *client)
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

