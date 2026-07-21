Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED88446C0B
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 09:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627401; cv=none; b=DwhyTurA8dhZWUdadfGaGCBzEdVdGz2rHq/8Mhns77jSbmlAeKDzc35XcvNnrlBEFMxa004y6KFde1Jzs6I3F61r9Uwq0H+FxuUNk4Blmg9NEKVZRec5fvtAVXsvXiEAyhQVbcIBN5IJoVtuidHyyTkEbJVTHXdu6KWkGFYmfYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627401; c=relaxed/simple;
	bh=qkSmO+AW5LxoIXLT9GpKbrSpSAJky3A3GfHMGrIZGak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l/oyKqWUOJIQnEPQGSQagnHBa2K4ZtgEgOSyl59T49ciQHih+kIB0bwz7oILusyYQQX2mXvtluiNQgHsLnolAYfk2xGU/M+tVjzUntoshwqA9euPFJhEIOxvLtwIMYSLnvau7HCOsecYsCMGlkzNA/RZ9/hYMGpEpaSHymLG69Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=R8MqBTQV; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="R8MqBTQV"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784627397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MLkmEy2Qv+au8QUwUsCORU0DDXMr6v1e63PHv69jpg4=;
	b=R8MqBTQV/VZCzIfaOmSDgHRXhiqrHc3ynsukEZgGcJfd1sqZjb5D8RXUmliHBdvj//vF05
	vClkgHYF6FtD49ZCH47V0QfWXgssJ/HRj2b5J6wC0k6BnHnm9PSI9AaznNDWVvtiUbwZQa
	Cml++9LwzlGZTIlxBG45ALi+u/L6WSs=
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Tue, 21 Jul 2026 02:48:32 -0700
Subject: [PATCH v2 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-ctl2301-v2-6-ef5fb342872a@linux.dev>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
In-Reply-To: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=qkSmO+AW5LxoIXLT9GpKbrSpSAJky3A3GfHMGrIZGak=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnxDmXnMj4uePKr43+v4L+PZxbemrtdYnHV45WfLxRyh
 7bVGQpUdZSyMIhxMciKKbJ0P+DZVuATZVsgUOgLM4eVCWQIAxenAExEJJHhn0HspsyvM86rMvC0
 6hQv4V1YsSXt1Pm5Hvvkri/8ue6IwTFGhr29HE9XTF/KyjbtdZ/KtojGVfscbr94c3/+vetOH+4
 8F+cHAA==
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-Migadu-Flow: FLOW_OUT

Enable I2C6 on the K3 CoM260 module and describe the Sensylink
CTF2301 temperature sensor and fan controller at address 0x4c.

Set the I2C6 pin power source in the board-level pinctrl node
because the IO rail voltage is board-specific.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index a38d7b738258..95a60fbb411f 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -26,6 +26,25 @@ reg_5v_sys: regulator-5v-sys {
 	};
 };
 
+&pinctrl {
+	i2c6-1-cfg {
+		i2c6-1-pins {
+			power-source = <3300>;
+		};
+	};
+};
+
+&i2c6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c6_1_cfg>;
+	status = "okay";
+
+	temperature-sensor@4c {
+		compatible = "sensylink,ctf2301";
+		reg = <0x4c>;
+	};
+};
+
 &i2c8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;

-- 
2.55.0

