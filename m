Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEAD2C862
	for <linux-hwmon@vger.kernel.org>; Sat, 24 Feb 2024 10:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708769720; cv=none; b=idlEJE/gvZGWV1hFtxYzk+Go1lHVcktaMAD8ukoG4NczFtP4mFNAbdMNisH9PJyzsF1UOBPs73HQmmvWCW5cVepEilYLE0Wy7Ccb6sxyqH8GAkllBuf1cQS5GCatY+AUReBzmRCeT+iXKYjAIuLIp1Pfe+EsBqfK96KO+pDlZuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708769720; c=relaxed/simple;
	bh=aD83uepM0Darh5WwNGaHTFt9aEgQZZROelPmA55Mti4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MnujJ8KleGghkUG0MMODdFp6gcrnJasXr5K94UKicNHXTCpbQv9y8uIZcgtJb7+x8ey1K/omDqnAnqUvrMDbpuQEYDIOuKmSwJyRmi3wcVErPp99X/LliEMitgM2zYDCrqYdn1FxRPYWFBzZ1aHrODI0oyge4iGdLRKf3fEhi+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YKCVCh5g; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YKCVCh5g"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-563c595f968so2082161a12.0
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Feb 2024 02:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708769717; x=1709374517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzTFvA5VYY95036xye7AAeQU1pMkC2skTCxswO20aS0=;
        b=YKCVCh5g+jnQgg4V83zhy0Yz44sawZswlbpY+59U5BYVngnSKD+fm0FgvcZuNYHJUC
         1Z2tPWPUcOvd7qWF4hDt8ALOInrV0EJdIl1FXDHkGH5+ybWiwjF3Sbs3H+Gw7k2ppfLy
         jMzvYA6dhoj08DZvu5BbyhDUeRNTVlmLh7r1XEsXOnqyNOwBItD6HcmxJAXJeA+LhLnv
         WIXLsm8PUghWYsAFP7+x3S4cF0iCruLs3KwrQgtVpVTuUig8b06NmHyAWvvGKtN1682S
         GTkf8yTz0TAIlFET6dXubSyZJNbb4QbN77Aq9dN8LJtX+NKy4IXInTxRL8NV73F/ZNPE
         g8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708769717; x=1709374517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CzTFvA5VYY95036xye7AAeQU1pMkC2skTCxswO20aS0=;
        b=d+iXazdyjowsTJi4MQ46aR+HQJp36xfkuiXYZ0M97GbAwKo43+em5tEn8bd4HIYbZB
         PJFNXtreRloMKPacgvDbbD19OXrsrWPpcCRF9xxQKGxg+qcYFn7HXhL75dxVz116+oqY
         87XDoM5/3PWg5CJEglBIYKTL8YGc3gwOcUJilGYW3fC051xrZxDxCAjzuia/Fo1lkQK7
         2rlXouzL9ElF/382HlI2h6EPxdRdC/zCUd27frgj0AebZ5q4q8L7e2LyiV4QQIfTe+Lj
         PmVzMPdPfHJnGRNQ477VsMOu6AUOYwALLZGR8PgZIOjkkdp2q6vhHKT4Uf6oovlvXduq
         MIlg==
X-Gm-Message-State: AOJu0YxZ8+M5Lq6akjJjLngLa/YzpSK7IXo2Qt4sM0IX1yTVPqBpQo5U
	VLnxgbDr1B7N+RDMWRGP28aWaDMDbU0to918nb/pCYl9zpLbErrD3o/ArCW3fp4=
X-Google-Smtp-Source: AGHT+IHuHnxXW77Q82v5PHyOSddDwM2zvBrQWex+4T6D3oGXMA4jJqVAWeWRWOB6tkf/ibD0LH4EsA==
X-Received: by 2002:a17:906:d04c:b0:a3f:adcf:7f58 with SMTP id bo12-20020a170906d04c00b00a3fadcf7f58mr1271974ejb.21.1708769717451;
        Sat, 24 Feb 2024 02:15:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id p10-20020a170906140a00b00a3fb4d11809sm446545ejc.204.2024.02.24.02.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 02:15:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 24 Feb 2024 11:14:53 +0100
Subject: [PATCH v2 4/5] dt-bindings: hwmon: lltc,ltc4286: use common hwmon
 schema
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240224-dt-bindings-hwmon-common-v2-4-b446eecf5480@linaro.org>
References: <20240224-dt-bindings-hwmon-common-v2-0-b446eecf5480@linaro.org>
In-Reply-To: <20240224-dt-bindings-hwmon-common-v2-0-b446eecf5480@linaro.org>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Luka Perkov <luka.perkov@sartura.hr>, Zev Weiss <zev@bewilderbeest.net>, 
 Eric Tremblay <etremblay@distech-controls.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-i2c@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1004;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aD83uepM0Darh5WwNGaHTFt9aEgQZZROelPmA55Mti4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl2cGnMHl7JvVmjVNpXVQbkA024o3WcnyxoDo7s
 lo6+7T2DHWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZdnBpwAKCRDBN2bmhouD
 1yUsEACZkgw116288idb0nBcbCgrzlAo9PqGWcTHRDqQXYPsHYf1Zs6n8t4+hwvHpRSbLVx+pWM
 TLYFoM326csLHXmawzl/9D6vfjdnxZhay5QGzCIjjkEHbeXrjXRcBz63G8zVtnuLWglGRBCAuO4
 zc+lRb0FwyDjLCfQZH4YpQreQ0E7NLIoH4zisTLElxB9FHDivEXkuYUQ81BWSwgtB143vh4wDOS
 sYsdbp4s9ssjMmzbmjCSMLk1iUPiPIncPA/EpC+zE/f6ByqNtOL7+q39uNLLx1lxH8RxIuUZBu5
 KPfHCAUbF7P+xNV8Tvs61bby1K9Zzm8empLCghDi0rmRjMEwjkMMPoGhU9JxlatXIj9Gzuu8Svm
 LJUWxLsfho/UGG/S9aplhBzI60W+G4BvufTiNR69KyP9nQU9bI0V7m1G1H3yYUxi/HUW1c+nYHt
 QxmOcFZcfNc72tl0Q1yvD6LslDUrfocLfRoGoWn7KMct0p+ORasiyF9ZX81rgZWQ9N2kKOaalx2
 x9JwHyE+vbp0JXiKfV6LdFbs158sVjqbc0MzvUstiQcAIdmuvipPt6lZt2cbFkfi9yUZWlVSGj5
 uRE0yvg7XO7BGTeW6uqZfK/F2Hc/yDyQxepnZAcRvPWj+YGbjKWOoJtTHrXs0m01rsBDRRSDHsN
 jYdbr9gI/tNlGQg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Reference common hwmon schema which allows to drop the
"shunt-resistor-micro-ohms" property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
- New patches
---
 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
index 98ca163d3486..853df9fef6c8 100644
--- a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
@@ -25,15 +25,14 @@ properties:
       The default is 102.4 volts.
     type: boolean
 
-  shunt-resistor-micro-ohms:
-    description:
-      Resistor value micro-ohms.
-
 required:
   - compatible
   - reg
 
-additionalProperties: false
+allOf:
+  - $ref: hwmon-common.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.34.1

