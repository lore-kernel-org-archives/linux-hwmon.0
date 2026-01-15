Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B51378D80;
	Thu, 15 Jan 2026 11:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768475671; cv=none; b=HKaA7QrjRnN3Qp9DUXH1UF3VLfN11envVCQcRQEeiSa47/3MkRN0Gyu/UuFOgHczBFA3DZXCMUw2LSqLnPKCmF9wmT/3PAH3grMcytDmAz/k9QMEfas1adxnO2chhon1nqk60u48NjLiZiwBFUimzAWzhLJGMJXANHb2iPXNA40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768475671; c=relaxed/simple;
	bh=uoQWg+LoHYYFWgEa0ZOuKZx6HhY9Wn3rTFBHRCXA4TY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b95a3OqPlhQWABV7hVAKdiv/c5TMuzCVaUpYm2tHIfW0+8Sdg58DvMpvyRGYG/O2T0gIGJeZMBwVnK7qjx78ibRwcn9bHr+Y8tk+iXFPhkuDaT0UG+myW2ivGKAbFfZaoFIpVZUvBF//lP+13f+zwQAGJ7PYwhRLrXrX+YNIT74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DFC0E1A069B;
	Thu, 15 Jan 2026 12:14:27 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A99F51A068F;
	Thu, 15 Jan 2026 12:14:27 +0100 (CET)
Received: from NXL37714.wbi.nxp.com (nxl37714.wbi.nxp.com [10.31.156.112])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E07C71800082;
	Thu, 15 Jan 2026 19:14:25 +0800 (+08)
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
Subject: [PATCH v3 3/3] hwmon: (tmp108) Add P3T1035 and P3T2030 support
Date: Thu, 15 Jan 2026 16:44:18 +0530
Message-ID: <20260115111418.1851-3-mayankmahajan.x@nxp.com>
X-Mailer: git-send-email 2.47.1.windows.1
In-Reply-To: <20260115111418.1851-1-mayankmahajan.x@nxp.com>
References: <20260115111418.1851-1-mayankmahajan.x@nxp.com>
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
