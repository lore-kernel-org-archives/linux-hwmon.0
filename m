Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BF223EA84;
	Tue, 18 Nov 2025 12:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763470384; cv=none; b=PnBnj9E4pen9aw3CKwru8tsKNaXMOxUDLT1PpHFPDPyYg2bkeHOUFYTtqgDjsYZCebUrBsvrBml8Fcvo2KUtC3qiPTqTDiiyQrXck7DkisRMlKofkKbWPuehIZ9ZGK9BDXt/ZlqPpQQp0LqJm1bkz+v8dx02XD2Iev21MGXu91I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763470384; c=relaxed/simple;
	bh=3IwuF4EV9QHK3caWErWLq/KOYmN93yIt0Vkckezx/h0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=L7FTM7RDfb7ax6tJ3t8UBj6zzg+s48Cf3+bEFRMvlPR4d58zfFvSgPTIe0ztnaSR8fjg3Pyp4AMojooU7TsvfriSABXUsMWQqZYZQ4zm7UjrVe5JuW31pp3M1O16FgKwV+FhF4BOYiXilerP0XPtdVqtUsRqwtrwUeA4nMLag5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=orFJ0C/c; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="orFJ0C/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=v+TEgHN9AHB2tSt
	vMr5GijsmfitBgxsTIsKMWoDx9Yg=; b=orFJ0C/cLZ4/Lc7fweOJIGWMr1FDyd0
	NT8iYpwxhWEfENTLTq8moaumVslj4iCgDo91m4qw3AALdUv/7sS2/J0USRqaSiIw
	KPLtUquTOwYOLXo6CiinvmsBr72bWsm88qfnwDX124FRjamDibGZ0ntoRJtCBWMU
	mqm3pFZk3m1E=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3E8H1axxpyxYsBA--.3548S3;
	Tue, 18 Nov 2025 20:52:10 +0800 (CST)
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
Subject: [PATCH v2 1/8] dt-bindings: hwmon: ti,ina3221: Add SQ52210
Date: Tue, 18 Nov 2025 07:51:41 -0500
Message-Id: <20251118125148.95603-2-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251118125148.95603-1-wenliang202407@163.com>
References: <20251118125148.95603-1-wenliang202407@163.com>
X-CM-TRANSID:_____wD3E8H1axxpyxYsBA--.3548S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7GrW5CF4rXrW7Gr4UWw15Jwb_yoWfWwc_CF
	s7Xr4rAFZ8JFWFgw1vy3yxJr1rta1SkFn7Aw10kFs8Cw1rZr909aykX3srAFy7uFW3uF1F
	vFs5GrZ5JanrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUbomh7UUUUU==
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbCwBp6Tmkca-qs8gAA3U
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add a compatible string for sq52210. The sq52210 is forward compatible
with INA3221 and incorporates alert registers to implement four
additional alert functions, all of which require no board-level
configuration.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---
 Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
index 5f10f1207d69..3bdd8dfb7a36 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
@@ -12,7 +12,9 @@ maintainers:
 
 properties:
   compatible:
-    const: ti,ina3221
+    enum:
+      - silergy,sq52210
+      - ti,ina3221
 
   reg:
     maxItems: 1
-- 
2.17.1

