Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CB53CB2C9
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 11:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773919228; cv=none; b=fpQ0WDpRy7CcKubsiQCTWOzNrMxCcyHPuCrc9q7ppvB5b62kmPyi8kgifnPXvq21G749opaZCcdjEOzGqkmuzIubxh5PMMgNItQrjhgTrLQ1G1w0vxNWAnkzCBu4hy2+sY435K2VqAIf2vlW/10zL6lmhZdvb4UZCeH8GclEWaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773919228; c=relaxed/simple;
	bh=ciHLf7bevgqHXVV1Zx/xu9fwtsFudEQfZfvHtZh2a7I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=d5iXmbYWnLksTkntiQnsYaUxZ7ylvzYCjSQK/214geUlqWdMFVBThFsslecSuyFuc2uF60QYoZl4SJeMtzD+zVO2C4JRc6QeKlLOyvaL0qXmDjzEvbdVMoHdrSuGATKO2f+NeT54VMsCe5D4rWZ5vfVH+TWrWbq1TZswhSRgaN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAV6XE1O; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAV6XE1O"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2aaf43014d0so3897815ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 04:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773919226; x=1774524026; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tFWl6KgxoNw3rtXQXYIsDCxT8H3n54d3r9FBVbrDtcA=;
        b=FAV6XE1OKapXYVfwzSkbH2C8ngN1aKdxNWMwH9QxnKt9RcSDOezWJBGSrqO6yOpiaa
         frBaM814Q6vDzOsllSfdwfD292OFP0PqMEnxdiNitodzCW2tZ85sMQpsiL0oqaLvivx+
         e4Q0UUO23T4ax6w7qQuCZsdgHdThp4hj9R71AXXL4uECenfJidrAuKnzQNhCpwPDzR4i
         m/FLioTd5q5AOPDNYtjZYRIopJYAAr2NLMWc/wtgeQ/6L0TozALcAqeTtnGbyVDVKRDg
         kiHZO+qkzJunNz2pTI7ivKZL0yWr0fEl0pi9YhQjM/zD2VIKTf1wJtsQUOLlqcN9ubZM
         gT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773919226; x=1774524026;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tFWl6KgxoNw3rtXQXYIsDCxT8H3n54d3r9FBVbrDtcA=;
        b=eg661FUiEh7zsuMhncuTKGphDOc8OHUHe60Blqi1xGcMGr0y2HovKdt+/V5D/D4+6N
         Ta8XaqN4DItfgnsyrqxSQ2NXWTuOR2VbNRs8SU4LX//G037qFhxMYEDt+g8K/6Yb1Vn3
         lZKHXkOv8Qidmt/PEIpH9wEhkg0wkgqXqMaAP2ofNsYvJUX6GrtJ0SSQlTJtb4KTkLru
         E0ZBtVLFrQPItwnFEhy9mh3hT5XIAjSuX+xocjnbU0SynFhbF+xIk4ICKAcSOrTjwrpD
         eQWzBOa4AXuawLE9xYYKejkLpXVlTPVGkTcsZaxz0oO2oAMTNFVGPdbEsWH8ii07TejN
         RYig==
X-Forwarded-Encrypted: i=1; AJvYcCXp0TDh0jcgDykN65nClnabmJYptrUztlLxEgHrG+NgBzho+6uovfjgd7lA9QexabHC1rBIrd2kgnfexg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa9Kh+ZV5DgxDeDsMBLh3HAHPzrTd4WSmavMMgQeCC7wu2WwAX
	a8OwkXELWWFN6DXBg+3Tx42S93EUSuSWQArmmKOFSkVpkNhIq+UQwdbX
X-Gm-Gg: ATEYQzxdDVnmJQ5WBwTcfmGbcd+o+Xu6INTwj9fyTVwVYLDBnnOXzSuiT/vjzm5v6wi
	yZBuN2CBB9UpfIpW5oTjZTvPK1qVv5DVS9uqYs3IntdpPySyFKC+a5BlTjtZuqFPSG62Wovyg8b
	jwV7k+lv2DIcTzGYLr80DuxzV+8oswypGuD6EqmW2OXreAyheCm7WZcqIfRIoEfbh21akjaV7JF
	U+FQEaQr8KPacm55IYiornBKK4rOmdtBnc0Bjhae1y5B2uKpn96TBmbthPZv5DPbo4ttGDU24zX
	JBPiJ50dX7Rx1Vd68t8f/w/+CFCYnHIuJPtbZsh/qPP7aGK9yt7M+V8EyprtFYpSg7hdjSNbjuV
	5f6gWNFL7CCMt+Ta25G0P57n5HTXEuBWpF85J29unviA+5iPTpYnDovJGN4Gqk/R+9WOqhBwBKk
	wURRCCs2IBjxzYdy9RtqfqV6/aQhyBOiEn8xJI4K8ZcTfH4UXQ8mYd
X-Received: by 2002:a17:903:1aa7:b0:2b0:6d8b:6a07 with SMTP id d9443c01a7336-2b06e3d3706mr77610905ad.25.1773919226322;
        Thu, 19 Mar 2026 04:20:26 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e4199easm76524585ad.5.2026.03.19.04.20.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Mar 2026 04:20:25 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH 2/3] dt-bindings: hwmon: Add Sensirion SHT3x and GXCAS GXHT30
Date: Thu, 19 Mar 2026 19:19:45 +0800
Message-Id: <1773919186-17515-3-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1773919186-17515-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1773919186-17515-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add YAML devicetree binding schema for Sensirion SHT3x series and GXCAS GXHT30 humidity and temperature sensors.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 .../bindings/hwmon/sensirion,sht3x.yaml       | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml
new file mode 100644
index 000000000000..47dbb743e2ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/sensirion,sht3x.yaml#
+$schema: http://devicetree.org/meta-schema.yaml#
+
+title: Sensirion SHT3x Humidity and Temperature Sensor
+
+maintainers:
+  - Zaixiang Xu <zaixiang.xu.dev@gmail.com>
+
+description: |
+  The SHT3x series is a family of humidity and temperature sensors by Sensirion.
+  It also includes compatible sensors like GXCAS GXHT30.
+
+properties:
+  compatible:
+    enum:
+      - sensirion,sht3x
+      - sensirion,sts3x
+      - sensirion,sht85
+      - gxcas,gxht30
+
+  reg:
+    maxItems: 1
+    description: I2C address (usually 0x44 or 0x45)
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@44 {
+            compatible = "gxcas,gxht30";
+            reg = <0x44>;
+        };
+    };
\ No newline at end of file
-- 
2.34.1

