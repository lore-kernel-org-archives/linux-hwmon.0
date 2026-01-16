Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09737379998;
	Fri, 16 Jan 2026 11:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563368; cv=none; b=HuUQpB4JRB+77/OOENeICUdkHJFtlMxErJlGcCnnCgoAZjK4KZyij7gAsgv4hP0wqtF7HJnPfV/LlfwGx/yHjS2nyiWscPZiU4gRTV4r5+9hFEG8/Mll6umHvTqwCEPY+bMb0ihsx7YzIUO2ghNSEVgbGALV5iokI6ZDTDkcO9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563368; c=relaxed/simple;
	bh=ojj2zA8/kfq+e1OyB79iNd8IHV8LNIDA5SlVi4zoTKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qba0yubAS9bOcM6rNJzDrQAsQ1C5H0lBFrxRaOcRXBf0YPuE9YS1wVym/84QZTwWJ93ywI7BbVIlKyRaBbmtJihK4OkPjp9QglHeGCrrn40mMZyb8dqnd0y8eYq6ExZfht7L0LDlwrZ/jROGShJSzLpGIjwEWAFXmRFSVnFE6wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 76EDB200ED9;
	Fri, 16 Jan 2026 12:36:05 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 41BDA200E91;
	Fri, 16 Jan 2026 12:36:05 +0100 (CET)
Received: from NXL37714.wbi.nxp.com (nxl37714.wbi.nxp.com [10.31.156.112])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 6C4A41800089;
	Fri, 16 Jan 2026 19:36:03 +0800 (+08)
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
Subject: [PATCH v4 3/3] hwmon: (tmp108) Add P3T1035 and P3T2030 support
Date: Fri, 16 Jan 2026 17:05:54 +0530
Message-ID: <20260116113554.986-3-mayankmahajan.x@nxp.com>
X-Mailer: git-send-email 2.47.1.windows.1
In-Reply-To: <20260116113554.986-1-mayankmahajan.x@nxp.com>
References: <20260116113554.986-1-mayankmahajan.x@nxp.com>
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
