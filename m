Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14CB157468;
	Wed, 24 Apr 2024 09:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713949509; cv=none; b=ENniUDFEDdwsXxs6yGNUUHmhmPBa9WD5X8FeQ+MI3WRFPCsaHJAp3mXkbGhYM+kDWg/l/ZNpYByy8J1jQihxcKNE4vNtsh7iMloHLyIdR9sqrmtRSaJRWJEm8t5MuyqvRBaYzAP4qKUZ0ee8NXCr4eTybQfOafN5ajTE+XfIBdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713949509; c=relaxed/simple;
	bh=gPkFNpdOmICXLayM0/OxvGB6u9bijX5nkgUd2cM03lI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UAsQvIPTa3vWQDL3NnERMrDR6PNM8rtJAqIaUC9OLlnKw8FqQw579KWxo+YzRVu1oxcYdNrZXAKwaW508PFmFCO9v6H7UsPf+zD7f81zNHYdI+j1lag1exkeO/uQiSmzy6c3YiebkVgaXyvbOHytfKLnHsdgjrcrQPTsZImwb10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=48ers.dk; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=48ers.dk
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49E8140010;
	Wed, 24 Apr 2024 09:04:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peko@48ers.dk>)
	id 1rzYYj-009cJE-2S;
	Wed, 24 Apr 2024 11:04:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Korsgaard <peter@korsgaard.com>
Subject: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document target-pwm property
Date: Wed, 24 Apr 2024 11:04:52 +0200
Message-Id: <20240424090453.2292185-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: peter@korsgaard.com

Similar to target-rpm from fan-common.yaml but for the PWM setting
(0..255).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
index 4e5abf7580cc..58513ff732af 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
@@ -46,6 +46,14 @@ properties:
 
   "#cooling-cells": true
 
+  target-pwm:
+    description:
+      The default desired fan PWM.
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

