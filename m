Received: from mta0.migadu.com (out-46.mta0.migadu.com [91.218.175.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE5E3F1050
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 08:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374003; cv=none; b=SlQ6H/xhsQXnC3f4PvDxAeiWtw0FDnl1ZGXacVXIA7NHfbjPXu0tshVSMWFqk4Q+HJlxA8JFH0fIOBkMbtrMf+aRgwgehZUHG24DlmKzkKPjLPpI8wB4PYn4r3LzSJM2LQca9VERpWoTDx5fFPlXJfBLmij05yhpCrIunZrtBkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374003; c=relaxed/simple;
	bh=U7vTt2iELlQ0EEFdakKRfkx0wSobYgfSFzBqINVEnHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 In-Reply-To:References; b=Q/S2luG5aYlybqX9WldrOrsJugih+eOjbPoriKZa38v5dp8UTbjc6jXP0sFNM97hc3IphNbkgM2lt2nLJ3AKaM29V/f2P5CKJRGYt7PkauuJc5kb/qkdxOr6cW4LbAY9mgi9DYSWWOEYIa5Cl6GcoUKyy4tmx5FdN5f7o00x6Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UK7DmuMD; arc=none smtp.client-ip=91.218.175.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UK7DmuMD"
X-Envelope-To: linux-hwmon@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=U7vTt2iELlQ0EEFdakKRfkx0wSobYgfSFzBqINVEnHs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789373998; v=1; x=1789978798;
 b=UK7DmuMDV0VPrT5MmKknXCqLYrMAI/3rY1tOmAtZZL5XIAOpbl7EE374D19gQGnOPXE4LDgv
 k2Um6ED2NATlrru+MbYUXcGbZXWmtV+f7di7ZqQ2yq5HRFNxc317ZO30E23i79Ks0cePx8El0No
 AqMVoFOZDQSWY5YN844+v+L4=
X-Envelope-To: linux-hwmon@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 85b6144fd9a19aa4;
	Mon, 14 Sep 2026 08:19:58 +0000
X-Mizu-Trace-ID: 85b6144fd9a19aa4
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 14 Sep 2026 16:18:03 +0800
Subject: [PATCH v5 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ctl2301-v5-3-522def70acb4@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
In-Reply-To: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=U7vTt2iELlQ0EEFdakKRfkx0wSobYgfSFzBqINVEnHs=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnL1x76eWbBXPl7F+xPi/5g/Tg77+OZHetkKg7IdR5t6
 xb8IHrIsqOUhUGMi0FWTJGl+wHPtgKfKNsCgUJfmDmsTCBDGLg4BWAiJy8y/GRMuGXty6XuH9Lj
 l1CYWmXifsWjbZ64w4c5n+eXKc85fIKRYV76CZb9U913eTW3f6nbbRjNZHAsTkhQ5u5be+9lVud
 2MgEA
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1

Add the Sensylink CTF2301 temperature sensor and fan controller to the
LM63 family binding. The chip follows the LM63 register model and can
provide a thermal cooling device when #cooling-cells is present.

Do not provide a national,lm63 fallback because the CTF2301 is not fully
compatible with LM63. It uses different conversion-rate encodings,
extended local-temperature registers, additional fan lookup table
entries, and device-specific PWM and ALERT/TACH configuration. An older
LM63 driver would therefore not operate the device correctly.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 Documentation/devicetree/bindings/hwmon/national,lm63.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
index f2e0993cfbef3..4c8d0a15fbd12 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
@@ -12,7 +12,8 @@ maintainers:
 description: |
   The LM63 family provides local and remote temperature monitoring together
   with fan speed monitoring and PWM fan control. Supported devices include
-  the National Semiconductor LM63, LM64 and LM96163.
+  the National Semiconductor LM63, LM64 and LM96163, and the Sensylink
+  CTF2301.
 
 allOf:
   - $ref: hwmon-common.yaml#
@@ -23,6 +24,7 @@ properties:
       - national,lm63
       - national,lm64
       - national,lm96163
+      - sensylink,ctf2301
 
   reg:
     maxItems: 1

-- 
2.55.0

