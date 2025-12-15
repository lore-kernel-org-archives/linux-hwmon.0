Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF8F329E79
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791546; cv=none; b=JoSGR377La4ZlT7jHa1/Mo5zueuEl613EdFYUTmJQUrHNJBX50knmmEIigKzubKGOHXaIY6rSJ8toVKF4y1RrCaPFZJGcr2mz0GiU3a67niE8ik2ASzMSQ6oUa+nrURsdmC1sp+mwUquMA4vMLNEnv7B8Qb9fynr/aZenJwtOUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791546; c=relaxed/simple;
	bh=WBSnoWKU3AENu5sDkwxg1gyjDJ4F54vrwnNIGBo3bkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aTOLqKszrHOcUkqKTZvARDAZUeIK5Uf7EdkIfw0Hsn6BCSSWgTNBvqisjoa+4j+kxFdScN8o+c4MvBV0/o8o1lO5xARojkZtXSt6Lb/QdmKCrYO0ontpwSZZU8yfLGaGYxv/fNXG3r6Jz/+pXDaRd5KEjtU1kXM0YflLntHW3mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWiv9h5N; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWiv9h5N"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a087b2a9c0so22484485ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 01:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791543; x=1766396343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bGUzMeLW/JozQ7jHBnhOnIeY8glII+n/t0VKsxF74I=;
        b=LWiv9h5NPkdPTPN/enXqezb8Pq4z+0tLzwCmTFGGHQcM2DL85g3TcFfKKB2l5qkKrd
         jsYcpuGhKGCP8pA05hhNf3IqjVhYvfWiPf0PFMYQh2zXj3mEWI1tRUE0e+KQwPekN/0q
         +9xfu2zSodjdVtrmY3pDqOy3P9Bt8IXQuF04G3McFyJvyW0jjF6ndUDTJSElXY8w3bNj
         InxW3QLJmhNdvB9AeybQXk1zD/3c7yvuZoO0qkjMCocGQuO+pixVloclYFM4R4nIixjx
         D6exkb5lvcDROnLbvD8sb7s7q2VCQ+mAf0NBUcMF8sIK92iUd9KjrSQyxLUqtdIFDqFc
         7b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791543; x=1766396343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2bGUzMeLW/JozQ7jHBnhOnIeY8glII+n/t0VKsxF74I=;
        b=fyMntn9EjlrwYkl/XuQNoJcB7g/ensmjN6D/ZcjjnnNexKj+gbxe3NjNgHaSWvFsVP
         0tciNC/FWFZqGjFZ5xJZ6cLph1h2fTG4q79qvlHvt0Xqc84Vh/dxHDuiGfA8PYXsB+oQ
         Php/33VBd3KLOfrNbeFC5w+5V68XKIp4sjRLY7ErH+mUlyg64FG1+V092pq1BfchhtOD
         ztH5A/GePIhM1ioX8tDZiZRVoJ5pLjeRa20T+0iw9WhGIUez0Joc+72e1VXGkZfmdlUH
         tyfNabDxlQOf3yBdEcUNfzFJa7N0zzhi0B4gCbsiqucDYsZwDII8NhRB+jHu15tCQ2oE
         my5g==
X-Forwarded-Encrypted: i=1; AJvYcCUO9gV5W+ppsH6SAt419vYqAQUbTNXZNLMx6sv6bQ2AYFe/SAz4J/TnckQuiSFkQl+FVflSyv8HFZ37pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJe1djClGcQUDkI0UgGEoFCtsfmxWhnYpnT2BvPRK5wdh0hYWB
	BdwD+xaRsb3aiSvG/N37vQEE6xlQ/ZJRFDryQNc41JW372GKdSet0XCH
X-Gm-Gg: AY/fxX46JzzhbxujSCZf0lcGLEdBvJrCr6M2c72UyuXtBkhaq5GQ3bjB5jgHotKEDhM
	dU2bOM564ikYi69xQsSnbjXP6WetPSBOeRYDOY7/2HJS/2WUArBpQtLiI3ffB4y4MhxZdisCVHh
	+66P2SscmuDMxAAlEdX1koNAgv5mNsYPiMmFepY00BkCeIsIsiXiPBulnNKObtEaW9nE6RxNYbQ
	d+W0iBsuICbPhYvNFZ0UV3QZq3Ukque9UmeDgL/0BmCsYsKDDqA+4ESOtksHO2CxH9LCWi6KsaJ
	vLEIsJIcliNJqZzkEMVSau4L+CUScRegxJWIBnvaVOawiEJxmufgBm/5MCcJUyUS1WP5RzXOUg8
	YcarntlP1byqDTCmjQ1sS3JNy0MwM09V/Z++sQmuaDOEVVvZhW1qeAb78UxpYjfLsk3csF/r0y1
	ybZKq1d6kCM8idJR7GcYCoQM07hIQoDeKy74Cr7tqrfXaGI+7Tyarkltm5zMkIpQ+TPjccjKTu0
	FPKbHcUdJKgiVMHLhmx4mwZuUluTRuSDgbSke6XivMhvtL1iJQQkNjPYi+s1VgK2hGCQQi4xWoV
	ZimUk7/LHl0k7zAVLQqPNWTsgHCm1ZzWYH9wYxOiSy7+6/eSsxM=
X-Google-Smtp-Source: AGHT+IE1ONDmMPxkmeJv8Jcwz9fHIvPtzkrv+UtHURTUiSutUD39OJoEqG9ODwNwY90PRcf4H0q9VQ==
X-Received: by 2002:a17:902:d4c5:b0:2a0:b02b:210b with SMTP id d9443c01a7336-2a0b02b21fbmr55998955ad.41.1765791543118;
        Mon, 15 Dec 2025 01:39:03 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:39:02 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:50 +1000
Subject: [PATCH v6 6/7] arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC
 node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-6-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
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
 bh=XqyBBwDw5d8mhE2yQoV9/8OYd4bvzgC4hPOX4wfMNZ0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn211msN8f2hHad0eiKb84X+hTfnyV7VXJHXeN/+YV9g
 su/PGLrmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 oY6xjhEDF6cATHVTHyPD+0CvUyukrZ1/yro1RbnqzLLbn6LQaFjJef3+56CtzwMcGRlmr667zhi
 x8ti05R2ebR0CvAtj48yMnqznmsrQW6/0t4ARAA==
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
2.52.0

