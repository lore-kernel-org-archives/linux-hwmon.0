Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516AD4418CB;
	Wed,  3 Jun 2026 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485067; cv=none; b=N24GiYlAUHOwlxpIhYUaGH6pglDxFH2uvWa37gC6LpkkjbyyjmosNauW8t+/DYr3EDVDEcoMq6VWtCBE2utXWijiXl3btAdVl7hjdbKa/ZBqFSVpgvyJrYILXXh8hW2pbrVhxdC7QJDJjWRLBhv2ly+T5vXOnc2rFUfMftVNYqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485067; c=relaxed/simple;
	bh=HCG9adi2ZLMuFGes1YkvDXdIMeL9tAXI44u4K5umM8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WdMKLsosicppv3678+EVfVglNar6RRHF1LImLGu6BrTI4rC1qeWqy+rvuGMLoKP4pdEOj55qKLZ6/jbYBFGIT6Eeaw+OnqsK9njGrs7ONRdgBx6Ok0NSa09UtFyVqrgrqgj4dAOf0Kad7g8jFSRs2Smmhuh17fAQu8gW6lVprHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=h6ptMwcD; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="h6ptMwcD"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9123A4E42DF9;
	Wed,  3 Jun 2026 11:10:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66AB85FFA8;
	Wed,  3 Jun 2026 11:10:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9531310888CCD;
	Wed,  3 Jun 2026 13:10:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780485058; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3XIg8GjehCWlUB8DMtiP7SFXCt7H+sLK6r9MYuiNWyg=;
	b=h6ptMwcDvpoaEvyPupv3tSGfKPRa9WC8sBbK7pFWDlDyOY11ZLlGIDS+ltJB1ttLq4yysr
	LYm5wmf+60mALRSpiRHcayS92Vasx6VaJQZ1KRSg7BV3VuZUTGOgJQNtX3yhb+HSnKriQq
	XDHOd9sn5FEv6+bBUpeDzZ3mbnPGlzkyRNejq98XAvSU8jEZncUGqeGAR84Rfmp8q3E1d1
	GAe7TqiSrRQSwuLvAKTNDszGxz9xOvoQRUQsx61mX5x86vlRwG9ylhZbVMgpKpCorhXTQX
	F0o3r66W63rsKBWEzGSI0eVEeF8zo8LvEliB1ONRC5Vl3P8Cz/nxJk3F0tBzXw==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Wed, 03 Jun 2026 13:10:49 +0200
Subject: [PATCH 1/2] dt-binding: hwmon: Add binding for ADT7462
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-adt7462-bindings-v1-1-301304bcf774@bootlin.com>
References: <20260603-adt7462-bindings-v1-0-301304bcf774@bootlin.com>
In-Reply-To: <20260603-adt7462-bindings-v1-0-301304bcf774@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kory Maincent <kory.maincent@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

From: Kory Maincent <kory.maincent@bootlin.com>

Add the ADT7462 hwmon Controller device tree bindings documentation.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[rgantois: modified SPDX license header]
[rgantois: minor corrections in device description]
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 .../devicetree/bindings/hwmon/adt7462.yaml         | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adt7462.yaml b/Documentation/devicetree/bindings/hwmon/adt7462.yaml
new file mode 100644
index 0000000000000..745a371affd65
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adt7462.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/adt7462.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ADT7462 hwmon sensor
+
+maintainers:
+  - Kory Maincent <kory.maincent@bootlin.com>
+
+description: |
+  The ADT7462 is a temperature and voltage monitor and a PWM fan controller.
+
+  It can monitor temperature in up to three remote locations, as well as
+  its ambient temperature.
+  There are up to four PWM outputs to control fans.
+  The ADT7462 supports high frequency PWM for 4-wire fans and low frequency
+  PWM for 2-wire and 3-wire fans. Up to eight TACH inputs can be used to
+  measure the speed of 3-wire and 4-wire fans. There are up to 13 voltage
+  monitoring inputs, ranging from 12 V to 0.9 V.
+
+  Datasheet:
+  https://www.onsemi.com/pdf/datasheet/adt7462-d.pdf
+
+  Description taken from onsemiconductors specification sheets, with minor
+  rephrasing.
+
+properties:
+  compatible:
+    enum:
+      - adi,adt7462
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      hwmon@5c {
+        compatible = "adi,adt7462";
+        reg = <0x5c>;
+      };
+    };

-- 
2.54.0

