Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE31E1C8629
	for <linux-hwmon@vger.kernel.org>; Sat, 25 Oct 2025 00:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351972; cv=none; b=rr4dMJPIfCxUmkKhfZmOWmva19uEDpcYSBQwOwiXNxzRdeb83R4FKYGyHHClOY78qlvcwSmtzNYdYDfefB+UkWRPW0FU6VOOw7/2M3GW6BxbBvEuFjko7/GF+JSq9Odu3OP9FPydlLWK2i3352K+oGh8fROHCT4oPYRT3T5w1Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351972; c=relaxed/simple;
	bh=aj4aVwNnkYZP/VgOnJhsAwtvL4XTAa/u4ZaKgBAEh3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bEULTv8hU8ubW+VvNL1yXioE1imumogShHzEQnjaYV5DTCiXr+CP/M4to8SjFDtbaS7lF+gGs11Q012b8fkqnQOvfRqLP2dMAmNOUbBq7CkU+6ClrVKI/w1B+bfdhQ6F/KFQ0JSc5ehLZVtFLMvk0O1t6xaMGu/ZuFLG4Qdq1Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcQvV3mY; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcQvV3mY"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b67684e2904so1930507a12.2
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Oct 2025 17:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351970; x=1761956770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5nftmpeMNxILQOhfvmkuo3ny/kYcoPK9w/ov0DMU2I=;
        b=GcQvV3mYF7B79ax1rkdHGufwtMG6W9dGQzFord+OUpGkacoQg0jN7nfbKNXE521E6U
         R5nRPNDkFT1U8CwHl45pZVVxU9AEmeZs2pUQitf1SGSqtPuIsXFCxHUxV5cLuPnHPG2l
         hxQW9UzQIymVogSH8cJYMpz1MWDxqjby8jQZwwu7DAt4q942BqC0BHm12mK6S7G9jvYo
         0SHhBkyGWjCTg227X5bAcMd9reMmYnXaWxpgohsE7iseuWWzyiOa6haUiZUCa3eIaZFP
         7QijLqNcSpB7KcRnOP9weLpKxCpm799XtiTbJj3APAUW28RMXlBn2SR1RmemD0BHDQCm
         0BxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351970; x=1761956770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5nftmpeMNxILQOhfvmkuo3ny/kYcoPK9w/ov0DMU2I=;
        b=L4Cqfdl+TsgGw1UWNwsuue24S3P+WFffUkQz5uGEIxL64+RQI2TWnUEKwxoDPKz6ht
         gHfgNEdf0bETWPh0jR0UP+JhZFR/3Y7DHv+b9ieVRjXkgqYQ7uz5p4KgJjHptgFBiRZg
         fwNzygtcmRg7mHHWTMn6dpfoYxDciJpF32reZf4oYYznOBSrRQBO1DMhmzO4y2JqvTFM
         ZNETkR5EB0pR5trO5exJboZhV7vtnNmYjyMaf4xzyUOwp3N3eD2Qj9lOYOWPxeqp3d6C
         5AnLZ4DaapzJWqCAQ8wmyEopHc1EMf0V281LKwcLuBRDvpiKl/2DF2dfvhht2eGrL+yU
         CHvw==
X-Forwarded-Encrypted: i=1; AJvYcCWRezR9hBGoIRj/RnFUNGzLiLcgOD0n5HN8lhfqA8rP3s9xXGndMe52lm/0NBb5azz1SEtZnAGwP4VdlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNMMaHCQy/eNcrlq2GdZgAAVhyIjtVIBs/t+w9vt/li3Y0zYnW
	+W4HBU5H91G3M2NHLcmzl2ASIp2i98mssQmKuZpJfHh5eUIiA6Ler4n3
X-Gm-Gg: ASbGnctsyMJegHwK85k/k6JBS+P2OQd1C3afZ3t+g1QcBcaYVI9oz2cIlIYfZUAAU7S
	CzENoTqaPHCdqEF6dfdxOyrAL3G32bofG5aYPZaGJ4OKMUbETBGCIH2dCphoYWmmfvvGzrRFzYz
	j2taCHfedzPGMguPbxSFubyIW29UcxvPYRGYDDbDCNWVg+s8NlSK4stTdV1Kmb/9JqjseEechVT
	5n/9MN+PA5MJz+CpwuaT5FTrjr3NRR4IzlPFBuMvF2V6SickvOfzH8QXWHm5SYQK2yXWalJ4714
	pxoWTbyIidywSBc3YslOS6LW6HRpqvdBN7X80s2oFQKWFK/AR7jxNMGNFP0sQY1wky6dzYGL/87
	9jPE6KjkBmPrYGpyuxoge302RxWUAifrbcazUiI5z2a/OeB24e8AHJs6aa0QL5ZT223wlh5B+zr
	ayubhXw+hROzmGdkZpIWP2x9ypEuGqm2YzHDtat7D6P4RvNLT3lKdVDFyThXAPYAJCmzgsho0Ej
	P/LKgQ7GeZ5bP2kEpmbQYkPttIOKeqLyA/mLFZH7vnsr20OX3yVPQ==
X-Google-Smtp-Source: AGHT+IE8KakcB5GHMGG8ECARmltmRt3k8h0a0+JIbETOJrnh8ND1oGT/dCjWnKYo35ORe4+xL9/X1A==
X-Received: by 2002:a17:902:db05:b0:269:8f0c:4d86 with SMTP id d9443c01a7336-2948ba5b73cmr48845065ad.53.1761351970277;
        Fri, 24 Oct 2025 17:26:10 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:26:10 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:41 +1000
Subject: [PATCH v4 10/11] arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC
 node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-10-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
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
 bh=2GQnZlbwDgkFgLSJTTlkgGVtMUC2q8Y46wlmJNb88ZA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM59fOHE8XGD1q5TTvfe1J0p3i1UNPndGn9/d7OLU
 d1ZTR9rOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFNteIiRYdmlmbkMnxU871/kSnOszjRcPnf5/0tbq3w+nJg8l2vSeQ1Ghlvlif/
 yF+yz+2l6ZbLx3N8bhLcfEPusO+nlav2A3Ss3neQHAA==
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
2.51.0

