Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33334D9577;
	Wed, 30 Sep 2026 13:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775896; cv=none; b=CWi8R3WG4rRGCcLCPFOwJ8Rpjds1UH9/PyVptiY6xK6T6/oXqyFLqHfRuIK+oyddHwPu0cPtvW9VokKwBGIK7iCvf+/gaz2Pl72TMH8QPv7SeGjt6ql2mKov3W/JNsUlYUKwbc/xGPYMHtzJs9hDqXPnwRM3vfav6tY+zkFDHIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775896; c=relaxed/simple;
	bh=D8/csY7vk5JiI2dwhOnZ3cGEak57aEsmG/f8ADj6iKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J6h38YZv0wmDLchgNec5LNfbQJ5NGz42oR8VRW6ciQ0OGqHK4uHY/drmld2kHUrq8VX5/dCHND7hpbL2Sdvw/SMvaOlVF0+vegyToWWxHe8eCO3ylL0PEY/2KFsYS2d05eeOpwQgCNwfRvXVUjaGEm95Dr0zGlep2tCssndDXZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=keeUh/eZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="keeUh/eZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 832E3C2BCF4;
	Wed, 30 Sep 2026 13:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790775895;
	bh=D8/csY7vk5JiI2dwhOnZ3cGEak57aEsmG/f8ADj6iKo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=keeUh/eZvrUEVuchzgbyynETeyMzA3mcLieefLWkDWWfS7vSXJ+jCxR27D74i44Lk
	 GdJG477Zva4L7h3p/u/FWzV47lXTpzRmJY/9W2b3SyzA+uxON++4qk/jpatn1LkXKA
	 pCWEURKSqHdMvzJwIIP0SSfWX4kX1nKZ52uxMqTwA1dQxuspVn6qebgEEpOY861JIe
	 +ULxWzCWiiLac5AXfkVEX13PvP92Mlp/EBEpdVBGrPWMM7VORk2w76pn9RWhebm4WR
	 rm87Nib70jti2LYl0sd7V5Iv1R3WuGHC+JxKxKGhYUZjzFLOlkW74d/XTe0VL/1tzc
	 mhLOc/BAcjNow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70545CA5FCB;
	Wed, 30 Sep 2026 13:44:55 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Wed, 30 Sep 2026 15:44:51 +0200
Subject: [PATCH] dt-bindings: hwmon: jedec,jc42: add #thermal-sensor-cells
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-for-upstream-dt-jc42-thermal-sensor-cells-v1-1-ef6365cae23e@free.fr>
X-B4-Tracking: v=1; b=H4sIAFISvWoC/x2N0QrCMAwAf2Xk2UBbtaC/Ij6UNHORrhtJJ8LYv
 1t8PA7udjBWYYP7sIPyR0yW2sGfBqAp1Rej5M4QXIjudnY4Lorbak05zZgbvukSsE2scypoXK1
 74lIMU/bE7upj9AS9tyqP8v2/Hs/j+AGZsob2ewAAAA==
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790775894; l=1166;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=mSc3Y85qyReq6ISJzbowfHld4A9js6Xfg/xK6HlzA8U=;
 b=pzPvbaToTilm9X2F2TEQuBc2nuZx6ABlJi3v5wZtop5UROQYGrf2BfCD9FYuD2n7VIEVx+ZLN
 cjrewKPNguJDHjYaLrUmadbxs7B41Ny/Y/r3P7Z12tUqvLMDmUxnqjo
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Since the commit
  032c1623c9de ("hwmon: (jc42) add HWMON_C_TZ_REGISTER")
the driver sets HWMON_C_REGISTER_TZ, so the hwmon core calls
devm_thermal_of_zone_register() for its temperature channel and the
device can be referenced as a thermal sensor.

The chip has a single temperature channel, registered as sensor 0, so
no cell is needed.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml b/Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml
index bf3332153ad8..d835664a926b 100644
--- a/Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml
+++ b/Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml
@@ -59,6 +59,9 @@ properties:
       supported on all chips.
     type: boolean
 
+  "#thermal-sensor-cells":
+    const: 0
+
 required:
   - compatible
   - reg

---
base-commit: 4781ca52761e666cf18b591e6bb0478396c90320
change-id: 20260930-for-upstream-dt-jc42-thermal-sensor-cells-ad1ce051661c

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


