Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679C82DC764
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Feb 2026 08:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771315934; cv=none; b=sg/CW+lLg2LQuYpUFOEkSfUwfMRK4GdTeRJEJ8+0vb9eC8VbqzTCJ9KK2KogI1vaWhdsFY+JowVWeswocRwyeDo+JfTMCb0BsDzuFTjjKjpJJv3oVeb3cfa8bfoaULKoGoQ8+6LvqzCld1HHmob3slPelPUG78K91+NIQTG81Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771315934; c=relaxed/simple;
	bh=fUJ50nNqzEo25SE79AYPaMX7LUUHzTN5oOiZ4xAgcTU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OfQMdd0URDLCWzOiSiPfRpgQPsK96s4jU+ZRkK2C5omLdfHHrzYVFkMEGT13wNYP5oCEJ6rYBe5L17NeJQqBdUgDV+mHeoyQMx/77JMp2u+FJ4vmG2DFyjh8MZ0t09dt1sKuh8bhSLZcHiW8por88REN5Jluvg49DlqoRc0E+LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kCqAREtM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kCqAREtM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48375f1defeso30448645e9.0
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Feb 2026 00:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771315932; x=1771920732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkC79iRLW3tdZGeGE0h/zKnK7gWxEm2JpK3spSL5h0k=;
        b=kCqAREtMYHy/35mt+VLAhNORUCi8CPSW3SH4WBjof5HePcmaMBLzji9Tr1EkIwjUNu
         8Lv47IxLWN817CnjY8hqtMeghkq85/5a4uif+Y4hTncxdEaOECWqkS+SjUXbB2T6yk3m
         1Cfmtq8XneIU0HN53bse1WMPhU0Q0JhwT0fZXpOj7MWs4v+J8PUK8uO/H6Wj69uOoqJp
         lbEiGMyKusehWy6Hbcrb4HSCG3oihzqMFA/YKnF9kCOtaeJOkMvsIERVn+/qaaoOpUAu
         09b/rhhuix4K7C0y5fkj7kIxnOArw945uksXk14EK5JnHQHG2whPquCe1w7OaprR37Or
         KQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771315932; x=1771920732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hkC79iRLW3tdZGeGE0h/zKnK7gWxEm2JpK3spSL5h0k=;
        b=FrKRqypexIzTMOxk+p9HJUPTOsexPMqM81X+fuTfYwWfo7bMMiWMZjs/BcrJXeUpJl
         KWt6dK0DJpdxHNtW/430XX+9Udtmgj6bmqvFQ9jYniQGcLo2fE6BmrprY5cq15wCgI8h
         s69nQInuZoB3sSFoFTrEKznOc1MvWECQoc9PxrG6VklYr2+N2qw7WoTZ82E9gEEdpBpz
         Mdkwh9xjRDY26NNJ5MoffQuyK1RNUl1SOSlkdAyVzqasYw5+CQnLKTYul7VfjsjtQYoo
         G9HgY6ztEX3QStwOdY5qowDd8BVJmaMkn0lq2v/5Wlh73gAL2y5lcIYNiCJzQJia8B/r
         CoXQ==
X-Gm-Message-State: AOJu0YxMllYGnnPDxjJ8Eehjdy/y3p8wOh0dh7efhzN42FLsIUOfwU4c
	njasyDuY3KMRi3Ks4UWL1n6GWX7alVCApqlQO/r5JARO6Jn8FJx0mi/LZd3OiWvmGhw=
X-Gm-Gg: AZuq6aIw+c43m/d5pzeh+uHko1Fu10CJj6yB5GlGBjO8tLMBasBkP/8y9qSDwLNVSJg
	3anmux9jZrN6s8W4GcUPOBviTaCKWfxtgtfbLuDHVcMGF1Gm+4abLlwoDNoJOcUxp+zfSOOwOzn
	W9W1tm6fRjMcEjqWbTwIFKi8ZnxzZcRTwtJ6GqbgrX1Prn0GIGoZ1hZkKQlI8HmzAq1J3QQPVM1
	baVKMcaLP/H2ZmatbIUxxbkvKVM1ZPCzrMq9jW89CB5tW3MOeJM/AqqC5JBoY10tcjWjmmfJs2Y
	HNM0WKucloJEGdLVkIRhbY25EAFPqrVN/TT+2T3ISXBnU3m2ZzCzjEsP02pydxgsk0yFZkr+Ksz
	eDeyOPLJKBd+TQI2W0CamktgduP5PfPVd7Ar4enKwvysQSbPv6NHF8/LZoTaAT2n1NjJzPA45sp
	MW4wIbhExolk+wXJ84SFu+igadhJM4h6e++B9Dlv1X+tBF6bL2tlLBPFDmJWIcI3fDpgp4HhjpR
	EQdosbwNg==
X-Received: by 2002:a05:600c:1f8d:b0:47e:e87b:af8 with SMTP id 5b1f17b1804b1-48373a5ba01mr233760545e9.21.1771315931619;
        Tue, 17 Feb 2026 00:12:11 -0800 (PST)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5d156sm35757690f8f.5.2026.02.17.00.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 00:12:11 -0800 (PST)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/3] dt-bindings: hwmon: pmbus/tps1689: Add TPS1689
Date: Tue, 17 Feb 2026 10:12:02 +0200
Message-Id: <20260217081203.1792025-3-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217081203.1792025-1-sbogdanov@baylibre.com>
References: <20260217081203.1792025-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device compatible support for TPS1689

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
index f4115870e450..973ee00c2c49 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: ti,tps25990
+    enum:
+      - ti,tps1689
+      - ti,tps25990
 
   reg:
     maxItems: 1
-- 
2.34.1

