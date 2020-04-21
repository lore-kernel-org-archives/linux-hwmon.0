Return-Path: <SRS0=+XiO=6F=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F9AC55181
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Apr 2020 08:01:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9130720B1F
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Apr 2020 08:01:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="2P4upNIc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbgDUIBV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Apr 2020 04:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728335AbgDUIBU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Apr 2020 04:01:20 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131EDC0610D5
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Apr 2020 01:01:20 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id s10so6190517wrr.0
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Apr 2020 01:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=itZ8nYpO9rVwAB+XOSiZ1Zaz+WlUMeN8KYJbRrgai8w=;
        b=2P4upNIcIwgvXsINcNwMKuLoNxfbr7DA+Jnu8ANYIWyy5/smGGvO2txOPebp357SyM
         9xtX+ZfPGfwrIPzvc5j36V2tN3+T1D+q3dwpBGFE7VWJMfZzVUcqeB+umjUadUUjSCq4
         dATQNiLI4T751oM+fcu4U/Y5XgsSygl4fgAYRVtuCQrFEXrvrVqsI9pgHO4pzjVa1d2T
         x/g46FT49QfIbn30BHst4ECbSzYAcH8x1/3QHciYWeaJJLSUi9kpiF14nf+kIFgFYPdr
         z7RlPTlHlYTEHzsbmqAs+tXOYt5s2M3tLDtDiyBpBUbkaQQNjDkzXMclSxyyLuFi0kbu
         iiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=itZ8nYpO9rVwAB+XOSiZ1Zaz+WlUMeN8KYJbRrgai8w=;
        b=AQT7mhFDihymeQxXrwF1dskCXrXDIXUhlfgoVUVqwLUJCCO2EsEu+5q7wsEUo183g+
         BRG2BTStag0fV9/Cme6RKoKV8Lcq7cfegLXC9KyMh9176ZHVuXgiCZfdN7QgL+XAYzjF
         ElZQq7xZYQkDgD1BnqzPrvSDa7KQWCL61/VtHPUgl/i5lZsnEkzkHU0K6TNXblHmPI/W
         2KZxpNu6Bn3oKXfHY9H5erKl7TVrKpvVX/RM+tislU8XRm3piMRn252NK/S3XzsuJSiu
         rrEslMjHZlgVabHodqi/n3d3lf0F+M4NJM7eYJ6hIyzNrIy63A4XYNlFBGtpspMe0Z6Y
         RzwA==
X-Gm-Message-State: AGi0PuZcLjUQYR3t6AWQxYWzFYoWy2EcJ51XJpVbc3Vg1Yq+MRvOcAKW
        6PJMOKCuYQJY0RQexIaGLumaKw==
X-Google-Smtp-Source: APiQypJ7I94NWf5qVdER06WU1+s/LCyUTU03msM+BLEEdT8t06/AWQHMkHiC71sCWlgXL4pKvRiNdw==
X-Received: by 2002:adf:db41:: with SMTP id f1mr21790458wrj.13.1587456078705;
        Tue, 21 Apr 2020 01:01:18 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
        by smtp.gmail.com with ESMTPSA id x132sm2561552wmg.33.2020.04.21.01.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 01:01:18 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     khilman@baylibre.com
Cc:     nick@khadas.com, art@khadas.com,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC 8/8] arm64: dts: meson-khadas-vim3: add Khadas MCU nodes
Date:   Tue, 21 Apr 2020 10:01:02 +0200
Message-Id: <20200421080102.22796-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200421080102.22796-1-narmstrong@baylibre.com>
References: <20200421080102.22796-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add the Khadas MCU node with active FAN thermal nodes for all the
Khadas VIM3 variants.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 094ecf2222bb..3325e54ea690 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -183,6 +183,23 @@
 	hdmi-phandle = <&hdmi_tx>;
 };
 
+&cpu_thermal {
+	trips {
+		cpu_active: cpu-active {
+			temperature = <80000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&cpu_active>;
+			cooling-device = <&khadas_mcu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &ext_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */
@@ -222,6 +239,12 @@
 	pinctrl-0 = <&i2c_ao_sck_pins>, <&i2c_ao_sda_pins>;
 	pinctrl-names = "default";
 
+	khadas_mcu: system-controller@18 {
+		compatible = "khadas,mcu";
+		reg = <0x18>;
+		#cooling-cells = <2>;
+	};
+
 	gpio_expander: gpio-controller@20 {
 		compatible = "ti,tca6408";
 		reg = <0x20>;
-- 
2.22.0

