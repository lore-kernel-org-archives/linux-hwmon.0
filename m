Return-Path: <SRS0=+XiO=6F=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D5AFC55181
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Apr 2020 08:01:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C7E820B1F
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Apr 2020 08:01:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Md9y6ssM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728323AbgDUIBT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Apr 2020 04:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728308AbgDUIBS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Apr 2020 04:01:18 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416C2C061A10
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Apr 2020 01:01:18 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id g13so13292670wrb.8
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Apr 2020 01:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PW/4clGD+cpV/fhovnrun++NoVB5+LjULUtHoJY62Ro=;
        b=Md9y6ssMrmxnRFOzwDtyc3RnxZm3nSdhd7K9l4xzl4/VWbFceYuflIerAN7he2TWFR
         oNTsfEn2Q6Xkb3ecjkbJckzrNkaSGdUuulC6mufGJ0jAlNBQOajgMkfnBBYE58ikB4r1
         ISX+etHAS7QP2Uc9I/db4Odza0EoQwgn5DeeShK/I0SQKdFqU3zsuRnlUXGV2Cj/sSeC
         ei2xrxhha8RcR2Fu5PDtUnOPbzmaKYNFRcNmSArTvonErYUEP4N0gFApNgUGVf+xoAki
         c/Wi3kdy5iDqG9ZoiKx3UYAhlH7T0vOITbplT1K4cn1POCpdoRtyeeZFvedC054JqDc/
         gDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PW/4clGD+cpV/fhovnrun++NoVB5+LjULUtHoJY62Ro=;
        b=Z/wJr620WmRc7Atpv1wg4XXH2iQ9Q7J/paC80Wb5xtOi0D9NnylrgLwC5U3yHbMapo
         GlK4AU6jypvtFoCeQmvf/7x7zSMhOT9Oo8aGvm6WrllM0Et8hOMpsBYCR16o7XTtpXzJ
         uCkfQ3EA2dII4d5V6IB6QsKWwgy8agziG0DrVFNkeRrswhHVw4vgm2WhstrAiJ9fasmz
         DDgVp5TGyZVMO3uo+nJPFQA3ORIWssR06Q9NMnKzBCOCbpELBVlYxk74QFJ1nM7a38fF
         UUaRJeeKo58RVnye+8XMmdevb6POAStAHil/9b2YB1TdPo5rT/P8pQuevcIFFEpaMTSz
         xCZg==
X-Gm-Message-State: AGi0PubCz8/aps5BZv4uBTS3WEQiYau0isu8t3GhOu6y6bZ1RjXvBj+8
        HpsKmZ7SWetUsM7EI9/rOY7IvA==
X-Google-Smtp-Source: APiQypL3utEsf7dB2jih1sknlBtO+Mz3QtokX8dpUitlTh5nRmGcN9zA3N6rmgcof9M+WmyytjSehg==
X-Received: by 2002:a5d:4a4b:: with SMTP id v11mr21989927wrs.32.1587456075927;
        Tue, 21 Apr 2020 01:01:15 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
        by smtp.gmail.com with ESMTPSA id x132sm2561552wmg.33.2020.04.21.01.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 01:01:15 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     khilman@baylibre.com
Cc:     nick@khadas.com, art@khadas.com,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC 6/8] arm64: dts: meson-g12b: move G12B thermal nodes to meson-g12b.dtsi
Date:   Tue, 21 Apr 2020 10:01:00 +0200
Message-Id: <20200421080102.22796-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200421080102.22796-1-narmstrong@baylibre.com>
References: <20200421080102.22796-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The G12B thermal nodes should be in the meson-g12b.dtsi file.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi  | 23 ---------------------
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 22 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
index 783e5a397f86..e932205badea 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
@@ -355,29 +355,6 @@
 	};
 };
 
-&cpu_thermal {
-	cooling-maps {
-		map0 {
-			trip = <&cpu_passive>;
-			cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu102 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu103 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-		};
-		map1 {
-			trip = <&cpu_hot>;
-			cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu102 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu103 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-		};
-	};
-};
-
 &ethmac {
 	power-domains = <&pwrc PWRC_G12A_ETH_ID>;
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index 6dbc3968045b..9b8548e5f6e5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -113,3 +113,25 @@
 	compatible = "amlogic,g12b-clkc";
 };
 
+&cpu_thermal {
+	cooling-maps {
+		map0 {
+			trip = <&cpu_passive>;
+			cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu102 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu103 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+		map1 {
+			trip = <&cpu_hot>;
+			cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu102 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu103 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
-- 
2.22.0

