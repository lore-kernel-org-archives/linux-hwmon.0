Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327CB40B387;
	Tue, 21 Jul 2026 06:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615540; cv=none; b=P1ys7AkU2lZAc4NmfPciEXS3YDNOKBBkWtqOoGM/D0Y6vuHSfcKH/KXL0BLClJsniL9NqVZasn7Py4qDDCgnd+iePIbfrERJBpbJ01stU2x5yajYik1aNZbDRSGDq7b2zMqhxJfejbdf8EX431EaWqp4NdEIH7KgxZA0qPI1OuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615540; c=relaxed/simple;
	bh=IxrRhAYDY7rF4IMIn1rS7GFRGa0+W7a8SuzyIHiP0Rk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oH0NfQmYgaaCgtcuPKyI3PD5leQFh3CJx22dgtSOxjrfLdJ9Osqw3i5EOgKJWnVUMjRMbFiPvhvn7eYeoscessXsFSwJ15kuX7AdsNymt4vKJfSvkQ8BRrN/O52O83g1d2MGEwQnzt3UoLBlbtVpy1lVKQDWDjwEXkzZnUityOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFT1P/rm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFT1P/rm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D94EEC2BD00;
	Tue, 21 Jul 2026 06:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784615539;
	bh=IxrRhAYDY7rF4IMIn1rS7GFRGa0+W7a8SuzyIHiP0Rk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QFT1P/rmqABi0dM2KYEvgxBJGi6pvgu9OzraWu8KXHfs2F+vWRdiHHDsrxpzxIb4I
	 xWO3KevI0HpF8UwjEOOywZhXN49O2T7JdPl/Nia3ohFT/MuSa8bOlmECGzgLK5EWXl
	 Y2oW7nSK6EY7AZXhFQKfpFm+f3Gq3eMhflsKkPnvY5AUsoyZSOqM47uwrIJlAieGdV
	 MtkLD+deBKPqUGOts2xE0CS4d6gCUI+mK3/Ifj6Wyn0TieE2hOz/7gNIXYjNF4HCJA
	 pW73/wGVuMkFcVsCaQ3SObm7mLs2KrYUfHJv1BnYOVq1Gkl1hlg2wxF5qaAPG6i/7c
	 t2DcAJpyQEmDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EF4C4452D;
	Tue, 21 Jul 2026 06:32:19 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Date: Tue, 21 Jul 2026 14:31:33 +0800
Subject: [PATCH v3 2/4] dt-bindings: hwmon: Add Kandou KB9002
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-kb9002-upstream-v3-2-70563922be8d@amd.com>
References: <20260721-kb9002-upstream-v3-0-70563922be8d@amd.com>
In-Reply-To: <20260721-kb9002-upstream-v3-0-70563922be8d@amd.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Chung <andy.chung@amd.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784615506; l=1702;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=aa6Ba0HXZ1SFh9Lr9jRG/ZUTYEiDVeuZYixRpDGrB3E=;
 b=plFEds/yrtTdxmmSuAPgU078J8bnqzroBLMJlZu7LeXHHimp6tUU9Z1KAAysKoT9StIWshhQE
 2cftKEaUG/qBm1TqloP0ypl4PpkuG5ilzggJMdVjlaJpYGZVR5t6Ko4
X-Developer-Key: i=Andy.Chung@amd.com; a=ed25519;
 pk=X2gaHRnhU2q5hvMjkC6xmIcC03vKNvHY9CQRdsj9ecM=
X-Endpoint-Received: by B4 Relay for Andy.Chung@amd.com/20260327 with
 auth_id=696
X-Original-From: Andy Chung <Andy.Chung@amd.com>
Reply-To: Andy.Chung@amd.com

From: Andy Chung <Andy.Chung@amd.com>

Add device tree bindings for the Kandou KB9002 PCIe 5.0 retimer, an
SMBus target that exposes an aggregated die temperature.

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
---
 .../devicetree/bindings/hwmon/kandou,kb9002.yaml   | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/kandou,kb9002.yaml b/Documentation/devicetree/bindings/hwmon/kandou,kb9002.yaml
new file mode 100644
index 000000000000..0d939c8aa734
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/kandou,kb9002.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/kandou,kb9002.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kandou KB9002 PCIe 5.0 retimer
+
+maintainers:
+  - Andy Chung <andy.chung@amd.com>
+
+description: |
+  The Kandou KB9002 is an 8-lane PCIe 5.0 retimer that exposes a
+  firmware-controlled SMBus 3.0 target on its sideband interface.
+  The host can query the aggregated maximum die temperature and the
+  running firmware version through that target.
+
+  The 7-bit SMBus address is selected by three SMB_ADDR straps and
+  ranges from 0x20 to 0x27.
+
+properties:
+  compatible:
+    const: kandou,kb9002
+
+  reg:
+    items:
+      - minimum: 0x20
+        maximum: 0x27
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
+        retimer@20 {
+            compatible = "kandou,kb9002";
+            reg = <0x20>;
+        };
+    };

-- 
2.34.1


