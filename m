Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FEE489892;
	Thu, 17 Sep 2026 10:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642541; cv=none; b=iDEXfbp31UwZ9Um9DruvUhnV9GITEGpUZDeni6asrd7z0b9azDYS9gRFnQYBbzKq2YMTtnNW9Mz8xPxI7pfybLhWWY7lZuW+QFWjR9v6dEJketzBpkCPLXa+wJKZ95rrMcZRCefALuYPt735UZenYYjwT9zg9hfMwq4auVFYQVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642541; c=relaxed/simple;
	bh=T9i1ckYRk2YlQMM+01DQqtuhKwnhsccYfgUtXSGlVYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U1s7sLLYxl9vw1tv59oUEHjuHz3Pva8lDyuw+YegH+UlfOFMbBdrD7/RFuOKEgA1fN8s04HgAq0Cs1fGfeJxCkNLjMWiEVP3W/4k8XMGLQuXJg2B8QECpt4LL9oc9o8CM7bxTTHs6Tioo54TQVOr40EfebVGQEVvsABtCbVcmh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcmK2vCq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcmK2vCq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 684711F00899;
	Thu, 17 Sep 2026 10:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789642524;
	bh=G3AVsveDPuirxTcml86dPOKs9u+YlTr6p114pcgfNow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WcmK2vCqBSys9dQ4joeOpE4ZrA2GeCXPc70HGEScKarkTXo0uOHiUJYCF9ISI3LJf
	 29Puwe4a67E0i7krv9oWeLZp0I4iIyOityuyG9PKBhABN5DNfRQ1sds7ZZ/8ycd4oM
	 xxUswNWVA58eneqU/6Y4epKybWJPpG1NDQUsyEHtmykUbonq3X0coYFAQjWX7smQF8
	 8Yb5SLIvLEy2zv53L3wbsIObYeOfIG2ESq85X052LZgBHv9uqOsylk41gA3erDPNj6
	 leGOuUYeZLCSzm7cfDHBj/Y1A/MIhRu9xAhRLThXGs+Mj3fyGe8vSyg558xoLqGvXE
	 HZSykZ2GdQGtQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 17 Sep 2026 12:54:58 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: glymur-zenbook-a16: Add Embedded
 Controller
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-topic-asus_ec-v1-3-373516d347ae@oss.qualcomm.com>
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
In-Reply-To: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789642507; l=1300;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=gP2ng+fwF0KAFGYtvh0+uoYCls2pmDASz/fi26pCJM0=;
 b=QEVMa/Eq4GUx+Gn6BsX6KMg+hH4qTbJs7sEBZb9YrLlM1+aUMQsyzL38dT1cL2yEa9ZNZ5/qj
 M6E4Q9HSIR7DC03hmVHtblHl7xhyEa5kgtXeLQeoEbh6vHxB7mCU6+R
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Glymur-based Zenbook A16 features an Embedded Controller running
custom ASUS firmware (which is loosely based on the reference Qualcomm
Hamoa EC one with a lot of modifications). It provides keyboard
backlight control, additional temperature sensor readouts, fan speed
monitoring and a number of miscellaneous functions.

Describe it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts    | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index 40433dc2d6cf..d3356fcd25f0 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -670,8 +670,19 @@ &i2c9 {
 
 	status = "okay";
 
-	/* EC subdevice @ 0x5b */
-	/* EC @ 0x76 */
+	embedded-controller@76 {
+		compatible = "asus,zenbook-a16-ux3607oa-ec";
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
 };
 
 &i2c10 {

-- 
2.55.0

