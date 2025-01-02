Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680F44C83;
	Thu,  2 Jan 2025 17:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735840253; cv=none; b=eFUj1XuXZG50dIdZGkvig3MZL5jiPu4vMPJzSUKBiLbeVvsLx3XZ6x6LQeZ5Q0nRVrTH/8a5aAUfPWVJnEbru6MsVbuuhRu2Saxo1aHPGcXBNaEs9vy+M6qTPLhQgHSr39ByssG16ePWLx5hAMvqfPSgnnFqRCCs0ACe/j7eOj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735840253; c=relaxed/simple;
	bh=P6qhlJbu53rjUmvLe1d+oqaNFvqOypkD/4qBvmwL83w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nUMoyNk2qEAtmi+V5v6Jirs1ue0qnIg9snpQCkyB+z83+xxLDSYkyHQDSOaDzG2/D4IvDvZblLdAzv7zC53G4tGhZT7TQYqNsGr/YZ632UQH4MGEVhu9nEZZSA4ozLTqjljJPkAF1Zsvdt1yKRZY8pxI2vveL372PabTxSBC/9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FF2D240003;
	Thu,  2 Jan 2025 17:50:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peko@dell.be.48ers.dk>)
	id 1tTPLH-003S6F-0t;
	Thu, 02 Jan 2025 18:50:43 +0100
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
Subject: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document default-pwm property
Date: Thu,  2 Jan 2025 18:50:40 +0100
Message-Id: <20250102175041.822977-1-peter@korsgaard.com>
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
PWM duty cycle.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
index 8b4ed5ee962f..83b8b0b964ee 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
@@ -20,6 +20,12 @@ properties:
     items:
       maximum: 255
 
+  default-pwm:
+    description: Default PWM duty cycle value to use at startup
+    minimum: 0
+    maximum: 255
+    default: 255
+
   fan-supply:
     description: Phandle to the regulator that provides power to the fan.
 
@@ -100,6 +106,7 @@ examples:
     pwm-fan {
       compatible = "pwm-fan";
       pwms = <&pwm 0 40000 0>;
+      default-pwm = 75;
       fan-supply = <&reg_fan>;
       interrupt-parent = <&gpio5>;
       interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
-- 
2.39.5

