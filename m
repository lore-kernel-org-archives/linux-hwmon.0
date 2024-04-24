Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F791BC46;
	Wed, 24 Apr 2024 20:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713990305; cv=none; b=XpU5OQvJ3vigcLeYqX4MRhex0uBtZ2SwSdX8jrPKJCqY1PWNoQTIUeLmAgub+kcfhw4oJy0tsm/f9I28A+g66v1oYLffgDyqDEa9rdk5zrFUt2CO1HBXRFvxHvTty8J2WzWt+6q29MfnoH2wFXJ0p3w4hhrgPqtlskYOq79lp8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713990305; c=relaxed/simple;
	bh=T16HxdpsxQ5oknI22T2lN8sCpNFXcO81pdwogIbjNRA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PKZgKsUlT0g3m8DGssA9Ebe+6kiuWgF76tGY1+BDQKynVNa/9ylxt0MGJ9cKZxqZvyo6dExhx64SggQcq1fCkezBcaiUQcQG3P86bjzde41HPqMcorHOBLSMxHHag1J6YIGs3xCNzu2vz086fWEyHo4xBtNRuN2k08M7vNPovdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=48ers.dk; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=48ers.dk
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52AB21BF205;
	Wed, 24 Apr 2024 20:25:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peko@48ers.dk>)
	id 1rzjAn-0004xQ-2s;
	Wed, 24 Apr 2024 22:24:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Korsgaard <peter@korsgaard.com>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: pwm-fan: Document default-pwm property
Date: Wed, 24 Apr 2024 22:24:47 +0200
Message-Id: <20240424202448.19033-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: peter@korsgaard.com

Similar to target-rpm from fan-common.yaml but for the default PWM setting
(0..255).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
Changes since v1:
- Rename to default-pwm

 Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
index 4e5abf7580cc..70f062b30985 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
@@ -46,6 +46,14 @@ properties:
 
   "#cooling-cells": true
 
+  default-pwm:
+    description:
+      The default fan PWM to use.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    default: 255
+
 required:
   - compatible
   - pwms
-- 
2.39.2

