Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EA03876B8;
	Tue, 11 Aug 2026 09:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786441099; cv=none; b=X8ZcUrzVYe69FyQbBJVjCWVQwLFncusPOwEMDeiJxOltkx0ECW7m82SPWJMscXj7HFZeocf4s2Nrt1tUVykuEp7KC8T83UBLd7fhblcAkqodtw3KYddv/hl0wMHhBN4CkkI6wlN7T0MnJhDxRnmZFUAfrE5mVUqigslo3HHZFQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786441099; c=relaxed/simple;
	bh=BlHTHG+YfYP2OFsviQ5ESAllCWNJ8tPA2esl3b0zJi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b629/a2RzVhA3lkWdBn8QuzagTMFLOAPgcxw4cu/b4kpfJw+DJQHxKNE1tl8GgcR9ADcYDsbYuymZg9enPNo3jIbDD9fqzur0M4v4kfwmRx010NnxviHeyks5w6CdmXHAz9COHE3h2fJMpf3CGEVBScsG92TIxC4omqA3FnmTKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XeS12ETt; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XeS12ETt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=uJ
	nduPDaVg+t/IdUMyYFgOzPrQFL4/xAUq9v2853FDU=; b=XeS12ETtYLVdZVFzh7
	r++4VjqP8PeG27P7BTMQEUd5C+bn4l7pDhD9Z9KHNXmfINX8ufWULs/zm7R3JoPQ
	E1NCcJppDZHIZzHQlyXy5SsfP3D4UMyeeSWljZTjHu6KIM9B5m5aTjt4WOtT3P/9
	uML2w/ZxyenKNPewaGowvgoQc=
Received: from fedora (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBHysZy7XpqJ77_OQ--.33587S3;
	Tue, 11 Aug 2026 17:37:56 +0800 (CST)
From: huangjia2hi@163.com
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiazhi Huang <huangjia2hi@163.com>
Subject: [PATCH 1/2] Documentation: hwmon: (nct6775) Add missing NCT6797D and NCT6798D
Date: Tue, 11 Aug 2026 17:37:43 +0800
Message-ID: <20260811093744.12199-2-huangjia2hi@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811093744.12199-1-huangjia2hi@163.com>
References: <20260811093744.12199-1-huangjia2hi@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHysZy7XpqJ77_OQ--.33587S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw1UGw47GFWrKF4xAF1rXrb_yoWDArb_ur
	Z7GFWkJrZ8tF1UGrWUZr9IvF97AFW8uF47W3WkAr9xAr17Xa9xCr1qqr42ya1DZrW7uF15
	W3y3GFySkr4ayjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRE6pB5UUUUU==
X-CM-SenderInfo: xkxd0whmldjxrl6rljoofrz/xtbCwxTRCGp67XSSIwAA32

From: Jiazhi Huang <huangjia2hi@163.com>

The NCT6797D and NCT6798D chips are already supported by the driver
but were missing from the documentation.

Signed-off-by: Jiazhi Huang <huangjia2hi@163.com>
---
 Documentation/hwmon/nct6775.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/hwmon/nct6775.rst b/Documentation/hwmon/nct6775.rst
index 9d7a10de61a7..6725f8ff98e0 100644
--- a/Documentation/hwmon/nct6775.rst
+++ b/Documentation/hwmon/nct6775.rst
@@ -80,6 +80,22 @@ Supported chips:
 
     Datasheet: Available from Nuvoton upon request
 
+  * Nuvoton NCT6797D
+
+    Prefix: 'nct6797'
+
+    Addresses scanned: ISA address retrieved from Super I/O registers
+
+    Datasheet: Available from Nuvoton upon request
+
+  * Nuvoton NCT6798D
+
+    Prefix: 'nct6798'
+
+    Addresses scanned: ISA address retrieved from Super I/O registers
+
+    Datasheet: Available from Nuvoton upon request
+
   * Nuvoton NCT6796D-S/NCT6799D-R
 
     Prefix: 'nct6799'
-- 
2.55.0

