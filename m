Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BA13FFFA8;
	Mon, 24 Aug 2026 15:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586192; cv=none; b=hbL9ku/hhDSDI4SbDqKxP2e6f76w3YAY89Y/KrH9e8ylow20DMvab17K9P1mW+oGxAnjvdTpx/FHFAYb1N6klxq0fQX/TqxJzoIaQPkmQPk5Ri9ronwbAJZ/WiDxQ+0vYpicsZAeDGz+9CU3vSJI2rzfPFEzYUN+31rz9JUZSFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586192; c=relaxed/simple;
	bh=qKmyUFw8Q9BZVbJDN104O2PJEqzLFIDcYKL0jxDSmMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=C29XKn76YjCyhK7PUnM0POH1s7FZ61kCEwjcD2hsOl6yzpp+KPc8+178+jL+tE/f5K+PEu9QltyQVt89pmi1ifHl6hS2ZNWqPBDfPce57LweHqVXO6LR3YXsFcWJE6MWUUtoW5gjPI0WVKRNaXrEGuJZHJBLS/nPqK1Upm/9r24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZ1dzsnL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZ1dzsnL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67AA1C19425;
	Mon, 24 Aug 2026 15:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787586190;
	bh=qKmyUFw8Q9BZVbJDN104O2PJEqzLFIDcYKL0jxDSmMg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=gZ1dzsnLCxqi/PhGkaRrewjwsUd+j2nOywmqLfCCqQ0c7/7z2QnTj2uIFr46uqOmS
	 xRewIPSOVp6qGI2O+fo2h1hiDT2McsU4aRB5+EBSvhjjlB6Er8EqVgw4aYa/AjKi9I
	 uIldmcDDqrYzrtP7QNxZ0CM6FrKPcKLfNBhRnUmNPEserxWU2ThvW5PKVamTHJepZ4
	 UbXVPPt7i7Z1ISnJ0RMwEaenoLXxoGjuCzrzu12eKf/D6AgiTBSaYxrY5U/Ac7/scW
	 oydFX1Qhec0Zbo1qknh6N4z+qixrWyT3662ZpUJCF3g1Aj0AwK77ffkCkB4OrxHv8A
	 Ir3ngQVE3C5Dw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43562C5DF9C;
	Mon, 24 Aug 2026 15:43:10 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 24 Aug 2026 17:42:59 +0200
Subject: [PATCH] dt-bindings: hwmon: microchip,emc2305: add vcc-supply and
 #cooling-cells
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-for-upstream-dt-emc2305-vcc-cooling-v1-1-cd3b53dfb5d4@free.fr>
X-B4-Tracking: v=1; b=H4sIAIJmjGoC/x3NwQqDMAyA4VeRnA3UbBXdq8gOElMNzFZSJwPx3
 Vc8fpf/PyGLqWR4VSeYHJo1xYKmroCXMc6COhUDOWpdR08MyfC75d1kXHHaUVamh/N4MCOn9NE
 4I/mm9Z77XkIHpbSZBP3dl+F9XX/VYcEJdQAAAA==
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787586189; l=1919;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=OmD5dPXn6kP0dHQvQO+WQZsrUb0dqokp2zQV0VNm5M8=;
 b=4G02U1j9qsh/7z1101Y2ZOFcREgjfyaxV5RyC576UKmi5xTmFKqlPMRltcsjvqNE3CO7zTbt9
 o7k55ogWrPUAH4Eq0kVDsG0QOUVT7sfq80KsoDK0+MM+LeE9a6hHvKx
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Both properties are missing, so a board that supplies either fails with
dtbs_check:

  fan-controller@2c (microchip,emc2305): '#cooling-cells', 'vcc-supply'
  do not match any of the regexes: '^fan@[0-4]$', '^pinctrl-[0-9]+$'

The #cooling-cells property belongs to the controller node, which is
where the driver actually registers.

Two cells is what that registration needs: a cooling-maps entry
references the fan as <&emc2305 min max>.

Two cells also documents what the driver supports today. The
pwm-separate path registers one cooling device per PWM against the same
node, and they all get cdev_id 0, so no cell count can tell them apart.
That is a driver issue, noted here but not addressed.

The examples in this binding put that property on the fan@N subnodes
instead, which does not match what the driver does: they are left alone
here rather than changed blind.

vcc-supply describes the chip's own rail, which matters on boards where
the sensor sits behind a switched supply.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
index 8c2548539d7fd..47640214de100 100644
--- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
+++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
@@ -44,6 +44,11 @@ properties:
            - 0 (Open-Drain)
            - 1 (Push-Pull)
 
+  vcc-supply: true
+
+  "#cooling-cells":
+    const: 2
+
 patternProperties:
   '^fan@[0-4]$':
     $ref: fan-common.yaml#

---
base-commit: 0a0d1d55dad570724bf8c7ea83409639cfb4be9b
change-id: 20260824-for-upstream-dt-emc2305-vcc-cooling-251655c99ef8

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


