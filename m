Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACBF22DF81;
	Wed, 15 Jan 2025 01:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736906206; cv=none; b=k4MvutyuDvWj7+b5prJo/8CU/UHyjAaiK1pxW/DCeD6kyC2ihDag3+IXK4RGLzkl8OvTVHpH9F7FBAFU3PsePFD9XisZoGutREeHA4azuRvgZfoz06sxAbOhX453XwIm49hOvH0TznW4+MuXjuMNmkNoFDXYGvObb2mI+iU7WpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736906206; c=relaxed/simple;
	bh=jbDg3zH7Zt7kTQp/KyVJdX3U8KOdDiJCSvE3Vdw+4MQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KfD3FP8Ohzl61cYptbg2BK4JujYQAeD4q5Q2Ov6nAsDPsbcEKGM0JIB3J8WTN28mYOgbdI3+rpkPbUtlnbn175lOIKwQEwbd7jhMQLVkeG8vPixjFvt+KBzItS5RGRTrDYVwuJ6O1dwSF+fZOT3lQSDmOPl14QEVocVWgno95/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/DPVNiR; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/DPVNiR"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-215770613dbso75138225ad.2;
        Tue, 14 Jan 2025 17:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736906204; x=1737511004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/KiMEE6m99oSk+rc43DPjA4qxXumnXhAnnWBZeRMy8=;
        b=J/DPVNiRigUbRxO8ADWNJnN1j9tuigqgKoZSxVBAEv0VLuPpqm8iw68OvWs6un56gz
         mYKZxfiuJJz2n50gD0wTGAAgoscQkOurXw+qtFQLLakkD/8x3RohSHSJpgkw+BaQmTB0
         9TUe2jNk/jgI+AuXXkMmnX/gMjHycrb1pELt/lzxFMtTXAvDLqsmJvQjZUewEBDKL6tJ
         Ji+qDvGDiOvuZAOWxxtMk+qBBn0ALsT+Ab7L6KUqjBvYcAoWNJ1kfMV77ChQTjLvu+yn
         opgAhyZ+0Pf/RhHmKpJeAJCMbYCFpBiF8vOugx6BfalqdAjKBDUpEx3E4TjSxOBw1NkB
         6k3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736906204; x=1737511004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/KiMEE6m99oSk+rc43DPjA4qxXumnXhAnnWBZeRMy8=;
        b=lcCvqNICP1lYUziz2ZO8NQ1RIw/BETWj+RBURNjKJ4jRNOmsDyDAwOTyCbSi98Ml1H
         awyUgPy3XI8+g92QWL68hTeny40dqQDxHHOffi6QSx05XZw5cJoDLCPizfjMUPVZCvq3
         6idJVZX9FkdSc+/Zp34CynZ/LesY99Qg9a/5ysKOcPwdnssV/brHys5ec7H2972O4xcH
         nrVdNbyyOcV/6lzJ3PhdMicRnnBwkaokgPwy292N9n/hrjVwVLVOgxwfYzsHuwmZAIK7
         Xaz52/qN0VHczTDwkRqk163fXLFHFmcgu98SdSCfkJ//DpvYeb7ud7N4HDZjb7N0EZqz
         vqkw==
X-Forwarded-Encrypted: i=1; AJvYcCU9d7mj2FIZB8fgqWVstoTwoyNEO1uSDyWSWhp1VuRWgZPYgzeePgAZzpRf0eMNJA0tKhy+9pnAPoYe@vger.kernel.org, AJvYcCVCpLWJ63puZ45RoOH+GK5Ezufq48739nvpJfnELPuuNgoud9priFAEXgX7prXE9xlIrnrhdTJV0sUm@vger.kernel.org, AJvYcCWTUnQ4UMYr9kQCxAwR+Sr263iBRl/cU2PESzcduJEhBPcwSAe2B24wLfAPkcQT5UNR3q7hn9BpHYJH/ps=@vger.kernel.org, AJvYcCXIR1IPAXWjAGaEF5nWqVknZttSW8b/ReR3APcK6nIeZwKu4ACJAahHTKhlSjyHiqWwHK8KFsgCWxigPK2D@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyu84V38cGaV9SG0tS7Bm9UByHvghPSJNxhgBFr6iRRvtwqqGF
	6hiFzUnaREcyxYLhKUIDjUTROczL9aIksRBP2DpCjddtavBc+pFH
X-Gm-Gg: ASbGncuxQHwcrypLYr2Vv5YptCUBdFKBNQLFa9LrgxAdQfemHJqhhfkoyidVIfP3boZ
	LHNiqN8HMQA1vg3Bh+FilMDPzugEhs4fqezDHmAilCuDQQrotQT95eclPNlB6L9j11ht4+gxMog
	fVvp04IPIFLaM8vn7QuBDYHElG/lFzTNz2qwt78kbgJRp7HMMwOvHc7QLcz0FMimkSKE/TyFIw1
	Rv80j/4bm4d3A/QQg439GvPudp4nNNzUx6Fi1IugEKhV5yGjRQZGgVKoxt2hanfbHeoPfwsfMcz
	UUF+wBz8Eu4opsae8ut3eBDC1xubDPRBEbygIQ==
X-Google-Smtp-Source: AGHT+IFaBTKfZ0/rZYnuXurVswvU7E9qFNDVekTisUPXSSlf5nwoNIkuUwiJcu28X8WdhwUr2SY13Q==
X-Received: by 2002:a05:6a20:3d83:b0:1e1:cba5:8e1b with SMTP id adf61e73a8af0-1e88d12b176mr42772048637.18.1736906203618;
        Tue, 14 Jan 2025 17:56:43 -0800 (PST)
Received: from leo-pc.tail3f5402.ts.net (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d402cec11sm7943328b3a.0.2025.01.14.17.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 17:56:43 -0800 (PST)
From: Leo Yang <leo.yang.sy0@gmail.com>
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
Cc: Leo Yang <leo.yang.sy0@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: hwmon: ti,ina2xx: Add INA233 device
Date: Wed, 15 Jan 2025 09:55:20 +0800
Message-Id: <20250115015519.950795-2-leo.yang.sy0@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250115015519.950795-1-leo.yang.sy0@gmail.com>
References: <20250115015519.950795-1-leo.yang.sy0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add TI INA233 Current and Power Monitor bindings.

Signed-off-by: Leo Yang <leo.yang.sy0@gmail.com>
---
 .../devicetree/bindings/hwmon/ti,ina2xx.yaml  | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index 05a9cb36cd82..097b3d7d9e4b 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -27,6 +27,7 @@ properties:
       - ti,ina226
       - ti,ina230
       - ti,ina231
+      - ti,ina233
       - ti,ina237
       - ti,ina238
       - ti,ina260
@@ -75,12 +76,40 @@ properties:
       the alert polarity to active-high.
     $ref: /schemas/types.yaml#/definitions/flag
 
+  ti,current-lsb-microamp:
+    description: |
+      This value depends on the maximum current that can be expected to be
+      measured by ina233 in your circuit, divide Maximum Expected Current
+      by 2^15 and express it in microamps.
+
+      This value will be used to calculate the current/power coefficient for
+      the pmbus and to calibrate the IC.
+    minimum: 0x1
+
 required:
   - compatible
   - reg
 
 allOf:
   - $ref: hwmon-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - silergy,sy24655
+              - ti,ina209
+              - ti,ina219
+              - ti,ina220
+              - ti,ina226
+              - ti,ina230
+              - ti,ina231
+              - ti,ina237
+              - ti,ina238
+              - ti,ina260
+    then:
+      properties:
+        ti,current-lsb-microamp: false
 
 unevaluatedProperties: false
 
-- 
2.39.2

