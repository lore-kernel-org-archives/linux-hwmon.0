Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E67C678D9
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 Jan 2023 16:14:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbjAQQOB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 Jan 2023 11:14:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbjAQQOA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Jan 2023 11:14:00 -0500
Received: from mail.zeus06.de (www.zeus06.de [194.117.254.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A4C3BDAE
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Jan 2023 08:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=kicherer.org; h=from:to
        :cc:subject:date:message-id:in-reply-to:references:mime-version
        :content-type:content-transfer-encoding; s=k1; bh=glk0Jn+gB8LWmA
        L9qdHg8WIPJlrmdmB5eXawWIkps0U=; b=CnFTy6aV0jjyVwFQQKfUCko5dOngo3
        pzFcykH83KV+rpZURQIxHZoY2FH5sfVQQMyTTofa/3+0ZUIuFCHhh2nkwPfV1M4F
        rJPcqTgkRPErI+J26ozUKXSq/8CWRqO+ZU2+ZzUaDp4hYZ9p78fz9cyxtxc6qWpT
        nXZniC15fan5Q=
Received: (qmail 1170969 invoked from network); 17 Jan 2023 17:13:57 +0100
Received: by mail.zeus06.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jan 2023 17:13:57 +0100
X-UD-Smtp-Session: l3s6476p2@Q+dR/Hfy1u7CtAHJ
From:   Mario Kicherer <dev@kicherer.org>
To:     linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        Mario Kicherer <dev@kicherer.org>
Subject: [PATCH v3 3/3] docs: hwmon: add docs for the NXP MC34VR500 PMIC
Date:   Tue, 17 Jan 2023 17:13:40 +0100
Message-Id: <20230117161340.1310936-4-dev@kicherer.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117161340.1310936-1-dev@kicherer.org>
References: <20230117161340.1310936-1-dev@kicherer.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch adds documentation for the NXP MC34VR500 PMIC.

Signed-off-by: Mario Kicherer <dev@kicherer.org>
---
 Documentation/hwmon/mc34vr500.rst | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/hwmon/mc34vr500.rst

diff --git a/Documentation/hwmon/mc34vr500.rst b/Documentation/hwmon/mc34vr500.rst
new file mode 100644
index 000000000000..5a8e0cbf4dbf
--- /dev/null
+++ b/Documentation/hwmon/mc34vr500.rst
@@ -0,0 +1,32 @@
+Kernel driver mc34vr500
+=======================
+
+Supported Chips:
+
+  * NXP MC34VR500
+
+    Prefix: 'mc34vr500'
+
+    Addresses scanned: I2C 0x08
+
+    Datasheet: https://www.nxp.com/docs/en/data-sheet/MC34VR500.pdf
+
+Author: Mario Kicherer <dev@kicherer.org>
+
+Description
+-----------
+
+This driver implements initial support for the NXP MC34VR500 PMIC. The MC34VR500
+monitors the temperature, input voltage and output currents and provides
+corresponding alarms. For the temperature, the chip can send interrupts if
+the temperature rises above one of the following values: 110°, 120°, 125° and
+130° Celsius. For the input voltage, an interrupt is sent when the voltage
+drops below 2.8V.
+
+Currently, this driver only implements the input voltage and temperature
+alarms. The interrupts are mapped as follows:
+
+<= 2.8V  -> in_min_alarm
+>110°c   -> temp_max_alarm
+>120°c   -> temp_crit_alarm
+>130°c   -> temp_emergency_alarm
-- 
2.34.1

