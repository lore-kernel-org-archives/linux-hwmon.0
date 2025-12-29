Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293102E8B74
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Dec 2025 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767004923; cv=none; b=Fyn6wpGyxuOWgRaG2Sbwil0hYk8gv9JvlWYgOA4Woqc6Ym9p/I6mWrxDDqdO//kGVHQ067pr6ix6RBEIktJnf6NkSCulKl/3HAhPo1MEZT4vxdRHVeAwoVCxW45lZgo51wZO7hSzQAgJfUrg9V/pxFLXnC6VZiHDdzfU9g5CT4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767004923; c=relaxed/simple;
	bh=gnCTBpHkjT2u/uhwo6SGtQ4dAyAcGDGCNmOyRLBxZTU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CXJKQXcCpPTxt1OQ0S5HHzTvsXvsKZe49+a2G5tKyXTM7wsE03UwOQmsg0SfwtYTUzJsJEIflV3adcgrX+dyv6WDdhpFOTcGH8kjcFlFB/T7DLKqX6IugnmQkV2zTcIAA0DZRXJcAChzCktkaw/OD7u878gUyJBkA6n8rkhuNtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWi5GXzy; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWi5GXzy"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0d5c365ceso117834845ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Dec 2025 02:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767004921; x=1767609721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/bak/Gm1yEoPiOz5r5uj+2GA4H6W72hfEprmZVj/Gz8=;
        b=gWi5GXzytWRFwJe8i9aLdSasXGqXDjvo1Qya0DvVSiDiDNHrWijLY75WVQQvd0pCVC
         /gjyTOrlhBO2rEO2MbOIM7Q8tScgKDADH7fEjAcye3XQtVBfXaoMk17gs1qDkwuXBa4z
         1/x8m/F2vA2OjSJkwXBwsHBKL50fx9uRRT4PY4NflOjsoqvXZv3zLwWzWxrc1qzTfzr6
         jJ4nbPFBYrIUOcwVhHr7crkTdgQGJzBaHFVPxAIQQKrb08hkOQev2I+3cpfJ08HYm/AN
         0gi0NgnnenFQb91H4jafB4wBDFp/zpA46t58i/hRtqlXf8PE2KnMTHxaqhtor4UgfUeM
         lqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767004921; x=1767609721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bak/Gm1yEoPiOz5r5uj+2GA4H6W72hfEprmZVj/Gz8=;
        b=o7zkrBq2xS/B3PMhcJW+kKRdHRe60zq2W7zxWzzKzU+ZrtwkuOFCcJsCi3OBwEc7nT
         KC7zgxb2X8EeprQ3c9pPInheHJeeeg0h4xKrU2Tx3l6DwWh4MUfamhr0/Dz1jjiNUpQ4
         hwcSoVcQp44o3I024v/BIth2iNOLWTzNvve9YAPugkG6VtxujIb0zWamM22ti5vm6SUA
         XcY6uOu2MHTQXD+9RE8k4GtWNw+4GLbUFKAiIQ9EkL9BjKZEwtjGcdZpZq0bAY+J6td0
         JG/536eH0FmxZEVPyg1xi4SSXmOV9lRJxNyYob4GoceyF+uJ+fR0UiHxlzA5VMfolwop
         Radw==
X-Gm-Message-State: AOJu0YzNHp/gCBKJ1kdUDYUZiRzs+KwP5HndnZXJS8nEHE+8p8Kf4JT3
	8Vc0YVFUbPSE/q85kx+k5+7uGSlfisBkdORbfPJww1/1J4Y9eTu8IniW
X-Gm-Gg: AY/fxX5+FognGFDFra709lOTIqPy+dZjIDOkbpwN0pCmtQ393FwmsArlEjJfIHrT2vH
	zbnRxvVhw0riLyxt7OjoC/kD5hSd8TNbzaH7krsqYCWT7Lj0DG2SDMJFmhLuMWMo0c1tTPxMnFn
	grj/I94mYCtRD1uhrOFGOeTg1nKBuXBDZNHSafpctjg6LbOyTgrbhILijTRjITSyn9aPgb5/kAj
	OBzjg6JOPFsx+bl/z052GMQZ/dP6Ei3FoFRK0ca4hNVNzVU608cns5nqjizDTM7WFFhoXgsN0cx
	O+DGT0qfABvRfnC8rI3rTDAmFvN3vWqLD5C7YkxCqDBngTDKrDB8F9MOAoxVFVlmdCZMnbem0jz
	gbiAMHcXuY3jBzLupPUPSB+62054xnppr3KuChHnEOQaoPjwmA6L65K6xJvJ5t7cNa09sO1dVF/
	BbqgyDx9RdqkmedBQi2NP3TPogo66SLyk5gYmGwZzXtM4EmAXURJQrSy6PUMqroKJUWsa5LJlRy
	sZT66kGorWNK2a6mpbdG6DuZM7rIbE=
X-Google-Smtp-Source: AGHT+IF9pF2OXfgj/4WKbrh74sWmW7eemfsJywFjVT833L1d7x1HTwDCFFHCW+3wFxyDrRtlCg5/zA==
X-Received: by 2002:a17:903:1a28:b0:29b:e54f:936d with SMTP id d9443c01a7336-2a2f21fc328mr297628145ad.1.1767004921362;
        Mon, 29 Dec 2025 02:42:01 -0800 (PST)
Received: from charles-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d77566sm272803575ad.97.2025.12.29.02.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 02:42:00 -0800 (PST)
From: Charles Hsu <hsu.yungteng@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Hsu <hsu.yungteng@gmail.com>
Subject: [PATCH v5 1/2] dt-bindings: hwmon: add STEF48H28
Date: Mon, 29 Dec 2025 18:39:55 +0800
Message-Id: <20251229103956.120184-1-hsu.yungteng@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the hot-swap controller STEF48H28.

Changes in v5:
- Move the change list into the commit message.

Changes in v4:
- Fix an incorrect datasheet URL and update it to the correct reference.

Changes in v3:
- Move the STEF48H28 Device Tree binding from
  trivial-devices.yaml to pmbus/stef48h28.yaml.

Changes in v2:
- Fix the entry in trivial-devices.yaml by correcting the comment
  and compatible string ordering.

Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
---
 .../bindings/hwmon/pmbus/st,stef48h28.yaml    | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml
new file mode 100644
index 000000000000..c6a4b02bcd84
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/st,stef48h28.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics hot-swap controller with PMBus interface
+
+maintainers:
+  - Charles Hsu <hsu.yungteng@gmail.com>
+
+description: |
+  The STEF48H28 is an advanced 30A integrated electronic fuse for
+  the 9-80V DC power lines.
+
+  Datasheet:
+    https://www.st.com/resource/en/data_brief/stef48h28.pdf
+
+properties:
+  compatible:
+    enum:
+      - st,stef48h28
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@11 {
+            compatible = "st,stef48h28";
+            reg = <0x11>;
+        };
+    };
-- 
2.34.1

