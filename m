Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CBC322B72;
	Fri, 16 Jan 2026 11:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563363; cv=none; b=gyDvMKitMLKZzPLCGl6d51ueNcmZGl64n509oEMmc95K/r79ZBJ98CKYv1UxJLtl+s2+wUVKbCUTc6fCSqR7XNKuYpgiuLAXkJlY8fYDq7z3HB9jEqX4onT9wYIzLO9j8iackSOOJdLmplWgaU7CyxhdhtYy2agUFNvZ77XQjII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563363; c=relaxed/simple;
	bh=yHXuyNp09eyUtLw1zJfAHZn0t8TjND8fOy4vzD68V+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DkMebeHELY39zOUczAAwCkb7ZEwgS4+6zQioG3Z8IdL57tjkwegcKtgOHfNlYR0lq8QwNBiZV/bSUtarjz+wqRzInzACUqGvIdxHcLYzSZb/KX8RvEPUUWkBKrBNW1UEB9WbMjKG91HYbi6d+WUlky5v7M4lbKrNWnt2brxLj0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 254711A0ED4;
	Fri, 16 Jan 2026 12:36:00 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E1E741A0E88;
	Fri, 16 Jan 2026 12:35:59 +0100 (CET)
Received: from NXL37714.wbi.nxp.com (nxl37714.wbi.nxp.com [10.31.156.112])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 38668180007B;
	Fri, 16 Jan 2026 19:35:58 +0800 (+08)
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
Subject: [PATCH v4 1/3] dt-bindings: hwmon: ti,tmp108: Add P3T1035,P3T2030
Date: Fri, 16 Jan 2026 17:05:52 +0530
Message-ID: <20260116113554.986-1-mayankmahajan.x@nxp.com>
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
V3 -> V4:
- Remove comment in the description explaining the schema.

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
