Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2A73FF89F;
	Thu, 23 Jul 2026 21:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784842727; cv=none; b=XKW9OA62F6W6db7lxAl3sFYKFzFIzKZ1cBMztU452JeVOyZe/lDizSHdTOPZsTSUUzwmL5lLNYC4nCXLOmBLfWG1WMyb0CadkFgDyTN7fdgeKbVz7ZaeW/FhmvBfcAZ1OICzXZd0VSrfOVovUGJ6Kupaar6/+oWPYv1nwM2BViI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784842727; c=relaxed/simple;
	bh=DLVhQmaKjnuyBa919iY7i8pN7lOModUYk9klGPgiHIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cBCQbZjr9lGkCJqMbvtUQ9QobFyeTortKvKeFlnz1W7jlQWmPnASdGwu8opMOubqqh4gPbnetsNL7mRV2+atbmwwNCv5cPRKg0r4ixJ45u6GvL3Wd+OZm7sg6itv90DTI3CCWtof5KEyVESs/wf66dOwDMmiXluveTlnlYzfboo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLHdEtbb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLHdEtbb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 024B5C2BCF7;
	Thu, 23 Jul 2026 21:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784842727;
	bh=DLVhQmaKjnuyBa919iY7i8pN7lOModUYk9klGPgiHIw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aLHdEtbbJDzC+4dbwCXqjKxyKmGfhElnckkqHbori+CNGOSdLNLJqRrt52/SWXpZ+
	 oORwfFSKtmpbRzA9Uv5ydti8L6V9PA5Uu3awjwN59Nb4UoNHvz+0UGhr5ZELZDChrq
	 VdOmNjJBZkuXo42n5Y8GK0ZDEDMFN9mR5c7OA8LAo+xyd61DZlYVtxSVFOiI3TyrYa
	 BN+V9Pe0QhTGj7t9P+lRkQhEc+L2qU/smq+SgvSgvel0jn1dF8zEbJnK14MPxmEMMM
	 VWbeRIH1tJ6+6AiQwYQDjDgwPBmfztnAzWTah/mOlYETTwii5mXDQRimCIRLqcJjJa
	 KDR0nWg/87iEw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F06C531D0;
	Thu, 23 Jul 2026 21:38:46 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Thu, 23 Jul 2026 23:38:45 +0200
Subject: [PATCH v4 2/3] dt-bindings: hwmon: pmbus: add MPS MPQ8646 binding
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-mpq8646_v0-v4-2-b6323d5fc524@free.fr>
References: <20260723-mpq8646_v0-v4-0-b6323d5fc524@free.fr>
In-Reply-To: <20260723-mpq8646_v0-v4-0-b6323d5fc524@free.fr>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784842725; l=1966;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=jpM2J4BObT1ueMT0EACWE+VQr1KSy7O4X/bw3YdCS0Q=;
 b=fhoao3hf9ITESHzo6hYX4viwfDEuxSnhI/6eN0Dh0heR0UJVN5neFRNkVhQDkh9g1pU/7A+O3
 RFE1nkbZSEnAmy1vECvDlKgWkgIPITW59K8Vh3q78GQZ1+QoqTbnouZ
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


