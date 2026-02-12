Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E84526561D
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 08:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770885910; cv=none; b=dZqDRoNBQR8YJdBIFshv93h+hSk00eZzBm5zhkdaccbDIvlpWagh3kNlfPCA1OshuRpOXu8u85mVX3MaOhhRet96tlBGHUFMwjiZ4i+gGPmsV/2AfbWUFZ4pent5++pKU98+vLqKlihsVk4vo9Y57rZmMxrJBu3/C351tmmrZs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770885910; c=relaxed/simple;
	bh=S4LjTcY8WIdOz/Fa9CMVBB3lEWE7ucfcbiatZtIUpyw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=amibkQ/2nyJVnAqHqX11R5rQTo0k6rJGJzgdY95/4wLNQJZSL8tqyLLDaJR9FK/mPKvjl4Vg5eYVyrQLCy24z4ZdocEpkzbtwHYCcyFmkwkKQaH0/72R4i1S1Zx/IIDRyzXZu87zaC12+YJ+E6ShyLY4b4Xymai9wqENAb5F25o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DoRu0aph; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DoRu0aph"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso17167725e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 00:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770885908; x=1771490708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NGh5IYyCcy/eOuT/iqO1H2zbkd7MZApIvvP1+BGFLo=;
        b=DoRu0aphxfMikLEkIws/gZ35AFAAaWq50/8p/ZB3104FdVmD5QkUvLccyEFLbs0JCV
         dI79B4H/pkuoUWFy72hZ0J06XCkQZPkDLqcI0QrNZM9JQn01FgqfodRKsVJ5XdW651EH
         WUMeViR+kCkUytG7nyxYOze/8yXBYF9Bi/r/wpCPBMUeiVZySfrYRhmS8IhpF9Gg4Cd1
         +K9lnwc2guj77uAYJsQ02ilAa60L3Oo1xtiVA11hTLoz2OBLwqAuJJvVh36eYdYlYc4q
         P9olHw5Hz+pkazv+l7oVHbbbxpRdT1ZqfZaffvlmpWtkLcnwPl3DkdySR+4LeK3xxCjw
         gmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770885908; x=1771490708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2NGh5IYyCcy/eOuT/iqO1H2zbkd7MZApIvvP1+BGFLo=;
        b=DLzBTdnPIdStUDxluXOgE/LI7Fd4W4BraHK3XsrxDFjJeXEPEXVuTFPxXROXGwjSKd
         50qnlBM8Q+wWQ7+oUFMMO2w+8ZTG3wVFW1Su4jjsgiYt5TH9CDHYipAs5OFXG26JbwMF
         lY10g2RGuxts7huCeR5AoazsFgVppZ4Jxa8nsT1Wwy9TXNfUmPcMocWbd6RTuyoeitgy
         RNhNq/jJJi8ZglvWjUZn8n8DhfaR1n5q19Io+bnNQWbfLyew8NR+Zx8Ro75xNSO3UCCN
         qk6yoWVLbayxbPeiUn1C6sD5Gx9Qc2CwAAU2QbZnqnjvAoHRZhR/Dgi0oTl/vQFaYhQ2
         MWvQ==
X-Gm-Message-State: AOJu0YwfYfDkCS+7lRrI3ED4+axMt4/F+RUEdggysuvu/ARtW6DyaYY0
	4xqvLBo0MEuK7LPFUs6LjCl2Jwy78wRzBCqLZPuEIyAMwuCOw5MtKWLHl5DbEZ5XvoQ=
X-Gm-Gg: AZuq6aKpxRIDnU1YTqasntl5AEz4/c5R83mFU34ysIPUmB70SzEZI5y+x60YBKpYKG2
	jkxC5eM4prhDqElvlRVIFni8e28RmuE0Y66pFUvU6fxDnDOON319cJ5JOnKE0RPRxYJyoqisVGG
	JE3ge++JB9VCS41z4npdf1MaZ5e2tUr/VbABuINXP06fbZ3U3s9Fo9cvNfQwm1XliV9ih7S3ZZe
	qqF44sk2mrYfiMRBMfhRufNVJm3S+vRMz3y11kxy09mwDE4LX1hkaFWH8mSxFyOnpKP0MnUhFbQ
	gIlvfITP46NG8sg2T3nLStavy6Z2mCL9vaFFEzMptu45M7J6IjmgwrWOVJqeEBxHj970uwOIlN+
	NjPQaUHf/gwCyRZTrTvXXEJ1rvo4hc69fCRbJ8cvwZLH0VvtcSPspgQPd8Rid/JcU1oiwmWuhUa
	PYxyNk4yCuMFqHlX4d5bMD/fSYBq6BeCP6PKW1nHBrhEvpBhTpLqTDQEQ2tKTof7uTXl5TMSUk1
	X0VHTbajw==
X-Received: by 2002:a05:600c:4e4f:b0:47d:333d:99c with SMTP id 5b1f17b1804b1-483660425a9mr22340565e9.18.1770885907761;
        Thu, 12 Feb 2026 00:45:07 -0800 (PST)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd0e15bsm82753705e9.13.2026.02.12.00.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 00:45:07 -0800 (PST)
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
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: [PATCH v1 2/3] dt-bindings: hwmon: pmbus/tps1689: Add TPS1689 support
Date: Thu, 12 Feb 2026 10:45:01 +0200
Message-Id: <20260212084502.1795-3-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260212084502.1795-1-sbogdanov@baylibre.com>
References: <20260212084502.1795-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device compatible support for TPS1689

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
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

