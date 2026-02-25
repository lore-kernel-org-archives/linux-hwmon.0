Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF1233BBAB;
	Wed, 25 Feb 2026 09:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772010259; cv=none; b=nPJRnG4U8+RyQ1jtRXlMjmUBTgO2YR/2mB5eRDB56Vmc1U3r9WjJ9ookfFuZTHAucZGglZ23URyAObWpJZHj4ELTy+pDHTJN+HK32yR3chTGZ97Kdyg5eztCcOiGCLR18A9eqcAvBc/z6yGPad1TJNdStgwty0+qkMkRAHR7TXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772010259; c=relaxed/simple;
	bh=WjsTHLjgxsy+mXRsoUwpiqJQYbq1MnNhmtWxtQbbl8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=rpa91RlYjkn3QW+GpgjNLF1jK/19hGR9ughCE4GcGZBXuEEbOeCF/OBUaDlxlkBlDtIQ+xFvRUQH4aan2Vx8lS3PoYlAnbsss4Jn4LkSe/jyBmDVgDrQ+73U7nC8fK1EzAXWganm7OEuGx/5FJqS5ziCZk6AjlzHz3bKFNhRkQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gVQcJL50; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gVQcJL50"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=MHv2qgvbLAFuri5
	w6URQ/pAxxfhBNmmanOC7CAD1enM=; b=gVQcJL50q8LuRKP83YQ5GDamO82mN3t
	i8qBZY6H6R1CxBnqwFZTvDamzjxZ7os6BlheLUkG+q8KWimiumrj5DlE4zJwGLJg
	e2GS0EzO+W8L66DR9XIfsAzSUt4ECMlgWXnwzepafAd5wn5GWB1F3Q4Zv7i42pIU
	l2/+N+pAXhiU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3N4nlup5pilgzMg--.30498S3;
	Wed, 25 Feb 2026 17:03:36 +0800 (CST)
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
Subject: [PATCH v6 1/8] dt-bindings: hwmon: ti,ina3221: Add SQ52210
Date: Wed, 25 Feb 2026 04:03:17 -0500
Message-Id: <20260225090324.112145-2-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260225090324.112145-1-wenliang202407@163.com>
References: <20260225090324.112145-1-wenliang202407@163.com>
X-CM-TRANSID:_____wD3N4nlup5pilgzMg--.30498S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4UGFWkZr13Zw43Wr17ZFb_yoW8Xr43pF
	s3CFyUWrySqr1fZ39rKFsY9F15Jwn7ua12kFnrGw4SqF4DGa4Fq393Kw1qyFn8ArWfXFW7
	WFWI9r4Fg397Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUqjgxUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbC5wjqvmmeuugxJAAA3L
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

