Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C164A13AE;
	Thu, 23 Jul 2026 13:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784811783; cv=none; b=CI4Znda73xeSCspUbS8OpQcx0pAg11C7Y/CjYW0fRLDe1H1G+4ZlttdQ7xwsWJmVlhwO5LKTQLuyMgxVmJ2RvgXk41nTpfYqHkX2D+OHEFf9nk8FjNiCeKDLxLAHHPgVSfNAp8RB5BWloySoilVKiu+/DVpfe4c01fPVCCKkG7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784811783; c=relaxed/simple;
	bh=1mon8LaeMuCph73tN+4tR92dPqjWfoCayEXKWENCMLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q4UdDOSw37X0hBkRPXI+C0ZjvoiU8oUL4pPSxYcmyvTnmupFgxIRWIxX8xw5YSF7Im16P9a8ewVIs5LcI2vsFU78SojzYmrnAeTupGFy0+zu/jWplUFK9/1x4n4Z24ZQl1jwgTtwAmk/wxwuOoXQQAC/Ln9P+gkU3GuO+HtqSjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsYs4m7i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsYs4m7i"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8952FC2BCF7;
	Thu, 23 Jul 2026 13:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784811783;
	bh=1mon8LaeMuCph73tN+4tR92dPqjWfoCayEXKWENCMLc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EsYs4m7ieh0GzPwxHld8jQ+oIXxS8KXpRj4A89O/2JlZW9uCjPEgLvmsoQFCFvdEm
	 Buo1MreKozUgt0HTx8VbMJQi4GvbIEjuYU1BPbCx9fTtN1Fvz5OCTrAedX0mT/wuLc
	 mCfYsZj9sfX1BEoemScZf+ucaQQmRW5Z4MuYErInRMWH78B+quRpQTDVkiUau7Jlvk
	 aPTk2Z1GR+mCHKqRBE+fj+OyELcuKG0gRX21/BnG6D9erSXBLdCV9nn9So4dGFdDOJ
	 qzZ5ReJCEtMARcK0147GIL52ev1SPMsQxXXcgf4s0URWCCPKi9R5a5UG3IO/wZjQrU
	 zmyuPqIczKKsQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70076C531CA;
	Thu, 23 Jul 2026 13:03:03 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Thu, 23 Jul 2026 15:02:43 +0200
Subject: [PATCH 2/3] dt-bindings: hwmon: pmbus: add MPS MPQ8646 binding
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-mpq8646_v0-v1-2-14363c75916f@free.fr>
References: <20260723-mpq8646_v0-v1-0-14363c75916f@free.fr>
In-Reply-To: <20260723-mpq8646_v0-v1-0-14363c75916f@free.fr>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784811776; l=1982;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=Tvf4fzvHxa9KKqFmGBANHE66PMlQlAr4hrKgSTUyCc4=;
 b=U08MA3fO8zvi76wSTIPiAJ8aUZLwkoPKs9FvZXg6VsyfAmQ77Q6McjT2qLrFeIenIAchmp4T/
 Hw9h0NFEd9nCvIaKwluwz/DGo8pbMAbc6vggpSbAHthUMAmRszdwGZL
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Add a device-tree binding for the Monolithic Power Systems
MPQ8646 step-down converter as a PMBus devince.

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


