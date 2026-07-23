Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67487477289;
	Thu, 23 Jul 2026 15:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821572; cv=none; b=QfunASs/JHe1zHdnlCGxSFt1ItWjAJrjkGukWAGaEnGFCvORVjViMaLpaIGLZzyInaUKFvpNkcC4BG5hJrn/5syEpPTEJLdfZS+5tSzsJ2yB30dgUq9Ydi/hez6NcWudCXD9oHUUUtzXNNA14fDWKqFhtz/2Q+MQQPDJv4BQXr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821572; c=relaxed/simple;
	bh=Hlkt1la4nswj+5NkXwp/Yf8uwqOeZQ07zTTI9UXQiuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RrgqvyoZaLk3jMDfG3AD9JP1gjolpx34itM4Y2AcSRCVNOexSsa6D52HaX6atZxvWjD60/z2wyrfXmgCuTh7omLPNkQLsUhq1zHrQADI45VmIPAXTtypDal91hKtElOJHWgdjJo5wX2jw7RaEaMTeJNQ1gvWZ0VYkbVD8EVg31o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QiCqkbcI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QiCqkbcI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C437EC2BCF7;
	Thu, 23 Jul 2026 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784821570;
	bh=Hlkt1la4nswj+5NkXwp/Yf8uwqOeZQ07zTTI9UXQiuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QiCqkbcIjSq6gGH735zUflaW5V+2Xu84ubSqSPR8jutVWoiDtpGc+EzcaSlXHOo2q
	 exAFelOewsmFc9DR3J+re1O8/ASlZTOaSFzCz56/J8i5urHBkTQ9C8sRciH491LEFH
	 VP6e659NhFn4/sABu3KGzKiK/7KL8ye3KoZsePSevqqaXD+DhPIc2L6g3TLNnqo4MH
	 sOfzDLZaoXachvtGV1miPdZylp4f4XGpGL8X7ukDoQQm9BSKR9snBMtiR8CQiaUrg/
	 JzfUp2SuHAHGqzjPho9IxZ+UNl9aLUAOzyN1/1AjRG4vNido21Y5OqGIDP1dbKZ09p
	 PzMPP0cs+eRbQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A6EC531F9;
	Thu, 23 Jul 2026 15:46:10 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Thu, 23 Jul 2026 17:46:06 +0200
Subject: [PATCH v2 2/3] dt-bindings: hwmon: pmbus: add MPS MPQ8646 binding
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-mpq8646_v0-v2-2-3c4cb71f23c0@free.fr>
References: <20260723-mpq8646_v0-v2-0-3c4cb71f23c0@free.fr>
In-Reply-To: <20260723-mpq8646_v0-v2-0-3c4cb71f23c0@free.fr>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784821569; l=1981;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=0wKiuVAue/U1uDeAsZEu1pkRFNe5eYJ+NCPIIaUPwzg=;
 b=oC/RvoOk2MrEuXITMTkWXS3dmaVXYw1F5RF9umCD+evaPmx0wyHJ050zdOrexXH4E3HoIgC4U
 h93ilgcFCbnC9QQu9Rl+BlnwrBncHVlBYDo4RiVLEEd+5AWYQquXNAl
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Add a device-tree binding for the Monolithic Power Systems
MPQ8646 step-down converter as a PMBus device.

The schema is inspired from the mpq8785e:
same mps,vout-fb-divider-ratio-permille property (maximum: 2047),
and const: mps,mpq8646.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 .../bindings/hwmon/pmbus/mps,mpq8646.yaml          | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8646.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8646.yaml
new file mode 100644
index 000000000000..401a80325b4b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8646.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2026 Free Mobile - Vincent Jardin <vjardin@free.fr>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/mps,mpq8646.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Monolithic Power Systems MPQ8646 PMBus Step-Down Converter (extended)
+
+maintainers:
+  - Vincent Jardin <vjardin@free.fr>
+
+description: |
+  PMBus driver for the MPS MPQ8646 step-down converter.
+
+properties:
+  compatible:
+    const: mps,mpq8646
+
+  reg:
+    maxItems: 1
+
+  mps,vout-fb-divider-ratio-permille:
+    description:
+      The feedback resistor divider ratio, expressed in permille
+      (Vfb / Vout * 1000). This value is written to the
+      PMBUS_VOUT_SCALE_LOOP register and is required for correct output
+      voltage presentation.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 2047
+    default: 706
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
+      regulator@10 {
+        compatible = "mps,mpq8646";
+        reg = <0x10>;
+      };
+    };

-- 
2.43.0


