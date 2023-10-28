Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B66C0032E
	for <linux-hwmon@archiver.kernel.org>; Sat, 28 Oct 2023 12:05:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbjJ1MFl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 28 Oct 2023 08:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjJ1MFl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 28 Oct 2023 08:05:41 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A09ED;
        Sat, 28 Oct 2023 05:05:35 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-6b26a3163acso2590658b3a.2;
        Sat, 28 Oct 2023 05:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698494735; x=1699099535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7y+u3HX5A7WzeSwU6shpmTa8VRBi7WiJ2jWNjhVEC/8=;
        b=koj2OpGsSD0YhCJqTK4VgTVkTUtd0x4HAsmcAH7PTOr/T8DRkt8tDOeVJiYLM6vfH/
         Uk9fiSjBf4PpogxP4gf4Izb1eNnOQL6+XGUW+RkH8IwyX70VB9lUURd6+zo6yE42B5EU
         i0b7ZLutnpJ/N8F93HefZOF+47jP7Fl+lY+Z1U28aVK26rckMld8Oi0LuydWkGuB9cwa
         Zy53EUByHkwKBrfcK36ofBswql9CFrP+bTmzHiuqW4sJVBqOwVph442aN9wew7HOB3ws
         2W9j0Db396csPTfZ1UoWfdz04NfL4v1Ve/kPzowaPSxXDjRtdDTElDsKHju30mgK27bo
         wapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698494735; x=1699099535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7y+u3HX5A7WzeSwU6shpmTa8VRBi7WiJ2jWNjhVEC/8=;
        b=WuGuBNFcHQ8rMBwh535Zt7z/c6Gna3rB6kXnJq6CzuVQqueKOWWVCbPn4YyRSgSk59
         QKGm56C+oMot8GOp0AFoG+NA/I0wBde2gFrIjh3KQz3G3pjwNmy34GVi1Oh91J3OAUzZ
         qkJVKI52FYu+UF1BR1aV28MO8WymEEVq5W7Ttcmido6B3pWDprsocyfaG+zB/T2U6fRY
         RYTHHqvZPGP4klgo/0I+zzpjxzUYkAHgBff4fpLwNawVig/v6+wwrPnVpaw37UeaPUsP
         CeZGVBn0ya5RGU2BEkd63OkxacMqUZAnGAa4als6kUcoUY8l3+XbXL3jTPxIui8R73Nl
         F70g==
X-Gm-Message-State: AOJu0YxhATsTnMb6mS/QyAkdFM8fRcu1ZohyqgMM7tNekJ5EKsC7+SXC
        wSIfZfyoOfiH/H5luvejPw8=
X-Google-Smtp-Source: AGHT+IFafLoTZpF1qEjjbYkP9/C/z/JwSkvBITeeQyRoDjKA/NdXrON9up2EEpxEKeowa1fAvjCxRA==
X-Received: by 2002:a05:6a00:3924:b0:6be:43d5:6505 with SMTP id fh36-20020a056a00392400b006be43d56505mr4819597pfb.6.1698494735083;
        Sat, 28 Oct 2023 05:05:35 -0700 (PDT)
Received: from dawn-Aspire-A715-74G.. ([211.81.255.5])
        by smtp.gmail.com with ESMTPSA id s24-20020a62e718000000b00694ebe2b0d4sm2847311pfh.191.2023.10.28.05.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 05:05:34 -0700 (PDT)
From:   Li peiyu <579lpy@gmail.com>
To:     jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Li peiyu <579lpy@gmail.com>
Subject: [PATCH v4] dt-bindings: hwmon: lm87: convert to YAML
Date:   Sat, 28 Oct 2023 20:05:26 +0800
Message-Id: <20231028120526.19528-1-579lpy@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <29d2e5dc-7eb1-4dba-a2fe-4829fdb65a95@kernel.org>
References: <29d2e5dc-7eb1-4dba-a2fe-4829fdb65a95@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Convert the lm87 hwmon sensor bindings to DT schema

Signed-off-by: Li peiyu <579lpy@gmail.com>
---
Changes for v4:
- remove excess spaces
Changes for v3:
- add type definition of has-temp3, has-in6, has-in7
- Change the description of has-temp3
Changes for v2:
- replace node name lm87 with sensor
- replace character '\t' with spaces

 .../devicetree/bindings/hwmon/lm87.txt        | 30 ---------
 .../devicetree/bindings/hwmon/lm87.yaml       | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/lm87.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/lm87.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/lm87.txt b/Documentation/devicetree/bindings/hwmon/lm87.txt
deleted file mode 100644
index 758ff398b67b..000000000000
--- a/Documentation/devicetree/bindings/hwmon/lm87.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-*LM87 hwmon sensor.
-
-Required properties:
-- compatible: Should be
-	"ti,lm87"
-
-- reg: I2C address
-
-optional properties:
-- has-temp3: This configures pins 18 and 19 to be used as a second
-             remote temperature sensing channel. By default the pins
-             are configured as voltage input pins in0 and in5.
-
-- has-in6: When set, pin 5 is configured to be used as voltage input
-           in6. Otherwise the pin is set as FAN1 input.
-
-- has-in7: When set, pin 6 is configured to be used as voltage input
-           in7. Otherwise the pin is set as FAN2 input.
-
-- vcc-supply: a Phandle for the regulator supplying power, can be
-              configured to measure 5.0V power supply. Default is 3.3V.
-
-Example:
-
-lm87@2e {
-	compatible = "ti,lm87";
-	reg = <0x2e>;
-	has-temp3;
-	vcc-supply = <&reg_5v0>;
-};
diff --git a/Documentation/devicetree/bindings/hwmon/lm87.yaml b/Documentation/devicetree/bindings/hwmon/lm87.yaml
new file mode 100644
index 000000000000..587191c663d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/lm87.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/lm87.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LM87 hwmon sensor
+
+maintainers:
+  - Jean Delvare <jdelvare@suse.com>
+  - Guenter Roeck <linux@roeck-us.net>
+
+properties:
+  compatible:
+    const: ti,lm87
+
+  reg:
+    maxItems: 1
+
+  has-temp3:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      When set, pins 18 and 19 are configured to be used as a second
+      remote temperature sensing channel. Otherwise the pins are
+      configured as voltage input pins in0 and in5.
+
+  has-in6:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      When set, pin 5 is configured to be used as voltage input in6.
+      Otherwise the pin is set as FAN1 input.
+
+  has-in7:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      When set, pin 6 is configured to be used as voltage input in7.
+      Otherwise the pin is set as FAN2 input.
+
+  vcc-supply:
+    description: |
+      A Phandle for the regulator supplying power, can be configured to
+      measure 5.0V power supply. Default is 3.3V.
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
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      sensor@2e {
+        compatible = "ti,lm87";
+        reg = <0x2e>;
+        has-temp3;
+        vcc-supply = <&reg_5v0>;
+      };
+    };
-- 
2.34.1

