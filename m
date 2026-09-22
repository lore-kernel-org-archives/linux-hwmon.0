Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD834D7D25;
	Tue, 22 Sep 2026 09:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069645; cv=none; b=dE3hyqpf9nSOSJzk2IAz08c6ayZE2yS4r6dEK/VPgfyVvpXpNwrfoTFA749KEVer9Ag8zqZaPxeMKF7Fs1yVfBcbgUMikr1odK6Yhz2Dmzs6Y/Rp8BSeQC+oPd51StI8j+V2MiKFvpg3QcF2FS2EMRDTZCWfRqNhJVYLQDjjCeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069645; c=relaxed/simple;
	bh=T9i1ckYRk2YlQMM+01DQqtuhKwnhsccYfgUtXSGlVYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QuMQbZak9hol+rhtv1ATObxlh1/PkgJcY+PBt5FfXmW63dtc1x8cBSCVoKSu0Ln5A5o2b5PmgP8jAwbT+eUE/05nge3CO9khvrnqFlu4tNvZ2nrvRecUFpF3E613qx2EsW8QSYyrBS1NJfKVkD9ErhyJITQDdmWJJrA3JExtrkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSspuHup; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSspuHup"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696531F000FF;
	Tue, 22 Sep 2026 09:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069642;
	bh=G3AVsveDPuirxTcml86dPOKs9u+YlTr6p114pcgfNow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bSspuHupgQv7U9+sx6SPKwWsVpuQUL7rMZWW+YNw8Sq7CuaJAE7sc74t3nW7/qhdN
	 nzZdUW9gsnrTXSZdqpM0a3lIBqtLRNcSjpMPiNIISf9t4iPE+nVFQchp580iWNgmUU
	 GlSe9fdd4lx+LHqjSHy4pB9iuh4br++NLknm8oQOtlXDLTmS2mGEYvCnFo4hLaKqsG
	 wN5sm58UCdJkJ+AN8fTbqFJ6oXFChW8hD0y1pCEXPEKU5xD3upNkQIq1N2o1fek2KY
	 nDvksXyqOguw+oNr1sRzVwV8Umo89NoV+oufRGF9o/M62dXD95o9CMFeeOjdxMIVZ6
	 kiDcroqmrvZqA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 22 Sep 2026 11:33:38 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: glymur-zenbook-a16: Add Embedded
 Controller
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-topic-asus_ec-v2-3-0bd923d1b853@oss.qualcomm.com>
References: <20260922-topic-asus_ec-v2-0-0bd923d1b853@oss.qualcomm.com>
In-Reply-To: <20260922-topic-asus_ec-v2-0-0bd923d1b853@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790069623; l=1300;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=gP2ng+fwF0KAFGYtvh0+uoYCls2pmDASz/fi26pCJM0=;
 b=gXT1GQ0NskTFQu6P+G7JUBD40U6NI5QlW7GrqFIP1SFCZE6MTobJh4tmdeuJ1/jRYirWb7S/l
 cxnfor9Jph+CmjgXTsfw3Hem0h/YcdaRpLr7Q+YVVuofERcvjMLQr5e
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

