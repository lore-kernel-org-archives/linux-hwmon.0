Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0329F3A3807;
	Thu,  2 Apr 2026 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117692; cv=none; b=jDCAZ4YriAIc3t7273788D1xx/T2+vUTmxm6OuFYSJY/nmoZWgivmNOzJqF862kWCMzeM7ETJEaUnM+lpkBPKA4SY4KYtkd3aKApFFDuoTSJBePu280waqFgOLcZOJjC/ru7GmwHjLXe8o4yWTHJr88IZ47u1XNZmxuXxGZYH/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117692; c=relaxed/simple;
	bh=WjsTHLjgxsy+mXRsoUwpiqJQYbq1MnNhmtWxtQbbl8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=u7uUjJSH2lvy1HnDKnzwCVld+w9+lfPhZfhJv0cVUTOs7SfQ3VIB2uT+hmkOW2fBtNVwXU1jdxxDs7VKUElVNJVBGdn1jhcPNMMfu6IB9p33ON6IIlio5MKwBRqBPK3+ObvjbB7YJGXliiJcLN6JOtCaa9Qwu++5jh2ThTZGl98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jfID6u8Q; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jfID6u8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=MHv2qgvbLAFuri5
	w6URQ/pAxxfhBNmmanOC7CAD1enM=; b=jfID6u8QVOmLv8SG7jCek4QiIlu1g6v
	0zhyhxt0P+yCk1McOMMUbeQ7RQApZrdDhz95GKCe+uEkQT4pUigi/1QGmMDDExLB
	vHM19CoR6bLa0Mz90vYZK93NaCKsJfQxskAmOHfl/i4cQfgK1am3P6bzElOzlHVE
	AwJy0+P/H05Y=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCX5UBEJc5pC9uuUw--.170S3;
	Thu, 02 Apr 2026 16:14:01 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Wenliang Yan <wenliang202407@163.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/8] dt-bindings: hwmon: ti,ina3221: Add SQ52210
Date: Thu,  2 Apr 2026 04:13:43 -0400
Message-Id: <20260402081350.65559-2-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260402081350.65559-1-wenliang202407@163.com>
References: <20260402081350.65559-1-wenliang202407@163.com>
X-CM-TRANSID:QCgvCgCX5UBEJc5pC9uuUw--.170S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4UGFWkZr13Zw43Wr17ZFb_yoW8Xr43pF
	s3CFyUWrySqr1fZ39rKFsY9F15Jwn7ua12kFnrGw4SqF4DGa4Fq393Kw1qyFn8ArWfXFW7
	WFWI9r4Fg397Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUgNVkUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbCvwlpPWnOJUkevgAA3J
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add a compatible string for SQ52210, provide brief descriptions for
both INA3221 and SQ52210, and define the compatibility relationship
between SQ52210 and INA3221.
SQ52210 is backward compatible with INA3221.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---
 .../devicetree/bindings/hwmon/ti,ina3221.yaml     | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
index 5f10f1207d69..2dd2fd148792 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
@@ -10,9 +10,22 @@ maintainers:
   - Jean Delvare <jdelvare@suse.com>
   - Guenter Roeck <linux@roeck-us.net>
 
+description: |
+  The INA3221 is a three-channel, high-side current and bus voltage monitor.
+
+  The Silergy SQ52210 is a power monitor that extends the functionality of
+  the INA3221 by adding additional current registers, power registers, and
+  alert registers. These features are configured internally by the driver
+  and require no board-level device tree configuration.
+
 properties:
   compatible:
-    const: ti,ina3221
+    oneOf:
+      - items:
+          - const: silergy,sq52210
+          - const: ti,ina3221
+      - items:
+          - const: ti,ina3221
 
   reg:
     maxItems: 1
-- 
2.17.1

