Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DEEC433EF
	for <linux-hwmon@archiver.kernel.org>; Sat, 26 Mar 2022 11:16:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbiCZLSF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 26 Mar 2022 07:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232640AbiCZLSE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 26 Mar 2022 07:18:04 -0400
X-Greylist: delayed 1217 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 26 Mar 2022 04:16:28 PDT
Received: from dogben.com (dogben.com [172.104.80.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9666029805
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Mar 2022 04:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dogben.com;
        s=main; h=Message-Id:Cc:To:Content-Transfer-Encoding:Content-Type:
        MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
        :Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=6xVw8wM/K2OEQ7l9C/Tdzdrqft4QbrlgvzRAXjfPIAw=; b=ZKzs4V1zI2eWqxmoaZT+KCSJ0o
        VqnOacXAjBjeA7i5ZSGqcWh+CtbyKThEFEFSw89PVlGjCUG0FiX5OfdjO4s7aHtvXTXLKB+USheVJ
        ZFQuHcdqQu5GmMiREm7i9zeEZKhH/lZeHWhlbq9cp/hpGk2B9gx60VBfvs79brmYBcPgcIdm7HhmQ
        6uD02IOk59JGSj/tlmZzGnAU6kF2xVGSCtz571m2LWrae6zqWjowP3ZZAVSzSr2SXh58aTbOJm7NP
        EhxfPr2MidwjIB3IPMOpgIHogSkQn57jO09S0GklNH8LeoGNU3DtyNTradLoS3N2MDrvgNNc7WDYd
        CwKVIq1A==;
Received: from [47.56.139.253] (helo=localhost)
        by dogben.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <wsy@dogben.com>)
        id 1nY43Q-000rAm-9a;
        Sat, 26 Mar 2022 10:53:56 +0000
From:   Wei Shuyu <wsy@dogben.com>
Date:   Sat, 26 Mar 2022 18:24:05 +0800
Subject: [PATCH] hwmon:(asus-ec-sensors) Add T_Sensor for ASUS WS
 X570-ACE/PRIME
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-hwmon@vger.kernel.org
Cc:     wsy@dogben.com, eugene.shalygin@gmail.com, pauk.denis@gmail.com,
        jdelvare@suse.com, linux@roeck-us.net, oleksandr@natalenko.name
Message-Id: <E1nY43Q-000rAm-9a@dogben.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

WS X570-ACE has a T_Sensor header on board according to manual[1].

I'm using a 10kΩ B=3435K thermsistor attached to the header of WS X570-ACE.
EC byte at 0x3d matches readings from BIOS sensor page and environment temperature.

[1]https://www.asus.com/Motherboards-Components/Motherboards/All-series/Pro-WS-X570-ACE/HelpDesk_Manual/

Signed-off-by: Wei Shuyu <wsy@dogben.com>
---
 drivers/hwmon/asus-ec-sensors.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index b5cf0136360c..3ad8eadea68f 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -178,7 +178,8 @@ static const struct dmi_system_id asus_ec_dmi_table[] __initconst = {
 		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CHIPSET),
 	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE, "Pro WS X570-ACE",
 		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_VRM |
-		SENSOR_FAN_CHIPSET | SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE),
+		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CHIPSET |
+		SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE),
 	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
 			      "ROG CROSSHAIR VIII DARK HERO",
 		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_T_SENSOR |
-- 
2.35.1

