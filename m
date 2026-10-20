Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514907;
	b=15PVCFkEKaiZRgb0er84GkS/8VRYm+FH2L/tnb7a1DWypxwbBq99SJT+l7c8hQTrm/5+
	 6Ty3FO2Skk8nSz11iLnut/hQrzIrKzQAjVlR6S5pwl/Yh3NDe80Bo5YXRXdqoRDuiN30+
	 PB3MI4Hmwiaa27nQL+j1/fwepbkgJ9Pnv3fKoy9eQnkwn1dX6c9oN5Klh5rapher5lZ+1
	 JgVLMCQbQzYgz/FTVO6ocAP8MakVSLAMbBO6jZYn7obqPhUxw0Wvp7UKdwU6eLZpI7hiE
	 PRttlI05g+H6RkCFw1Sc0x1rdVHYHGJt5GnEIja4vkKAUlKbJ9CKky20JaDOo1WK8ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
	b=yMP7o85ATBF8Dy9NYT4rPxMqoiZ5yqYHDZ+WHl0sHXbLykqUSsO1DUkYUhcOfaLKdxEO
	 ptQIbI+8JGKk+X6h4ED1VCvJklM+nGgiGjrLjbjVBd3zm6hCwpuLT0O6W/oCdeEr0gSOn
	 hgYcqDzVyIsss5Et7bynbt270LCzD+B4FgywV70xCzQXlNm7S5eT+eGLHyXhwpIvy/5Vp
	 CxfemQCFwvmZDu8bBxnfLae92VGR7cVtCOGxWVMl4IbBfO7xdXXW7omA7UW+dTh2A46o3
	 qr2ke1EPzr7smGAtS90PuxZXIZSP0PylHYo8n/S/DbBP/L9Lf/F+Gl7I8W8QKGFIkdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b="asN+/mJc";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388DB60A261C
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 16:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 388DB60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=asN+/mJc
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15dd124bbe7so866608c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 09:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792514906; x=1793119706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
        b=asN+/mJcU9zt1+Ew7cYXC5xXTLeYVwsdj8Hyrtz0iXW1b3RBMxYmDYl514VEVie10j
         82FYCcHC1M8nJSu2OONjjyOtcFC6gZHNKrYXJHr5nMiVgjLkt2AHYzcinTJTpTAweINn
         ceiDB4RwrIQKYjDxEcwqOuQ2zEIMM6oIFQEaTNi/fjcYZUz/8nVR0NcwsPlUOxwTj3rN
         hffBkB8nTHsiH2ET11kFj05nJQdp9fp01OcFNOs3IB4TlKp9hJk/JoUemW67NNkHeiPf
         /HpuClRnaj22CXs9FsDO6YXGCR11O2QDe+IVb7udqHkzgjQkdhPIoBORX+Cc/gPRmd7x
         spzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514906; x=1793119706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
        b=0AJ1gWqM1YYLGuKl67UIOhVcReZ1tPG6czfy69y0sTF96Vo10ZtB8/X7aecBFJAkWz
         E5I53r6K3pOIxz+83CVtlrfgmMqfD8f3MP9AMPMu1Wwzu2yzYqDCwNE2bwWX1IRQ3lXt
         Z6YxHa65Rt9Dte/LQ7OOrkFB9knNcT2VDsBHw7OXCCBfyC6VwmhJ92ysjrhZIhZ/jwPs
         JsQzoIvJYSYYoC35rxOyhbzZKTBXaeredWnayZaWVO2qchiXtsq+jlrMlwTFM7MBKpXH
         xUCw6Z8ohlS5a0d5WRrWj/SnLALxtfkLQPyF0aVnEcvi1pseVUfVJskSLtG8VBoZqDDD
         Gdkw==
X-Forwarded-Encrypted: i=1; AKwUvBxZtbxVFJepNxneeuDQiXTaFBXGos3hL1wK07pe8OF+vLCH4RTAkFU85eW5iEoNBRWt8PAxXNrOeAR2JA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKsAxDy7jZp/xPDsNe8FpFj1fMS/wlk7kgrbKT3YhOSaqVm9R9O
	tq+1nObgoTymsTFuE+ajCqDZrMsuRQcu+0ruyYWHmNoCA+SeeL8aZwySOPNS9ebDWKQ=
X-Gm-Gg: AYBFou0GISP9NLqgWtInXZOgyZKQYuuScURaDDHNiIQ7ZjSKkc6zoi7xKLPEHFUhG+V
	bXEWxq9DrndoPzm1tvQa9q7YKrxId78UJ8BAfmpqvvUWp9ibtP7qkcBm/pO4crQf1Ul+NWKPoDz
	MgHVBKQ8hOtg68YY9NBEm7bftfdzZmswpM+FaMxkz66/iJWH3DvUXf8ztRTGzBvYCVT43e+og42
	mOHsinmty7qxpbNbgUZOK5QEaFZ/Tj1iKl35zohEZlaeGm6hBLVBfvwUynl1QaWoDrgTq5VyC1p
	9UejJ6E7yXuJrFFOu+sFtiLrt02qHyN9J9dB740bl8MV0FP306islhkRvP3cJkI0gM55XnKxthg
	hzkd9aDAUagUwWYghgzl02IMcRoR2S9hvp5GWdtIIlhumQ3rTKUJY79SElObo7p/wQqleZrOxeV
	Hy4XGektV4O6O0FbEd23dsrHkp7Lezd77x4vV49zZhwRP9Sc5WMhl/X7XuWR0zymSe
X-Received: by 2002:a05:701b:42c1:10b0:14a:5d07:9b with SMTP id a92af1059eb24-1851310b0e0mr15711482c88.28.1792514906047;
        Tue, 20 Oct 2026 09:48:26 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-185aaea8b24sm30916031c88.19.2026.10.20.09.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:48:24 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Tue, 20 Oct 2026 16:48:15 +0000
Subject: [PATCH v2 2/3] dt-bindings: trivial-devices: Add TDK FS160x and
 FS1006
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-fs1603-v2-2-0986107a5cd2@nexthop.ai>
References: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
In-Reply-To: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792514898; l=1668;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=vv7jc6T42fhaJkWqiEeKPohXQukidcy6joILhcZ0eqE=;
 b=vd9Mh9E0vGBxVgQlbvK8XjOPWj2RIAXhnuQwwJjS/QF1HgV7E52cWY6JCExf5hFUgRXo+D9fz
 gqBuJKTqEPzBceMMK0WoDNiGBDb3oSPIX7d+GG85ii8oILKxpA62pdr
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

Add the TDK FS1603, FS1604, FS1606 and FS1006 uPOL converters. The
FS1606-0600 and FS1606-2500 presets scale telemetry differently, so they
get their own compatibles.

Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 42527c7ee9c8..73bc8c130802 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -466,6 +466,20 @@ properties:
           - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
+            # TDK FS1006-3300 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1006-3300
+            # TDK FS1006-5000 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1006-5000
+            # TDK FS1603 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1603
+            # TDK FS1604 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1604
+            # TDK FS1606 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606
+            # TDK FS1606-0600 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606-0600
+            # TDK FS1606-2500 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606-2500
             # Digital PWM System Controller PMBus
           - ti,cd9200
             # Digital PWM System Controller PMBus

-- 
2.43.0

