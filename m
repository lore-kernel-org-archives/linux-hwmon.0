Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E3732FA12;
	Mon, 19 Jan 2026 04:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768795519; cv=none; b=O1m+JIAbqiFXgNR7h3SVfGH3pS/jrEv6Xtj0QotBkRayE7pDQoSSEv5iobmuAyH+DoD/mvprrWLSyihwZT+UvBmw/LmupenU2Y58qeW30z94dc9HwapFtylFeHVSifl/D+B2RYRJnLOBUz8/tBRB4v3u8/ARej2XELjwEMRrga0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768795519; c=relaxed/simple;
	bh=oppyS/CHq7HB49HP3TfRret0nc03G0/BaEBFmFMx4AQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tVNLdO/ymG9vUkO0biTSc9pUG0fpZWhUgxNwMTLw5liye8ZX7GXHjIdiA2JOUbD/7jcF1d1DOcVYzmWnpMfrtycuyExfBn02BTKE3tLr2qY1Uii3hdZyVB6mTUzeazEGTXvoVoVc3a8GqhgQYyZ3pirDtDdf+LicxJqvMHfP89Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C8C5D1A220E;
	Mon, 19 Jan 2026 05:05:05 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 926991A2208;
	Mon, 19 Jan 2026 05:05:05 +0100 (CET)
Received: from lsv031445.swis.in-blr01.nxp.com (lsv031445.swis.in-blr01.nxp.com [92.120.147.159])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 5B1751800241;
	Mon, 19 Jan 2026 12:05:04 +0800 (+08)
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
Subject: [PATCH v5 3/3] hwmon: (tmp108) Add P3T1035 and P3T2030 support
Date: Mon, 19 Jan 2026 09:34:59 +0530
Message-Id: <20260119040459.2898998-3-mayankmahajan.x@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119040459.2898998-1-mayankmahajan.x@nxp.com>
References: <20260119040459.2898998-1-mayankmahajan.x@nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Update the hwmon driver documentation for sensors: P3T1035 and P3T2030.

Signed-off-by: Mayank Mahajan <mayankmahajan.x@nxp.com>
---
V1 -> V2:
- No changes in v2.
V2 -> V3:
- No changes in v3.
V3 -> V4:
- No changes in v4.
V4 -> V5:
- No changes in v5.

 Documentation/hwmon/tmp108.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/hwmon/tmp108.rst b/Documentation/hwmon/tmp108.rst
index bc4941d98268..c218ea333dd6 100644
--- a/Documentation/hwmon/tmp108.rst
+++ b/Documentation/hwmon/tmp108.rst
@@ -3,6 +3,15 @@ Kernel driver tmp108

 Supported chips:

+  * NXP P3T1035
+
+    Prefix: 'p3t1035'
+
+    Addresses scanned: none
+
+    Datasheet: https://www.nxp.com/docs/en/data-sheet/P3T1035XUK_P3T2030XUK.pdf
+
+
   * NXP P3T1085

     Prefix: 'p3t1085'
@@ -11,6 +20,14 @@ Supported chips:

     Datasheet: https://www.nxp.com/docs/en/data-sheet/P3T1085UK.pdf

+  * NXP P3T2030
+
+    Prefix: 'p3t2030'
+
+    Addresses scanned: none
+
+    Datasheet: https://www.nxp.com/docs/en/data-sheet/P3T1035XUK_P3T2030XUK.pdf
+
   * Texas Instruments TMP108

     Prefix: 'tmp108'
--
2.34.1
