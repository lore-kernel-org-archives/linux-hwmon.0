Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B7E2DC791
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Oct 2025 11:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835918; cv=none; b=NPudhdvgBlIESz10g5+5SLsqmdkjl4TdfsIvyRdOZ7qF7aBgFFMt43WRhcQead+3mgzgYu3bU3r/oJZwF1Y1f/YrKiOje115oKIIfr/3a2ZBzf9yGBOgDXjlGi1a2i+4g9le+AwdhkWbteDGtvR+ZFMDpl8MrDtqYTNaqDBLP5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835918; c=relaxed/simple;
	bh=aj4aVwNnkYZP/VgOnJhsAwtvL4XTAa/u4ZaKgBAEh3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ayDFUhaxc0muBunDeVE22ZoVoYsX73rJyeQxJ2OygYaiLL+MGWqoZfOsaRGWvE7nQXmKcE3WUYRnQCawwE1yKhzYe+WKImw2LuWCjXtRXkePlVRU+QlLdyeRXOHscAjSJyKW3SacdaVl2oo+JKYfVe+jZscE2104/G/w6SaCCXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYlzwupD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYlzwupD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-26c209802c0so59721705ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Oct 2025 04:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835914; x=1760440714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5nftmpeMNxILQOhfvmkuo3ny/kYcoPK9w/ov0DMU2I=;
        b=NYlzwupDGThZRHDRSJ0IzlInDTU1jpda9LFB651lWtvVtPAmrq9fftwnNnj+eRDorM
         yZwrHpLjr8nVBFhbVu1UVS5auim9ijYrlm4hcdA78VZoNgKhI4uIlFB0phQVp58Jj5C2
         zgt9sCwdwgvkKKvG+7yUChG1Ly4xMkVkma0XaicEwAk+otAZOmJ8idSRDPlmVLjHQCf/
         Sj1tWu7xB0vQFPCOeLQWHVKazaL1Tz2+HoAQvLoyRe4wpYwZy7EfWq4mwIunnc9KD5QU
         eihl6r8dH+xJqOGRbNpLgU9lX460sC79OTbF8dT+T5Z0geQgPwYwRybBpA0DZ5tEF+fJ
         cyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835914; x=1760440714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5nftmpeMNxILQOhfvmkuo3ny/kYcoPK9w/ov0DMU2I=;
        b=hMr1zJfc6pBi2ZBrqxdsYLbZs3R3fmOTVrK92qPz3hVnorFAhHmwY/9by6tNb9/yF6
         JGZNGQFm0+/Rs0zlwKLQ4Se4cmbkXbWNaoHluigLRFicyIRXH3Ck1KaYwIzt09p5C7gl
         g1rz9UfBILVGke3zXJmzUfsuLakmJ3dHNYExFt5saGLZufqRoSGSmKRxoOdsN9humhiS
         8Qd7+EGfxrx+lRhBJlLByEZIFOykUaobi1awTAYCcprm6EzPgltFTcQyGpbtl4jIixhO
         sKQW1iwFMZ8mrLrsbMcbt0ayt3L9Ayhinte0DiTEaudPJXwjoZ6W0RHn6wjbwbNWkHmf
         NwuA==
X-Forwarded-Encrypted: i=1; AJvYcCUghBcZmClKQBxI4AY7HYyHIQx0Gs3tjS173RijxJK4p8ziozIsSFSUQFbH9U7Cwkk1IW7vAAGjB1SwQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRP1uTP7w3gHpCLr97nsmN054hr9qj+IjZb2Toi7jBQ8gvrdmX
	0fB/A7DbbiovlTCroa3+LmItLa/5pHuZ2H49Mwn6Frg4I2f9NemuicQr
X-Gm-Gg: ASbGncs3zHWUVfwCD2QAvPpXxDjHgKXOdDKM0iCf+ZIdjOJyJSeKTS8bovJgfi3DP4i
	hWQ7+HvbNwN3MEKJWtx+9eRjB1vPWMHNbY3ar/GQhHyHFNjUjKd2mE2fnphdyqfdHMiVTtcEjNK
	ad0rJLzo1sepHgSjORzl17me/4DCHv5Ljv9zXImVc3eKd1UofTRG2rxRfM18bOO+yWV804aiLfY
	U7gtH2Eh3C7c1ru3ht4Ygh+UjeN22XTF2Nv0sgdEqPpgXd+Mesj7MHHYiSgZ4M6Zi2yn0T7wq7r
	dE6hs6SLIqL12LNW/TNg19ehAOl5M2rR1nCSDx7/lmaXkITyTPCyK+nLxmgakow7EEgx3P+Lxni
	vMBLYSXUVHBi7EHQZcyD3wpqT4zNdkn+Zd0RB8T0QpcKY2wfSRljdfM5iNWP4qlBGBMpjaNqhNB
	xdKipfGrCwPE1oVR6fxT2mFkCLTLQMtMYTty8vs1TWRNMO3WPelTd3
X-Google-Smtp-Source: AGHT+IHuJHgjXCw9R80/D5o7z6w5Ge8vVPTT5vKpu+uAH8PzOw9lXkX16l4ogNuFgD8KvHrVNOpLCw==
X-Received: by 2002:a17:902:f60b:b0:269:ed31:6c50 with SMTP id d9443c01a7336-28e9a54efd7mr198564635ad.10.1759835914522;
        Tue, 07 Oct 2025 04:18:34 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:18:34 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:51 +1000
Subject: [PATCH v3 10/13] arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC
 node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-10-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
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
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3z/bogMmDmvGmNrrUnyxbdOaX5PtCls+l3jMPhz
 6cmtr+Z3lHKwiDGxSArpsiyoUnIY7YR281+kcq9MHNYmUCGMHBxCsBEym8zMsxcaGsZebPXWOLh
 Jk2m5un3M9certhx625ak2LGK/uJp9UYGbZ/4zg+d7f2xsAVRRMqPC6XTBVXf9Vx57Yo4/bqpe0
 89gwA
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

