Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C2D3EDAC6;
	Wed, 15 Jul 2026 09:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106561; cv=none; b=ZZoQzU7fuVNd/8BgbVlN+MCV8a7DKgNp5GDeZReMMiJrmxKCK0sizotHitMkgub/jgV4u1CE3AN/KrlJpLNwACmSgHYjxGyu+W81BWeRzBOeP2VSxp0KvTiz/w/IFHEMrVoVkN46FM2mMsnCejGaCWgXIohB1loyBw5/1aBfmEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106561; c=relaxed/simple;
	bh=awbzImwgwevD5B+WPMxw/mtoevlgiKoZ2ZmXSNjFfjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VdrRfJHcyr8tTjHzARaKgnUSwukyB3XU7kJpvBx7cNaxwMtrldN06xz6Hfhbo1TihDuSD54cwE6E3lNNTMVNaxSVv2HnmSVXHd4akzws4HV9HzeIzsTC/KJAxJ2cQIV+5niHZlhhnShxGUWPizyOnG4qPQ6uUL+ikjYACX2mrxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZLNForR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZLNForR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67E27C2BCF4;
	Wed, 15 Jul 2026 09:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784106561;
	bh=awbzImwgwevD5B+WPMxw/mtoevlgiKoZ2ZmXSNjFfjM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YZLNForRYghznbLzoSPit0GhzIHNB7t0RP2+a7QdR2EdFHHKDRa0mQI7UdwSJYrnw
	 XksxyXWo8mqHTVRrxehXVHLGpRJT9BkieTT8F9MXCqCWLCBvFNN1oZCGVjopeValyr
	 MXOSf7yrY4GiNerw1/TeuXll416lZsrio0JXU2LidkJk2k6v4bt+8SKjnHZI90T9/P
	 CNymgcioON4SaBCf8uvmtYMGxml0NPVgMqRK7wtzmN8UcmFpLaQyZ5eZ7z95Q03EFy
	 n1vhUzpkDt21eTCjx1sJu2t/MAELYPlId6gR5Sz1nQ9Bk/gYWe7B5XHHiKfBEOfTbZ
	 ug7stbWaK3jyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1C7C4450E;
	Wed, 15 Jul 2026 09:09:21 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Date: Wed, 15 Jul 2026 17:08:36 +0800
Subject: [PATCH v2 2/4] dt-bindings: hwmon: Add Kandou KB9002
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-kb9002-upstream-v2-2-2fd390383da5@amd.com>
References: <20260715-kb9002-upstream-v2-0-2fd390383da5@amd.com>
In-Reply-To: <20260715-kb9002-upstream-v2-0-2fd390383da5@amd.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Chung <andy.chung@amd.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784106525; l=1681;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=sULzoCWER8/kQnyowJD1BDPPGQySh69msij2k9XFp+Q=;
 b=Bq/6LtMPuUuBWcupg02cmjvvO5QpsiKlwza1DPF/RD1+D0o2yfVBa6kXPydO406zXd37+CFfL
 OIEFahyfGSLBZRc/xhvT1KVaLnu1rKXtvEedzbRn34httP8QzeFmA29
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
 .../devicetree/bindings/hwmon/kandou,kb9002.yaml   | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/kandou,kb9002.yaml b/Documentation/devicetree/bindings/hwmon/kandou,kb9002.yaml
new file mode 100644
index 000000000000..67859e9d63c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/kandou,kb9002.yaml
@@ -0,0 +1,45 @@
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
+    minimum: 0x20
+    maximum: 0x27
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


