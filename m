Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592C0C352A1
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Dec 2022 18:00:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiLGSAu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 7 Dec 2022 13:00:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbiLGSAs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Dec 2022 13:00:48 -0500
X-Greylist: delayed 1391 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 07 Dec 2022 10:00:47 PST
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com [192.185.47.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB4E35AE35
        for <linux-hwmon@vger.kernel.org>; Wed,  7 Dec 2022 10:00:47 -0800 (PST)
Received: from atl1wswcm05.websitewelcome.com (unknown [50.6.129.166])
        by atl1wswob02.websitewelcome.com (Postfix) with ESMTP id 9803C13BD0E
        for <linux-hwmon@vger.kernel.org>; Wed,  7 Dec 2022 17:37:35 +0000 (UTC)
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTP
        id 2yMPpom2hI9C52yMQpLGLE; Wed, 07 Dec 2022 17:37:35 +0000
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=yJr3yuqK+1G1bLkCzGBFbDK6G14y9MID0sp5A55GL7k=; b=MS587yx8xANUGZP2zLjcciRHLS
        sTXl581o/JpWQ6TUtVoyZr2Y2ZEloga7pREZDsQv6UIF6JQqI83VfmySjD9mpbQhtz4v/WaQ11FC/
        xhDX6fY5HBy3p5a9J3IPVtP9Pz8DVQbSTpBGuSe24yBa2HmAHRVQYjDumlQnC9ZE3lttJE3EK9WhV
        HquAH3apc4giwzau0mOKusWm8mHL63u3W0OJhhPIhCnIha+JrTkQXI0Nn/OwaVugqEd2O/0BVIvrr
        tPQ3PjKeLpYKCWC6Nk7AZJr5BEd+ygRfYlbFUvjXNjN+C8aKSt0miza34ifiVVjLKhLhGvqDlpyHq
        seRWnVBg==;
Received: from [106.222.117.249] (port=8172 helo=discovery..)
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <saravanan@linumiz.com>)
        id 1p2yMN-0025qb-So;
        Wed, 07 Dec 2022 17:37:32 +0000
From:   Saravanan Sekar <saravanan@linumiz.com>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, marten.lindahl@axis.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Saravanan Sekar <saravanan@linumiz.com>
Subject: [PATCH v3 1/4] hwmon: pm_bus: core: Add min_uV in pmbus regulator helper macro
Date:   Wed,  7 Dec 2022 18:37:13 +0100
Message-Id: <20221207173716.123223-2-saravanan@linumiz.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207173716.123223-1-saravanan@linumiz.com>
References: <20221207173716.123223-1-saravanan@linumiz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 106.222.117.249
X-Source-L: No
X-Exim-ID: 1p2yMN-0025qb-So
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (discovery..) [106.222.117.249]:8172
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 11
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPEpSF4nrFl4MPC2KAbrXd41s0m5vceJi1fgqWLcF0PVVtHWbhjr4Jt48IOpVJW1LhFook1CdWySE0XnZKU07SvvdJHWkQyIKiZxSWzdZQ/ThDwJjFQp
 I6q6l+QpeHusKeg36G4DGVc9uX8cVnTgzKI6rZOTBscAfl2IljXp/FS72aUsk4kOOMoABMaDDm2lv2e5Im9/Ac8YdX/itjxBgRs=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Some regulator operates in a range of voltage which should not allow
below the lower threshold.

Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
---
 drivers/hwmon/pmbus/ltc2978.c | 16 ++++++++--------
 drivers/hwmon/pmbus/pmbus.h   |  5 +++--
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 6d2592731ba3..406a36885ef3 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -569,14 +569,14 @@ MODULE_DEVICE_TABLE(i2c, ltc2978_id);
 #define LTC2978_N_VOLTAGES	((LTC2978_MAX_UV / LTC2978_UV_STEP) + 1)
 
 static const struct regulator_desc ltc2978_reg_desc[] = {
-	PMBUS_REGULATOR_STEP("vout", 0, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
-	PMBUS_REGULATOR_STEP("vout", 1, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
-	PMBUS_REGULATOR_STEP("vout", 2, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
-	PMBUS_REGULATOR_STEP("vout", 3, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
-	PMBUS_REGULATOR_STEP("vout", 4, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
-	PMBUS_REGULATOR_STEP("vout", 5, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
-	PMBUS_REGULATOR_STEP("vout", 6, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
-	PMBUS_REGULATOR_STEP("vout", 7, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
+	PMBUS_REGULATOR_STEP("vout", 0, LTC2978_N_VOLTAGES, LTC2978_UV_STEP, 0),
+	PMBUS_REGULATOR_STEP("vout", 1, LTC2978_N_VOLTAGES, LTC2978_UV_STEP, 0),
+	PMBUS_REGULATOR_STEP("vout", 2, LTC2978_N_VOLTAGES, LTC2978_UV_STEP, 0),
+	PMBUS_REGULATOR_STEP("vout", 3, LTC2978_N_VOLTAGES, LTC2978_UV_STEP, 0),
+	PMBUS_REGULATOR_STEP("vout", 4, LTC2978_N_VOLTAGES, LTC2978_UV_STEP, 0),
+	PMBUS_REGULATOR_STEP("vout", 5, LTC2978_N_VOLTAGES, LTC2978_UV_STEP, 0),
+	PMBUS_REGULATOR_STEP("vout", 6, LTC2978_N_VOLTAGES, LTC2978_UV_STEP, 0),
+	PMBUS_REGULATOR_STEP("vout", 7, LTC2978_N_VOLTAGES, LTC2978_UV_STEP, 0),
 };
 
 static const struct regulator_desc ltc2978_reg_desc_default[] = {
diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 10fb17879f8e..713ea7915425 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -464,7 +464,7 @@ struct pmbus_driver_info {
 extern const struct regulator_ops pmbus_regulator_ops;
 
 /* Macros for filling in array of struct regulator_desc */
-#define PMBUS_REGULATOR_STEP(_name, _id, _voltages, _step)  \
+#define PMBUS_REGULATOR_STEP(_name, _id, _voltages, _step, _min_uV)  \
 	[_id] = {						\
 		.name = (_name # _id),				\
 		.id = (_id),					\
@@ -475,9 +475,10 @@ extern const struct regulator_ops pmbus_regulator_ops;
 		.owner = THIS_MODULE,				\
 		.n_voltages = _voltages,			\
 		.uV_step = _step,				\
+		.min_uV = _min_uV,				\
 	}
 
-#define PMBUS_REGULATOR(_name, _id)	PMBUS_REGULATOR_STEP(_name, _id, 0, 0)
+#define PMBUS_REGULATOR(_name, _id)   PMBUS_REGULATOR_STEP(_name, _id, 0, 0, 0)
 
 /* Function declarations */
 
-- 
2.34.1

