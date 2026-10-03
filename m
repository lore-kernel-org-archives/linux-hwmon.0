Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE67544A3F5
	for <linux-hwmon@vger.kernel.org>; Sat,  3 Oct 2026 20:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058926; cv=none; b=SXu/8CfzmSzDfT0KI3UswCHfLHxxxWszoaIvUWjie4EA78E/JFxSy5yXKzjS0mrEk73OPP/ii5ixrbfKG463ZVird7SvhYilCiyxEYW6pMNDFWo6KlSjqUKBbR8AcxKhodEoSWUm+f+UzuMkvb6shevVSdch7cIgVhPh2qKW2vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058926; c=relaxed/simple;
	bh=vHlNApf1n0eU2OktVinpI4zv/MZunnjQ95s6jli1xzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E3HG3392uRL/xK1XVddXmDcyNlaWU9xuHVO7L56b7zI3jhFNsnJmjs1x4o4VmH6x8IUDteSpK71mfir4Fredo1Yg3hb4/sKZBsT6Bh5zNk90/HXk5JAVwQWZIkLgO2E3Ry5XV0a84D3IEpTEeJHbQhxtTxVK0SkU0elOhX2F8Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9CpxOpQ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9CpxOpQ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso6766785e9.3
        for <linux-hwmon@vger.kernel.org>; Sat, 03 Oct 2026 13:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791058919; x=1791663719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdTRy1oUzdTMPfJnHsa0F48c4vY6O6GHObHAbcTX0Q8=;
        b=E9CpxOpQvqdDyv5L3mchbAdOH00kUUYB8lcQJjG10gcp6tkpDTJacm0DgQWTRhLV0T
         tAwTjRZwqcREb4depS7jx7wRB8pupFAd5/eWZlx+d1KO2N1OzFJk7d07pG36kIMRg3cw
         MWFmEjYqSCc343DZ+IlEeGeifBDF7hKrk+hKO01txOXbMwydszp98Fcm052sbI6I4WXd
         5UPZpXJRrm3S+XbzfdIGMSBuneyVb+5VXYi3rF+RBqdaRkJoVyEGifmF2Z67N/hq0UbE
         33V4fUhOJlJAcxcL6qVPi9UUPtZECO/DS03hKW0gfQQrtCzcNfiHnOGjqJNLq5Hy6t5x
         KvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791058919; x=1791663719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jdTRy1oUzdTMPfJnHsa0F48c4vY6O6GHObHAbcTX0Q8=;
        b=iMYM3YxugFWiog1aQgdby4AIZ93zW1vRuuJ6ddZ0N6Tz+nDDDJKRxsO6Yfv6l6I/3m
         ncD7E7kdL0gNUQMbhR3ABEt0RYS20aWJwDWdSUwet4dNLLcF3czJcJAxygvmSvoIj9gZ
         lY0Y1Qp5ESQ/6ZvU3KocfhjZbu/LtqrtmcUXSbXuwgO2171lM4Ioi6f16N4L+0r0rPvZ
         6bJd1/a3Klqi+LCA1ksMEn2RLw8YJUWWkkdRxsRUgQKUfYpy14iHmPwhG1IDSsJWXWzd
         sh7iFC+E6lHsEKa0W4LIOCzjt+KsItB7kt+SLZRw6pxJHVdX4Go61+AvKrC6yzdlqWSk
         Q6XQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9Cx6lNGsjFFU+MeAK7QD0bi38qHin3cIalvYxqLWPA6BEHotWLLDvrp7b6r2HyTzwtJr7XolptQISIg==@vger.kernel.org
X-Gm-Message-State: AFuF++mJZ8JNilnuTdSjHG+iSOTheWn76Iy6/rj0UyUT6291xRFClmKL
	dQ6cHm/DAjuwQzKJHzXco/GXHq870kQNpqoC1nyMYRy/Jv+/MQgPtLC+
X-Gm-Gg: AYBFou1ikzIu4EbPUZMMkXEJUgYhFut+oVuTjh4hjSW7sOYpytK6I4QALQbNyz/qpoc
	PZgoaN4KGOryM7zBSV+8BH4QdNeVQnwOw00zIC6P5jSp5O75gaebfqNdZKm2B4pfdbddc5ajQk2
	qSpapi9xSLxuKJIye+S1obGHGVbqduOnR0BqREFkiauBL5Lf09bsL31HaFnmBv/IsIXQG+/7nP1
	W4rcr5z4H2UqA+HMYziU/I8Q8tGHH5PVctTI4/FRCiRVoBiUY4HBsgYlzPk7LJHtRY4yH3Ci2RW
	Lxp5xppIH8nqRrMmQPPch9+d/NVPjVK6G+bOYtY2XKuyv+cd8REufuQIYylFZ+GzfqVO/UOqvJl
	bPVMCl3PvSZlneVvpxkmokuZ8DMkcYfn9ARZw5nz+Amzq8Jxm69U61BBNSQJbFFE5xCoIDrBclv
	p5Wdv4zbQ0prG+7Q8W4LAXuEn3YuZY+7C0U5fpahwRE9b30redJz12JK8iypbPyztJjvQiaR2Eh
	wzYhw==
X-Received: by 2002:a05:600c:608d:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a02750fa51mr115371465e9.4.1791058918814;
        Sat, 03 Oct 2026 13:21:58 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48b380facfesm15083316f8f.23.2026.10.03.13.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 13:21:58 -0700 (PDT)
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
	linux-hwmon@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v5 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller
Date: Sat,  3 Oct 2026 22:21:43 +0200
Message-ID: <20261003202143.4697-4-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003202143.4697-1-okerixx@gmail.com>
References: <20261003202143.4697-1-okerixx@gmail.com>
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

