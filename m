Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413803;
	b=kX5TlUiKnHUCaew8J3IjuHe97J5pRvQND+/womXJ/O7e4GcrvaeSLRLB25LoBwLQ5LO0
	 Iv4zWA4bxBV7ST6T2ucvEknOHeEF+VU2urLXE85NWYmPCFv6tcUXyY+Ziqz1b35iU1cKA
	 UxXZfw7iXfmXHpzD4JbtVR5pL+621uwew/g6c2YtL3QX8WPpJ0akZTQV5ClFWdkQWWNgl
	 EF3r2XSCea5cv/tlnwHdd1ePppY277LNojBgwBvF4aeKIFVLnPlwmc1RkfNusE1pNMZ3A
	 6CW1UokldBzJm1bsmvtehQNb8yD8ab0j9TcMWexLkAfTB0yu2mpIgi8XjjYHPbjrGmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+dRaeVfgsyPtrbZOsuqy4B0zrN0QNLB0gPpKiOiCtw0=;
	b=IsnERveAnMCUiL5Is9DoIBmXsjhoSkY6mbbV3GBPd9SA1qnFnYNdgdYq0QdwYIHQ/Uxf
	 hl8GXc6xMcH9YjR73kN0TWOhB0v+VwtlVh7UJp7MXcIeW931c8VmNC5INBG4JvcWRGaj4
	 NJrmvzbpTvyFmLY6N/Y3skP1CniVZlhuaRQKXk3M8aPVkhszPO//JreBjnCXevRm8V5OU
	 u2yLaIyx8Ji+8aMDxAvgpeaWk+rvCjPCi3t5UngwlFKH/QqilAhaI5EDYdWrzjB6mrX13
	 WdMJnGHMy7oS41bwzhqj2WxYcsq9YIGUeIx/kuKtmX8E1qBjsXEsdFxHO8h4p1NJJOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b="CVimmv9/";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C0F606A8A3
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 16:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26C0F606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=CVimmv9/
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so2247985f8f.3
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 08:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794413801; x=1795018601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dRaeVfgsyPtrbZOsuqy4B0zrN0QNLB0gPpKiOiCtw0=;
        b=CVimmv9/YyZU6AJwXGaip7fVyORgOVY9vHCD0+v9Wsq2yB1Mgho/tn/ThCTYFKNijG
         oV0p33U2a1daomR19trtTfpeUBCWvFTNi4+juWIcEu4kjy3hQ9AurAVAfbuEBQh0qie/
         3g0dDnORCF42d1HF4U+O4bx10ZDDeqbDtc/+bNWE68IhE2Dw1dB90XPgmcbClpwLelqw
         se75rKSVFNADxNyHo4nwo2YKPPUlO+TizaKYzva+wrIt2vlopEERzC2WC/Aw3fVFU8v2
         f5ctqoTruT+DUYX7023GtjqCUtLnlcE4np1oDxg3RJpbzwn9cw5iwvdZ6MdDjer2XkYF
         afYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413801; x=1795018601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dRaeVfgsyPtrbZOsuqy4B0zrN0QNLB0gPpKiOiCtw0=;
        b=QmGonLWn5/Xx6kbSRPOf4v+QTxLucIaimIMLMxPdzYulpMPfIdplMAq+scPxv4ozk7
         8xThhzzTrX1oekPUaMiP4nRYx2t4s4eS41vRIJyGvs4gRd8jC3o75U0dLzxf1nGaqPrx
         XnaRPj6xCawuAm9Z7oef+8zHG7br6B3XbjTOq295HquRsjZkySLWS3YBjtlDlZDUOH6p
         3Dh+a9CDknnQNYdZps77Cq/xj+Sf+/mbAOpDbvjfunEq65CG4RiIOomWq8YEn6rOcuvf
         LGar9loSZYOo1vPvFfsX5DSZbHlTSN9OvUh54v8X/j7bDh0e+oqUiPh/bx0Rc88wAvvO
         rc6Q==
X-Forwarded-Encrypted: i=1; AL+hErFjyOSvcqlzl04LskvsRLD7m1edb4tkkArCRXApDs+OyL0vxIxDfzILpwuSTLr2KGZQF2xLjeft3a6QsA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9AZqsjAQhNJhFEy0kPTGoAV/uaYNRYL2zgTvaUqmy3J8aB9E08
	opHfVzuNz9OrBTzn4oYLWRyqnNCfjZyc2pbq6Yj95hi3ukQk8WU1ZtpuuvMTjaqjZhs=
X-Gm-Gg: AYBFou1uqj0hPVMcXoITe5Ym6K1Mlxkggbah2MZ4a5C1bGv6jLqN/CI7EnVWfHe8sXr
	38qwGB9i1ksQ3FHVbw6vPQ4QV8DwYlGfhL3/ukVpDeKlt9FveJgOSEzK1e4HcLTSe2OfzcLycNh
	VSTN+gZz6ST0BVeoBB9MVniaHMmnQRPqJXGpfl1ga+qMSxk6k36TqIc+mK4oF4L2W4uzsdfnGMS
	jcjvYeD64HzAntC5xY+Y7a/+m62FR3KOMxtrmsFLK//zMGnSfZ9EHBU6bzH/VBsHzgy1k7V34X6
	KK/qlo3KIphP2Hc4+zutEjnj8VSIVw4ktW5lfCnt4s2EBSd3U4y2hGuwlI9fx6N3RTEKiOWy8Q9
	NJ4pMAAjaKhahOrm8f1+lzsGr4HYZNLUYZcf7Z6DXQNvYlRzSvkZacqSKj+tCPB51zjFWg/dPvB
	84WQlYVqyWuI0012Z5/qF8iRckwGMYYhdayqy6Y1NY1ynZHMmDIRrLjgy/CeV9hojVIdAE2ry1w
	8/KgDpztgWgih7XzrDQJoEu1FLniO3USl2aQNV5hcsvJdlpAUuAi4aD4tfmmAcAksufQZb3HxiW
	pDQtjA+knaoyuuaCzPx74sJfnHsFY2eMU70MtGsovBkatKKgObK2LmoXiKYfvPFPd8+5t/uZBqp
	25HjuKqQj6ujpFuVU4usvmnL3RgrNkXDILrUYL21I1RtmuO7R+/O6C+pd2r6f7HQewaTUZsxw5t
	PJZ88plsSI3obQI2QgIWN9PODFQyIL9HuSPcMynKN8+glF
X-Received: by 2002:a05:600c:1986:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4ba09379b69mr50759305e9.8.1794413801590;
        Wed, 11 Nov 2026 08:16:41 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-240.globalnet.hr. [213.149.36.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fd01sm8374925e9.4.2026.11.11.08.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:39 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 4/4] arm64: dts: microchip: lan969x: add fan controller
Date: Wed, 11 Nov 2026 17:12:48 +0100
Message-ID: <20261111161619.232141-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111161619.232141-1-robert.marko@sartura.hr>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
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
Changes in v3:
- No DTS changes; renumber from 6/6 to 4/4.

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

