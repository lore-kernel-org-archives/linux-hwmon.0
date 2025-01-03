Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA0C1F9A8A;
	Fri,  3 Jan 2025 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735899308; cv=none; b=t2SwY67h46b7mSXutsFpv0DYm7ZJUY+r96wQYLsPrlR9Urk9A2qPK4nD3kO5bc7oKNcyVPIp49L72kvWFa5AaSPPKkaOhemJ3iVbzb1Oeh/RGg9IFrNc6bIb+AEsgaTZdqs+cRWkLFRblWolQzouz8wGz5XEn/p68ckXWSqVNEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735899308; c=relaxed/simple;
	bh=qDqhKoebL+U3703j8ycPOl91l3bsf/dg4Y2ghOWLvz4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jDLJiVtsdCgDC0JBe/tPy0SvMeGkhZkBqKV9BN2TctT70meO0GEee8B5mjQeBkr6ny/hZT6eWq9m6tJ/fkwkhdS+BAQRrUt+3glkJweSxhfeGBvQdTV3icKgZ2iaPk+CfhPmnpJCzzC5jzMOp2+pz8vGbUHFIfuUU0mo3qS6/lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2ADE51C0004;
	Fri,  3 Jan 2025 10:15:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peko@dell.be.48ers.dk>)
	id 1tTehm-003jnd-3D;
	Fri, 03 Jan 2025 11:14:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Guenter Roeck <linux@roeck-us.net>,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: Peter Korsgaard <peter@korsgaard.com>,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 1/2] dt-bindings: hwmon: pwm-fan: Document default-pwm property
Date: Fri,  3 Jan 2025 11:14:47 +0100
Message-Id: <20250103101448.890946-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: peter@korsgaard.com

The pwm-fan driver uses full PWM (255) duty cycle at startup, which may not
always be desirable because of noise or power consumption peaks, so add an
optional "default-pwm" property that can be used to specify a custom default
PWM duty cycle (0..255).

This is somewhat similar to target-rpm from fan-common.yaml, but that cannot
be used here as target-rpm specifies the target fan speed, whereas this is
the default pwm to set when the device is instantiated - And the resulting
fan RPM resulting from a given PWM duty cycle is fan dependent.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
Changes since v3:
 - Fix example syntax
 - Extend description of why target-rpm cannot be used

Changes since v2:
 - Recreated/resent

Changes since v1:
 - Rename to default-pwm

 Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
index 8b4ed5ee962f..873c4c32e608 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
@@ -20,6 +20,13 @@ properties:
     items:
       maximum: 255
 
+  default-pwm:
+    description: Default PWM duty cycle value to use at startup
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    default: 255
+
   fan-supply:
     description: Phandle to the regulator that provides power to the fan.
 
@@ -100,6 +107,7 @@ examples:
     pwm-fan {
       compatible = "pwm-fan";
       pwms = <&pwm 0 40000 0>;
+      default-pwm = <75>;
       fan-supply = <&reg_fan>;
       interrupt-parent = <&gpio5>;
       interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
-- 
2.39.5

