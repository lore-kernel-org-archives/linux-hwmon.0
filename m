Return-Path: <SRS0=0ZqG=ZD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404FFC17447
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Nov 2019 20:35:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 15B3A214E0
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Nov 2019 20:35:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="UFE1uVkG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbfKKUf3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Nov 2019 15:35:29 -0500
Received: from mx0a-002ab301.pphosted.com ([148.163.150.161]:12218 "EHLO
        mx0a-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727058AbfKKUf3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Nov 2019 15:35:29 -0500
Received: from pps.filterd (m0118790.ppops.net [127.0.0.1])
        by mx0a-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xABKUZSu001174;
        Mon, 11 Nov 2019 15:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 cc : subject : date : message-id : in-reply-to : references;
 s=pps-02182019; bh=i8W1Kx6gS9Qjmej33Wdv7QX7i8E1UTb/tj0cbJcmhhg=;
 b=UFE1uVkGwc+TEOWLwzDwqrloU0FvBX3guVlFsIO6rDzuE3AfUaTID3IckYPtvLozVHVQ
 cTOxczANJ46XeJltF8eK10BEfMNow7o0wx5WgeFfwtgAS9U5PmzNJoJoWA/36rIrPb7U
 QCLUcPdn8L8Rnw1RRUkbgafRJylAuSxGh9q+u4wfGKHs+YpY9o2HVhnUpk2k4stdDxzx
 Nz6sUSvO+mykUwgZ7Ze+wY34NWodTfjn8pXfMGV3z7uRQ6OFO5j+MMCbWz4SZs2DoSNi
 /cWUCgywW5zd6Beezf+2zf+gpKF0b0zVE/GQmU8uPweQpo/ZVbLUds7bnZQjPvGyLKMi Tw== 
Received: from pp-smtp-02.acuitylightinggroup.com ([170.76.205.10])
        by mx0a-002ab301.pphosted.com with ESMTP id 2w7cv484pw-1;
        Mon, 11 Nov 2019 15:33:41 -0500
Received: from pps.filterd (pp-smtp-02.acuitylightinggroup.com [127.0.0.1])
        by pp-smtp-02.acuitylightinggroup.com (8.16.0.27/8.16.0.27) with SMTP id xABKWj6k021872;
        Mon, 11 Nov 2019 15:33:41 -0500
Received: from inf-dsk-207.acuitylightinggroup.com (inf-dsk-207.acuitylightinggroup.com [10.59.79.18])
        by pp-smtp-02.acuitylightinggroup.com with ESMTP id 2w5rqdr7yt-2;
        Mon, 11 Nov 2019 15:33:41 -0500
From:   etremblay@distech-controls.com
To:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        corbet@lwn.net
Subject: [PATCH v7 1/2] dt-bindings: hwmon: Add TMP512/513
Date:   Mon, 11 Nov 2019 15:34:44 -0500
Message-Id: <20191111203445.27130-2-etremblay@distech-controls.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191111203445.27130-1-etremblay@distech-controls.com>
References: <20191111203445.27130-1-etremblay@distech-controls.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-11-11_06:,,
 signatures=0
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911110179
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Eric Tremblay <etremblay@distech-controls.com>

Document the TMP513/512 device devicetree bindings

Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
---
 .../devicetree/bindings/hwmon/ti,tmp513.yaml  | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
new file mode 100644
index 000000000000..de4ed3645e0f
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
@@ -0,0 +1,89 @@
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
+  This driver implements support for Texas Instruments TMP512, and TMP513.
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
+      - $ref: /schemas/types.yaml#definitions/uint8-array
+      - minItems: 2
+        maxItems: 3
+        items:
+          default: 0
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    i2c {
+        tmp513@5c {
+            compatible = "ti,tmp513";
+            reg = <0x5C>;
+            shunt-resistor-micro-ohms = <330000>;
+            ti,bus-range-microvolt = <32000000>;
+            ti,pga-gain = <8>;
+            ti,nfactor = [01 F3 00];
+        };
+    };
-- 
2.17.1

