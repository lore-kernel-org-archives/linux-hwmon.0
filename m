Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231395;
	b=zAjDG1ybAl5pU0EmU00xppyJet9wjrFK02WmhdeGEkhhV0GEtFu9Djg02XT1BdcI0GnM
	 iE1D9WLYXDCz17UZoj7pNYBfLmKFgySc5EA42EvPASUjY/8i9iKkciRE+cp42Mht+iRPA
	 nr9dSG0T8bCi9cduB2PhbNiAoKEEH4d7IPD/Xhl9oUWNzNaF8ncoZWljoofQpaeOYTNdJ
	 fXmaEwI8He5JQqv6sGRSugF7vpjfrOcd/J9EpeEoWAoHpRXYQNJiCGvo3CATgrU42P8NB
	 wSoJnjkPijlNGRsp4elkJrVZyFzULEdDtUTEZea52ET6Woi68LAMPjUHN0hCcUdc1Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LKWAw/AZxDTQtn5ObFqcUuzM3ObhugKfW3Vkn+etxwQ=;
	b=rAhZ12oLyyftzhLJXG4TKRh8YRj8iiE6zPJavuNZQEC9wNJBl/M0j6BdQ6mKaCNCfHun
	 V+TlIHbkW5vwG5id3k7qhVjt7u2JnHxK9SGbgaocZ4q1K2PhNSNyIDChkYcd/mtYjAhCz
	 LNT299BMIXHquUb5rN3u9PQWAl1/2Wxuj1/JD9Ie/KpAOsz1utG4dXv22XSWQEAoBBIau
	 tlJporYrBMuUJIxZRgs18nNYgaq+FdGI7W/YPvBJzTtSjHezN9e1V5uVBQNRoKveArlMZ
	 SXDuuMvGI1sYfWmYmjhphBNf0B4F1679d/goHu6ODVBqFTU0nPhjq7r4e/OUuYK7zmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=InJTp9wv;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94B0608363E
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 13:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E94B0608363E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=InJTp9wv
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so8734975e9.3
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Nov 2026 05:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794231393; x=1794836193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LKWAw/AZxDTQtn5ObFqcUuzM3ObhugKfW3Vkn+etxwQ=;
        b=InJTp9wvTygr8V9hYoTr/NhW8KHKk5RlASOuXlrQJRy8N0Bk+kk2ajjODwLpYWwgxh
         TYQuPErpVPfO+JdrqsH6xMDh0cejwZYWD8OD0nSvifgwVbS2gJX2Wxube9ViIY9pKva+
         fR4YSqHXpP2lQOG35vONoJZU4huNzw791xdfVVhq9DLvYzXZZno070PbN3hAdhSzk9c7
         ge/FngigunniTaKQkFaxrj7KU0N03BlIryAAfyRMAXSufAyF8kc4tP8R9GZdTORuuYq2
         ygBtGyg4XdKB7qXCwiX88LIF+0/8MAGFVx0tV2jZ83g3CAiaUUlj6Y4JDJQkTTdkkty7
         swzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231393; x=1794836193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LKWAw/AZxDTQtn5ObFqcUuzM3ObhugKfW3Vkn+etxwQ=;
        b=v07ju6ebeZAhBhKuD1BW3Djq9UBemkYeqJxkCDWXqnLk0D7Wf2fwZcmkEUCOfS8vfo
         oUGt7UryqirHyc7V+p46GwctyF/uGjzYp1dcY+HZeaC7wQg9v24sYHCO74e+0vTNhlKl
         2Z15diIRxdiIiKTm9P6nT0/cyhJlEo6O4PI4XStTsZAtNNQhgx4goHq2eLf0LX80/56F
         qBI/kpSzr0d08TucQpWJ6MuRy+S5jgLzeyzdDguXVp/EU+Wjgmo/5vIV4VfuISO/gVRU
         8O5/z4jhl7TEpplFQEVcC/fOT/pmwgrGOTdXdsWxfF1aIRe+3X03J+/uVMTzvewl/TsP
         Vo9A==
X-Forwarded-Encrypted: i=1; AL+hErFL9j9aHaleWa+C1QYqcvrkeJ2hhXXUERfgLUnki4Pd2puRL+JW8hlpF+a/mJBYaUcU57UW0KuJNbrrhw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/YR6tGCEkL+6hNzepWLzx5ee3UUkOp6oAupZxKIx4lCk1XmeUT
	lS86LN6PgY6yoQSvCE9jM6kC2lSXozBkVNE6HJFaC2cQAhn+LWpyHdaUC/0SpTYc5MI=
X-Gm-Gg: AYBFou162WbRI1EVdYsp4HhRk36p6tGsTTk3S6OTa+AluJjtd9G0k/sOoyjv9d3oeud
	NYFpC9hIdLocGgNBbjzM/IWshTlna4dIUgzjQI9YnafRgNwKUfg0qDEiIw4ie+wIxuDB0dB/cVy
	jaD9NXrA/XeVXp1qw/utIxBKSzfgiTLSmKtsPobk6/uqD30LrAmSM7vdO19425INQ6Ao0le8Esg
	hFY4rhXn696APER/OyJZr7XppWpycbCag3g++0Y+sUMZGzBBMHsxMTg56qAxAYnh7Lyn9B9fKQG
	K2OIOlW4UDm60amp0e8ZO1koaSAdPxcCfuK2NMBlCmjyi55M7UJ57QphigPg8iyt8PVu2ar4b2/
	/6Fq5GEf76RbslrxvwCfLs+eH2wN3sN7MJWImc8SwVbFhXHNGG26pxc/7m6svjM+2ChP8YmvoJM
	VjDTB9FZF8/0oTIqypiueX6snnEQN8lL+NDNr8NtPRLfX8i2qcopHkPupBKwyNHiwX6cvCML13u
	3bfvCTGVrlXyj6G8AeoqjFtxZr2X1mEtP/9JS1+nGg4Dl9PvurFpv1Lv4/LyJv4nEaWHwHGDxAH
	15SujocLDI1MBmgolwy3uyqpg+l/GF+QbiqNZBYtrLKr5zAq7a4ZxDksuJ7VuSXeHu/Ax770gbW
	drBrBG8xp5dLl3vjL0cKCSw3ab9WEy26GGf2w7QVM0PIMbwN+uKP2JTpRh+F4v5Tw0+KihihJiy
	4J+zc=
X-Received: by 2002:a05:600c:3f1a:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4b963c6e08amr75104175e9.22.1794231393335;
        Mon, 09 Nov 2026 05:36:33 -0800 (PST)
Received: from threadripper-fedora-workstation (cpe-109-60-83-229.zg3.cable.xnet.hr. [109.60.83.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm245418915e9.13.2026.11.09.05.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:36:32 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 6/6] arm64: dts: microchip: lan969x: add fan controller
Date: Mon,  9 Nov 2026 14:35:10 +0100
Message-ID: <20261109133609.810876-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109133609.810876-1-robert.marko@sartura.hr>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x provides a PWM fan output and tachometer input in a register
block separate from the temperature sensor. Describe it as its own
fan-controller node and keep the temperature sensor compatible.

Connect the EV23X71A fan to the controller and route its pins. Use a
25 kHz normal-polarity PWM for the board low-side FET. Set cooling
levels so the fan starts at full speed.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Split the fan controller from the temperature node.
- Add the EV23X71A fan child with board-specific PWM and cooling levels.

 arch/arm64/boot/dts/microchip/lan9691.dtsi         | 7 +++++++
 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index 52c22dd1a15d5..039c2014aa341 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -522,6 +522,13 @@ sgpio_out: gpio@1 {
 			};
 		};
 
+		fanctrl: fan-controller@e2010348 {
+			compatible = "microchip,lan9691-fan";
+			reg = <0xe2010348 0xc>;
+			clocks = <&fx100_clk>;
+			#pwm-cells = <2>;
+		};
+
 		tmon: hwmon@e2020100 {
 			compatible = "microchip,lan9691-temp", "microchip,sparx5-temp";
 			reg = <0xe2020100 0xc>;
diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
index abb21a8bace9e..3cbe5beebce1d 100644
--- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
+++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
@@ -775,9 +775,15 @@ port29: port@29 {
 	};
 };
 
-&tmon {
+&fanctrl {
 	pinctrl-0 = <&fan_pins>;
 	pinctrl-names = "default";
+
+	fan {
+		pwms = <&fanctrl 40000 0>;
+		cooling-levels = <0 128 192 255>;
+		#cooling-cells = <2>;
+	};
 };
 
 &usart0 {
-- 
2.56.0

