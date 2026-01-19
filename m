Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6379538F93F
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Jan 2026 19:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768849695; cv=none; b=nqu2D5s5GMNx0EPUcGdXTk6rBElUFFLCvNBNPyWwkgPsQePaho5HgtiwPkbvevKEkuuVaRciUi9C/XitJNjiSNpr85o+MefZCwHF+Eq5RCK2vxKaUML0GFibczvS1wryd2z6olvBNylrkY91U2xl5yZZbzwEkhMuOMNh6phTZdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768849695; c=relaxed/simple;
	bh=ISqsKDoXGCE7uargYNsShdMm0Y5qbCliuVj3rq0dN/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hrbmaCbpdjWqBiOwEK+60t242alepGXvzL/TnwfMloMA91cVUikGj2yDWkMcCNt5ET0WpTDAOdZnkiyeDhEKyWnCgfLLyiiTf49HyC2JvvWFBGe2c4Noaq0RYHeK8Gyua5y1eWzNCNasZpVEvGLWlPKK0LBI4ZA/TxfquGd2oUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnbDmoS1; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnbDmoS1"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64b7a38f07eso6297655a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Jan 2026 11:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768849692; x=1769454492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J52ytgfbeFADZKDw62J7y5/K+5VVfpLFyRp/PpNxx+0=;
        b=gnbDmoS1WA/HqV0J1PbvQT3w51c5FOUIQELciYPw/hAAv5tF1i6Ht6FGoSyF73TJBL
         vGcl1eeCUVddqc5TU5FLx4QA8XQpYkpTHtSnuwg9p67/D+UsN05YQpJUgiPr4doCHfet
         kz0EnsM+qP4CJwW083vi4lCp3JJ+JWECp0meDAC/GwwXT7vQAyYSU+6AM0k7cQi+nPWs
         ZB9iuF36PAitWvC4YL1OY/HlQLkj7XN/E9ZbtSJsqFRUv3s6XieUON7prIxpGR0bPTHe
         9d180ocqU2UF5cy9Rv+2ubvJSV0w1N+9/4iL5kaadVbR6Yf6GxS7ahqWfCJS/GzW4wZr
         hTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768849692; x=1769454492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J52ytgfbeFADZKDw62J7y5/K+5VVfpLFyRp/PpNxx+0=;
        b=QmrcCrY70GcTQU2QzHql52AmTyY3TPMwBgtDaVOzCCDdNSsd/1us+uxbQlFWSEalEr
         sXx4hgBS+tslGlimEDC7X/aHfYIRhOKfCvBiaMzh67aXrX8EoSlhlMB5zjFCOl7RnxNM
         5lgmrrXw5cLvSP6/oOYzt7zER8fWdIq1aDqLy5NqjgN0DASkHAO7ggJ1CYG78b5qtTgs
         EW0IU0PAWYuhLoYmPi3viTeK9zOtkDTU2eIPBfGytriIzg5WsOfGJL1mFlwpMJS3XA6P
         hxW8vBrgm9OG8jQMBOyliD8i8ko2RYBIE+y+vyJ4scMct5fQHw9YxnYG295M9LWvlcqJ
         9eag==
X-Forwarded-Encrypted: i=1; AJvYcCUKEr7CwR4p/9KeMvvHo35sttztxftog+4udenQzOVpgFDtfVQY5kgY5kBNYRqEYs6LPKmTdhwjoRa7dA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHVX97Dy+ZaV/vDRCqaSRLz9jdDG2LFrlqQbiSjWq99nxYzv8X
	KvzpH0JloZ5Z0cY3qHlIcKQB9CNP5nMt4ccPOi4TTQR0mSM+x8I2/Q8z
X-Gm-Gg: AY/fxX5/0Cu17IBjoulf7FuDDaEC+Fv224pkCyqZuZmQAUOOgsKStcpgcxgYqlKURS6
	eSFug6ZQV5+fXCDEIKqhnX4mX4qLexQ/ZesFWZT+T2GwwTiLV8Lm5CZ+xFTYJJdekN43h1QKAaU
	n8jYqLZWk3KIadAfpebsPS4C+GdhdCtxt5dY1GTTSXeXTMLHiXLygzqT723E7dM3BOQm2rk+IZO
	mBP6VlU7ayfy/gisFR/VsLnnl/fUet9I34pKEMTfKUOtu76ksMi2IK5jEo+3IK7Bmi3cQjado6Y
	Qx1qGuFBBB6O8l2r5JZpT7KIyU37pJSFihQDY8BZL0FETei8N6XRzzVC7qhJzaTjYy1YB+mkani
	Dx9iWJB1Ph8H4y+vs4qiV1ia4ML012bagHn4XdO1UqphOkILZRPUhqAtvLz2URDSbEztGC7Pk+x
	SNmBEz7xuz6JYz88YUP6auZ1z8TsQJF3uZwg==
X-Received: by 2002:a17:907:1c9c:b0:b87:39d:2bb4 with SMTP id a640c23a62f3a-b8793028f6fmr1108598866b.59.1768849691548;
        Mon, 19 Jan 2026 11:08:11 -0800 (PST)
Received: from vamoirid-laptop.. ([2a04:ee41:82:7577:a4c5:86fc:3b16:bc0a])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b87959ca32esm1193767366b.41.2026.01.19.11.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 11:08:11 -0800 (PST)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: trivial-devices: Add hitron,hac300s
Date: Mon, 19 Jan 2026 20:08:05 +0100
Message-ID: <20260119190806.35276-2-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119190806.35276-1-vassilisamir@gmail.com>
References: <20260119190806.35276-1-vassilisamir@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>

Add HiTRON HAC300S PSU to trivial devices since it is simple PMBUS
capable device.

Since this is the first supported device from this vendor, document its
name to the vendor-prefixes.yaml file as well.

Signed-off-by: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index d0f7dbf15d6f..efa1957948a5 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -123,6 +123,8 @@ properties:
           - fsl,mma8450
             # MPR121: Proximity Capacitive Touch Sensor Controller
           - fsl,mpr121
+            # HiTRON AC/DC CompactPCI Power Supply
+          - hitron,hac300s
             # Honeywell Humidicon HIH-6130 humidity/temperature sensor
           - honeywell,hi6130
             # IBM Common Form Factor Power Supply Versions (all versions)
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..fdb11141e597 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -701,6 +701,8 @@ patternProperties:
     description: Hitachi Ltd.
   "^hitex,.*":
     description: Hitex Development Tools
+  "^hitron,.*":
+    description: HiTRON Electronics Corporation
   "^holt,.*":
     description: Holt Integrated Circuits, Inc.
   "^holtek,.*":
-- 
2.47.3

