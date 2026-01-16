Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF0F314A60
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Jan 2026 09:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554014; cv=none; b=pkVfEAbwAw5vcohYWn/vAHTfF9CXT7oMRILpc+lvrrWfUW7VcYpp76tfLMz34jY4s9Rh2cw7CqrgCY2nWvDOYKLaoPeek3VEcCfI5AJixgM9/ShJ4uoaNr93w0N48NMWox71JXDisjHcJ3+WBf8hgA+Q1JnjwoeUtd9sz3w2AVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554014; c=relaxed/simple;
	bh=k6kJZK+mSCtSaeQ/Na3/Nw6zleT4XQn7IR5BvpypeEg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RJx/j2BkaimQfkaLBZqQMkMI5UKw4KrsfgVaiYkGPa5k380iy8wmWYLHhZ3fVZnCdFkB/mdYjscYT1xu/p0tRkaFL76b7V5caPXH3BhvW7IFgv/IZeYl1i7tGR8QyNWcNjDxRIQJFJMJ1dEki0OqEcTJyaNUAamu7AAcJ6FCppo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbK4WM0o; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbK4WM0o"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c551edc745eso867072a12.2
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Jan 2026 01:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768554011; x=1769158811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i4V8XqUH2nzegFm44X+jl+a+Lf24yE7XhsC0KU3eBG0=;
        b=CbK4WM0oNmsiD4PuBpttHMGmWa8udqCN0IRYH8sJvepkJ2xGw506y/B8bCNq0zEYDy
         DRtfcHSNnVxYiN/7pg6EC5oR19qTS4rCnLPknXYqeeBT6cJJMo1a0Wn7fwztWmUy9WXW
         kwngtE4yyptAAJLo78Km0tDZu6MRrBfmFt8wzTjs0w7Cp4mJA+Rc9jdTfg2N92g3KTRU
         yMh/Gua6lCcO20O+y4By8HtBe7/Q8aFUt4r0ggrrH8t60AX29CFoWMQD+or5BpfQ0vqt
         ZfparrEP9174vNVg0JsnqJrPIujnepKAMSqXILoU19L1TIodJeXdCox3fNwLGZ2bNGxZ
         XydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768554011; x=1769158811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4V8XqUH2nzegFm44X+jl+a+Lf24yE7XhsC0KU3eBG0=;
        b=BQx3An8r7yhFVgwLAK/dZFcFBZ30RINqBwFgp8Qnxzb50xS0GWw83VtbByFZJPTnbM
         zHwwMWiOfMDZ9jUaFAFogrCkU+GtL9usLX/zkJq6ijuc0KMsgSUqbTawZHniGyXlfZ1T
         NkN+HCeuduXP/cqvrZtbjxsqjFRHcyvVPs5EY4ZYnj9CnidY021DY1NFxD+CgN8ylZCa
         pKSrEkToNw4NbVEM+DVX6bzuUsbeCH6F2bvlR2nEKAEGbkXnDJnqRY/UADKqdyO8WxZr
         w3xa66XPEw0BPv6DZx3+8yEmr0vo9k3594qzTzeiqgqRHSHoFs8GMTJdtnVqfS1ID4eP
         6O8g==
X-Gm-Message-State: AOJu0Yyh4gz2dbzT93BygVWYPmuX8zTcAHEVn/7pEkuf1GX5EjkSJ7fn
	IQdQTiEvPCB6TDydoARyImdGi7WLo1dIuTIYG+X+bu1Pd1Rl+lGgJOGj
X-Gm-Gg: AY/fxX6Rx++uQEHXsRK99tMwOe26Rxn5JY5fvReYBXifUTzg4iqdTAL6/z318mQjzZC
	SGFTCLsP401aAOZc5wGwU1oydPW3zFI6VyXjKbPiuUCcT4dpZAkjIr6EQMvmDZujVCxQ5jK9wiE
	Le0/6OVhSQodGn2q0U1RfogSyuI7uSIz8ATB73yrgCK7TLZQvJfCVpvWRIt8gs3CS3sqpdqrJwp
	KheSedde6IWLus9A74OQvsX3BxOOT3cLXiV4MZe7EhARSNDxEUh4AL2MTuLV2P1TEpYN6MT8+V6
	TzAdQzuoowwSGUbwcc3JGvUH7MZ6PIVThGAbPt8XXboGdJdqWt/1l9NxpWZV/CLY2dleEIaNEiw
	/QpPn0eysNZXK9ylDIloRBTu7klbKTPmLgzYXxNt8j9kE5rewf2+k+BxNqNPnF7z7afT60fX1qy
	bJQPLuy8ssihH/6vAz7npVXIYen+Ytpmlumvdb4F1WlpC41Jcb2U2Dek4QDyNE6xluJXv4yL+ZB
	5hQwVSTNvDnKTu9AbxiGBtbR3G1C0A=
X-Received: by 2002:a17:903:1cd:b0:2a0:be68:9457 with SMTP id d9443c01a7336-2a7177d0da0mr26039185ad.44.1768554011456;
        Fri, 16 Jan 2026 01:00:11 -0800 (PST)
Received: from charles-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941b915sm15304445ad.90.2026.01.16.01.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 01:00:11 -0800 (PST)
From: Charles Hsu <hsu.yungteng@gmail.com>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Charles Hsu <hsu.yungteng@gmail.com>
Subject: [PATCH v6 1/2] dt-bindings: hwmon: add STEF48H28
Date: Fri, 16 Jan 2026 16:58:01 +0800
Message-Id: <20260116085802.696661-1-hsu.yungteng@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the hot-swap controller STEF48H28.

Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
---
Changes in v6:
- Fix patch formatting issues.

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

