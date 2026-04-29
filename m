Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C623793DB;
	Wed, 29 Apr 2026 09:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455726; cv=none; b=Z+tZwq1jhhwwBU6UCkMQN/N2EVHbrqNR2HP+8U1IFamjWtIeALcI9+YTjAG/uZQRsmUCSNBI3KxnwcLkA66TcGXxBy1VEZ8KjQXBVbeP1/zLj4aD1IbtNwlu9SaDNuhpsHeFib+AsGr2ntkgC6fU6JlJ7Tv4ZvSYvynR8F+f6Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455726; c=relaxed/simple;
	bh=9mATjHy/p92zdocodNNWbLZIIdHAStQKLxfvQ0r+77c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QGhjy1lOs/CD9XSeGQvudFROKjiofCe3fjUul3XLFvG59T3hzlDRORor4TR27JYh2AyYKYbz4a409WmreYzHA+1MnIv5X4TcVoDygx+m4T5xyTVF+EbCMCYkrD3aM4r+eLsioxG26PtwgvGuTs2qEUm1sf4zcv4ayER1mr6+VuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TmMxhhT3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TmMxhhT3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3634C2BCC4;
	Wed, 29 Apr 2026 09:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777455725;
	bh=9mATjHy/p92zdocodNNWbLZIIdHAStQKLxfvQ0r+77c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TmMxhhT38l/2E5hjRN5zAVx/VF93Yt74UxHpbf6lRRhL8FmJkClc+BfWafBK+OBoI
	 0H46IrMRkkyItpaZLyqHDhuWEf1Sv0uu1CXUg57h2LxtMUirVyIu+SXj8Vo7Xl9aO1
	 JDb/pR/8Zm98dioy+A1G6Mu6qoFnkt62qrIEy901usT38kVN32JKL5cOmVzwgU23YQ
	 mia7Fx1iAwPSjyu1dlO1meJybJOODuYtARpnEPRiRk/V6WVmRC3ivVuJQT+ShD3sTN
	 hvDcDIJB0RIEsRVz7CQdfm9/63MbN9GNJ7+XJhQILiaAbysYl4uEyRb9b9K6ksn+WE
	 rZfW0JX6WVQvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2754FF8875;
	Wed, 29 Apr 2026 09:42:05 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Wed, 29 Apr 2026 17:41:58 +0800
Subject: [PATCH 1/3] dt-bindings: hwmon: pmbus: add Delta E50SN12051
 binding
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-add-e50sn12051-v1-1-c101e6c80bbb@gmail.com>
References: <20260429-add-e50sn12051-v1-0-c101e6c80bbb@gmail.com>
In-Reply-To: <20260429-add-e50sn12051-v1-0-c101e6c80bbb@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Chang <kevin.chang2@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777455724; l=1513;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=4ai3gQorriR95uJn5LyCKNAUfjhgHd9lSkC+s7TUrI8=;
 b=a221JMOGHN2o9wbB6pOEIlq4J//kGnqL99ROnMmLVkYapRPebeu8B5/gLt0jB3dJyj2OVUXZJ
 7QYkvSSrVMVA4OlYnv8JNf/p0vdGTO3wzfFuzrW6NUHSYia97vwZeyf
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
 .../bindings/hwmon/pmbus/delta,e50sn12051.yaml     | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.yaml
new file mode 100644
index 000000000000..362cbbf10bfe
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+        e50sn12051@40 {
+            compatible = "delta,e50sn12051";
+            reg = <0x40>;
+        };
+    };

-- 
2.34.1


