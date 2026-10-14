Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3438F51DAFF
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 13:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984211; cv=none; b=n7fHXkXkjiXfDJT83KuFxE40Apwve12gHYzmjPZ4OFzjtx+L2QxCjfIKfzMObZfmdyDrGFDm3pv/Zq30MUZ1E9tATMCt58erOITUJVW6ZH/5SFGvsIbQmKirvhlxbnGP6Ujf+o7xboSwPyTVFjQW6qQb0PkWOo2vRZ5XXJUgqEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984211; c=relaxed/simple;
	bh=vHlNApf1n0eU2OktVinpI4zv/MZunnjQ95s6jli1xzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j6pj1PBL0yYzrmejpaDz+gmzWspNmmmvXjyXWVYAJ2A7keoIr5aMW6qkB2Kt14R/cTLjZxGVakoJ21TihtH6yRtmtIAjW/p1k7Xwe2K93HEDNDOmgCcHiynPtQYGpXf/W0Y90BXgLhfRU9g975jRFu5cFtwZOKkAliZ482Aig+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSAuN/BQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSAuN/BQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so9792425e9.2
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 06:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791984206; x=1792589006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdTRy1oUzdTMPfJnHsa0F48c4vY6O6GHObHAbcTX0Q8=;
        b=eSAuN/BQJo2nCqQLjw+pMDp7TroyRIUh+tG2RNt+y5srWj/0zFtSD++KkSyhc02vvc
         mCKQjPKqgWZk0vdxuoncN3EZU6PNpLHRUfXKwQ9Y2DBSqiqnaw8wVgyStiEWcmOcM3NN
         hh08pFqprCRzonKlZ7QEuIcU8C0opY7TWJlBU1dgCTA54/A7KXRLPEQSwKIpNnTCNSi1
         NFw6wNNBHkwipQdDOWbgMd0qH93Q0tjg/9drwaY6u48xOTYlB/mgfxrSuksz6KzAbwal
         vsANlIkHCUO5p7SdGQ3MagGK2VyzuUBNcrVpf9amwnD6OjLxaguOfGKEfmsS7yuSIYVb
         8hyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984206; x=1792589006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jdTRy1oUzdTMPfJnHsa0F48c4vY6O6GHObHAbcTX0Q8=;
        b=vD+UBDdTmd9NRsNUXX4iEIF+bu8wEszejuISqFyFEluHcSuBuE/yANeG/7nxXsC09N
         Nm5ZzSKIIBZrKGoLMa5PwXeZBmtZnwnl28kdw2MQSZvIr8T2OHk8vf3nCh+mx1oWJlAr
         F+EBV7Q9yzSjk0T3Y2EcNQo73Y0C6KYTiMUMoU2by0IXzq91etMQeXzV4iCtsroMGdqB
         EA8UWNTVXbY1s8Ilh3Y6ZEBEETOKtWdDX3zoacIps+Ch56kt3fGJ1sueZdZJyZuwzflf
         rravDi1NiVKEzowCQ22etwzy+G4biSaGGD0+ALBeRW03RGfssLhbpIHEh6CZ1lTv2+b3
         TMnw==
X-Forwarded-Encrypted: i=1; AKwUvBx2jVJygvNTCKI0LouLbMKV4LOMDrrPpDKgvZb03GJb5kl+X6IVk5GNlOtODhtZ6Fy/E2NiOWoiRu9DdQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLL0Vd6226j36XgwYbJB1AsYNSMFg0QOAsPqqPZ4sY3kCwANC27
	VmIfL+IJ4yub585nq2h22+hnx4Upqgi6dS//WkunsqPI07KyMsBC760i
X-Gm-Gg: AYBFou2v4gCsb0BM0c19lI6UcPnpqfhcjEpEXZN8BF9WTpSU1EBTAlws4RrdfqYYYrE
	D2axo+S6n5ULtIdbVxKzSvbhvU0j/MHTDLq63/Xl6EmWGMtI3za2S+yknlkpl45ebb8CxatQkS8
	FSATsjB+6WWDUjzSgW6aDuhquoHKEQmmoGDjlWqPBdeL0hZEfp7E8ulZ9H+TtdQ81uXIjF5nt0y
	8oO3DcXvwLRlJ9r15aIXBhkBuycbvvR3HY7LD7CCmYQRQOlmnJQJ0I73d04iS48Q5EHsVvatuAw
	foeGQs9V1J5Ea33OwRlPv21O+R+f0hVCIiCMeiFIJXwA+k+PHcAQBlUa4StRaKhFACGhc9FfLa+
	ALRZfUpogF3EPoDAFkdb6k+xRbQFaZBCAVcffeGlaGPkKDCguhbNnNGkf9i5rGDuB8VAu+cwQQN
	CIq0P2oERL4V5ykHzN4XeJHYNFq/4blDW/uROHVC7TTzMs1U0f8emzfuRo90c8MdqBacGPkp6ly
	KFqJGP04XJ0/w==
X-Received: by 2002:a05:600c:5489:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4a18e4a5244mr306911845e9.8.1791984206139;
        Wed, 14 Oct 2026 06:23:26 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bcf69402sm782515e9.14.2026.10.14.06.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:23:25 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v6 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller
Date: Wed, 14 Oct 2026 15:23:15 +0200
Message-ID: <20261014132315.4659-4-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014132315.4659-1-okerixx@gmail.com>
References: <20261014132315.4659-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the Compal embedded controller on I2C at address 0x70. It
provides the board thermistors and the CPU fan speed, and drives the
keyboard backlight. Its interrupt line is TLMM gpio66, falling edge, for
which the file already carries a pin state.

That state leaves the pin without a bias. gpio66 has no external pull
and floats when the EC is not driving it, which shows up as a steady
stream of spurious edges; the vendor ACPI tables describe the same pin
as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts      | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
index 769f195c99d9..bc840fd8e458 100644
--- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
@@ -659,7 +659,15 @@ &i2c9 {
 
 	status = "okay";
 
-	/* EC @ 0x70, irq = TLMM 66 */
+	embedded-controller@70 {
+		compatible = "lenovo,yoga-slim7x-gen11-ec";
+		reg = <0x70>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &lpass_vamacro {
@@ -990,7 +998,7 @@ reset-n-pins {
 	ec_int_n_default: ec-int-n-state {
 		pins = "gpio66";
 		function = "gpio";
-		bias-disable;
+		bias-pull-up;
 	};
 
 	kybd_default: kybd-default-state {
-- 
2.55.0

