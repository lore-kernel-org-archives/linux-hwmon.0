Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A37C1FBE87
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Jun 2025 04:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749096541; cv=none; b=UHi5Cy0OeLkWdM7nykDC1KRBr67LqABT2SfY7bVsepQn1u4cIHxEL6YYNhpkr2/7dUPA+/A7/F4f903hcKdcB+Mxz1ssZB3Bj0Cut38Ly/K7l3zKnH1sV2NTBmlMHnEy4cBPjb7goEehzJgB5GCvgBFMKA1XbIy8TjfaOXg7t8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749096541; c=relaxed/simple;
	bh=a9vspmwOZwaz+AyzjgcDWgvZX8fCbnDmm62t4KkqheY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dtxl9I5xAYBHQqmY7cyuCCfsSdC5jrkX4pZV+6qwThgncHqBB/oPVW+Xfp7OSLKorMxdDWOmqPkcd+ghAFK0EmPIDA+hBr0jajqPdVKBm5Fmb4aJYh8LwJkY2vcU8wJj66h+L2skNDcRHbeRYlO9yr2yJAUvt3N/PBLL4bPkJKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=MbUqVah+; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="MbUqVah+"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742c27df0daso568801b3a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Jun 2025 21:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1749096539; x=1749701339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjfsNmetPpQZcvk0DXM+9sLzYuAqIccObvN/JpO0d60=;
        b=MbUqVah+lK7MXo5D9b75EAAiO3RxL25XvgKnX3d2tfAGIJWU9X2cgZ6cOnYP+btdeL
         sxX1RWPDTiRC681CL/0yGaH6mernQu9ZansHs5yxLVfoKVHb2bySvLiZzN23Lmma8OrA
         B3LaElePpWuXrPxc7gV6jxXsfA/H1dYrqO3YfBD/KGBbeVURtNkWQzg22zzh0iPDiG53
         o74ARzsneQFNAYCyRpyOBaIOP2T6FfbBZ30p4MwKaGJA6fpoaTqz3b7FIAFPE9vdDiy7
         10rN3EUD5rrLZKZfwlsD6Z66sltmLKSWwsFcDl54dTfBfKSVc99p6EUOs+67awo27PXV
         hAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749096539; x=1749701339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjfsNmetPpQZcvk0DXM+9sLzYuAqIccObvN/JpO0d60=;
        b=gfdYOIwFQhVQcP3cG23RIXo5usmzCLdttzrNmVOoV+Jw+6E8xdDJ+FyBIJE5bjVYiV
         DucPGzzbCfW+rD3KDEmj62ztt+REEa+t7iET0MjbYYD4Xl4xThi7DxjRHMTB8j411MiU
         NqZwta6uMly6FPQXAgJea4uEiAcQCcTU6OxIdfQu4A/FBoZfTvN4f2EMRFx/kxvh2xUe
         khLzjPGPHUlMX8UQ5Jlsz5ZSQl5+PA3W3k+KU7pxtNevEzkf+KLSeUCQ/Yq71KQJ4a6z
         oS9oaHLEj/a+V+KWZUBxeOaw5vWdYJMa2RsbMHScyhHE/WhsPlGBShs8BdNI5jJTYjA7
         3HWg==
X-Forwarded-Encrypted: i=1; AJvYcCWbREU2wDeauWflUFelCX2xegC54IMGRtAUXP1uuuxYDRLaQJ3B2JW4Xr9jbKQ8fPGOHVTJdJpGVLtx8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/J5+9eptdzRdIMYXY/4RkHW7DA0dUwHL3mgHdxWxj/7PXBxNP
	n/PCgPcCd79S+UFBydCbB7PPOF6hiRBbfiNmPyrStynFkxyk/ghHxS2Jp3CPodg82sE=
X-Gm-Gg: ASbGncvKhZ4qHb0LkSSGjxQNCFdYJncAscc4Gr1Yc/5cBBPMw2DKS2p6C3pev2BbwjB
	nap98LkrLJVQiBSiSorScHdfv5Ei/f1khWUkFFBp5n+nB0tXtaHv10jbph2tveQa24tUr4yfLbW
	e7ew6Nnzqgl7aLmJ57WUj+cIOy7ocs71lIN+TYxu0pHA13KoPzcNMXOl081u38SCDr3UownDKW3
	SMIN1fsuWw6BM3P/uInYLNmJpS1K+p2jzyY3uBJ9wNgDL52NicBWO7+vVv7cCpYDWO2u0QttTqP
	3m4czBIrQR4pVVGktGZH0RCPh0CTjXWMf0OBf1VMpgH6juxSXRyo4x9kny/kwUpRQRJVNoeopku
	3VRzQB6ePxz0hW7bA6M2WyiE5/mEJew==
X-Google-Smtp-Source: AGHT+IEirjuNisMSQ5l3eLZXrOk0WC7VdmxBT7nUZIwftQy8n8ayiAsp8QGY4W1u4FXoCgiVkkh9VQ==
X-Received: by 2002:a05:6a20:12c6:b0:1f5:7ea8:a791 with SMTP id adf61e73a8af0-21d22c0e03emr7290700637.10.1749096539440;
        Wed, 04 Jun 2025 21:08:59 -0700 (PDT)
Received: from localhost.localdomain (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb029fbsm9480924a12.13.2025.06.04.21.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 21:08:58 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: chiang.brian@inventec.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	grant.peltier.jg@renesas.com,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: hwmon: (pmbus/isl68137) Add RAA229621 support
Date: Thu,  5 Jun 2025 12:01:33 +0800
Message-Id: <20250605040134.4012199-2-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250605040134.4012199-1-chiang.brian@inventec.com>
References: <20250605040134.4012199-1-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device type support for raa229621

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
v4 -> v5:
- No code changed, included Acked-by tag
- Link to v4: https://lore.kernel.org/all/20250602050415.848112-2-chiang.brian@inventec.com/

v1 -> v4:
- Correct the subject and commit message
- Patch kept in sync with series version
- Link to v1: https://lore.kernel.org/all/20250314032055.3125534-1-chiang.brian@inventec.com/

 Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
index bac5f8e352aa..3dc7f15484d2 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
@@ -56,6 +56,7 @@ properties:
       - renesas,raa228228
       - renesas,raa229001
       - renesas,raa229004
+      - renesas,raa229621
 
   reg:
     maxItems: 1
-- 
2.25.1

