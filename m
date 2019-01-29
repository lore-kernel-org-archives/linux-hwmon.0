Return-Path: <SRS0=NJdv=QF=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C1B3C282C7
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Jan 2019 06:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59C772175B
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Jan 2019 06:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="TeKqwhJu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbfA2G4h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Jan 2019 01:56:37 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39245 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbfA2G4h (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Jan 2019 01:56:37 -0500
Received: by mail-pl1-f195.google.com with SMTP id 101so8946502pld.6
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Jan 2019 22:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dGn9hM8Sxs5FdNqcRp2MeP2tH32YrXO5xLq3FlKymfE=;
        b=TeKqwhJuY9rQs6J6mKskTsBmvU9/qn4Uuc2chpiEJpPcBh5qW/m8O+PSngPdyZsEJC
         tznolDq/pollndW3ZhDHs/tIeTs8aLYH+0Q1/Cdyf2vkMMV2d/gged9K/A2frwfvU6mI
         +U6gqKd40c/FO9QaEByt1g/VyofoDxanZWWzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dGn9hM8Sxs5FdNqcRp2MeP2tH32YrXO5xLq3FlKymfE=;
        b=b/kCtw+mR60BjWwRWSNrplUEb0ol5uSKUCEBtGRDqA3umYCqDjXmeZ/iJXl6WIuNXA
         wBdMGSfvWgOjN3pCu7WMDOPgmIvfu4OAXDhfyeRoHx/hiINUB7f+FyfB3EotbFujUWRg
         Kvt2apy06JLT6pjacoe7zarFV751S7bpsHyPMjlID8Dac3GzK4xyb/ZP6Q5SOqgtCceJ
         /cbhDxEInb/i47Fuo6HP3BVjy/Xw5UzAPHT/v18H70HnU19TpYOCESHeVI7Tahk6DH34
         MSLCjpGPMABTEUCF/ndF47A/zVXz23/YthiS4t8UcaXkLMonmHIAzzSS/D1U2iE7tgkt
         VrNQ==
X-Gm-Message-State: AJcUukclePQJn2d2SHbKYSKSs/y9rWVrh8W8ikTFLc3GAN9ZO1RH5eqr
        F46pYzq0zT/ruppQ/At7jI3hOA==
X-Google-Smtp-Source: ALg8bN59REIuoWjUa66v9cZczFLMGeXVFWTNrys/NkedDbRiY3GcZxeoKNNJlCEtAWBqjQnlXfJHGw==
X-Received: by 2002:a17:902:e08b:: with SMTP id cb11mr25096116plb.263.1548744996485;
        Mon, 28 Jan 2019 22:56:36 -0800 (PST)
Received: from localhost.localdomain ([115.97.179.75])
        by smtp.gmail.com with ESMTPSA id y71sm71507396pfi.123.2019.01.28.22.56.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Jan 2019 22:56:35 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH] dt-bindings: hwmon: Add lm75 documentation
Date:   Tue, 29 Jan 2019 12:26:23 +0530
Message-Id: <20190129065623.6771-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add dt-binding documentation for lm75 hwmon sensor.

Currently documented for national,lm75 and st,stlm75 and
rest might add when required.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 Documentation/devicetree/bindings/hwmon/lm75.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lm75.txt

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.txt b/Documentation/devicetree/bindings/hwmon/lm75.txt
new file mode 100644
index 000000000000..e384a3765f10
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/lm75.txt
@@ -0,0 +1,15 @@
+*LM75 hwmon sensor.
+
+Required properties:
+- compatible: one of
+	"national,lm75"
+	"st,stlm75"
+
+- reg: I2C address
+
+Example:
+
+sensor@48 {
+	compatible = "st,stlm75";
+	reg = <0x48>;
+};
-- 
2.18.0.321.gffc6fa0e3

