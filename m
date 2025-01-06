Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB1F29CE6;
	Mon,  6 Jan 2025 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736147859; cv=none; b=ZkrTVm756XRLk+HPwNOr6D8VPrnKeCPGEtXGGn38F1fKisptybR85IA0xtwWZDkqYLTQuBce1rbgoRobtp4H2d2eUe5SvqqmDKxFHyCIsClEdF8h/nR6yyYCNoInFuYF2YuPCFLM1gs8py52AXmPOctvjEOtRu54nb6/pd+5VDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736147859; c=relaxed/simple;
	bh=Yg/eoE1sqjEkz82wDEkJpfwlNryj3MOrJefOW7wdtqM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q75z92fcTcR3k7wrhMXt2DbvnES0Ff0yWbJxyrE4CwsX9DMZSsryKIIHcv/OwB3pe3bvsA1NgpRVE97PgYHoElcvNPAeG4QQWRzpgCg/NmW8T8Pn7hJPNkO22/Vpt1QbRBiMxEGs7/rQdeZ6zEPgQ3ZV1QwEfgRGzeZFEKN1inA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XO4HkY8q; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XO4HkY8q"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21680814d42so169833865ad.2;
        Sun, 05 Jan 2025 23:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736147857; x=1736752657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCi3pwYXnEAki8Voc1v2CtwOV69mMTi46BzIP1BLPI8=;
        b=XO4HkY8qAQM5NZbFRPeeUbw4X/jyHrQakqpZCjW6GrPeq/7ivUeOef4ca6NV1c7E1C
         2+chudzFaX4eEgAuMyMCXJZ/Q6lL7LUy0Fh9mXuDu6JS/yR9FG8NVapa7AMigmgKJe6E
         04YiSrmAFHeTX4oh4GUGZ3fe/n2TiKEap22RyrR8s1NXZ02jh4wEEkHwSXn162PCv9v1
         CpMXh8Sjoq2msIXR7lrFsTs0hw0EW36EesGeQyiPXueZppbjHMMrKlsDxpNDuy9Vu238
         F98hUNAf7mua/dIHMgY87ra/cB3Ulzv+S+FEvRmYL2rNYmyQJaZNfpr5k+kmHDz+XoeG
         BW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736147857; x=1736752657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCi3pwYXnEAki8Voc1v2CtwOV69mMTi46BzIP1BLPI8=;
        b=OImGvfB9oguUwb8AS0hyEY063idtdgC2b43AlrdK0fQuVrGRt3fhFYKKHNkm47Aeoa
         CFranlLEjT4RkDqHcCigLyzJLMJID2ueRfPNAbH1q7/gIKCXkok+RRtCkwBkwBL5mKeT
         KwY0gvo/lL9M8IptHtlHSf5C//Rq4Rd94kKr0GFCFyHXETxfWGi7pH8kGbrmCksDza/c
         3owDHd47o6gqVRvAXepA1eCIP0/ZgcVFhiLifY2W08X0DBTRn5g7MsocBSI2t4LZyWiy
         vmt78XWtpbgB+Q0+wR+29eKK5k0qOjKJbde28l64ZG0b5DXjIwq90pibYLI1fVizwLgH
         2G+w==
X-Forwarded-Encrypted: i=1; AJvYcCUIgT3JOxJK4jokC2UVTIpdCmYMhJlyyrxfL39ELUG4GkhOUDbOtATYEHTHklVGE5z18bMQqX+2tQNP@vger.kernel.org, AJvYcCUr1WnCRHY8FfMYlB6UTgxNtRu9b0L/aGVG61rMTU8S3gRNFoDENDHgNB9V5I1s32zS2YePZr5SCzNSzu3M@vger.kernel.org, AJvYcCX8FhKqGi0nAz66Suy11bvjY5Lva6mG5wWdbAC993EKix6haaC6LdmyyZwQQU8fq3eLeZogf1X3TNBHH1Y=@vger.kernel.org, AJvYcCXOIzQFcbEb7U6IWXjXzV+GAs5VOmsQUvieJOV/WUyE8NkAtW+SzldYf9qVzGmiECEdDJd+aCZUBSfP@vger.kernel.org
X-Gm-Message-State: AOJu0YzPzCCWgdPWdssecMMdri2ArUrC28GlMkGxvsgDfki1sChAmoLU
	jpV2UfjFNthlb1U6HgD3GpqiDDBVOfroR4Dq5XANyS0fKElF39rAOuSGBQ==
X-Gm-Gg: ASbGncsTnfjSneKcGWP/FLVZn2TukPdoXnvNQmj/94lBx4rIXBYQbQDYWP1p2R+lucj
	36tK2ue87yi7ib9sIjHtiHxYz/8lboqiFtgjLDAHAKz5R6PL6oWvtW3WM/gM8cjjP2uZHt5mCXL
	kwduDoidnEz1DaEKQG8KlhGaC9ByW65jWM9QTALzd7IwK5J2xeQf5zFOSuFHbQi8vx3e5HO2DL/
	cfk/RuaMt5GLtqQs3WRfemNM5j6Gqa/cqlXgbAAMDCfVBKV27nddXHf6g9YRCRFtCell0gLcT2u
	yn/D08KqlsFcPVSiTl6TKXXZ/VFzVjUCw8c6
X-Google-Smtp-Source: AGHT+IFtLEiPFYCf2iAIpsScfOYbVZieURQdMijOJfVOd6S5y0AU2gbfcQpVUruIhgqcq1V/aO95ZQ==
X-Received: by 2002:a05:6a00:8085:b0:725:ae5f:7f06 with SMTP id d2e1a72fcca58-72abe096383mr88046121b3a.23.1736147857228;
        Sun, 05 Jan 2025 23:17:37 -0800 (PST)
Received: from leo-pc.tail3f5402.ts.net (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad816222sm30630566b3a.37.2025.01.05.23.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 23:17:36 -0800 (PST)
From: Leo Yang <leo.yang.sy0@gmail.com>
X-Google-Original-From: Leo Yang <Leo-Yang@quantatw.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Leo-Yang@quantatw.com,
	corbet@lwn.net,
	Delphine_CC_Chiu@Wiwynn.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: Add INA233 device
Date: Mon,  6 Jan 2025 15:13:36 +0800
Message-Id: <20250106071337.3017926-2-Leo-Yang@quantatw.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250106071337.3017926-1-Leo-Yang@quantatw.com>
References: <20250106071337.3017926-1-Leo-Yang@quantatw.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add TI INA233 Current and Power Monitor bindings.

Signed-off-by: Leo Yang <Leo-Yang@quantatw.com>
---
 .../bindings/hwmon/pmbus/ti,ina233.yaml       | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml
new file mode 100644
index 000000000000..2677c98dadd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/ti,ina233.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments INA233 of power/voltage/current monitors
+
+maintainers:
+  - Leo Yang <Leo-Yang@quantatw.com>
+
+description: |
+  INA233 High-Side or Low-Side Measurement, Bidirectional Current
+  and Power Monitor With I2C-, SMBus-, and PMBus-Compatible Interface.
+
+  Datasheet: https://www.ti.com/lit/ds/symlink/ina233.pdf
+
+properties:
+  compatible:
+    enum:
+      - ti,ina233
+
+  reg:
+    maxItems: 1
+
+  shunt-resistor:
+    description:
+      Shunt resistor value in micro-Ohms, Please refer to the actual circuit
+      resistor used.
+    default: 2000
+
+  current-lsb:
+    description:
+	    Calculate the Maximum Expected Current(A) / 2^15 in micro ampere (uA/bit).
+	    e.g. 30A / 2^15 = 915 uA/bit
+    default: 1000
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
+        power-sensor@40 {
+            compatible = "ti,ina233";
+            reg = <0x40>;
+            shunt-resistor = /bits/ 32 <5000>;
+            current-lsb = /bits/ 16 <1000>;
+        };
+    };
\ No newline at end of file
-- 
2.39.2

