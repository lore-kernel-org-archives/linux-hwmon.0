Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03652727FC
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 11:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946333; cv=none; b=AOluOXhX/WGOaGUg6sFLHABOd70v9HZ1LLJbAuDn8zBe1wamU1LyaDMkdvNnCyKH71PgNC31MKwTCr6Zcb8rt+edG/T6RGmMXkHdOBWXlCO9yJgAlh7bgTpJDiaWgXDigQdW5mwWOf1BIUh5m90G8Vntok6aO24jRzE8qvGCoog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946333; c=relaxed/simple;
	bh=cV5fF0qJO7pdpT8f2yzJ48FKOMe3eNyb1yjLf5hwPSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=THmSmcsCLSKPFfW6lNnCH1siWNLIiv3qH3cxifGsFrF6lvaJorkYIzL4XqSXEacYBSOykRFHWyxobcSGtHT6XH6wWa4j+++ns2T6YvBbNE90gCAsvr3SjE49Xpkee5JCf3PnhCbvtHTNv+fx5Qt041eiHQSkPrHHxY+4UD94YAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bk06i2YK; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bk06i2YK"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2956d816c10so7550845ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 03:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946330; x=1763551130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iA6BDAFFSivvDJvfncgF5ApGj9cWDmXDuEaDbWv5cik=;
        b=Bk06i2YK/4G/N1zND76g9QO5VYP4E2cJr4Ycaf3iPh96lkebMG1smw/LdCmWt8LXbL
         sqIm5CrUhGgM0dJSbDY4k7bmjFKHcuaV7vwccX3DU+6QDIHjBB2CbNizL91vNtffTV8f
         FmgwcS2eCOL039z49ENwAo9ulu6EKmJKFs5ePfSRb0o4IuaKdEibaCN/tI7xPKHejQVn
         +PrLKryD4kTzOT2ZWgEqytkReKLETaAWF33u7HJJ7ufsXyWh2Qk7F8svPasvZFgbVI+x
         JgNolEaIVvgmyiqBlQR8ePgZMm0m+yrpPD1cqDENZ1Iz8TIVUzoA8mSs/XSEJFzqHxyJ
         DzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946330; x=1763551130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iA6BDAFFSivvDJvfncgF5ApGj9cWDmXDuEaDbWv5cik=;
        b=nBsR5alPeYQ4V/vekMTf6Imq8OHWLDReqGUWZk9M9/NxuP6VzM1k2cGfqAD9dTW4Fw
         9meRMwiF9lAi9APdGg/quZp4zm63Ad3HVKYo7p4TWr+U3uIjUUTtuizpqJOxUP+7BBu1
         FgjGUk7VtZKq07PgYdzwWYTVXZA0T+ScxrxYQKJywlUWsvV9vXU7YWcYqThamiLVQrqN
         7F4P5DeibrCnsP0ggD5dyg5yASDZkbTpDxAG579RwLxaccGcVNbb+wEgVLWAx7IC9+Hd
         MHi8dewvJzlURVby3ppeUQNLAMQYf98mDmx+2cDWYWv9jNod32YZH6Z9PaeBIi42yzjL
         i2sg==
X-Forwarded-Encrypted: i=1; AJvYcCWWKpSKXID8ZxExdapiEzNv9ynzIFN0UIuoiIChCgmUCtVhpW0SC3H9k1D1BUAelsvlBt4UMcJdHJf05Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPUXaJyO86TCYDpD2LTK7ujg2jfb9f0w9VnhVktJgRDxFAJi2A
	0EOQlhOX2R9VuZttDjMa+lfXYFkx7ge0TbiTxb8KE7I2+DlMWOjIsmJhxIsu7N/fpEE=
X-Gm-Gg: ASbGncvJwLqh/2MBqMMY/hydBiXw+sdZrK294wk4gbqYfDill0ftNxiu/BKzzle/nki
	K4s4c0Y6TTixbwXv4MYOxKRX3BfFqjNxPoUqTBfeQuLgHccOgUdMAEuh/dlATwLfzYr+aotkfMf
	oN+39C6Ti2I1X0HcNhVCKg5YjLvYv3cmFY8djYtmttVz7s/7mx1K0Rx5CUAVRlWHHJrMchmPA6K
	6tFFzcSZucfq0MWbulJZAWF8usPKgiKQXOqLZ0NSvBJiSGc3Yfn661XqHM+Kp8aYacaVwGZHiUR
	uBFRclm4bnoHYYu1KnE+13JHXyfO6RVUlQxXjUVZUTbk3y5ZQBFmmVMVKMPwEG60vMaccEjfHVV
	f23QBTUlePcz9bIHeIifLNPSjgSzimxyIetMKmWpVIMNA4wnWJkec4FGgrBhUimYLqLHMyFQb/j
	i6DaKux0pnsG2w8Yhyy5MytJUzgOYPkZ3pwEcu0f4/gUVRcLMhYGBY7S9ZIYvN29o/HXDDcaX8j
	ET9VnaR/parzk0A2tcbGkF8xOWgFpW6qdyO4pQrXjQFnw3yAHfCofY=
X-Google-Smtp-Source: AGHT+IFR7QWTTs3Zcb/5ft94/X6vbUaJNlBlezavBVdQ/3VzVvLaCae6d4kQA/Kg2GnApMGUCG81qQ==
X-Received: by 2002:a17:902:e543:b0:295:2cb6:f4a8 with SMTP id d9443c01a7336-2984ee16a71mr33782855ad.51.1762946329798;
        Wed, 12 Nov 2025 03:18:49 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:49 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:56 +1000
Subject: [PATCH v5 10/11] arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC
 node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-10-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2689;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=WbLk+4olybI4wwc+d0lxY+Dd90gh9RgPWEprBEz0Yao=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOcfOlYr8bFj60khS+5UQ9+ndU0LetjI3h5jenRAds
 vHv9vyajoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFTPsGBk2Hnku/XnVYdT5a8tbZ2TVdjOzRLv9rKet/G+5L3EV+bhcYwM3TMD+QP
 1Wg9YbJ+ZoGimuWT1km1Luw48U79aPqHg7cRgRgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Sven Peter <sven@kernel.org>

The System Manager Controller of all M1/M2 SoCs supports the RTC
sub-device.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t600x-die0.dtsi | 6 ++++++
 .../arm64/boot/dts/apple/t602x-die0.dtsi | 6 ++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 6 ++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 6 ++++++
 4 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 3603b276a2ab..f715b19efd16 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -44,6 +44,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	smc_mbox: mbox@290408000 {
diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 2e7d2bf08ddc..8622ddea7b44 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -121,6 +121,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	pinctrl_smc: pinctrl@2a2820000 {
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 8b7b27887968..59f2678639cf 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -916,6 +916,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 3f79878b25af..6bc3f58b06f7 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -919,6 +919,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {

-- 
2.51.2

