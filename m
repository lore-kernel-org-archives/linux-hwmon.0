Return-Path: <SRS0=WP0z=C5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD2AC43468
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Sep 2020 18:09:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B657D2085B
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Sep 2020 18:09:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="P3T1VNit"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgITSJ5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 20 Sep 2020 14:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgITSJ5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Sep 2020 14:09:57 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F75C061755
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Sep 2020 11:09:57 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z4so10453512wrr.4
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Sep 2020 11:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RhsFwh0Xf746HqZw1ov1Te1cJJL//OI9FdvirfvR/J0=;
        b=P3T1VNit7YRch2zqqUzWKRcDaR/gZAOkDwhecbf+wXZKwnUMWof4h1azv6BxV/Lb6j
         +x0F0a2UOEyKl3Ml5SQmv49L9JzpqArWijmpfw2Q7o8f6P9tkayzcYYRBiw/5mocZ3DG
         s/n7oJTatXlyNPymhPqCojjmANy/EKQyCu3W0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RhsFwh0Xf746HqZw1ov1Te1cJJL//OI9FdvirfvR/J0=;
        b=cs3TXF6OeBqfeOiTieCdAomwxuhW4JI2LNHoIqcnpAZbfoZl3hPsD6rRGFxF+CWkR9
         yujp5Mq/2QhC0/8rn1vBWQwRjOKLHXz4Dt+E+2XHjWTTEM8ghBS64Tnb0+wiWAWDW/IL
         XX+FbKrhtmcfj2GFN3DPa9h+WcZk/H0LltIHR2mOcOKXO2LA6CEwWI4YSeBpdG8MVLeF
         LCEbPihilQA6TOE2SOF7RaqAlzmot9oU+kS0yYhc28wIUmbziqpXOJt660f4qudzxz7I
         9elFM4bRkwmy+WsyiBIz4G5XbsdPc+HVFyFG+TepxFIjbSa1mzxkMdn2a3lVQJnldh6i
         wTIQ==
X-Gm-Message-State: AOAM530sOECg3MwGHbHk84IDzk2bEmxWmvpVSFMZqNje+MgsiWoclpQW
        xBfVs0E+HYDUAFBbvxLuFLos0w==
X-Google-Smtp-Source: ABdhPJxzGkGUwoRRauQ6T3Dmh06fz+pp8J+JQyUtB9N2x/mwpA4ZxxWZiRexuMZFTB0Izq4qkCj3Sg==
X-Received: by 2002:a5d:69c9:: with SMTP id s9mr48266043wrw.348.1600625395596;
        Sun, 20 Sep 2020 11:09:55 -0700 (PDT)
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id h186sm15823702wmf.24.2020.09.20.11.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 11:09:55 -0700 (PDT)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/1] dt-bindings: hwmon: pwm-fan: Support multiple fan tachometer inputs
Date:   Sun, 20 Sep 2020 19:09:40 +0100
Message-Id: <20200920180943.352526-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200920180943.352526-1-pbarker@konsulko.com>
References: <20200920180943.352526-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document and give an example of how to define multiple fan tachometer
inputs for the pwm-fan driver.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 .../devicetree/bindings/hwmon/pwm-fan.txt     | 28 +++++++++++++------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
index 41b76762953a..4509e688623a 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
@@ -8,15 +8,16 @@ Required properties:
 
 Optional properties:
 - fan-supply		: phandle to the regulator that provides power to the fan
-- interrupts		: This contains a single interrupt specifier which
-			  describes the tachometer output of the fan as an
-			  interrupt source. The output signal must generate a
-			  defined number of interrupts per fan revolution, which
-			  require that it must be self resetting edge interrupts.
-			  See interrupt-controller/interrupts.txt for the format.
-- pulses-per-revolution : define the tachometer pulses per fan revolution as
-			  an integer (default is 2 interrupts per revolution).
-			  The value must be greater than zero.
+- interrupts		: This contains an interrupt specifier for each fan
+			  tachometer output connected to an interrupt source.
+			  The output signal must generate a defined number of
+			  interrupts per fan revolution, which require that
+			  it must be self resetting edge interrupts. See
+			  interrupt-controller/interrupts.txt for the format.
+- pulses-per-revolution : define the number of pulses per fan revolution for
+			  each tachometer input as an integer (default is 2
+			  interrupts per revolution). The value must be
+			  greater than zero.
 
 Example:
 	fan0: pwm-fan {
@@ -55,3 +56,12 @@ Example 2:
 		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
 		pulses-per-revolution = <2>;
 	};
+
+Example 3:
+	fan0: pwm-fan {
+		compatible = "pwm-fan";
+		pwms = <&pwm1 0 25000 0>;
+		interrupts-extended = <&gpio1 1 IRQ_TYPE_EDGE_FALLING>,
+			<&gpio2 5 IRQ_TYPE_EDGE_FALLING>;
+		pulses-per-revolution = <2>, <1>;
+	};
-- 
2.28.0

