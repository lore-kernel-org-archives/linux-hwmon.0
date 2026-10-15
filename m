Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB4B49E137;
	Thu, 15 Oct 2026 08:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054556; cv=none; b=VXV+Coe0HSptYvAyfvRNWBw8fGeR/7Nho/OczUQbXS8rhM+DfXdeneo2EWJvveAdJ8FYDJdq5Dtqb18XhCcu/RgmlbbfjVcjYMwh2nSfvFIBFwyqg3qdvfplx1NTsYd+b1i1UgMeAgumX8eA1CuF2uoC8jS/xtLtc8LMhKL/C70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054556; c=relaxed/simple;
	bh=1axmsHn5SP7qGaALJYUsZfK56yQKb1sDPPLeFFYRJnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YlKFuWzhLBrtUpbFhJ78kUThCzYmNjRc7c+hVv9OBY0G3MM3fQfwhKNoYVHBkFGrYEGuAHOQt+B592vqF8UP/eyLsmVThG7u62xrKgFh/b7rIyJt6hRTBtPL2ub4F1XruDxFzHjer7gMubA3Cu4yjfqcvUosFHya6V6fU/3xips=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DsSof7Y5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsSof7Y5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38AE91F000C5;
	Thu, 15 Oct 2026 08:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792054554;
	bh=FNRbfd1fnoRFIc/mst0HM1dzH2lHwK+FZAjzL6dP4iA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DsSof7Y5X1QNCyX2C3F6bjGMl3h3T/amwV2r+V/Wp7IemeIu8cg8jJMWU/eCcf0NC
	 opcq0rJzGgEWeGFN8koi1eHVbDrKuZsb8GpP+bBQYOej6tWkDzwMS7oFnCK5WkwnVG
	 8FYuwIm5C9jYPyY/+b8gQjSp+222swxINX5iZ5RN3ykaOo3QGUlgfqihuAzWyYiM9c
	 z6G7H+uHY3EhRgD4nY0zGg6SkGhMHc9PN7q4iv60jvJ3TBY4/TUfKW/YVyNUWzZnlH
	 8cK/K0vwZX3zOiDWy9CwQzXP1tbFV0rByP/Qc+CeV50kMKv+RP1js34Hdep+m5c96E
	 qWAf4n5urUAFw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 15 Oct 2026 10:55:32 +0200
Subject: [PATCH v4 4/4] arm64: dts: qcom: glymur-zenbook-a14: Add Embedded
 Controller
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-topic-asus_ec-v4-4-af6305ffcb10@oss.qualcomm.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
In-Reply-To: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792054531; l=1574;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=cFTEpTGOGmdsguODZ+j+dhSSfpzZWRzdDHTl/sSRn+E=;
 b=cHZsduVdC5JYe2QfQNucPntGiWNmQEvwJcQqc1RdXfgfVBBYpblAqeDx09gvYwwqKudrw5hhE
 BwyEeBW119EDkZG6A7NRMbbSrwlD7W5r61m6sUZwv3wvvx9FOVibeyE
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Glymur-based Zenbook A14 features an Embedded Controller running
custom ASUS firmware (which is loosely based on the reference Qualcomm
Hamoa EC one with a lot of modifications). It provides keyboard
backlight control, additional temperature sensor readouts, fan speed
monitoring and a number of miscellaneous functions.

Describe it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts  | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
index e96e65a0c5b4..6e7205c29f50 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
@@ -588,6 +588,26 @@ touchscreen@15 {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@76 {
+		compatible = "asus,zenbook-a14-ux3407na-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+
+		#thermal-sensor-cells = <1>;
+
+		wakeup-source;
+	};
+};
+
 &i2c10 {
 	clock-frequency = <400000>;
 
@@ -889,6 +909,12 @@ int-pins {
 		};
 	};
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";

-- 
2.56.0

