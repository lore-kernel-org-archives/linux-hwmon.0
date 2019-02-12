Return-Path: <SRS0=z86d=QT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A1DC282CA
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Feb 2019 11:38:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9E792184A
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Feb 2019 11:38:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="lUIlMsyi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfBLLiU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Feb 2019 06:38:20 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37050 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfBLLiT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Feb 2019 06:38:19 -0500
Received: by mail-pf1-f195.google.com with SMTP id s22so321345pfh.4
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Feb 2019 03:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k6pAyer58RNNFhdHldiD3k4wD4R5mI/N48g+M0dHSFw=;
        b=lUIlMsyixC9JiOxpujHG1ZbS/3Bmxp8Mk0PpoAVpJBBLd3slQS9KXgkNSDxgMUluBc
         GeVry8mJXd1ISgCsXHiHLXjaKmM01emVMXZhG8nuIPMKDygwT0SQRS9jE0zoRIuq1nUi
         6AEWzrYtWD7BkVsaNh/OoCor6tAQm0slIcyDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k6pAyer58RNNFhdHldiD3k4wD4R5mI/N48g+M0dHSFw=;
        b=CGTHuBJ/YOR14oIzD6JbHw/7k7AIuyMmVxYU5k0nUge1zRzhJpl+spljo3eIYYj2Bm
         bFg89UEEQJA41Sn+J6tBdglyzu2cZRk01spfT4amj97RJRobPibtdowt5iy8P5CNVE5M
         edSh3wGns4sZ83U77c5TjY1/98z1l6+cf1HLoUvBwQs6C2zDOpHOelpP1s/4+hyJZ02d
         HihLXrF0Sl/aFZAm087HMAt9aRh2HWZ06K2a9vihrLaqIiy0t5lQbdRabQiJT6zBsFWO
         RfXseJx1xJFlxBjLjnNXA9umKrj4EznoEIiHLKU8HPEVEUNp1DQPSaKZC9LZcR8v2ahG
         xiaQ==
X-Gm-Message-State: AHQUAubRXLku9DdJQSq3lNVakUVN+VqfRrfByYbAT7KlvfmWJKUH0K29
        Z3AjgAORvxPOi9JelwEDGb4CyA==
X-Google-Smtp-Source: AHgI3IbuX/T5TOQiDafZ/5axHx4F5iMTZigEVlxQJxapu/vf0htRap7fFeS2C2qxeMVFRovSt4NyeA==
X-Received: by 2002:a62:3241:: with SMTP id y62mr3537498pfy.178.1549971498845;
        Tue, 12 Feb 2019 03:38:18 -0800 (PST)
Received: from localhost.localdomain ([115.97.184.151])
        by smtp.gmail.com with ESMTPSA id b15sm4653478pfj.44.2019.02.12.03.38.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Feb 2019 03:38:18 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2] dt-bindings: hwmon: Add missing documentation for lm75
Date:   Tue, 12 Feb 2019 17:08:08 +0530
Message-Id: <20190212113808.3040-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add missing dt-binding documentation for lm75 hwmon sensor.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
-  Add all compatible nodes available in lm75.

 .../devicetree/bindings/hwmon/lm75.txt        | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lm75.txt

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.txt b/Documentation/devicetree/bindings/hwmon/lm75.txt
new file mode 100644
index 000000000000..12d8cf7cf592
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/lm75.txt
@@ -0,0 +1,37 @@
+*LM75 hwmon sensor.
+
+Required properties:
+- compatible: manufacturer and chip name, one of
+		"adi,adt75",
+		"dallas,ds1775",
+		"dallas,ds75",
+		"dallas,ds7505",
+		"gmt,g751",
+		"national,lm75",
+		"national,lm75a",
+		"national,lm75b",
+		"maxim,max6625",
+		"maxim,max6626",
+		"maxim,max31725",
+		"maxim,max31726",
+		"maxim,mcp980x",
+		"st,stds75",
+		"st,stlm75",
+		"microchip,tcn75",
+		"ti,tmp100",
+		"ti,tmp101",
+		"ti,tmp105",
+		"ti,tmp112",
+		"ti,tmp175",
+		"ti,tmp275",
+		"ti,tmp75",
+		"ti,tmp75c",
+
+- reg: I2C bus address of the device
+
+Example:
+
+sensor@48 {
+	compatible = "st,stlm75";
+	reg = <0x48>;
+};
-- 
2.18.0.321.gffc6fa0e3

