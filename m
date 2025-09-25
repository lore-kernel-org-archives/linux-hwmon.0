Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B753C35966
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Sep 2025 00:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758728; cv=none; b=G5nj+9rY9ZwlCUItCnBEJszM5iHY7kEwZYgMRvDj+u4U/lyu9jPHipza7wjxr28CxrR+IKuXEqGg+2TIe4wuxkfDC92KAtCclrZNh0v1MfbGhG6kTb9CYJuy5Q2WLd8Ilq1VBiuQ1D2otSujhD/gBglcpzrpCDrEAHHJ+pTdRg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758728; c=relaxed/simple;
	bh=Yjeo/kxzLvJO2MQlk4TZVIyVLUXf4NIEiJXkBmyt40M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6eRJo6sPnKHuF5U1LNBd6NHwCuUraEXuXQx6OKMTOLi9756hadmTUmpbsqUfv8m4G34FqbN5iVU5Ahs7LnFqFMMm3vFcZezvHHaWBXTcm3fYn5ucwRHFrImIzTL3+Df7xPNEfArif988QEGlPBTOwK+cGy5t5vGwN9qgllY+zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C24DD3F532;
	Thu, 25 Sep 2025 00:05:18 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8F7613A6B;
	Thu, 25 Sep 2025 00:05:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ACrxKj2H1GgdNQAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Thu, 25 Sep 2025 00:05:17 +0000
From: Stanimir Varbanov <svarbanov@suse.de>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>,
	Saenz Julienne <nsaenz@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: [PATCH 1/4] dt-bindings: Add Raspberry Pi's RP1 ADC
Date: Thu, 25 Sep 2025 03:04:13 +0300
Message-ID: <20250925000416.2408457-2-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250925000416.2408457-1-svarbanov@suse.de>
References: <20250925000416.2408457-1-svarbanov@suse.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	TAGGED_RCPT(0.00)[dt]
X-Rspamd-Queue-Id: C24DD3F532
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Score: -4.00

Document dt-bindings for Raspberry Pi's RP1 ADC.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
---
 .../bindings/hwmon/raspberrypi,rp1-adc.yaml   | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml
new file mode 100644
index 000000000000..5266b253fd2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/raspberrypi,rp1-adc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rasberry Pi RP1 ADC device
+
+maintainers:
+  - Stanimir Varbanov <svarbanov@suse.de>
+
+description: |
+  The RP1 ADC is a five input successive-approximation ADC with 12-bit
+  resolution (ENOB 9.5-bit) at 500kSPS. It has four external inputs
+  and one internal temperature sensor.
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-adc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  vref-supply:
+    description:
+      Reference voltage regulator 3.3V.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vref-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    adc@400c8000 {
+      compatible = "raspberrypi,rp1-adc";
+      reg = <0x400c8000 0x4000>;
+      clocks = <&rp1_clocks 30>;
+      vref-supply = <&rp1_vdd_3v3>;
+    };
-- 
2.47.0

