Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE6B3191D0
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Feb 2026 05:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771823317; cv=none; b=mAXhjuldM9Qm57MK5Pf2+41QXBhyIuVlqy9KpN4HT3xKVasxxIFztA7IPeRJPIXEMMuNMoplJy9X3g9LqiEVtfPSzKOHKWPhl1RpJ5oIuG5Jh6LVeVa9g7GhSVuGd5Zjc3vpE0BOBXTbtVwLKcIXp2LfRZ2GVloZ3nAk/Nah5Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771823317; c=relaxed/simple;
	bh=ErS3wJTAyTaQRYawS6VwyuFEeddf9rFQGTo3AZ++III=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j1cJqZlSI+8SyAMY3jqUARHRl6SJd0etnlHdwsQRrUgyxiNaYHnTUKeqM49qF2kZYE9+e7gI8ZMFOUX9Ktw0XAMALm2O2hQoDgIUL3b4FN4U7OUY5z5AEUP+ovCRMiwilj72CZXfbHAKrBR5cP2oL5Ib5UGoB/xKR/ZBTKBKHd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyDQUyrs; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyDQUyrs"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-824a9348603so1550896b3a.2
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 21:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771823316; x=1772428116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIriBNBZ/cMMJ/jUXL45O4yEu1LeY7GdlDxQ1g/V6qY=;
        b=IyDQUyrsGNTk8YIMhTAPp02dKY2P32m4IuizsnGNTjRtimSmomGQ50L7WloxTkPnJ/
         ygrU34Rg6H4hmnSh7b7Ee5abFBpVXTicTLoi0kskm59xNxMwi/NZ27TRZgvTfFVrijUM
         tXipBMod2nmwnLPjIzDV7V+vs3YH2ZypzYf7BCQo6gqj7MHsuylmmH7WrnEQth3/1P2O
         cbmLsD6o27eQzxzgx+kqQm2qpoT6o9/b2jnT78k/ihYb+qf66AuaGS1CnRqUTVgl981D
         uoM203nkr8pcUvygC31Vtr0HLiu5N4VWVVG4tYif+YThQ1hgYatEbLkJGOVZnc2Kruyt
         n7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771823316; x=1772428116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SIriBNBZ/cMMJ/jUXL45O4yEu1LeY7GdlDxQ1g/V6qY=;
        b=ibPPHyLHPcy9T8oqm6Wc/OtFuu+ZdGoLjCS05elSxMynp/JVVsXfFTlUer1U5xeVkf
         Nuyhahy70uHCvz+5JPe1nFxRH/pDguHter4i7zquPFRNHl7j8XSVxUxexaLuIWPkWTxr
         uZFEYjTor9nlENRjjO+D+jivi1MSMmPONAVZPQrKB/E09eKAW2ayYF7rslZ+Tt6SZDbA
         FpWMGTGXFapuyNXx8QDdPxy6sU9bAKlE3U5BXawZfT1tbVclNq/zhW8xGdXabNU6Ghze
         oINP2NKQFaBtywc5XcmSSKpuGCmY06bHQVl3le1QIqBCkb6mWL/uIShzS2yYJ9V7K6UN
         RHuA==
X-Gm-Message-State: AOJu0Yw8nRdWyW1sfwWq+QxK+hhx0NqqFqGQFoGnnciduEkzlJM31c2H
	zXaLCOenMMvgyCG6wQhrTI+Sj2Ts6yyLin9pCpd6TsqPAhXt4DWrsuUR
X-Gm-Gg: AZuq6aKRjwKCIuxRHuVuNCUtcSngMW+SLuD+aaxbTM2azIeuiPfC33V/AiPpU5upGwD
	HaTNCs7GXtZ2Hg6wdYBokJMhpOemedZr5Ap6Rm0iC+fUZScjxEZj4fayvHkUlbrwJM7wsAh1DJ5
	WpXeWXXnSgbPUvmUCiqO+oSrgFF4nKFkBrdvXjCN7XkbW/EsUM/DE5LjRcY+2FzH+jALUEvlNqC
	BOmSaXfq1u1FdmRurzCoiaVdRNhE5SC16KkTSRm4MpPQ/4PGyVtpG+BYmQPy0qWQDGllDHrYbQi
	LlFB/+vUx5v/wwY+ybbtYKnSM2sWtkIPwOHU7Ihjr2QdBPoM/+hkegDe/BC5sr4y8DrrKf3s1sE
	fMr+QsSxTAphX+80vFLFvRo3ZH/WlK5jJbt67Q0pCxW8IX27vtkJ80wf4H+CpBCgNB+2GLf08Y+
	e7pcl1/aj7FB2CBief2IM4SqBjmc8J09ZRc/pfGs1nRVwynQ==
X-Received: by 2002:a05:6a00:3c8d:b0:822:7fd8:ffbd with SMTP id d2e1a72fcca58-826daa89442mr7723707b3a.59.1771823316079;
        Sun, 22 Feb 2026 21:08:36 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:93aa:64a5:666f:7ac0:de3b:1659])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8bf9besm7502022b3a.55.2026.02.22.21.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 21:08:35 -0800 (PST)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v3 1/3] dt-bindings: trivial-devices: Add support for XDPE1A2G5B/7B
Date: Mon, 23 Feb 2026 10:38:02 +0530
Message-Id: <20260223050804.4287-2-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260223050804.4287-1-Ashish.Yadav@infineon.com>
References: <20260223050804.4287-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add Infineon Digital Multi-phase XDPE1A2G5B and XDPE1A2G7B
Controllers to trivial devices.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a482aeadcd44..343f1e62c373 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -157,6 +157,9 @@ properties:
           - infineon,xdpe15284
             # Infineon Multi-phase Digital VR Controller xdpe152c4
           - infineon,xdpe152c4
+            # Infineon Multi-phase Digital VR Controller xdpe1a2g7b
+          - infineon,xdpe1a2g5b
+          - infineon,xdpe1a2g7b
             # Injoinic IP5108 2.0A Power Bank IC with I2C
           - injoinic,ip5108
             # Injoinic IP5109 2.1A Power Bank IC with I2C
-- 
2.39.5

