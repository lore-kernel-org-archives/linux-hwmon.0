Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C453532FA30;
	Thu, 30 Apr 2026 06:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777529784; cv=none; b=p4ot7/KD8Tw0n5HbBt8hKXdx7JvuH2OEO7qw65jnEFxmWc69UOKa8cWTwCSFak6j1oDedHHYpelmNq1yCfhmnd16ID4Ihj6w60uZfuhYh5+Hzx5oaZ/O5GVs2qG4sBB3pIg1VbJXteiQNPJs1MZFNkWo87uL2/TMuQqp90mq3+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777529784; c=relaxed/simple;
	bh=YCQ1gVmEk0+UlLBrYKAXo5Qvaaa3gzuUr6RlFJGdqPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jcLX2sPGHtThtAheolpQqDtYKF8+fxYmD9zvvuo1Rl+Z+McNyANvzSkhwcabNEmHfWVTcMvu7ItpCTXjzElyUpe9c/nlWmBcDuhPlm6ZzAPHMXEh1Q0BsSaD5+3lp8U8NawmB3szJ+FAXJhWo13hODdKHMVoIRoDOn/+ysGtHgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b48TLmtF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b48TLmtF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82F29C2BCB8;
	Thu, 30 Apr 2026 06:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777529784;
	bh=YCQ1gVmEk0+UlLBrYKAXo5Qvaaa3gzuUr6RlFJGdqPk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b48TLmtFUQz765meqJ8t2kbh6Jjg/bKxINMnymDLpR/O2EpakpeK8eB0232e6CB6b
	 ibkkxfh+rjwckX29xYyz3qga9J9vuQdGMQ5hgjohT5wwRKEa6/XWxk6tN7iiFcIsVG
	 Vn6Kr8UwHPzgrfUONHsJnNAQUzucpt7nVGwAmbz4N1McA35jWjBvQVPF/EyAlA7ZVV
	 /8u9tOOdTOPbPDxIKiPgdJqVkMzrAIpDHtbHJ159rGV7RGH+Q9ZWbAnXk5E0oZSmf7
	 s2YA7lOXXimvZICkQ7akZNQpz2hWQfLY2sCj5C4YEYertboBsumjvlGMrFoloZ50Ej
	 zXDNIGfaCkUow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759C3CD13D3;
	Thu, 30 Apr 2026 06:16:24 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Thu, 30 Apr 2026 14:16:20 +0800
Subject: [PATCH v3 1/3] dt-bindings: hwmon: pmbus: add Delta E50SN12051
 binding
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-add-e50sn12051-v3-1-f6d4e043ec7c@gmail.com>
References: <20260430-add-e50sn12051-v3-0-f6d4e043ec7c@gmail.com>
In-Reply-To: <20260430-add-e50sn12051-v3-0-f6d4e043ec7c@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Chang <kevin.chang2@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777529782; l=1520;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=LrBg+nJFD1aQQfSoi4TjC+OlDZ2w3HkTNOHnZebm0W4=;
 b=GAVjpQ3+MMbtHJLoZESE2X9JCvqsSNi5Hs0cJkz7Jc1EL96VO+hDpVoFZfY8y9GloUaYuBr/T
 x+XqGZskZZoA+feFYZH2b4TPQMh+s7M4mT/BICiSpVOhze0OjADBbGG
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
 .../bindings/hwmon/pmbus/delta,e50sn12051.yaml     | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.yaml
new file mode 100644
index 000000000000..ea7b6d001d66
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.yaml
@@ -0,0 +1,41 @@
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
+  This binding describes the Delta E50SN12051 PMBus sensor.
+  The driver supports reading voltage, current, and temperature
+  using the PMBus interface.
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
+        hwmon@40 {
+            compatible = "delta,e50sn12051";
+            reg = <0x40>;
+        };
+    };

-- 
2.34.1


