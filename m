Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792244AAC50
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 14:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002210; cv=none; b=NZoGewypRgNt4NNPdoUyOOPgxH8A/hE3XsewD/9O8bRImgRo9Er7YWJd5zPD9qa9r2l2tbAS4i+lvX97FmDRa9ScQ/JZk/JXiurP3gmSgbR/L2RruZfezsze2xdyMgVM2fL7jYQDl2DWSD0irKJG8X5Ad7wsxZAcg7fNqUH7dqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002210; c=relaxed/simple;
	bh=gQp5P6A4HKZPmr2RXt5nnsqu1turFNqjNRfQGzceh+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9xwUdekDyCIbE47QfCJ7BbGGPSGXbcm0YXtDdUMHoHTozl55iFbi2uFoW1fmao0Fb4WZPXaarWtgUbf/eLmm7K6WI8B7AGFTRTtkamPV3HWLBAzSt+ayRty9te7Jay/ZZV/Id7y5jydhzQvMRLb+DVrHKvlvas16SM1xoxRpIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1l6QMZl; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1l6QMZl"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso22632685e9.0
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 07:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790002206; x=1790607006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eycLZYI0OnWON4y4DQc42djuKTXBLKJTdaLEQ0NYzI=;
        b=M1l6QMZlJJ5OBCcXf03tRRdMPH1cHn9uWdZSCVQnYfrqzEOgMctZqG7bT9gpR3rnh/
         jWKVXR+egPc4mmsrnoDVGIEbdW62poaSZAijxmgZqqtNeKwsIZC70UcO9vJraAonk3up
         3SRQbPINez22DWc+3ooNL9bZvUpr7kchGr595QhalcUa8uuCCuTETJXypbksWa+2rY0j
         t5QIooTPHYEgAYxseUhv4+Nzs6T4eJ5rzizXJ8tniK6odNhzqTNjead5ZaGFoG4B+Y4w
         Dr+PC0kbnn4OT0NXTConNFNP5foW3E3Z1meDHyToimIFzejow5CItn6zqNzTTzEN6rzw
         8yHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002206; x=1790607006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/eycLZYI0OnWON4y4DQc42djuKTXBLKJTdaLEQ0NYzI=;
        b=J+03LP2DI1s0lX7jp8trrIJuuKeMaiCmPua4it1XSZfKCV3JiFiLKEuyMTtvaMlvuJ
         tRU2MdNAh7sIOMT+WCVtAJvE8keJGwgv/l/Ek0g/K/AV3R0QGWZV5L0VM++t60L0cRqO
         tuN5FrjqGAgTGwnmodWTfrCSh01N2qLu6+V4MrNU5L0glVXoTaWc9dAIRQMC3ukVtr0/
         Kf8oY3nJCp/5xkj3KHY4TNHt4Q64xF5tObNrI7u9YBbj0mCieRdExUgD3dv1C/HaOPEx
         0k8XKKygDrqJuHxwzu6SUjjaTM8Y9umVa7qklZ1biqG7pdoChgGIgEWiMJcpLEqz/IsV
         jdlA==
X-Forwarded-Encrypted: i=1; AKwUvBygEvEH6eGtm/QwHogwYcRSk7vXV42Jk13XLjTmA5UHYTyNc0PVmAB6x6Pbtxopazl1aGL7cnLtMvT/8g==@vger.kernel.org
X-Gm-Message-State: AFuF++lVlFyWjNPqNPa2Amud2Ul8JHRz1DtCH0DmceDP5SXYH6VJYGQD
	FjSzmX2uSSR5KUp8Km2lcm4D0OV+ERZ+9JZ4F5f23wovMqyQtLih0iIA
X-Gm-Gg: AYBFou3fKXCIt+9kNFJL0MEYqDEPzQTdZbwSr+doC0f+HZbc+wP1qM8M4txlyhJOuY0
	CyqVMkeLWPi5IO3JPqouIcEQiMjXXi6vWhTXBGWBy8IQos3f4HtPyokIgD7zm+AC3YM77yoCvrq
	OAAqN94TMvPOntHUfJa8xEIVXSnhMsQIJIcZqyAfI4t1I4qNYZ2wO27F1Q0vIhZLoGBsYaBp/wn
	gK2obAPsVlJPm084cLmsSd/sykJGni94C9dVSEWukDM6vA1AO7v3z40knPVKnp/vHuZN6PgM+U0
	BXTSNskzaj9JxIfOJ2Mc7Ag9/WLGSC4wpZitjrPtIgPsw3B8Ii6zwY3XA3DQaJzSTS7PqfhSTCn
	ouhjZN/jcAo1BXq+NdeK4Vg6IMlgsCJdDP7o1J4WQDKZqpi0CMULD28pKoZAkvSOZ/aYTaP+qo/
	/fMQU4Wlze0EM7TohbgMgGgNN6kjup73ZzaHdKU9w7nZ+c0JOAfmvIE6IVPTCkrvHOCBIAPFFcJ
	HTBHw3rQ80=
X-Received: by 2002:a05:600c:3e19:b0:49f:bd3c:bc1a with SMTP id 5b1f17b1804b1-49fc572f27fmr153111575e9.21.1790002205475;
        Mon, 21 Sep 2026 07:50:05 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fcd8bc15esm191595725e9.1.2026.09.21.07.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:50:05 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller
Date: Mon, 21 Sep 2026 16:49:53 +0200
Message-ID: <20260921144953.15113-4-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921144953.15113-1-okerixx@gmail.com>
References: <20260921144953.15113-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the Compal embedded controller on I2C at address 0x70. It
provides the board thermistors, the battery cell voltages and the CPU fan
speed, and drives the keyboard backlight. Its interrupt line is TLMM
gpio66, falling edge, for which the file already carries a pin state.

That state leaves the pin without a bias. gpio66 has no external pull
and floats when the EC is not driving it, which shows up as a steady
stream of spurious edges; the vendor ACPI tables describe the same pin
as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
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
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
-- 
2.55.0

