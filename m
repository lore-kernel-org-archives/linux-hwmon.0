Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F45630B509;
	Tue, 18 Nov 2025 09:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763457126; cv=none; b=rlc1wK/zUKNJ/5x47xC3WrG+HAww0kyFKGrW8yXbE8CfHTicg8pLpMP+4hVGUZyWSTvdNLqRMevxF88cj6Gj9HksTl5tX3ECOgCgR8xoGnubd7aZDNz4YGkGGFqJjUNN7oixuQtUGMByG4CtCdgqjxxHFdHpqkIM6dRr+BH/Ng8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763457126; c=relaxed/simple;
	bh=JDmEdUnkLF6RVLRvaEnIBn8tkpVakmNeGiFD6QBSMrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mddqsO5N9RHRWbZQL0NQlAVC4ZHUgExg093bV+x+AHwadMnbWs+Za12Y6Pz9FmcNTPyk/qCwn39DK8CNABhKSv/vG9NrHUqkE9iyWxp3OSjXDrGd7bSF0xuLNVfE4B0d3J+kBWnVcMmF5c38i5DDXRaieyYmExWUaAQTSUxmNdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 18 Nov
 2025 17:11:54 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 18 Nov 2025 17:11:54 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 18 Nov 2025 17:11:53 +0800
Subject: [PATCH v2 1/2] dt-bindings: hwmon: Add AST2700 compatible
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251118-upstream_pwm_tach-v2-1-4d9bc13d34f9@aspeedtech.com>
References: <20251118-upstream_pwm_tach-v2-0-4d9bc13d34f9@aspeedtech.com>
In-Reply-To: <20251118-upstream_pwm_tach-v2-0-4d9bc13d34f9@aspeedtech.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763457114; l=1208;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=JDmEdUnkLF6RVLRvaEnIBn8tkpVakmNeGiFD6QBSMrw=;
 b=8hgzFz80poWkTppmHKaWIGpC5XxmS85p6j19TgPcrTxzasWNqRjDMan1sQ0vBR20yVoaI1F0g
 v9sbXH76B8SB59L/vZT5imGr4CNq+63pF566kVLXsJGbcFFgxi47Pxq
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

Adds support for the AST2700 PWM/Tach controller by extending the
compatible string enumeration in the device tree binding.

The AST2700 PWM/Tach hardware is compatible with the existing binding
schema and requires no additional properties or modifications beyond
the new compatible string.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml          | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
index 9e5ed901ae54..8b579321915f 100644
--- a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
+++ b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
@@ -18,9 +18,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - aspeed,ast2600-pwm-tach
-
+    oneOf:
+      # AST2700 with fallback to AST2600
+      - items:
+          - const: aspeed,ast2700-pwm-tach
+          - const: aspeed,ast2600-pwm-tach
+      # Only AST2600
+      - const: aspeed,ast2600-pwm-tach
   reg:
     maxItems: 1
 

-- 
2.34.1

