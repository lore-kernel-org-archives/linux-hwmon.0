Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055A930F7EB;
	Thu,  7 May 2026 05:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778130755; cv=none; b=Xmhcs+QwmCR8jmJhDIdUvu8y2meI4abWi06ALCpHcUwR7Kz0eRWEEkck6qs4wCSVCSE1WWcsYYTtuZ8QEAFyCT0eAOy7t43DrQGA4CoVPzHsx4GIbb4ZaMZREjzl3wDBLrTUmhvoBZbnM/Rutml+qIqszrOu4kXNFs6rr6rql/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778130755; c=relaxed/simple;
	bh=3r4H5G/jrvWpNeWhHOaUtWx4IFj1JUDZcYWQSojOaxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uA0YKwFOuqOMFNUOPM3m+OmvLHstQOtR39dK1Pmtu5Hzmo7XXhnqn2dDV5hOZYMu+B4ergb00+2xd818n9XuYIVco8nAo7UBUdRtzrVED4VWa4wcFYGP7/VCRrqgzJeDIFcGBeXhFp3ZkY70eM1Dyc2y4WiliQrOeF8er5JQA/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RCtLA3Je; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RCtLA3Je"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6008C2BCC9;
	Thu,  7 May 2026 05:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778130754;
	bh=3r4H5G/jrvWpNeWhHOaUtWx4IFj1JUDZcYWQSojOaxk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RCtLA3JedL0UrEdvbCKkeM0gtLqJiu0J+yg13tERO8/UpG8T33EkPMTJyfGRGVUIe
	 ZtWX2JLSg9pXYxi/tT2z6cxph3GkyyxqI1/mPNPhyBXN6TBs1DYyDz18IZBrs8z74I
	 /nwURXVaueFSedZs3RNRUxGsdiKn97JibkGpugurws1yyTHwSmxSyltn892TNxd0eV
	 e+OsKGxejKhDRHHunRvnORaN2JGQiBXzEPRTmz1TP673YUyVlYspCegH/VepytvycH
	 MM7Ygqf4sRm54fcBpHB1QzpKUioVRPqyDq4gW7HKk60alJGPqOaH5S1zB1UjA3yrcD
	 LyxGEszMZyUiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A372DCD343B;
	Thu,  7 May 2026 05:12:34 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Thu, 07 May 2026 13:12:26 +0800
Subject: [PATCH v4 1/3] dt-bindings: hwmon: pmbus: add Delta E50SN12051
 binding
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-add-e50sn12051-v4-1-ff2b3768ac7e@gmail.com>
References: <20260507-add-e50sn12051-v4-0-ff2b3768ac7e@gmail.com>
In-Reply-To: <20260507-add-e50sn12051-v4-0-ff2b3768ac7e@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Chang <kevin.chang2@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778130752; l=1608;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=LsFD1WB8cxVjFqAQavi/vJOUq3ztpTJc2Fdx31QeHU8=;
 b=4NS/ybOabUG3+V2P0oSOL1ps+nIvcGkTNqJgHgyue+rBFC199HBt1GzcJdm2eDOqYInD8wgtm
 n+Ir/xejrHWASDuy9Q3aUwt42DWGOI9pkJJZnSBPXeBKQ+FgIfVHbtT
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Colin Huang <u8813345@gmail.com>

Add devicetree binding documentation for the Delta E50SN12051
PMBus-compliant device.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../bindings/hwmon/pmbus/delta,e50sn12051.yaml     | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.yaml
new file mode 100644
index 000000000000..72aefe212d17
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/delta,e50sn12051.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Delta E50SN12051 PMBus Sensor
+
+maintainers:
+  - Kevin Chang <kevin.chang2@amd.com>
+
+description: |
+  Delta E50SN12051 is a non-isolated 1/8th brick DC-DC power module.
+  It is a PMBus-compliant device accessible via an I2C/SMBus interface
+  and provides standard telemetry such as voltage, current, and
+  temperature measurements.
+
+properties:
+  compatible:
+    const: delta,e50sn12051
+
+  reg:
+    maxItems: 1
+    description: I2C bus address of the PMBus device
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
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        power-module@40 {
+            compatible = "delta,e50sn12051";
+            reg = <0x40>;
+        };
+    };

-- 
2.34.1


