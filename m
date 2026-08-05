Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EEA3F44C8
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785921996; cv=none; b=qZR8eQApH3M9HZSHc5pnQFROPh8wzZHcyb4xwBPSAZpZwNFppaZWKzZZKv2sBjZR+TG9E6FCsQqWhJue0lEACb07eH1/Lcq978ggjA4kFOflefj/edQWCUx/VWgRNUrsnrUAvcufxbTN7jVifD+Dd0KkoFmj1tKAyyiqCtAO3EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785921996; c=relaxed/simple;
	bh=qkSmO+AW5LxoIXLT9GpKbrSpSAJky3A3GfHMGrIZGak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 In-Reply-To:References; b=bQsz84gFj41PQ5IiOyO7xl5gPnBaM9BA65tNVj2HgsKZfAUewgL6KZsNr1bXqbAcO97SDT0FBa7bvrVjdpzKqLfyVqHJqsbKSEjYhF9RTaqehWjiKAXNdjevTT1ojuaVGTvMjXZXKCnOYLPv5epmhkyjEKSUOuXfJiitO1fd8/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JLV2tluV; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JLV2tluV"
X-Mailbox-Line: From troy.mitchell@linux.dev  Wed Aug  5 02:03:29 2026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785921992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MLkmEy2Qv+au8QUwUsCORU0DDXMr6v1e63PHv69jpg4=;
	b=JLV2tluVrP6L0K5Jqph3/Gm/ExTCIV44fuCHhLO6HNBThduiWBloGup1CWZZLBRMR4Tg7M
	XW7X7+DyCyR4zqYr1++Sw5BfHZIqckZKMmoSpKuKiGYGyQjUkh79l4IEeKsTDQnhm7sdNA
	zldW6xzW+GK4+pK0nl6yc2yVLmL+UzA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Wed, 05 Aug 2026 02:00:56 -0700
Subject: [PATCH v3 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-ctl2301-v3-6-b86c75d1c552@linux.dev>
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
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlFv0/xi1+72ZxzvK+hfKn9jQixffu/FCqt9bfYfWpb2
 Syn7cpMHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABOp5mRkmKCxsWlS90G2GNMP
 e+W1Ps39ciVb1lz9/3PttjfGQVuPpDH895CwkJwi7+Zj3Jp5bG/Wf/v3z1auFtutkuLfluZm+nQ
 ZHwA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
In-Reply-To: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
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

