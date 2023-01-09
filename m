Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4241C54EBE
	for <linux-hwmon@archiver.kernel.org>; Mon,  9 Jan 2023 23:36:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237807AbjAIXgB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 9 Jan 2023 18:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237647AbjAIXf7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 Jan 2023 18:35:59 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82E7F646F
        for <linux-hwmon@vger.kernel.org>; Mon,  9 Jan 2023 15:35:57 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id i12so7470221qvs.2
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Jan 2023 15:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWfOKCoKa6fVAUu6wQ1ieIdGSmrl8W8A2HgAxf0hwpE=;
        b=bvtIZBszxda3SApy+Vt245BDingr6VZTIE0uCE8ugMrSsv+pvqEUruYgswQfXSdXNC
         VAmuqsJCdrrXukhir+jfqy8l19M5PrfFk69mRqg9raoPIPug6x1o6cRVtZeAcf/lOLoW
         7Cgg+TicuwJrkCt5Sqy5P5530IM+waDzfGZ1yMxP1Bhq+TjdXyNkEBDiPUXqqJtq5za/
         5ax6j0+xghsb2p/NVTdAbJPQrBnzzSRRzhpfdWhVDR20+0j0LFf7xuI7fjcJsyYZBgAd
         stdkfOLeBElQnrxjBCk5Qbkot5Uojaw2N8f1rxRdMveNL9PTyrPQK8hy1aaRoLP9lGgp
         EuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWfOKCoKa6fVAUu6wQ1ieIdGSmrl8W8A2HgAxf0hwpE=;
        b=05uKDFbPt2bM9QcGEuz+excyGo+PuNDjSiyCQQValp+JgJB/hw2WBugQ81KDwuOno/
         HYoHweo8dAoTqUAtn+o6zfaop2aw+kok/R3uXqHWlrmHcEdjLf1klbbNPq0P3K7VIhue
         q50y9GUp+NL5uDj/NLk8QesEvC4w2YAGy847xaSqEEs0pNWKFNNDDbYpTlShywrdorKe
         JIm2EHMp9dg0RPB85SX0iEMvs3JM1HLKiyIqwnjaU5SeM8piJ1W9v9ISTzLUGzuL35qx
         MQIfhW0R8BaY36+qAPgCfi0JW9wc/XO9WT+tjbGnFB3Ru/Omtwpjkbc/aLVdAmU1iaJ2
         QaBg==
X-Gm-Message-State: AFqh2kqbiUpoRgobXsqOfsz05VSOssEBPgGHgfIhzLZs+2sA8tJdoVCn
        9z+bu21lq8f9hpWUWp1TS/ukMOgIPPFwmN50
X-Google-Smtp-Source: AMrXdXs/rF2/7d4tbX4eiwWCEqNoi1JKKTU7hd5nGyVo6/fHYoOLbHXFadfBW4oZivtIGTPI+Nn6wQ==
X-Received: by 2002:a05:6214:c6c:b0:50e:48cc:a95a with SMTP id t12-20020a0562140c6c00b0050e48cca95amr123111751qvj.43.1673307356280;
        Mon, 09 Jan 2023 15:35:56 -0800 (PST)
Received: from jcormier-MS-7A93.syr.criticallink.com (static-72-90-70-109.syrcny.fios.verizon.net. [72.90.70.109])
        by smtp.gmail.com with ESMTPSA id t5-20020a05620a450500b006fa8299b4d5sm6294846qkp.100.2023.01.09.15.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:35:55 -0800 (PST)
From:   Jonathan Cormier <jcormier@criticallink.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Jonathan Cormier <jcormier@criticallink.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bob Duke <bduke@criticallink.com>,
        John Pruitt <jpruitt@criticallink.com>
Subject: [PATCH v3 1/5] dt-bindings: hwmon: adi,ltc2945: Add binding
Date:   Mon,  9 Jan 2023 18:35:30 -0500
Message-Id: <20230109233534.1932370-2-jcormier@criticallink.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230109233534.1932370-1-jcormier@criticallink.com>
References: <20221214220727.1350784-3-jcormier@criticallink.com>
 <20230109233534.1932370-1-jcormier@criticallink.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Create initial binding for the LTC2945 I2C power monitor.
Add shunt-resistor-micro-ohms parameter

Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
---
 .../bindings/hwmon/adi,ltc2945.yaml           | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc2945.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc2945.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc2945.yaml
new file mode 100644
index 000000000000..5cb66e97e816
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc2945.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/adi,ltc2945.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices LTC2945 wide range i2c power monitor
+
+maintainers:
+  - Guenter Roeck <linux@roeck-us.net>
+
+description: |
+  Analog Devices LTC2945 wide range i2c power monitor over I2C.
+
+  https://www.analog.com/media/en/technical-documentation/data-sheets/LTC2945.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,ltc2945
+
+  reg:
+    maxItems: 1
+
+  shunt-resistor-micro-ohms:
+    description:
+      Shunt resistor value in micro-Ohms
+    default: 1000
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        power-monitor@6e {
+            compatible = "adi,ltc2945";
+            reg = <0x6e>;
+            /* 10 milli-Ohm shunt resistor */
+            shunt-resistor-micro-ohms = <10000>;
+        };
+    };
+...
-- 
2.25.1

