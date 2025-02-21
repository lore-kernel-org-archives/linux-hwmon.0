Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF25F253F0E
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Feb 2025 21:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740173929; cv=none; b=BMrOMuibYp8UxYjuwbQ8rn8TiTmPX3u7LVzELL+L9Zf21Q8efp40Ptn1c8t+cAhR8FWW5YeO4HK885+0mv+j6DsGXVpuTjY4pUgyLliDsrOQw7sBXVg/uvteACn4LNTv/0IrruxxMTEvHqAEo/ymfvnD23fpAAnkWiEDuFVqzqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740173929; c=relaxed/simple;
	bh=mqb+/F/SJd+Kw8g4GHIMnmOg6gFag8LOyrjc/CBzfDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LhkhTliXkt+3giBZpHfZ2+VW2GtGQv6NDkFTd4oMYjDiQ38yItAO496d4qpybWq8ePzoJze+3BrQKmSMh5HBp1YTWdyUnPxn14ZxwRENJwGOmy/eUPr6tO25NuSwE/B7iVKfOz/0iUQ4EHpI7O/Pu9ht1rHHmpX5+gwJK96yaJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=RVs/7UhN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="RVs/7UhN"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43690d4605dso16523865e9.0
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Feb 2025 13:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1740173925; x=1740778725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJT+U7McgsKphrcHRdaZ6L+JaOsqY4avlMmqDJFGzCA=;
        b=RVs/7UhNVNLTLGHpLc8GM6kdoShL63p9wk/EZLGqXeeaJhwKEKgdiuKr67y5Pus1BX
         yYlZpRwjT60fk7lCfFTRfelB3TXyQwMQHURqcJIZjvmWUFZs59P8MVp/Vbu1jitKu4Os
         frrYbCqB9alWVmovdIBZTlN6AN7DMk4zV0JccliEeqrYJMSTyvZYt2zH1VgdQFz/ME+m
         E51erJOHxhEbjmE7BsEDVg5np99Z3Qb0/OLFiq/5ALENVXu92scfHFyn0KEQPUMigXxI
         5Zi1kCEzOschpscJ4QsN7zZwrTLEuZfKpQOwcM0dILOTX6T4NMUtRL6p6SjEPTKBHGjd
         gIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740173925; x=1740778725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJT+U7McgsKphrcHRdaZ6L+JaOsqY4avlMmqDJFGzCA=;
        b=VqcCaNarE+cz8EKOgf9VfKp6+oqltUG5KKRjM1IB8Pwqykz321R3xNkzfVX5S8ixQ3
         BAh/ijVglY1oKAKcfviwJgRmUtD+F9VphrIXbppyTUBzaYrNSHVVQuhxjWcpyohMeRb6
         gXGhT6T0CcM5CdFZgv5i23YmAQnnz7AMlVSbfVrWP0f9Xw55/zOOWwmUqdSLCoIbeU5B
         DRc22xU0mcDYygLHTiZ369iOJ069TB9gDexBHpJkure7tYctlQ3WJHnPVq7y8Bkz8Jan
         Qg/sloETVU4Ek8J1kEy5Lr2CMvS6XSQWYwumVVD9wxMqbkxMGq2u2PusnMOVvKpHqp/o
         hTPg==
X-Gm-Message-State: AOJu0YxUFwvYFs4aVQS0ltR68BY02mPct5Xob/AC0U4KUs7UQmucp/+O
	NAIKtZelVR630uYq8/Z6EB2NDnIsbrT0teyp37IkSb7LeZoP7TY09j+TBdtSIxE=
X-Gm-Gg: ASbGncs7zhiFiNQBA6sfxUnzc8Pd/onyXgPAeWQYROSWQ88TyhNZAHcE3n7rel47pfV
	1WLIR3VO14/HBQG9KNr1QKkm/IbIoosLygrvF2jDmXDkYnqnUMw65og2NV+vxxp34AxPc+N3VnL
	vCr6Zly6d7x5RaYhBOVy2vMpTFiQwYrEDmX8JA6kZt350HH1KZJspthoeaZhtIQZDgP4dvXpkBj
	JTwT1zhLkd/FTk+QbEgl3nPWpdzzrZMzKTTWRxjq8ezXfJyDCNLfOfVnQsccDDW8yvy0TuQlYa3
	BuYQCa7JHQUxXcxQbgUj3VucSN21Qpn+Chreheo64IQR6/kcJH8i2b4FKuevR0fug5SxzpM/UZY
	7+Vl0l9/jyAClMN830nZczg==
X-Google-Smtp-Source: AGHT+IEJdfP86XwonfKjpWl9cuxaXOkK2TY/AbasqcdUgfrAsr/wju12Wjkvh2xGz6T+sDP+8jaxzw==
X-Received: by 2002:a05:600c:4f91:b0:439:955d:c4e2 with SMTP id 5b1f17b1804b1-439ae1f15b6mr39164505e9.13.1740173925072;
        Fri, 21 Feb 2025 13:38:45 -0800 (PST)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25913f5asm24767461f8f.52.2025.02.21.13.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 13:38:43 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Guenter Roeck <linux@roeck-us.net>,
	broonie@kernel.org,
	conor@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Naresh Solanki <Naresh.Solanki@9elements.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-hwmon@vger.kernel.org,
	Naresh Solanki <naresh.solanki@9elements.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: dts: aspeed: sbp1: Align regulator node with Infineon ir38060
Date: Sat, 22 Feb 2025 03:08:35 +0530
Message-ID: <20250221213837.1594057-2-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250221213837.1594057-1-naresh.solanki@9elements.com>
References: <20250221213837.1594057-1-naresh.solanki@9elements.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PMBus driver expects a regulator node, which was missing in the
board's device tree. This was corrected in the latest device binding
update for ir38060.yaml.

Update the board's DT binding accordingly to align with the fixed
device binding and ensure proper regulator support.

Fixes: 1d333cd641fb ("ARM: dts: aspeed: sbp1: IBM sbp1 BMC board")
Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
Changes in V2:
1. Update commit message
2. Add fix tag
---
 .../boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts   | 124 +++++++++++-------
 1 file changed, 80 insertions(+), 44 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
index 8d98be3d5f2e..34f3d773a775 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
@@ -1838,13 +1838,17 @@ i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			pvcore_nic2: ir38263-pvcore-nic2@40 {
+			ir38263_pvcore_nic2: ir38263-pvcore-nic2@40 {
 				compatible = "infineon,ir38263";
 				reg = <0x40>;
 
-				regulator-name = "pvcore_nic2";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					pvcore_nic2: vout {
+						regulator-name = "pvcore_nic2";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 
@@ -1853,13 +1857,17 @@ i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			pvcore_nic1: ir38263-pvcore-nic1@40 {
+			ir38263_pvcore_nic1: ir38263-pvcore-nic1@40 {
 				compatible = "infineon,ir38263";
 				reg = <0x40>;
 
-				regulator-name = "pvcore_nic1";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					pvcore_nic1: vout {
+						regulator-name = "pvcore_nic1";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 
@@ -1874,13 +1882,17 @@ i2c@5 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			p3v3_nic: ir38263-p3v3-nic@40 {
+			ir38263_p3v3_nic: ir38263-p3v3-nic@40 {
 				compatible = "infineon,ir38263";
 				reg = <0x40>;
 
-				regulator-name = "p3v3_nic";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					p3v3_nic: vout {
+						regulator-name = "p3v3_nic";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 
@@ -1889,13 +1901,17 @@ i2c@6 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			p1v2_nic: ir38263-p1v2-nic@40 {
+			ir38263_p1v2_nic: ir38263-p1v2-nic@40 {
 				compatible = "infineon,ir38263";
 				reg = <0x40>;
 
-				regulator-name = "p1v2_nic";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					p1v2_nic: vout {
+						regulator-name = "p1v2_nic";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 
@@ -1904,13 +1920,17 @@ i2c@7 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			p1v8_nic: ir38263-p1v8-nic@40 {
+			ir38263_p1v8_nic: ir38263-p1v8-nic@40 {
 				compatible = "infineon,ir38263";
 				reg = <0x40>;
 
-				regulator-name = "p1v8_nic";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					p1v8_nic: vout {
+						regulator-name = "p1v8_nic";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 	};
@@ -2070,13 +2090,17 @@ i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			p1v05_pch_aux: ir38263-p1v05-pch-aux@40 {
+			ir38263_p1v05_pch_aux: ir38263-p1v05-pch-aux@40 {
 				compatible = "infineon,ir38263";
 				reg = <0x40>;
 
-				regulator-name = "p1v05_pch_aux";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					p1v05_pch_aux: vout {
+						regulator-name = "p1v05_pch_aux";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 
@@ -2085,13 +2109,17 @@ i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			p1v8_pch_aux: ir38060-p1v8-pch-aux@40 {
+			ir38060_p1v8_pch_aux: ir38060-p1v8-pch-aux@40 {
 				compatible = "infineon,ir38060";
 				reg = <0x40>;
 
-				regulator-name = "p1v8_pch_aux";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					p1v8_pch_aux: vout {
+						regulator-name = "p1v8_pch_aux";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 
@@ -3596,34 +3624,42 @@ i2c@1 {
 		reg = <1>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		p5v_aux: ir38263-p5v-aux@40 {
+		ir38263_p5v_aux: ir38263-p5v-aux@40 {
 			compatible = "infineon,ir38263";
 			reg = <0x40>;
 
-			regulator-name = "p5v_aux";
-			regulator-enable-ramp-delay = <2000>;
-			vin-supply = <&p12v>;
-			vbus-supply = <&p3v3_bmc_aux>;
-			regulator-always-on;
-			regulator-boot-on;
+			regulators {
+				p5v_aux: vout {
+					regulator-name = "p5v_aux";
+					regulator-enable-ramp-delay = <2000>;
+					vin-supply = <&p12v>;
+					vbus-supply = <&p3v3_bmc_aux>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+			};
 		};
 	};
 	i2c@2 {
 		reg = <2>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		p3v3_aux: ir38263-p3v3-aux@40 {
+		ir38263_p3v3_aux: ir38263-p3v3-aux@40 {
 			compatible = "infineon,ir38263";
 			reg = <0x40>;
 
-			vin-supply = <&p12v>;
-			regulator-name = "p3v3_aux";
-			/*
-			 * 2msec for regulator + 18msec for board capacitance
-			 * Note: Every IC has a PTC which slowly charges the bypass
-			 * cap.
-			 */
-			regulator-enable-ramp-delay = <200000>;
+			regulators {
+				p3v3_aux: vout {
+					regulator-name = "p3v3_aux";
+					/*
+					 * 2msec for regulator + 18msec for board capacitance
+					 * Note: Every IC has a PTC which slowly charges the bypass
+					 * cap.
+					 */
+					vin-supply = <&p12v>;
+					regulator-enable-ramp-delay = <200000>;
+				};
+			};
 		};
 	};
 	i2c@3 {
-- 
2.42.0

