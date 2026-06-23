Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA25B3A9622;
	Tue, 23 Jun 2026 05:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782194165; cv=none; b=tmQ1DyCmHKis82kiiGL61mb+0pz4PHRx3Wd9ffc32slwKSQuACmfBrHcKEWA5haEylq+v14EXnpv/CtwZxTfPm2IBQloYx907aoxx8GEpnHNSbWvKs52nI1uvpeR6IQPmIolwlMJxYej++H/DHZwb//au9uRA6/GvaEkXjZJvgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782194165; c=relaxed/simple;
	bh=m4OrtqCXPBUWfHjtzRUrWD0LAKMUcdetJENuV5F8VBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IhXSEmkhljMFqgoZw/oFJVx1OlkMszCDH6gJFew2nSDMBQmY1T0VHYaxrhAnlvyvA5UesVx2MVY+cbwuZ9/tyc+ILI8esrlVIflYeMUqADwEUrYMJDQOiaSnFOFwlKGCZgkwujm087u5vW9FFMAtNDa80rXnP91ijuhjXvoelLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qyGChj2A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qyGChj2A"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70589C2BCC6;
	Tue, 23 Jun 2026 05:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782194165;
	bh=m4OrtqCXPBUWfHjtzRUrWD0LAKMUcdetJENuV5F8VBg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qyGChj2AiqTKBGYN2c9X9gbuKOnxZXWJS3Fq2K+QQ5QRxPR0n6xN/LcrSe/I2p1Gd
	 axPkI33kKYeOUo4vt7AOAkmiLSEF42tL/6Z3tAjFDH5lGJfN/sxtk9e5U6Ji8p3B+W
	 t5PY7//fXOT2OXSclY9TIiJORnmTWLtDtTOzq5J4ns4tS4eLDWBAzlzEZ2nclDzT43
	 CjW9/liDCi19FQR4zlyOE2JG1OH3MSTwj/kn97KGsZPPKADcvQLHutkb1wjxgtshUU
	 FFhrhZWbM7Yi7sR8BNQWvmWuZjp7GsW/9q9tr5VJRRCt7c3U1GzWD8HjFnri/dQj+S
	 eFyAOVZPEqSBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60962CDB471;
	Tue, 23 Jun 2026 05:56:05 +0000 (UTC)
From: Selvamani Rajagopal via B4 Relay <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Date: Mon, 22 Jun 2026 22:55:38 -0700
Subject: [PATCH 2/3] dt-bindings: hwmon: pmbus: Support for onsemi's FD5121
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-support-fd5121-from-onsemi-v1-2-b31767689c65@onsemi.com>
References: <20260622-support-fd5121-from-onsemi-v1-0-b31767689c65@onsemi.com>
In-Reply-To: <20260622-support-fd5121-from-onsemi-v1-0-b31767689c65@onsemi.com>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Selva Rajagopal <selvamani.rajagopal@onsemi.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782194144; l=1429;
 i=Selvamani.Rajagopal@onsemi.com; s=20260531; h=from:subject:message-id;
 bh=Zw1KdNLpVYL6UZplq8A+h3jDYYOHRawnuaZFGAXmcFg=;
 b=5LwwDnJZbiIpKvcgN54cRezHu4qz681+0HrvqBMRvst7oLKuB54J8cRxlp0EyDzKDr9brEFXz
 r8spVsYORlJAjyxA4sFeFKc7xyY2n8ljxvfke9MxCY9eZUiyx0shcx1
X-Developer-Key: i=Selvamani.Rajagopal@onsemi.com; a=ed25519;
 pk=5QRdM0HS/LGWWcUZZ9hVfZ+qbPQGZCumcTXOiN7Fyug=
X-Endpoint-Received: by B4 Relay for
 Selvamani.Rajagopal@onsemi.com/20260531 with auth_id=803
X-Original-From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Reply-To: Selvamani.Rajagopal@onsemi.com

From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

Add devicetree schema for onsemi FD5121, FD5123, and
FD5125 dual rail, multi-phase digital controllers.

Signed-off-by: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
---
 .../bindings/hwmon/pmbus/onnn,fd5121.yaml          | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/onnn,fd5121.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/onnn,fd5121.yaml
new file mode 100644
index 000000000000..b0453b0634f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/onnn,fd5121.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/onnn,fd5121.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: onsemi's multi-phase digital controllers
+
+maintainers:
+  - Selvamani Rajagopal <selvamani.rajagopal@onsemi.com>
+
+description:
+  onsemi multi-phase digital controllers with PMBus.
+
+properties:
+  compatible:
+    enum:
+      - onnn,fd5121
+      - onnn,fd5123
+      - onnn,fd5125
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
+      fd5121@50 {
+        compatible = "onnn,fd5121";
+        reg = <0x50>;
+      };
+    };

-- 
2.43.0


