Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8700638657C
	for <linux-hwmon@vger.kernel.org>; Fri,  3 Apr 2026 10:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775211327; cv=none; b=cWRXlp32fiG1ls+/osBIuKXZedGQ0gTeI4sTG4t2I7ycfy17mZj0HRkWvhJco5I3Der/L29BHd2nu0RDyQ6hDLZt0BCfP7jiLv1mTpXUA8ozD07I/BaRmrfIKV3sdl+fr2btu9OmcwnuKKRxucM6gJDaxrTJ0U7tgvBbk9pRac8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775211327; c=relaxed/simple;
	bh=IpM5hFB+kdNbV7lli0k0M4KR3AimfZZxqbKqhSv0u4k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=bhdHqZhGRz8/M0qSwcM3hNQtwCa4I+JjGk96+xDvN0voG+Zo4ZIa6KnnDIATIVC53tWdBl00sbp/GPMBeT5rLBrQnPHSfT785CdlhXGl4YemDX9j/GECxujW2maazUwftFzvP49LJoXBDwRdMQfzDg3+dqWNmdMkVUwurzyPO8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hk57mXo9; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hk57mXo9"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b2469e5117so9716745ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Apr 2026 03:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775211323; x=1775816123; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h21ovezJUJbbP7dsEh1vhqxhJxf8p0z1BeveGGiIaz0=;
        b=hk57mXo9IK/VQR+9l0hIBRrefOOp6LEgnSlt4VAWt4KsXq/u1UYYj8TcmiXYroGMA4
         56ORcORf4NkFWXOHp1P1wRO6kwDQzBbRmXWiCMqB4m/HBZh77NiXsJMk5e+vFONt26IW
         kFJHc5rdmSWDgwuHwcySA9hLLSVcc+sLSofQtmAiMw+Yyu1kgPvucyyyht8MmmsWaY+V
         DXjhAZ1VR/BIKZFpZeuw2Crgn/ljNh1aK3b9gUbAij1en1I6Cg0pZszi7s0wWzgxm+mq
         gKmDUvW3bAcGO5YaGEBESdvhBqDfoUI3OYokBrSX97WfTfWGgJLAZRz5OsXztFAFf4Lx
         M3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775211323; x=1775816123;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h21ovezJUJbbP7dsEh1vhqxhJxf8p0z1BeveGGiIaz0=;
        b=iPw2NF2Nq0cnFgrs2EedgaKQakPl6xzcL0ZUavlwdK/bgccEJAnwx4LBiTSho4vC6w
         Dc9w0Wce6eztFHDIwwFsKbEcrva1N6/ol756EXDqheY/5++WZyVuBlV2NAQn9LfmNlDm
         5wzcfd1Xo0fWb/DjW115EAwnmiTsMFcRdmlb6TJUEZG0EDLXNJUTVtJhRlrpkA6dWasX
         N93n3e+X4p2qXT+1/tfTHxY8m9bvfj/Pru3sYuPuP4sxGDpQmLK9ppnFK68++sAU6Abv
         siMShKrXtj/9L/u5RXrcFsbpelv6xZzeA8T1SkbfLo2fyeiQDdVmIRZROgw7kiNM8AWt
         TBkw==
X-Forwarded-Encrypted: i=1; AJvYcCWXoTwUI/Sb6IDjAXHaTGbh1/WHTQm6iyHs4b8hJXmHsSR++PzrYF4cn6NYWaSTssIsrls0yLDs5xlVpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx06JZf8PKOQEkiiTc3Eh+ea5IyoTtpNIxqo2VBItwPFEh5cT+V
	Muz92GmOy8VzB0ZoQYR0sucinhFSKuDm4mfR3IdgGZU+EeH/J5Jndle+
X-Gm-Gg: AeBDiesuMfCNyXAdQST3ZG/Gvo1rMrIPcJ+YIKKvlAhGTKHJ6OUxIXni6RDId/zdPWa
	Ama/1+AkL4imbwT+Ajgr9Nt8udbSf13CNwLTbzgKcfP4z4r30Onv3TBW8zuoHYryVmIRAe53K8v
	23NBcNuJsvYd+5+bVi+QcakXpruZcnqdUX1dysK8u/ieVCm+9yUsqcq5O0s7oFhMj/Y8y7lapPd
	z8b/jj+hoRRwSDZCT/LBbj6/NV3umwZx6jHHGDFQPuZ5kLwUy2i2q4gqm9oZIMj0ApP3qfixPe3
	v23iMtp9aBpNGKHDZCemYwPHVQssDlH0w94uDlC3vty1MDv+DvHkXXLJuXRxuOxTK1dRfNHtghh
	tO+G1VXorBxolofHcF1XVJhZZzz/zFvsQRslqQqHfqV5M05FXFa5n7tNuBBw1hAJcDxEFjZ9qZl
	VPl0tfdu2QQqq5PUvhqrhkDEuYAzB2IDFrsFGAh/D1SUowjyMeMv+J
X-Received: by 2002:a17:902:d2ca:b0:2b0:b557:6fe5 with SMTP id d9443c01a7336-2b277e88764mr51371725ad.30.1775211323213;
        Fri, 03 Apr 2026 03:15:23 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2747341a8sm54383675ad.3.2026.04.03.03.15.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Apr 2026 03:15:22 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v5 2/3] dt-bindings: trivial-devices: add Sensirion SHT3x/STS3x and GXCAS GXHT30
Date: Fri,  3 Apr 2026 18:14:55 +0800
Message-Id: <1775211296-63722-3-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1775211296-63722-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1775211296-63722-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The Sensirion SHT3x/STS3x series (and its compatible alternative, the
GXCAS GXHT30) are simple I2C temperature and humidity sensors. They
require no external resources other than the I2C bus and power supply,
fitting perfectly into the trivial-devices category.

Historically, the driver matched against the "sht3x" wildcard compatible
string. However, as pointed out by DT maintainers, wildcards are heavily
discouraged in new bindings, and specific part numbers representing real
devices should be used instead.

Therefore, document the explicit chip names (sht30, sht31, sht35, sht85,
sts30, sts31) along with the fully compatible gxht30 in
trivial-devices.yaml. Note that sht85 is already supported in the driver
but was missing from the bindings.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a482aeadcd44..e6efabfb1b14 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -125,6 +125,8 @@ properties:
           - fsl,mma8450
             # MPR121: Proximity Capacitive Touch Sensor Controller
           - fsl,mpr121
+            # GXCAS temperature & humidity sensor with I2C interface
+          - gxcas,gxht30
             # HiTRON AC/DC CompactPCI Power Supply
           - hitron,hac300s
             # Honeywell Humidicon HIH-6130 humidity/temperature sensor
@@ -399,7 +401,14 @@ properties:
           - sensirion,sht20
           - sensirion,sht21
           - sensirion,sht25
+          - sensirion,sht30
+          - sensirion,sht31
+          - sensirion,sht35
           - sensirion,sht4x
+          - sensirion,sht85
+            # Sensirion temperature sensor with I2C interface
+          - sensirion,sts30
+          - sensirion,sts31
             # Sensortek 3 axis accelerometer
           - sensortek,stk8312
             # Sensortek 3 axis accelerometer
-- 
2.34.1

