Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0054D36AB58;
	Tue, 13 Jan 2026 08:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294376; cv=none; b=g2h8cC3Fs1iv7G41EhqtzpsOoW6NTUWqxEylIcE59l0553AIWTGvJ85DhZ7fv4v7WhBBFscWW9JU+bHI9lN+lXCZ5nz+50KKV7A9GYsxXODAXCiRaZE7cN8urPUzov3vneUE0rUYb3dVxKGTWrxEv9GJdQRAw8fwDJ6IBfhchXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294376; c=relaxed/simple;
	bh=OWsBgRVRhkQ6Duwp8Qo2MOZzACg+S2m5GMrtotJF2Y8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kxrSCvGqMUS2UoGyyX2ldpKbBSqo96BcGV8X9DrIuvbDFd/k3R6NAXCDZtvL/G+QQI9gEypuAyr0pMWgcmbNzwPjckzMdgRArjlSpPKkHAg1yZoV5ccX2IXLDyX2idZ0D3SX5MXwASvpRBsiRtMINrv4udTQoF8zuTwgKljRXRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 740E1200B88;
	Tue, 13 Jan 2026 09:52:53 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3F471200960;
	Tue, 13 Jan 2026 09:52:53 +0100 (CET)
Received: from NXL37714.wbi.nxp.com (nxl37714.wbi.nxp.com [10.31.156.112])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id BE6DD180009C;
	Tue, 13 Jan 2026 16:52:51 +0800 (+08)
From: Mayank Mahajan <mayankmahajan.x@nxp.com>
To: linux@roeck-us.net,
	corbet@lwn.net,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: priyanka.jain@nxp.com,
	vikash.bansal@nxp.com,
	Mayank Mahajan <mayankmahajan.x@nxp.com>
Subject: [PATCH 3/3] hwmon: (tmp108) Add P3T1035 and P3T2030 support
Date: Tue, 13 Jan 2026 14:22:47 +0530
Message-ID: <20260113085248.1771-1-mayankmahajan.x@nxp.com>
X-Mailer: git-send-email 2.47.1.windows.1
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

