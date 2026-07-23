Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1466F34041D;
	Thu, 23 Jul 2026 23:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784850932; cv=none; b=ayEU5nFn7HjH7Itq1Di1A/hgCLy/lQH+GB9GMdsLYnGKGg5b3vniuFHIt9Nh+7AeFtsNkDDnImvESRPkJLMKpKZZE5+inCt72HDm3SPjdTP3wqTjxS03bRnKsx03nA0OGw8ZK1/zLTV9o2FCrj9lSHj3YbU6OlJsObKaHUxq9lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784850932; c=relaxed/simple;
	bh=DLVhQmaKjnuyBa919iY7i8pN7lOModUYk9klGPgiHIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z2Ft7QdPiNkXB6RfWzC221EoEUWPGx/xwlMHMIoU5JHnQjpXYiY+x1hjlc0sbG6TPTicSC57I57gYG7+W5wSvl/nT7xiCj15ixjbZ5Va3213qAePRF7hyOrG0DLTHgA2XoADq9pqllOrGNCQGlirs+cx3WR5Bf6cyY0V3yFJig4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mC8FTELG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mC8FTELG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC3D8C2BCC9;
	Thu, 23 Jul 2026 23:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784850931;
	bh=DLVhQmaKjnuyBa919iY7i8pN7lOModUYk9klGPgiHIw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mC8FTELG93zKLwOnWTMvdQH0Uj9A6fLhd7UDVpP1OuuAw2zWuD1y4LvDRcDCKmC+A
	 gS+hhMUv0NwdVkt2IixSOPwJo26sh5+qqiurSTHYrWNJwS8+XBXbuq8xwYy19gISA+
	 iC9TX4a159Eel9Se1sqEOFK1WOmXtLp5gsdqRHKfk++JsW0gFTmykHaiCa5VA7/C8J
	 NKtgJ/mibZvldqEEPcwDvDDn26Ol7vFeslFqs99PEO5QvTcvctqjhbyzaNwy4henoh
	 dDnwKKtKFEp+tYMyhJAfWG51lENlwhdmbdtAq0UdR4cwHuFDGJq48bWIlyRkc79ECZ
	 KOKpuSf/7aOqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6D0C531FF;
	Thu, 23 Jul 2026 23:55:31 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Fri, 24 Jul 2026 01:55:28 +0200
Subject: [PATCH v5 2/3] dt-bindings: hwmon: pmbus: add MPS MPQ8646 binding
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-mpq8646_v0-v5-2-5915b5ae9aa2@free.fr>
References: <20260724-mpq8646_v0-v5-0-5915b5ae9aa2@free.fr>
In-Reply-To: <20260724-mpq8646_v0-v5-0-5915b5ae9aa2@free.fr>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784850929; l=1966;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=jpM2J4BObT1ueMT0EACWE+VQr1KSy7O4X/bw3YdCS0Q=;
 b=DA/dGfCyIZvJ62g4QLWR1GWa+dzt0DUBHuABib1dZ7TIXZLvpVQ6Lx2XxsY6WTgp3HK7l0nV3
 3S0NkMf2LYpDuZI9OviV0ofcxgRK3eT07f0Tig3VqXEMV4NRz9O+CfV
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
index 000000000000..7acf4f235b12
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
+  MPS MPQ8646 PMBus step-down converter.
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


