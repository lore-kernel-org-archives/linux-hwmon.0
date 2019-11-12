Return-Path: <SRS0=vS6D=ZE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CC6C43331
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 22:30:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43B6721925
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 22:30:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="mkAenltE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbfKLWao (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Nov 2019 17:30:44 -0500
Received: from mx0a-002ab301.pphosted.com ([148.163.150.161]:12242 "EHLO
        mx0a-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727058AbfKLWao (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Nov 2019 17:30:44 -0500
Received: from pps.filterd (m0118789.ppops.net [127.0.0.1])
        by mx0a-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xACMPcEj012875;
        Tue, 12 Nov 2019 17:28:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 cc : subject : date : message-id : in-reply-to : references;
 s=pps-02182019; bh=/SWeVGogwmOlhROp+ImoSsXOiMdKLGqT8KghQ96hpi0=;
 b=mkAenltEtICqWwXn/pebMJQPnu+4UNdhX3dbtf0TVCEZYLNerEL3Nuvfg2QMnADf4DPP
 nc4PPXnM7Oiqr8/RTy7ztAH1uQzUrY8VZsYxXGvDs5bFcLLzt91ZGaSpvmcaTcqKuyAb
 xIjXDNqQvqnur1j3jt/Art9ZwOVUbRGJmClrMcWCLQjD6F9fUw7W3va7j1PmBfnFaPH8
 JQK/zz77LkposEjhEdgW/q5MjpJinWUtVD5qwOhujzB9zxVj4PTAzmyZ+uwpkRGljLlU
 UqVdZgdCiU1+baX8GU63nl363fKTDXZahwU8Wc5zmGcBOm67NaXPvTHYOp+ZHWH7AYEs Tg== 
Received: from pp-smtp-01.acuitylightinggroup.com ([192.234.69.190])
        by mx0a-002ab301.pphosted.com with ESMTP id 2w5q5c3waw-1;
        Tue, 12 Nov 2019 17:28:57 -0500
Received: from pps.filterd (pp-smtp-01.acuitylightinggroup.com [127.0.0.1])
        by pp-smtp-01.acuitylightinggroup.com (8.16.0.27/8.16.0.27) with SMTP id xACMQm8N020048;
        Tue, 12 Nov 2019 17:28:56 -0500
Received: from inf-dsk-207.acuitylightinggroup.com (inf-dsk-207.acuitylightinggroup.com [10.59.79.18])
        by pp-smtp-01.acuitylightinggroup.com with ESMTP id 2w5uadrkkm-2;
        Tue, 12 Nov 2019 17:28:56 -0500
From:   Eric Tremblay <etremblay@distech-controls.com>
To:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        corbet@lwn.net
Subject: [PATCH v8 1/2] dt-bindings: hwmon: Add TMP512/513
Date:   Tue, 12 Nov 2019 17:30:00 -0500
Message-Id: <20191112223001.20844-2-etremblay@distech-controls.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112223001.20844-1-etremblay@distech-controls.com>
References: <20191112223001.20844-1-etremblay@distech-controls.com>
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Reason: safe
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document the TMP513/512 device devicetree bindings

Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
---
 .../devicetree/bindings/hwmon/ti,tmp513.yaml  | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
new file mode 100644
index 000000000000..168235ad5d81
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/ti,tmp513.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TMP513/512 system monitor sensor
+
+maintainers:
+  - Eric Tremblay <etremblay@distech-controls.com>
+
+description: |
+  The TMP512 (dual-channel) and TMP513 (triple-channel) are system monitors
+  that include remote sensors, a local temperature sensor, and a high-side
+  current shunt monitor. These system monitors have the capability of measuring
+  remote temperatures, on-chip temperatures, and system voltage/power/current
+  consumption.
+
+  Datasheets:
+  http://www.ti.com/lit/gpn/tmp513
+  http://www.ti.com/lit/gpn/tmp512
+
+
+properties:
+  compatible:
+    enum:
+      - ti,tmp512
+      - ti,tmp513
+
+  reg:
+    maxItems: 1
+
+  shunt-resistor-micro-ohms:
+    description: |
+      If 0, the calibration process will be skiped and the current and power
+      measurement engine will not work. Temperature and voltage measurement
+      will continue to work. The shunt value also need to respect:
+      rshunt <= pga-gain * 40 * 1000 * 1000.
+      If not, it's not possible to compute a valid calibration value.
+    default: 1000
+
+  ti,pga-gain:
+    description: |
+      The gain value for the PGA function. This is 8, 4, 2 or 1.
+      The PGA gain affect the shunt voltage range.
+      The range will be equal to: pga-gain * 40mV
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8]
+    default: 8
+
+  ti,bus-range-microvolt:
+    description: |
+      This is the operating range of the bus voltage in microvolt
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [16000000, 32000000]
+    default: 32000000
+
+  ti,nfactor:
+    description: |
+      Array of three(TMP513) or two(TMP512) n-Factor value for each remote
+      temperature channel.
+      See datasheet Table 11 for n-Factor range list and value interpretation.
+    allOf:
+      - $ref: /schemas/types.yaml#definitions/uint32-array
+      - minItems: 2
+        maxItems: 3
+        items:
+          default: 0x00
+          minimum: 0x00
+          maximum: 0xFF
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          tmp513@5c {
+              compatible = "ti,tmp513";
+              reg = <0x5C>;
+              shunt-resistor-micro-ohms = <330000>;
+              ti,bus-range-microvolt = <32000000>;
+              ti,pga-gain = <8>;
+              ti,nfactor = <0x1 0xF3 0x00>;
+          };
+    };
-- 
2.17.1

