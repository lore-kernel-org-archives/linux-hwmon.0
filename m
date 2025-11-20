Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8E53101B6;
	Thu, 20 Nov 2025 08:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763626852; cv=none; b=JUVfgUFxvwa0ft7R4VCxRCBFgN2ZEmOgY4RZV/9gBlG9JxtrtoA3+9RMGoyePlbYp4UPx49Zt8N4PlGiP7paGdbDwox4f5Jzc41wph7i1vkJ30Joc41c8pPRhC60/6xOptFCoePmAMFOrlDfWH1LsM/bXQUvDrwbhNLn8cWdVwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763626852; c=relaxed/simple;
	bh=veV9uBc/4+2aXJkyUrwX782yhnEiSwH07lp6tyy/BGE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Evm8MtNfHHYuJLKYCnVVgOJsguRuY7GR1kXJJJfPKQQFzjRqPJ0HdFtO8AAh7/Sqo6FPVPjlDo8O2dymtKD0CuZLtnX2FGlEsb5/mGH8MaSZZerD4lhvquBkdAspogoXRii1NWVcR79n21j6I3IVwJQAYzvQPFWlmPHdzSo2o7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IzTO/17H; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IzTO/17H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=f8CQJTckkb9TGfo
	mcbXlA1LWAw7cih0RzjzYbL9VEVM=; b=IzTO/17HtNaBDqKlH0ejU6Me1+07Fww
	vcJe1G2ZTuyPs/qCD7aBMIGPeCgiQI2z2JpHfGxSWTNlxGu3VEM3jtfchc1E3pgI
	V23KPCDmspqBCMYcItHoG4eP8NLBsSrjY+bNuxTJIJeZhb9b0JCSGo1FyIo2LJFE
	VAtXuJVqvkpY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wA3BPAwzx5p45f2BA--.17S3;
	Thu, 20 Nov 2025 16:20:05 +0800 (CST)
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
Subject: [PATCH v3 1/8] dt-bindings: hwmon: ti,ina3221: Add SQ52210
Date: Thu, 20 Nov 2025 03:19:14 -0500
Message-Id: <20251120081921.39412-2-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120081921.39412-1-wenliang202407@163.com>
References: <20251120081921.39412-1-wenliang202407@163.com>
X-CM-TRANSID:_____wA3BPAwzx5p45f2BA--.17S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4UGFWfuw17KFW8uF45KFg_yoW8GFykpF
	s3CFyUGr1Sqr1fZ39rKFsY9F15Jrn7ua12kFnrJw4SqF4DG34Fq393Kw1qyFn8ArWfXFWU
	WFyI9r4Fg3s7Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUgNVkUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbibhEM02kezo8TfQAAs4
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add a compatible string for SQ52210, provide brief descriptions for
both INA3221 and SQ52210, and define the compatibility relationship
between SQ52210 and INA3221.
SQ52210 is backward compatible with INA3221.

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

