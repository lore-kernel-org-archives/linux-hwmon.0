Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F262385D83
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 18:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787596751; cv=none; b=Wau4x6Z61PNeL6EfjXVLBiw33Ub5cSFJGuKnZUGMKa6qN1ouYbn4hA3nG57mQGGhNH73mm1VVsNdjTt0oa45A8hNf7PMmmS6r23N2qvk43ucgbM14DQ+Edtbo24/kJt9ewfYHo4i1BoEOKIYkRo+mF9G/o2qf5OAPWezcD2qdbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787596751; c=relaxed/simple;
	bh=O3UXywBmTQzj42EhSFesy4w4MZCGG2xsS0Sf+bwGzkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFe6NNxhx76bnzUhuC8vT7DYrW9hq8zckoOVFzp3eODdHtzf4xf6Jxhi/EbqSLtcchdGe6Uqppf0cJTnZr+wbi2ysBQBTu4P1ckqHuBTQ2aTpywUByAHnJGYcJwVwYhynzYdKyrmkNNpgoJo594aytfd3b5acD7M5m9vpXGeXUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYqynPWV; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYqynPWV"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so444252866b.0
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 11:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787596747; x=1788201547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+SSHM+dMzftRd72hGlvvpR2crpi5QEgfnmH3X3t3vsU=;
        b=QYqynPWVWavJVhftKUBA0EcPHjzBjGF3Owob65G4PJ4cFPYRMD9/WKH0B2z6DgKsoq
         /qHy9mK/FVefLvZHftyquuKmrdfG8pRGosfncya+/qDdanxhx3JzVS57FXaonhkFNhSD
         uVFQRnI8kAFLEXK4U81oWTKql6eZCe0YolXIrnvyyJPoAbqDgZrDP4mBSPjkiC7WPe4o
         bdpvSUNtYZlLjYSV68DtOOq/UWw5Ag2TOuTTzuDcrSC3yeRcNHynVj96qHvY5Afcro1a
         cSO5pzTLgVp37TMVDpRkYmIuBF6UKNRLvMWvljLv3pJB5zgVe7SAJs9+ZuDXClxS8san
         02EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787596747; x=1788201547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+SSHM+dMzftRd72hGlvvpR2crpi5QEgfnmH3X3t3vsU=;
        b=PPpKiCOTqP2StSmt/zYrB3X5djF2DaevA0oEu9t57S7ogHpNh4kbtY8cK+FJeFqmlp
         kMmk/Q3NTAGeTCzWbMSbVr6dqOwPyHvMQ7OxorAJAwdb5UNV17IbP+GJKs5uV6pSorSH
         4f57DnmjLuVAR+Na5nTfdPUaYGDHWdDdPssbHs031nVLErqGYFvcw4Fdkj5de8NdTevP
         RnTyoqtm474EpxLC9pNWSS5hSAr1yJLtq6eqQ5Tcm2Lh+EHXe5IhNWWYmSFnqFzP4HfU
         oaFA+NXDPLMnbTdmKNL7t+D8MlZawevrDx0Z6F9z6dFlzZ35f49dcEFy/aIIdYLcKPtZ
         yHCA==
X-Forwarded-Encrypted: i=1; AHgh+RqGeDu3HrJAgwdqqX+kkT6BVBHVs4cg18hiRv2Nb1CjHuKSH8LV/8PX5DUx72WAbU5nswrBoAFt6M3Vkw==@vger.kernel.org
X-Gm-Message-State: AFuF++ngcbPBwhnXyfDG9N4+ghPHLakPnRV9FL6Okp2u4vv6Dk8pOzsA
	rrk0KYe32gAwvWrDTelMY35fgUL2a5SEVXdxoVzQxnwTe68QQ4TU9RrO
X-Gm-Gg: AR+sD10RNeK6Ohg3LfyW+Fwb3o1Jzo8cXcbwMWrfpZ6IHtdNWHyiUkMrBL4BOr9k7d4
	Psm3H/PxO3uV6HM3DqU8CTYoO88Zy81WLFiDsiwj/1r2gEJZI36Z7TdAa4Nrvxophe7MugmqEQW
	ek6AmpJ/saW1ulovzS5tdM+alk9SzNPC+bbzYQ8syO7bMQiKR2GUiykLqNCn00UqQHBGrkKd/Gn
	PXyO9tSRRVBhOABnkcSLGDblCQT+SJL6xO1l2ufhc4pY6l9ApqgWgHkXA/5Ir40NkkgIryaTnEc
	+fktPG+l9RjrjgFc84l1SxdUijAoQuDVngOTvneAr1WExiKASboIIxxEwPsspb8mr3N6OQHgg7/
	eg0N7P276aUuP26Nw4MEBY41s9tFGenvl4+3T1B8qhkdrp/CwZ7H4sY6UEcwuiKekY9e192mzPI
	fby49VMzW2ZKxy2NaJSoWk5ix6Kq4s3uRdrocF4QLVKPmQ8JxV6MMnlKeJok2pcbUm8qusHZbhp
	o93mdK2yweFhev63UL/3kAwuPI7an/q4nhjycoyhnjhBg==
X-Received: by 2002:a17:907:3d44:b0:c20:1c9d:8d4b with SMTP id a640c23a62f3a-c24e58d101amr38617666b.2.1787596747403;
        Mon, 24 Aug 2026 11:39:07 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([2a02:2f08:440b:2900:8e59:1937:8c58:aeb6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249673d43bsm1307499266b.47.2026.08.24.11.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 11:39:07 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: hwmon: national,lm90: Fix channel constraints for temperature offset
Date: Mon, 24 Aug 2026 21:38:59 +0300
Message-ID: <20260824183900.8983-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824183900.8983-1-flaviu.nistor@gmail.com>
References: <20260824183900.8983-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Limit temperature-offset-millicelsius to remote channels only, since
channel 0 is local and this property does not apply to it.
Channel 2 is only valid on devices with two remote sensors, so reject
channel 2 for compatibles that do not support a second remote channel.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 .../bindings/hwmon/national,lm90.yaml         | 29 +++++++++++++++++--
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
index 164068ba069d..a7f82b202b86 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
@@ -113,6 +113,29 @@ allOf:
       properties:
         ti,extended-range-enable: false
 
+  - patternProperties:
+      "channel@0":
+        type: object
+        properties:
+          temperature-offset-millicelsius: false
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - adi,adt7481
+                - dallas,max6695
+                - dallas,max6696
+    then:
+      patternProperties:
+        "^channel@[0-1]$":
+          properties:
+            reg:
+              enum: [0, 1]
+        "channel@2": false
+
   - if:
       properties:
         compatible:
@@ -149,7 +172,7 @@ allOf:
               - onnn,nct1008
     then:
       patternProperties:
-        "^channel@([0-2])$":
+        "^channel@([1-2])$":
           properties:
             temperature-offset-millicelsius:
               maximum: 127750
@@ -172,7 +195,7 @@ allOf:
               - winbond,w83l771
     then:
       patternProperties:
-        "^channel@([0-2])$":
+        "^channel@([1-2])$":
           properties:
             temperature-offset-millicelsius:
               maximum: 127875
@@ -186,7 +209,7 @@ allOf:
               - ti,tmp461
     then:
       patternProperties:
-        "^channel@([0-2])$":
+        "^channel@([1-2])$":
           properties:
             temperature-offset-millicelsius:
               maximum: 127937
-- 
2.34.1

