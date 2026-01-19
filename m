Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B5014EC73;
	Mon, 19 Jan 2026 04:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768795512; cv=none; b=cOR8g6J4cv7/n9m+M0RZvCZdx6tHAPWZklrgv28rLpJETz6lLtyKeD0E4mnoJGz/c67O0a5k48n1fd+11xbuN3kqCLgdDuZOOqQiWOCvedoDibEg7HA3SaMf0SDjiOnSD143xd6upASFvznpKmjCSNFekii3rh3/As7VBIHizTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768795512; c=relaxed/simple;
	bh=X7zdAfg0njGQ7BhyvgK1ZVLDgQACN6nEQOAhfEj3x1M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M94PGkg3AFZZIqM4Z+pjeNFp15ASFSkes2ooxYbGjBjU5C7RqsooWJODTitWMbv46FeECmrouKRr9FaJ1N+sGCNMZ7vxB6IWPPXvGaXKgbiWfC0uazBFzNw2MwWz+dlKxMCXQ0lH4mUEfEi4IzFOjhclHnBq5uoDPTpe9Jb0DRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E3DBC1A2206;
	Mon, 19 Jan 2026 05:05:01 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id ACB351A2208;
	Mon, 19 Jan 2026 05:05:01 +0100 (CET)
Received: from lsv031445.swis.in-blr01.nxp.com (lsv031445.swis.in-blr01.nxp.com [92.120.147.159])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 746F11800079;
	Mon, 19 Jan 2026 12:05:00 +0800 (+08)
From: Mayank Mahajan <mayankmahajan.x@nxp.com>
To: linux@roeck-us.net,
	corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: priyanka.jain@nxp.com,
	vikash.bansal@nxp.com,
	Mayank Mahajan <mayankmahajan.x@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: hwmon: ti,tmp108: Add P3T1035,P3T2030
Date: Mon, 19 Jan 2026 09:34:57 +0530
Message-Id: <20260119040459.2898998-1-mayankmahajan.x@nxp.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Document the NXP P3T1035 and P3T2030 compatibles in TMP108.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mayank Mahajan <mayankmahajan.x@nxp.com>
---
V1 -> V2:
- No changes in v2.
V2 -> V3:
- Add P3T1035 fallback for P3T2030 as they are functionally identical.
- Add comment in the description explaining the use of P3T2030.
V3 -> V4:
- Remove comment in the description explaining the schema.
V4 -> V5:
- No changes in v5.

 .../devicetree/bindings/hwmon/ti,tmp108.yaml  | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
index a6f9319e068d..9f6c9f6fa561 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
@@ -4,27 +4,32 @@
 $id: http://devicetree.org/schemas/hwmon/ti,tmp108.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#

-title: TMP108/P3T1085(NXP) temperature sensor
+title: TMP108/P3T1035/P3T1085/P3T2030 temperature sensor

 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>

 description: |
-  The TMP108/P3T1085(NXP) is a digital-output temperature sensor with a
-  dynamically-programmable limit window, and under- and overtemperature
-  alert functions.
+  The TMP108 or NXP P3T Family (P3T1035, P3T1085 and P3T2030) is a digital-
+  output temperature sensor with a dynamically-programmable limit window,
+  and under- and over-temperature alert functions.

-  P3T1085(NXP) support I3C.
+  NXP P3T Family (P3T1035, P3T1085 and P3T2030) supports I3C.

   Datasheets:
     https://www.ti.com/product/TMP108
     https://www.nxp.com/docs/en/data-sheet/P3T1085UK.pdf
+    https://www.nxp.com/docs/en/data-sheet/P3T1035XUK_P3T2030XUK.pdf

 properties:
   compatible:
-    enum:
-      - nxp,p3t1085
-      - ti,tmp108
+    oneOf:
+      - items:
+          - const: nxp,p3t2030
+          - const: nxp,p3t1035
+      - const: nxp,p3t1035
+      - const: nxp,p3t1085
+      - const: ti,tmp108

   interrupts:
     items:

base-commit: 983d014aafb14ee5e4915465bf8948e8f3a723b5
--
2.34.1
