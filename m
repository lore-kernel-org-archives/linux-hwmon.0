Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BC04E56C4;
	Thu, 17 Sep 2026 11:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646373; cv=none; b=U5y0adUL6Q0E7q57NdAzy2a4Z3wf7qn+pay1gzpV5wJKgOGRnWzJ/rerkkAxCQXFJUepEYbBJWA+uO5kJA8Z7AZxyx/XxspPmbHzKkvK0tQ+f8enAbAQUaIOUyEz1GyMynvl7DpeaPbUhM6dgAGBbldk9tO2TdIq+hc/XmYY4z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646373; c=relaxed/simple;
	bh=gUkQ+9IGUGG1i4SnzJhYF9d8+2RaoXLErEXCtwLWoQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XMkmVbF8PT3sc6DhK/g8Ek1CAqpHEq8wHHYmWS8J+xrURO1H3Ki25ltNNATs6H+Nv47rACgw0rtxf0aUF13DuK4Yecgdl0YbEobaMY1FDpA8oEVk6Fhm/wjyL0dW/RIUK8HWDVtJyLDTknIk81vMYLE/1/INQwAwC3B5RdtnUyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NPyzQKNH; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NPyzQKNH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=a9
	Hpv1AbfVJns/FHuM8559htjAcFjZ3OJ+nD3pxVXaA=; b=NPyzQKNHVKpmq3WyOd
	SIHqPpMSkJ4HJi20l11XGE5APPd3WMbblOEh2it7xsju7nVKOi5UPBHjIBo6dwFS
	ntDDLoxf4l1Bk9ZU7l/He6BjoNDbEe8w1qmutRac3ZSLu41zkVhOKkELNDUBVPxM
	AYfSLr3EHUTrtAK9e6ikRmglM=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAH7aTa1atqD7D0BA--.50575S3;
	Thu, 17 Sep 2026 19:58:20 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Quchaosheng <quchaosheng000406@163.com>
Subject: [PATCH 2/2] dt-bindings: arm: vexpress: drop the obsolete hwmon and regulator text files
Date: Thu, 17 Sep 2026 19:58:18 +0800
Message-ID: <20260917115818.540344-2-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAH7aTa1atqD7D0BA--.50575S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw4fXr13GFyftr1fZryrZwb_yoWruFWkpF
	43Zrn7CF48JFyxJ3y5t3WIkw45Xr15C392kr1DArW8Xa15Aasxtrnakr1rAFyUArWkJayU
	trWUur1rtF17Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pE_HUJUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbDABwyp2qr1dwYNwAA3u

Documentation/devicetree/bindings/hwmon/vexpress.txt describes the
arm,vexpress-volt, -amp, -temp, -power and -energy sensors, and
Documentation/devicetree/bindings/regulator/vexpress.txt describes the
arm,vexpress-volt regulator.

Both restate what arm/vexpress-config.yaml already documents: the same
compatibles, the arm,vexpress-sysreg,func property and the label property.
The regulator node refers to regulator.yaml, which covers the generic
regulator properties the second file lists, and all 13 in-tree
arm,vexpress-volt nodes set both of the properties it calls required.

One sentence in the regulator file is not a restatement: it says that a
supply without regulator-min-microvolt and regulator-max-microvolt is
treated as fixed. vexpress_regulator_probe() implements that by selecting
vexpress_regulator_ops_ro when the two properties do not both define a
range. Move the note into the regulator node description in the schema,
so that removing the file does not lose it.

Nothing else refers to the two files. Remove them.

Assisted-by: LLM
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---
 .../bindings/arm/vexpress-config.yaml         |  4 +++
 .../devicetree/bindings/hwmon/vexpress.txt    | 23 -------------
 .../bindings/regulator/vexpress.txt           | 32 -------------------
 3 files changed, 4 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/vexpress.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/vexpress.txt

diff --git a/Documentation/devicetree/bindings/arm/vexpress-config.yaml b/Documentation/devicetree/bindings/arm/vexpress-config.yaml
index 41c53e3acc12..b04e8e052181 100644
--- a/Documentation/devicetree/bindings/arm/vexpress-config.yaml
+++ b/Documentation/devicetree/bindings/arm/vexpress-config.yaml
@@ -139,6 +139,10 @@ patternProperties:
 
   "^regulator-.+$":
     $ref: /schemas/regulator/regulator.yaml#
+    description:
+      If regulator-min-microvolt and regulator-max-microvolt do not both
+      define a range, the supply is treated as fixed and only its voltage
+      can be read.
     properties:
       compatible:
         const: arm,vexpress-volt
diff --git a/Documentation/devicetree/bindings/hwmon/vexpress.txt b/Documentation/devicetree/bindings/hwmon/vexpress.txt
deleted file mode 100644
index 4a4df4ffc460..000000000000
--- a/Documentation/devicetree/bindings/hwmon/vexpress.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Versatile Express hwmon sensors
--------------------------------
-
-Requires node properties:
-- "compatible" value : one of
-	"arm,vexpress-volt"
-	"arm,vexpress-amp"
-	"arm,vexpress-temp"
-	"arm,vexpress-power"
-	"arm,vexpress-energy"
-- "arm,vexpress-sysreg,func" when controlled via vexpress-sysreg
-  (see Documentation/devicetree/bindings/arm/vexpress-config.yaml
-  for more details)
-
-Optional node properties:
-- label : string describing the monitored value
-
-Example:
-	energy@0 {
-		compatible = "arm,vexpress-energy";
-		arm,vexpress-sysreg,func = <13 0>;
-		label = "A15 Jcore";
-	};
diff --git a/Documentation/devicetree/bindings/regulator/vexpress.txt b/Documentation/devicetree/bindings/regulator/vexpress.txt
deleted file mode 100644
index 1c2e92c7831e..000000000000
--- a/Documentation/devicetree/bindings/regulator/vexpress.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Versatile Express voltage regulators
-------------------------------------
-
-Requires node properties:
-- "compatible" value: "arm,vexpress-volt"
-- "arm,vexpress-sysreg,func" when controlled via vexpress-sysreg
-  (see Documentation/devicetree/bindings/arm/vexpress-config.yaml
-  for more details)
-
-Required regulator properties:
-- "regulator-name"
-- "regulator-always-on"
-
-Optional regulator properties:
-- "regulator-min-microvolt"
-- "regulator-max-microvolt"
-
-See Documentation/devicetree/bindings/regulator/regulator.txt
-for more details about the regulator properties.
-
-When no "regulator-[min|max]-microvolt" properties are defined,
-the device is treated as fixed (or rather "read-only") regulator.
-
-Example:
-	volt@0 {
-		compatible = "arm,vexpress-volt";
-		arm,vexpress-sysreg,func = <2 0>;
-		regulator-name = "Cores";
-		regulator-min-microvolt = <800000>;
-		regulator-max-microvolt = <1050000>;
-		regulator-always-on;
-	};
-- 
2.43.0

