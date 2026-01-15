Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6C330CDBB;
	Thu, 15 Jan 2026 06:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768460297; cv=none; b=dAwOO6I1jd71WLwmwASkDHYKs3HA1CJK+g9UdIb7rSCwLdjAoVjEr6+6shrbZQv/jT/ztFM+23ITWiqzPYo5s6gC8fbFFYtfbbYwWccoRf0KcfxseGOaskujdudATcD0SReinogi++SVacZNKu9dmkA5c6z1wiLxMJxZJeCUox0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768460297; c=relaxed/simple;
	bh=pl3W65QY3bGLK1RoZti1dCNu2JaHXPqnZEXZQTLL0fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZjJLfaMvddoYObOn38wLuexXXW6ywyNjAAp41NSRHo62OpwvBJ4xWl3uTalL/kwXLLjkQUW9flRygCy+dGN//h6aSAHnxB8LdwPCgTjjwhCzieEuBTEsJlvluvHp8GQluI/CNNgO2/YHUzFUYhxdlZjkXzZ+lZzApXBtr+8F+Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 40D781A0510;
	Thu, 15 Jan 2026 07:58:05 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 02FEC1A04DD;
	Thu, 15 Jan 2026 07:58:05 +0100 (CET)
Received: from NXL37714.wbi.nxp.com (nxl37714.wbi.nxp.com [10.31.156.112])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 47F0A1800086;
	Thu, 15 Jan 2026 14:58:03 +0800 (+08)
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
Subject: [PATCH v2 2/3] dt-bindings: hwmon: ti,tmp108: Add P3T1035,P3T2030
Date: Thu, 15 Jan 2026 12:27:56 +0530
Message-ID: <20260115065757.35-2-mayankmahajan.x@nxp.com>
X-Mailer: git-send-email 2.47.1.windows.1
In-Reply-To: <20260115065757.35-1-mayankmahajan.x@nxp.com>
References: <20260115065757.35-1-mayankmahajan.x@nxp.com>
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

 .../devicetree/bindings/hwmon/ti,tmp108.yaml        | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
index a6f9319e068d..1ca7f3aa4cd4 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
@@ -4,26 +4,29 @@
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
     enum:
+      - nxp,p3t1035
       - nxp,p3t1085
+      - nxp,p3t2030
       - ti,tmp108

   interrupts:
--
2.34.1
