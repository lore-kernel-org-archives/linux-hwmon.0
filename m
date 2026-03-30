Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26583B6C0C
	for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 10:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866257; cv=none; b=dX0pHn7/9lZzJcnpjPQgQsaEE3OXOtCyV7UzaFvVHQO/+vnBv/L9nyoAiPd/PjlvCLd3/wRZP2v0CD7JVRCNcvWN8TAPeIVVfABvNoILHb3tzkDg3MES6qnerlwZGus5rcxMh3olRJ8+hPHq9zbNTCdQGCaBW5lV84fjibqFTz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866257; c=relaxed/simple;
	bh=WIm6RubI/tLAJHS5ewOY+I8EBIbSNInquvgffjL+6y0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j67bhMsn0LMdkniiEXLIv+9+I2aO1JHvAeL2Ut1YFYeSuFSJn0nmwJro2C9tgY1mIiIwljwgyhWUoxdu3GfWfByagN7w2n1+Zm1s9nklTHlwTPNcnWH4IZpCqbcxgdO19YXZF1egyg4OOYIii3OvluDKmfQWhAablELNIiU8xIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7yMvNwI; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7yMvNwI"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso2072715a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 03:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774866256; x=1775471056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMUKD+43+H0oR5S99IJHORhT0x6zEEBwVqT64sGew7c=;
        b=Z7yMvNwIj9ZZR6Q1eCXleC13Ad5Dn+ncnOAM68ke5c5pvUXMyAz8f3Rjo5jJ+INtKt
         7MSyMYhOs8WZ2mNgncSOw1TkpOs2Ie76kchs9MYCc5CDkTTGBx89S9eZFc38aoflGGOQ
         K7PEJy1Bi/CEDKCh46Sea3g64/ZLBiTZhkixghbn4vmneKuGKLgu1IH0pY3tHgRQK6a9
         JAV4VI/yKlAMVtN49Aw/IOncktTy31saoUyDQ1ZFK6zrTQB/VnQgVkqlp9jQH28kOKaI
         G4NrvOOn5zmSpkOowWAezj+FwuWVnxrzDSvgBGzTRVpzmGm4hqPWD5McZ4X5marYKLrk
         iFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774866256; x=1775471056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CMUKD+43+H0oR5S99IJHORhT0x6zEEBwVqT64sGew7c=;
        b=G/RM3Gjl+CyxfWspvJUppjPdRy9QXA9H0OWCV3kqCEl7hvYezdAhc+t5NHowvesj9e
         lfLAKOGDRpkD35PF4E6+3bdFC93vAkp/pQ7jHwmfiqtJjb1BpW1sUt3IHde9ZyM3xjj1
         KzJs9P7rY2/6ymJKwMmtKsBmm7nU+CRV1CgaWSmZqh1BesGIWE9LzIlPMO2Ji/ouF3ON
         pMk5SdYYSbB5DrzHqICE22ZXTvCummX/EyiqO2v9biKsulPQ70gHtqhMXnVGa+z+nE7s
         QWt1c/We5dBs0XPqthlaFO9Inq+pVqxCfD4/MgZWvRvJzlZOjQIzAQWEYJilukocAEjZ
         Jyhg==
X-Gm-Message-State: AOJu0Yzjwy5Md2SSRczyymowB8PDxUeF/g63+WxjyIAbXHo4qoviCDRc
	KdF3sMUc+IT1BO6zFFcoOegbZcifB7ad04+yhltZ+3CUdHnUkYvG+RwG
X-Gm-Gg: ATEYQzxGAk6xvugyuukQlGBfGB0buaQlpdJQVwiYlDOeABCkzbXjGoImLtjPCrtKlYQ
	vV/U7Y+02nt9cDZ2a/MTfzXmiArHNt1EIxKulPgBkrMo6nbd/9Kv3Np6O7/MSqt6uqTRESr3Xhd
	sfuS+G1hKW2Q8E8eVsfbeBrlpi56E3t59z+0PMSJJTCWvyKFrm6GwnDV23mnRbKiVeuSDs4YHiE
	om/QR5IFVxk6gErX/zvZZCSp4UQIg0ywM8d3vs2aN36NQTrziD3EdoMyIJJyrXzXT/mO0gqcbhL
	bCTvdi0lnUh3bNqqPW2PlIedC5PcKlgh5A/RIWeYKWc32AOJEAk0IlhHvbCVvm+l6XsTzjO+WPc
	ZN6j6glAoLRRc3qttz/LiZOeZWgYmUcwbyIoQdDRUpqeVLYVcSb8bBrmHj4O0Zez+fsiF7EEp4B
	cpqL7MP4tzimthFRIKTllnz6z6pgWqJdJKFzjJ670TmaKuFg==
X-Received: by 2002:a17:90b:39cc:b0:353:356c:6821 with SMTP id 98e67ed59e1d1-35c2ffd0ec7mr11801460a91.8.1774866255957;
        Mon, 30 Mar 2026 03:24:15 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:93c7:f319:97ce:1434:43e8:eab7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35da9ef1b70sm2487452a91.16.2026.03.30.03.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:24:15 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720
Date: Mon, 30 Mar 2026 15:53:44 +0530
Message-Id: <20260330102345.37065-2-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260330102345.37065-1-Ashish.Yadav@infineon.com>
References: <20260330102345.37065-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add documentation for the device tree binding of the XDP720 eFuse.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---

This patch introduces a YAML schema describing the required and optional
properties for the XDP720 eFuse device node. It includes details on the
compatible string, register mapping, and rimon-micro-ohms(RIMON).

The RIMON resistance is installed between the Imon pin and the ground
reference.
---
 .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
new file mode 100644
index 000000000000..09249a326eee
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp720.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon XDP720 Digital eFuse Controller
+
+maintainers:
+  - Ashish Yadav <ashish.yadav@infineon.com>
+
+description: |
+  The XDP720 is an eFuse with integrated  current sensor and digital
+  controller. It provides accurate system telemetry (V, I, P, T) and
+  reports analog current at the IMON pin for post-processing.
+
+   Datasheet:
+     https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf
+
+properties:
+  compatible:
+    enum:
+      - infineon,xdp720
+
+  reg:
+    maxItems: 1
+
+  infineon,rimon-micro-ohms:
+    description: |
+      The value of the RIMON resistor, in micro‑ohms, required to enable
+      the system’s over‑current protection.
+    $ref: /schemas/types.yaml#/definitions/uint32
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
+        hwmon@11 {
+            compatible = "infineon,xdp720";
+            reg = <0x11>;
+            infineon,rimon-micro-ohms = <1098000000>;  /* 1.098k ohm */
+        };
+    };
-- 
2.39.5

