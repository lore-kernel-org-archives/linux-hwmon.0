Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F2D29ACC6;
	Thu, 15 Jan 2026 11:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768475666; cv=none; b=UjHOvOgcI37+e1Wupzu6icQE9ScMeF0LVK/sqQkKbkZpDorCH9jbqUs32jlRKgH+PByN7zAZw9f49ULyrE5AMFHuFSAdSTjAJM32l8GNM/+6zjUKka0IOWXj4N+MqwKMEYmoZfD9Adlm63UeTReZXD5lASMMyWXBfomAmy7D0bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768475666; c=relaxed/simple;
	bh=UUtNN/zq/MKZGeiZH3wCPMaeyJnM2LfOzzKRzIT+eQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pbFP1T9z3XlS91/r5TWJp/H2wkzDrrDL+0gP8ZZoMok1JfLgq/a4uPSidX+DNXs58krrXxgfhyKB46mIp3n7NYRpDmOgmkXgR4c9S71PJqEv/HTQPQOMzTS1jpCYU1IAZrKl0HsJ7hDOWbCC8M/KE8xHC7Q7WXxz4mH7LQQ+ZEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 773D3200656;
	Thu, 15 Jan 2026 12:14:23 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4A62B20064B;
	Thu, 15 Jan 2026 12:14:23 +0100 (CET)
Received: from NXL37714.wbi.nxp.com (nxl37714.wbi.nxp.com [10.31.156.112])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 863B21800082;
	Thu, 15 Jan 2026 19:14:21 +0800 (+08)
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
	Mayank Mahajan <mayankmahajan.x@nxp.com>
Subject: [PATCH v3 1/3] dt-bindings: hwmon: ti,tmp108: Add P3T1035,P3T2030
Date: Thu, 15 Jan 2026 16:44:16 +0530
Message-ID: <20260115111418.1851-1-mayankmahajan.x@nxp.com>
X-Mailer: git-send-email 2.47.1.windows.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Document the NXP P3T1035 and P3T2030 compatibles in TMP108.

Signed-off-by: Mayank Mahajan <mayankmahajan.x@nxp.com>
---
V1 -> V2:
- No changes in v2.
V2 -> V3:
- Add P3T1035 fallback for P3T2030 as they are functionally identical.
- Add comment in the description explaining the use of P3T2030.

 .../devicetree/bindings/hwmon/ti,tmp108.yaml  | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
index a6f9319e068d..1f540c623de6 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
@@ -4,27 +4,35 @@
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
+
+  P3T2030 is functionally identical to P3T1035. Hence, device tree nodes that
+  use the P3T2030 must provide a fallback compatible string of "nxp,p3t1035"

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
--
2.34.1
