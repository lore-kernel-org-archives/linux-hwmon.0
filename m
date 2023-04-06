Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01175C77B6E
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 Apr 2023 20:31:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbjDFUbV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 6 Apr 2023 16:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239126AbjDFUbT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 6 Apr 2023 16:31:19 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872664C17
        for <linux-hwmon@vger.kernel.org>; Thu,  6 Apr 2023 13:31:18 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id by26so4204683ejb.2
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Apr 2023 13:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9bgnek9zezufpOznehWFLiWuMLFq160OkF04+hDtVg=;
        b=DZfMCSkFDtwL+wAEAOKEF+BPBEglCteY7eu0A7PJt5poTWiie0elX86FUoHC5OJnvc
         0DL/nGAPVOgm6baRgrhCFq6jgYRI/2cB41wdsA6bBU08/MkHWV713HiBkFjWUbIYRmqt
         Y9D5DowgtmzQpMUSB8kMwEWbA5M3GXqSewttjoUxxCTvXcxpisDEj+Get88uthGaPpNs
         aJthp7GoxksoRBFzlufpXAS5fWujiHLWSvZiBUS0jMH+4g9I2Kh75sZ1JK/kb4EYmxis
         zWZOxmmq88z2MA6iD3o+1ooOpBjC9Y/+5I6E6WBj/AzsvYHMcgX3lnDVe0Pc0Mle3rYl
         m3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9bgnek9zezufpOznehWFLiWuMLFq160OkF04+hDtVg=;
        b=dtb5tS1owcoBVuREApjDymSgONo7f2CpGmwfTMA0esB3K9F9b1kIYJOWNBbpfeEbG8
         Pi1ftOPYqqniTDe3NaToB5ttVNRo4VFXyQR4K7+B0yWFZw6sj8g563wh1PvqWZkcpnPk
         Yn8cIRPTCAXIE6vncVrQjfGdor8NJCwBvd6GVIF3nM0e55pbzg+wh38ah4x/aUdS3umL
         1c4z23uZomSIF9gqUhp56lKCNPQEAi0FP6yhyXpK6gq/BJ7ihpLzP9ioD+DA1Z9s/5vs
         YM5yr2zeHuzFjYfcKRxKw+TtO1zp1gUg9tpde1E9CKNXkPNnC8oEDRUOqcJN4JIPDkIh
         zXrQ==
X-Gm-Message-State: AAQBX9cxP1Yp17lFK0GNfPeIu98B4hwz1jUsqokHoYPOAJmxrhX2e56E
        kq6deEKD0IsQWICwaBt0zG2KWA==
X-Google-Smtp-Source: AKy350athCTWJFwC9QStRqEB2SQ3i+g9X8jbV7cHjYrcV3kkQoUpiKKCxIeF/qvj91z2Kg99e7wcSw==
X-Received: by 2002:a17:906:892:b0:92f:495b:bc7c with SMTP id n18-20020a170906089200b0092f495bbc7cmr6268101eje.23.1680813077135;
        Thu, 06 Apr 2023 13:31:17 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:31:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Oded Gabbay <ogabbay@kernel.org>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Aleksa Savic <savicaleksa83@gmail.com>,
        Jack Doan <me@jackdoan.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Marius Zachmann <mail@mariuszachmann.de>,
        Wilken Gottwalt <wilken.gottwalt@posteo.net>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Jean-Marie Verdun <verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Rudolf Marek <r.marek@assembler.cz>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Jonas Malaco <jonas@protocubo.io>,
        Aleksandr Mezin <mezin.alexander@gmail.com>,
        Derek John Clark <derekjohn.clark@gmail.com>,
        =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= 
        <samsagax@gmail.com>, Iwona Winiarska <iwona.winiarska@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Michael Walle <michael@walle.cc>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Agathe Porte <agathe.porte@nokia.com>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        patches@opensource.cirrus.com, openbmc@lists.ozlabs.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 01/68] hwmon: constify pointers to hwmon_channel_info
Date:   Thu,  6 Apr 2023 22:29:56 +0200
Message-Id: <20230406203103.3011503-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
References: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

HWmon core receives an array of pointers to hwmon_channel_info and it
does not modify it, thus it can be array of const pointers for safety.
This allows drivers to make them also const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/hwmon/hwmon-kernel-api.rst | 6 +++---
 drivers/accel/habanalabs/common/hwmon.c  | 2 +-
 drivers/hwmon/hwmon.c                    | 4 ++--
 include/linux/hwmon.h                    | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/hwmon/hwmon-kernel-api.rst b/Documentation/hwmon/hwmon-kernel-api.rst
index dbd68d7b033a..c2d1e0299d8d 100644
--- a/Documentation/hwmon/hwmon-kernel-api.rst
+++ b/Documentation/hwmon/hwmon-kernel-api.rst
@@ -107,7 +107,7 @@ The hwmon_chip_info structure looks as follows::
 
 	struct hwmon_chip_info {
 		const struct hwmon_ops *ops;
-		const struct hwmon_channel_info **info;
+		const struct hwmon_channel_info * const *info;
 	};
 
 It contains the following fields:
@@ -203,7 +203,7 @@ register (HWMON_T_MAX) as well as a maximum temperature hysteresis register
 		.config = lm75_temp_config,
 	};
 
-	static const struct hwmon_channel_info *lm75_info[] = {
+	static const struct hwmon_channel_info * const lm75_info[] = {
 		&lm75_chip,
 		&lm75_temp,
 		NULL
@@ -212,7 +212,7 @@ register (HWMON_T_MAX) as well as a maximum temperature hysteresis register
 	The HWMON_CHANNEL_INFO() macro can and should be used when possible.
 	With this macro, the above example can be simplified to
 
-	static const struct hwmon_channel_info *lm75_info[] = {
+	static const struct hwmon_channel_info * const lm75_info[] = {
 		HWMON_CHANNEL_INFO(chip,
 				HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
 		HWMON_CHANNEL_INFO(temp,
diff --git a/drivers/accel/habanalabs/common/hwmon.c b/drivers/accel/habanalabs/common/hwmon.c
index 55eb0203817f..8598056216e7 100644
--- a/drivers/accel/habanalabs/common/hwmon.c
+++ b/drivers/accel/habanalabs/common/hwmon.c
@@ -914,7 +914,7 @@ void hl_hwmon_fini(struct hl_device *hdev)
 
 void hl_hwmon_release_resources(struct hl_device *hdev)
 {
-	const struct hwmon_channel_info **channel_info_arr;
+	const struct hwmon_channel_info * const *channel_info_arr;
 	int i = 0;
 
 	if (!hdev->hl_chip_info->info)
diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index dc2e3646f943..573b83b6c08c 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -173,7 +173,7 @@ static int hwmon_thermal_set_trips(struct thermal_zone_device *tz, int low, int
 	struct hwmon_thermal_data *tdata = thermal_zone_device_priv(tz);
 	struct hwmon_device *hwdev = to_hwmon_device(tdata->dev);
 	const struct hwmon_chip_info *chip = hwdev->chip;
-	const struct hwmon_channel_info **info = chip->info;
+	const struct hwmon_channel_info * const *info = chip->info;
 	unsigned int i;
 	int err;
 
@@ -252,7 +252,7 @@ static int hwmon_thermal_register_sensors(struct device *dev)
 {
 	struct hwmon_device *hwdev = to_hwmon_device(dev);
 	const struct hwmon_chip_info *chip = hwdev->chip;
-	const struct hwmon_channel_info **info = chip->info;
+	const struct hwmon_channel_info * const *info = chip->info;
 	void *drvdata = dev_get_drvdata(dev);
 	int i;
 
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index c1b62384b6ee..492dd27a5dd8 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -430,7 +430,7 @@ struct hwmon_channel_info {
  */
 struct hwmon_chip_info {
 	const struct hwmon_ops *ops;
-	const struct hwmon_channel_info **info;
+	const struct hwmon_channel_info * const *info;
 };
 
 /* hwmon_device_register() is deprecated */
-- 
2.34.1

