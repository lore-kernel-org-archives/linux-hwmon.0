Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1B5255F31
	for <linux-hwmon@vger.kernel.org>; Sun, 26 Oct 2025 06:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761461464; cv=none; b=mnXACdqL8tdz5i4lsTwGQ0YR3lcufIXog/hPKJY2piGkN2cmcjK7ug6awK797f4J0dxFaE2L0eSkJOszp6hnJTop0SF63u9mn75mTtWRJ2I9R8OPC/r3T63DF5g4b2l+nEWqMFTP6NAyBKKJFSzeDGoY+fcw/tSimcRKy3NSO4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761461464; c=relaxed/simple;
	bh=91eutbdiqidC/G4kon+Q++aT9/9DTzorL8tQ+hqakE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lcRO4F5cy6N50yZY95+4/0qwTvLwx6H/lsQdkL6HXt+TjVXgG7DcbvAOTK02NTVgy++qAUtwoQIWhrwDLEE0zZSU9TYCiMRUFtaVROCssih+jtpd8GwM5YCbVZa+zJsSxPYoY3ugvzS+QcH6Pk1ljlxYEWvv7/iu9a00GXlJQEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=NJSGOybT; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="NJSGOybT"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-290b48e09a7so43759145ad.0
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Oct 2025 23:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761461461; x=1762066261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dz7xWRpvEc8yOS8Ty/nPJaqOcnmga2XcXY7rl8nMBM4=;
        b=NJSGOybTdhQytV5T5cTzLXX1PHHiP0Xcfd0dExykrGIhpI0ItSrs+5k/8TWCwxQktE
         FQa/xSjNpde2yqTQ27j9X5GP6pGzT9VE4189t9HkSC4eT9Yrc07UYfPAGZ64LqFV9BzE
         XENPapCqv1Zd9NsiQDHC11Kd5MZZabpEyHQlN+NA3/izBsTSeLKW6l0XWaGtyIwD7Pa2
         z5IaCs40xwlMOuhCkqpNzBlZPVJ6mDfVaY30skxr/T+Dl4euV2pYYoFM5g781nDB/hXz
         QIO51Xiz87uM2nGrowua3tX61YEfEUw3uWCriQx7f5jV1NjMj8PA2v7uTzwVwIGArgZS
         RB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761461461; x=1762066261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dz7xWRpvEc8yOS8Ty/nPJaqOcnmga2XcXY7rl8nMBM4=;
        b=MWBSmk+SWO3JV5vs2lVGmJsPgTzqc/S9KJDIbGm/sPSirE2hz+/xdmCUy5GXL4vBAy
         J+kjBleEHCEb1QZ0j5jo8nnQbOtF68r96AG9mNq/FBD8YZu04eYIv5q3oQeox9rpp12r
         TItuyQkmnSN71tE4hT9xBs5mkoTRBhJmK1Q6HobckhTVj/5a8QWnFYdw16J3q2kqcbyO
         7tGsnljrPzlQVDuCll/APusiAwwk6SAvvFEDQALNoeojmGe0IJz+nTo7q3I/FJ6Vojyd
         qsfNRM+aL/6DVCxG6w2B9j2C8li1XXDkJoNfdCMh6qjX28ac3Tl2+/MUOndzb+YcxZGh
         Ls2A==
X-Gm-Message-State: AOJu0YzYOt19EMBQ/JmsYQHujYxrp021T8MGdfpMtW28ClQ+AnvlOeAZ
	fviQX5oP2xNDtRQu1X56cE3IhDwh/evZxqlnb18Vctn/tnX+N+/mrRIU01GfGq8PIDwSD55m/Zt
	tNECT9WA=
X-Gm-Gg: ASbGnctrZjFjo8K2IMvSTvrjJJRbKPPHFQUQCEyGJR8UdLk7IFiT0DGMB8JuBdw+VGO
	kB48Xl0CL3uS79urYtlIIKyRJpZN8dFU66iWH6jRLaZq7vpTudxq4Z34QbQpW+jlWJj2zfOzXi5
	0ARsxAK8Y4nO6rx60pXhgKc77Z2e3BCp7m9WZqmJuKlyvnhyqmmrKPBXgXlqPjSz3Azk3TOADgS
	dcStU6JfAlfdLcHDl4zvPNSpeuvwS1ipfhwhFxSu2hy/RYMgbjgVjKRZGpejE75R9Fuwjc/7PN/
	zmHx5n+ePFMgQQbwLb2ybgCbokGp3yMcTEqFhJSDtmhZszsXutXNcwKgYw3CBjQuhzUDBYkyZ3z
	i6yj6QM2m9jej9L28tNMWjeMglwErc6wBic2491pnier9LTupJifIqNAZaoOZ7hEDAFGBMp7zGV
	40ZSLrtdk9Ux7Lfxvv
X-Google-Smtp-Source: AGHT+IGUfSpO1SH+sIklCLC7sSxmHonNYEFcnwWc8ZIBDaDFBHRdSpDdt7EYFZ3pJ8lJ0K6h8hWNag==
X-Received: by 2002:a17:902:ec87:b0:24b:24dc:91a7 with SMTP id d9443c01a7336-290cb65c5a6mr393908385ad.45.1761461461459;
        Sat, 25 Oct 2025 23:51:01 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:640c:95e5:94c3:cc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d4288asm43184905ad.84.2025.10.25.23.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 23:51:01 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux-hwmon@vger.kernel.org
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v2 1/2] dt-bindings: hwmon: Add support for ST TSC1641 power monitor
Date: Sat, 25 Oct 2025 23:50:56 -0700
Message-ID: <20251026065057.627276-2-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251026065057.627276-1-igor@reznichenko.net>
References: <20251022044708.314287-1-igor@reznichenko.net>
 <20251026065057.627276-1-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a devicetree binding for the TSC1641 I2C power monitor.

Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
---
 .../devicetree/bindings/hwmon/st,tsc1641.yaml | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml b/Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
new file mode 100644
index 000000000000..cfa0e2cca869
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/st,tsc1641.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST Microelectronics TSC1641 I2C power monitor
+
+maintainers:
+  - Igor Reznichenko <igor@reznichenko.net>
+
+description: |
+  TSC1641 is a 60 V, 16-bit high-precision power monitor with I2C and
+  MIPI I3C interface
+
+  Datasheets:
+    https://www.st.com/resource/en/datasheet/tsc1641.pdf
+
+properties:
+  compatible:
+    const: st,tsc1641
+
+  reg:
+    maxItems: 1
+
+  shunt-resistor-micro-ohms:
+    description: Shunt resistor value in micro-ohms. Since device has internal
+      16-bit RSHUNT register with 10 uOhm LSB, the maximum value is capped at
+      655.35 mOhm.
+    minimum: 100
+    default: 1000
+    maximum: 655350
+
+  st,alert-polarity-active-high:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Default value is 0 which configures the normal polarity of the
+      ALERT pin, being active low open-drain. Setting this to 1 configures the
+      polarity of the ALERT pin to be inverted and active high open-drain.
+      Specify this property to set the alert polarity to active-high.
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
+        power-sensor@40 {
+            compatible = "st,tsc1641";
+            reg = <0x40>;
+            shunt-resistor-micro-ohms = <1000>;
+            st,alert-polarity-active-high;
+        };
+    };
-- 
2.43.0

