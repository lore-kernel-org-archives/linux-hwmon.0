Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CE14E2F1E;
	Thu, 15 Oct 2026 08:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054551; cv=none; b=ora65fw6D6kINMVKkT80KGEOO7PDPBhsF6URPywwgHmAo1WG0+zW8ZYihCzcOzRUEmEZOgcQcFoeHz1n7NqF+nsMfhQgkXSh4iKy0ImYmuYA8iYRSn+6PQpoEC2Of2k0eUdllKA6uwn4ijA/J8OnvAme76Y5BqyukazXvVDcUpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054551; c=relaxed/simple;
	bh=33LhKKvb3oGlN81qdNH6vFta3ThI09YW/8Ch+36vhYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ucevzf+mUcydotufJhkF5/vwEsi2JFuDoFyCRDimXy3W7o/QQVqViwj8ZQYj0GsIfOe8WhlGHI7bhCHOnTBeu9LxThPcVdZPHe3vjteNnFV+A73tQillWTcsz8dGXegV6IxASOANsLiVeVd3PgflBJmueflhJ9ZIH/3MyEmHklE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y223MDQ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y223MDQ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0A21F000C4;
	Thu, 15 Oct 2026 08:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792054549;
	bh=oG+LpD1SOmYgQmrb6+UNRP0SJ4xRktOMRQszem7xBrQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Y223MDQ+n8SYcwoqnEK/u4t2JXp2o5MlE7UHoprsZJhb5LByozu2y5eL4j8UBWtfK
	 hxjcH+lgVJxj+GYRg0BF8dvSH/R7aQEhh11wt6i3cvV1VZzHB5sjLTqDVVLZ3H8nZA
	 zWHZZir+LxvP5VByg2Nyynm4ZzGHaJJtPYcNZxXocRMkR3STfpZmyK3ge24j2JAugg
	 sy+UC1kKndyskKO61BugMj6eKCh1b0s2SrSCl2YALkeqQm0j+BqFS/QbKIrXhmSN4N
	 czzn64gxWzK8SGUTr3qnqgexsWVeXA/b5e0wefLJll6SuI5osClyZQGESUymoTKmvl
	 PclyBl5FUKw6Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 15 Oct 2026 10:55:31 +0200
Subject: [PATCH v4 3/4] arm64: dts: qcom: glymur-zenbook-a16: Add Embedded
 Controller
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-topic-asus_ec-v4-3-af6305ffcb10@oss.qualcomm.com>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792054531; l=1353;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=OGZzuyDvCxbgGsO+jysfzR+Kr4Q218/wRY3KaNckd4o=;
 b=knc9DRz4PCZg7UwAoJPEP271tHu4FPiX9xtjcEldAvQDN01r3uTnCCKztaan6JMaV7TZ5817L
 MHWUqFn8ijtDrYDvtoEkwvT6sioqYQpDdo2V8LsxxD+bZZZGs/TurRc
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Glymur-based Zenbook A16 features an Embedded Controller running
custom ASUS firmware (which is loosely based on the reference Qualcomm
Hamoa EC one with a lot of modifications). It provides keyboard
backlight control, additional temperature sensor readouts, fan speed
monitoring and a number of miscellaneous functions.

Describe it.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts    | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index 95da35125d75..7f073dfea8d4 100644
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
2.56.0

