Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5AC26A1AF
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 03:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781493003; cv=none; b=SL+BiLfvChi+4InA6tSqRg4XqI9PAMdmLhqOpUqgRrPH8oyarKvLFgPJk8aH51E4FTHp+EpaNQUSHJ/Oug740D4Wb0r7ccg41E4ipvbKH4/UUXRuESLKiAnM1Mw8I0b8mwNpNXMlLYGxmBrKBgIl4BxrVD2XXBgwVhlnBgWg1rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781493003; c=relaxed/simple;
	bh=ljj+axbM+pJuwMhZDIuTvY80JYwL64DThqWuBH7p+gY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cD6qIj88bcX16KofSaBsLoIVPlRu1TC2g5TzaEhl5X2HZfKz7r6jmlRAW/ynSoh4LtbKiTYpuZp8Fxjn9db2U2UNgPFwffaYmRIOQxOnf2Mpn0dlA53KHnZ8IUli+mspPkx76jltLbdBnScoicN3LSP/DHzh5k+LZhtlXG7lBuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8nIAIbk; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8nIAIbk"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0a5354da1so22296025ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Jun 2026 20:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781493002; x=1782097802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J36qwc0X2qiNqmkJvA8c5QaVK5MbkzBle392XoOcBTU=;
        b=D8nIAIbk1V4tQfX2JMU5PW8CGtga8PEsn4ZN6FVt3L+h+usQcNX/DcdyMDJTZNYlwU
         4NSCE2FkifVUcrRKEztmXyEsMCMaMERA96R4sTgeCEfqvDZ7h+DCs2yG5H1iYXSlpptp
         DqB5NFDIt0BjQ5g6OkXLJ64XaGNG1xazOrtrQs7kDv5Uvtl9jXeri1g8GQYoQ3ALGL6X
         DKanKvceXWIPN+SysmVHtAO8HviLHo/vZlHKTYELhQKj6iIs63dBtXZxOQGlZ7W9LqA/
         j64o/WuUDtcnKLiSZQ8mLPiXqALm1vYmXsbzm2moZdI/30NjxXMTZv8NIPO83sNCToDl
         lajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781493002; x=1782097802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J36qwc0X2qiNqmkJvA8c5QaVK5MbkzBle392XoOcBTU=;
        b=YLIquaoBPtffyInuS3dRzRVKdhZYfiRuA1AlA1nPjXp56DNs2FcCC5EyGNwg3fNHRA
         reVkWMs3PY2OU2MNAlNgA8X2Rd52Ob8zn2+1kWzNYLUFvYlo8i44mVE9FlAJ9mw6h0lt
         APGhF9ZLKOnP3+Ia6Z3u+CquSrBVWID2GABq3z4lN1SvhpvQufoZa3cuZK0JQnV/nfDW
         fIKUABRTbvk/7t3qFQAjwwo+N/QzGsj4b2lexyzy0zlb4dZQliK6FTUhc/7vABIwSAFk
         ttNZWeLlRIZn0yB0K8EMqjQ75YfIJt39RGipY3xxCxzx+brlF7kgu4sjIIfHWBPXKIhk
         QUuQ==
X-Gm-Message-State: AOJu0YzOqhHpgr7TvSSwhTyGHMO66qrv7edYhJPPW3O8kdXut5UzDDQi
	LnH+/U2LfbjdYPTS9k8df8NoXYDZWAspsNRyl7JshBZpzkigIHUZvmC59aLWiw==
X-Gm-Gg: Acq92OFSrvFV6Ir01T5WqEbp9XsfIKL7albz2ab6Cs3tgjuFCw/TDyCtp0vuo25B83T
	5yJW6Gn1ZKsQxFa31hI1rXv3jp/ujT/A49Djinvtp4A2wCIaYlt2eudMs3hNuJeAgGYlO52yFri
	i3UylL9jonM/FMhuExxOLRLDEwkyQN6Nkq4Ze+RPobQuba4cE5hfcaF2v0avM5BzKMoLDYq5fik
	MhOlRMMCn22VS0+dHrKeWz8lZ11WnD/wVdHUV2oztWO0sXqxlqRlLWiLXeL0xNEd8pTcYSASJOT
	mfbycnd+jpS9CQfAA87YrXZKEK1SIKwmGmy4ZSr1OjSPCp8BwhiKxDgfnFbDfUm01ffqccOessZ
	NiGT6hYSHEjv5wyGi5OqH4FpDrRaMM+Udb53KEuwpvrqrS9npo3fulQ2rzxJ4blXsXLDUFI6IkE
	PDL7hgwyben4/L+PLbF4PQ1J96xto45V1P9bGQcsZjdn7JhbiPyWr07630rSceyluCgXVmhH6Wk
	aoz
X-Received: by 2002:a17:903:124b:b0:2c1:6ed:513b with SMTP id d9443c01a7336-2c42ed16cbemr98346685ad.16.1781493001796;
        Sun, 14 Jun 2026 20:10:01 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433460a60sm99211095ad.76.2026.06.14.20.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 20:10:01 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Mon, 15 Jun 2026 11:07:13 +0800
Subject: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add current
 limit properties
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-lm25066-cl-config-v2-1-59be46e67d5a@gmail.com>
References: <20260615-lm25066-cl-config-v2-0-59be46e67d5a@gmail.com>
In-Reply-To: <20260615-lm25066-cl-config-v2-0-59be46e67d5a@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Zev Weiss <zev@bewilderbeest.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781492996; l=1420;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=ljj+axbM+pJuwMhZDIuTvY80JYwL64DThqWuBH7p+gY=;
 b=thuqyjgcTfh+c5VjPdx6zLslfu4bUG5Lc0niV/9FsT5rMFL7QRU34dNYoUEdPI6TGOb2TSNsA
 ThsVnPy7nHwCBng3e1b29ifcdFZlsRoyhRV2HUihtKgK/O1CG28Z+eE
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

Add a 'ti,current-limit' string property to configure the device's Current
Limit (CL) behavior to "high" or "low".

LM25056 does not support setting the current limit via software, so
disallow this property for it.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
index a20f140dc79a..53ee98e871ff 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
@@ -46,12 +46,30 @@ properties:
 
     additionalProperties: false
 
+  ti,current-limit:
+    description: |
+      Configure the current limit setting. When present, this property
+      overrides the hardware setting of the physical CL pin by configuring
+      the register.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - low
+      - high
+
 required:
   - compatible
   - reg
 
 allOf:
   - $ref: /schemas/hwmon/hwmon-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,lm25056
+    then:
+      properties:
+        ti,current-limit: false
 
 unevaluatedProperties: false
 

-- 
2.52.0

