Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD4544D693;
	Mon, 24 Aug 2026 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586400; cv=none; b=no6h8wk8Yjtvv7+0Nxjfxh/+GCLvSZZPQ+0+0tXchUluy9nxuPNCzNSuvwzuiaX8nFIH/P9ADslQz62jQ6G9i3WrxHypOI+sPIs9Axtx6ufeDe25/Ps0R6oYlBXKEid0L0X3Ix8xVnZrCm4GFJyBmTpNxJ+gwb0Hkb+P3kWs+SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586400; c=relaxed/simple;
	bh=uK79qjAHQ3AeX/ICLt1IK3Zc2rMOVt3EIxkbNN6yzcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EpQpcwTuzAAV7yl/ih7rYQJ/U++C6biHPUYvjKmx02LQ72qe2JbwG9Os50ViS8/RXCcJzaD4lnr2gC20g+LuQEhwder/mCSTipG+xX1/WHSlaOTpZQDFtxTuI2ydVliGnft60z3GmCRYB0Y2lBZfby3KnPJL05Ft1wd1cQRUEv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKdqsc2g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKdqsc2g"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18E53C19425;
	Mon, 24 Aug 2026 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787586399;
	bh=uK79qjAHQ3AeX/ICLt1IK3Zc2rMOVt3EIxkbNN6yzcA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=oKdqsc2g5hSpUKr7v9UuVXoPwaZE8E6wEkEHW2jFd/xn++HvYMe55h7H6ujd3OXj0
	 LDhWTbcwnZ5o1dMnDyHn6Y0OyvyakC7Vg/XpDxnvIGkLjBB7oGdzemtUR39FrbDjiI
	 sH/dwG6QOLEtLah8Fcp2p5VHdxIpwOjfxONvYRB9HnkEwsU/HtzIg3D9+ogsDvtQ73
	 KpTwsTky+QmxHRXzguNQQFcnWc+ioZdNPx3R6V1lSrRcNoazN9+Pg255qEU8LwysyP
	 +YYob+1tFHp9duFUsTeDEadSptI7GZG1WzHh5oNHWON7f8mRqWG9Vowj3rlqclXXGk
	 a5We6Vpyy18Zw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E19C5DF94;
	Mon, 24 Aug 2026 15:46:38 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 24 Aug 2026 17:46:36 +0200
Subject: [PATCH] dt-bindings: hwmon: ti,tmp401: add vcc-supply and
 #thermal-sensor-cells
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-for-upstream-dt-tmp401-vcc-tsc-v1-1-ecb5ef7898bd@free.fr>
X-B4-Tracking: v=1; b=H4sIAFtnjGoC/x3NwQqDMAyA4VeRnBdou07EV5EdaoxbDmpJqgjiu
 6/s+F3+/wJjFTbomwuUDzHZ1gr/aIC+af0wylQNwYXWdSHivCnu2YpyWnAqWJYcnceDCIsRJt+
 OTN3zFThCjWTlWc7/YHjf9w+FU6QHcAAAAA==
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787586398; l=1364;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=P+vvtVa9Xt5cHsZaKRS93Aih5rhUVfFYRpn5jmhnpxM=;
 b=tyqh1tD1gWbAy0YYrloa/Zvko1FEsMvJGZPig0Y/hhR72qRY3lPu+U5Y750Qap2yS7PRxopyL
 C4Cmwnwe4M1DBtU9GERurozcJpLm4wnr/e1mcojtfHCg4rkRugJwSh9
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Both properties are used by the driver that backs this binding, and
neither is described, so a board that supplies either fails dtbs_check:

  tmp411@4c (ti,tmp411): '#thermal-sensor-cells', 'vcc-supply' do not
  match any of the regexes: '^pinctrl-[0-9]+$'

vcc-supply is fetched in lm90_probe():

  drivers/hwmon/lm90.c:2777
        err = devm_regulator_get_enable(dev, "vcc");

so a board with the sensor behind a switched rail has no other way to
describe it, and omitting it means the chip is probed with its supply
possibly off.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
index 0e8ddf0ad7890..69f77aec01a33 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
@@ -50,6 +50,11 @@ properties:
     minimum: 0
     maximum: 15
 
+  vcc-supply: true
+
+  "#thermal-sensor-cells":
+    const: 1
+
 allOf:
   - if:
       properties:

---
base-commit: 0a0d1d55dad570724bf8c7ea83409639cfb4be9b
change-id: 20260824-for-upstream-dt-tmp401-vcc-tsc-a16bec8352e4

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


