Received: from mta0.migadu.com (out-92.mta0.migadu.com [91.218.175.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297A340DB51
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 08:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374036; cv=none; b=Y2B28e/CwU7Cj3+0kQCEHAbd3UqTNbTjeDByXFy6A+KQu8ntJieMj5LLLIhGrTklM6Q90dqnjTgfz/gz9Ydu7MHfLi/5FbpJH0mUS6UXDvO+dM8x8lL54VxsQ3TXeurYhd/EapJaF+OS/mO5Ruvv2C3UXASXwJsj8aMPPjfdZ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374036; c=relaxed/simple;
	bh=+88ROtLrCstIdLndNiAde/JzZl0qUsawtPJuqfY6oGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 In-Reply-To:References; b=VDgvcwPEwbO2ue+As/cpfTzqeVitm2ZhViGhJXAV9P6qynzRIxxvs9IvjvZdqAvJO5oD6y4c0EfhExgr2/wW5fkkK9dHSj8q8rJOCAv7DzTppSoYCc2xRLu53YuXyFIiRRJ76JuKhzyT/A9WQGcDPJN4OKGL10QeVjYOeSPg7ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cyHlnfdM; arc=none smtp.client-ip=91.218.175.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cyHlnfdM"
X-Envelope-To: linux-hwmon@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+88ROtLrCstIdLndNiAde/JzZl0qUsawtPJuqfY6oGs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789374032; v=1; x=1789978832;
 b=cyHlnfdMRNSlRtZvnv7GekeN1F7Ww265QlaZ1Rbm7H/cM64WGaTrF52ivdUjX7w3jM5NfCs8
 6ffayg7JqFoc4UMKpbyTdpZGYgrUmCth9Tf09CZblMVJKVzwvFfT2WVIm5Nw+MbFLT4vxkj0a0A
 cmVMOsCt3oEwxvtthYykf6Kc=
X-Envelope-To: linux-hwmon@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id efc6a5f5c4e9eadc;
	Mon, 14 Sep 2026 08:20:31 +0000
X-Mizu-Trace-ID: efc6a5f5c4e9eadc
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 14 Sep 2026 16:18:06 +0800
Subject: [PATCH v5 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ctl2301-v5-6-522def70acb4@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
In-Reply-To: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=+88ROtLrCstIdLndNiAde/JzZl0qUsawtPJuqfY6oGs=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnL1x77WOvBI3yosrjbVvL49Q1N3uEV8cuvJmz80XtvQ
 fTnvJcNHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABPZ9Y/hn3GrUaRJ5VfZdfM6
 W9jDEo+E94n/C9T3iD1f9uYKJ6vxVYb/TsXd7haJBzv06mc+3Na87Mb/hVNuusYbPivJ7au4qPG
 ZHQA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1

Enable I2C6 on the K3 CoM260 module and describe the Sensylink
CTF2301 temperature sensor and fan controller at address 0x4c.

Override the I2C6 pin power source at board level because the IO rail
voltage is board-specific.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index 37627963a6492..92dea86397798 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -58,6 +58,23 @@ serial-number {
 	};
 };
 
+&i2c6_1_cfg {
+	i2c6-1-pins {
+		power-source = <3300>;
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

