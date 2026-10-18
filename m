Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F68422E3E;
	Sun, 18 Oct 2026 04:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792299313; cv=none; b=m0ctE2lCKI1KS1iKUkMe1Z7aSqShulpWmYVG9U7yg35a0/ySv8CduU5qsZIfu8V10UGFglThZt0gOrbE+yXj99eIVRjnmXe8iedHkurQIbpuHpfmzQVsCiSQmYR0HRk0G9cjiqd8oEfsxAv7wJF6u27HQTm3No/sMQxqFCrhilk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792299313; c=relaxed/simple;
	bh=dtivKKmcg8zcbQIIlTROYPcTUxR+GP0NXH684ufM7r0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fnczw8RtvCSzdV2qDi4o20FIiar3ygfLdzep6HVh5r4JZlPvpG6cnTYDWkhrA++4x1IWNaZiHF3faAbK68ZCNDQCnpfFAf+deCVj/f6WCuVEVa10dNGfciLcpmi5iqXQb1mvZAIihyQHS1iTb/nFamO8tupxO/KAGDvBJ1+S6GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=itcj84WZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="itcj84WZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3D55C2BCC7;
	Sun, 18 Oct 2026 04:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792299313;
	bh=dtivKKmcg8zcbQIIlTROYPcTUxR+GP0NXH684ufM7r0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=itcj84WZh32DoUODw3yguRJecogYukRcHwHvkZMbneyOmHBg0GqkBYj20tGU/o4O6
	 t3rTjyUb5rn4wXp64T6D1qEI5zyLVND9Sz93TqXEXs0gJnyAmvnvWfk4T6pL3SXtPE
	 nBBcVmB9f0Jp/L/xvA2WMfwVDmwYNEV3m57Pyv1pwWtv3LUOfRI4kd+IX7Cxu+uLHZ
	 aouc3HhuiqERu1zUY3gceHUrub8clyoNC6hfG8EQPliAKqiA24+yAa7QmEvaxKtgO6
	 7BXymHmnX31/VYbKaLFPyS4nOKriU04EHjnFVnROQCVEduS+wzlqxG564WS/6pwDqr
	 KvzNkHfYI+amQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40CBCCF2C9;
	Sun, 18 Oct 2026 04:55:12 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sun, 18 Oct 2026 07:54:59 +0300
Subject: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Reference the common fan
 schema
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-helios64-fan-label-v1-1-69a3f96d4efa@iav.lv>
References: <20261018-helios64-fan-label-v1-0-69a3f96d4efa@iav.lv>
In-Reply-To: <20261018-helios64-fan-label-v1-0-69a3f96d4efa@iav.lv>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2256; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=qUXxvAxXaQVads84aZrFPPsu7N7+O4+7hDtPOHnoLsA=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFlXAnW6rne+PmWWPE+rS8fks8WRg2tay/6tq3q6xGvf/
 SstFYtTO0pZGMS4GGTFFFkmHNK4lbHk6l9/D/MHMHNYmUCGMHBxCsBE8jcy/FM/t5ZBc7bC86/b
 vp8plRS1uBv+Zfb1cOlEhW7LmXPZ9NMZ/kesmrO6xvuzxpvQFRZFe1/53lfgZJ3xVq7dzrnScKr
 AZi4A
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

From: Igor Velkov <iav@iav.lv>

pwm-fan predates fan-common.yaml and repeats several of its properties.
Reference the common schema, drop the duplicated properties and keep
only the constraints specific to PWM fans.

This also allows label, which the hwmon core exposes as the label
attribute.

Link: https://lore.kernel.org/r/20250106173805.GA501301-robh@kernel.org
Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 .../devicetree/bindings/hwmon/pwm-fan.yaml         | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
index 6a24851fd80d..b5407ed52976 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
@@ -10,19 +10,18 @@ maintainers:
   - Jean Delvare <jdelvare@suse.com>
   - Guenter Roeck <linux@roeck-us.net>
 
+allOf:
+  - $ref: fan-common.yaml#
+
 properties:
   compatible:
     const: pwm-fan
 
   cooling-levels:
     description: PWM duty cycle values corresponding to thermal cooling states.
-    $ref: /schemas/types.yaml#/definitions/uint32-array
     items:
       maximum: 255
 
-  fan-supply:
-    description: Phandle to the regulator that provides power to the fan.
-
   interrupts:
     description:
       This contains an interrupt specifier for each fan tachometer output
@@ -51,26 +50,14 @@ properties:
       Time to wait in microseconds after start when stopped.
 
   pulses-per-revolution:
-    description:
-      Define the number of pulses per fan revolution for each tachometer
-      input as an integer.
-    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 1
-    maximum: 4
     default: 2
 
-  pwms:
-    description: The PWM that is used to control the fan.
-    maxItems: 1
-
-  "#cooling-cells":
-    const: 2
-
 required:
   - compatible
   - pwms
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -114,4 +101,5 @@ examples:
       interrupt-parent = <&gpio5>;
       interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
       pulses-per-revolution = <2>;
+      label = "CPU fan";
     };

-- 
2.43.0


