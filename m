Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DD6388397;
	Mon, 24 Aug 2026 22:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787609601; cv=none; b=m+NMhQMOBC3TLjVP3Te8xfHwGaA7Wrtl3n+SiYDvFKT2N854RFyV4GhbAaapz3JoYcazlQPiIDZ6NGIb3dm6ClQ9nWklIdv+O+gVpI4WT19WU0qRX8TGAtU3ayGvrkGSy947oJOjsNDy7HMrn1RoW6O/qyz0Hq43oef9ZiZd6Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787609601; c=relaxed/simple;
	bh=66gAA5F728DPnLnV0Pk8J8UFXieYvHaZlM+jBjqe1XY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KDe3xBi0zBS4+keO4DH0E5JzVB+O+It2oukoDk7BNgOY+OssgNeYpQHqbnt8TWL42Pk6YR1NIOAjHKe3EXbKnar7GVgd7uwV/TBU6tCrguWB+HZuQz3Hp/6v2Ktpc48tgQjg9kNptq6gbKOIlGazbqNKGyB9glt9ecfgVtFHlEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxJwOxgs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxJwOxgs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D0ADC19425;
	Mon, 24 Aug 2026 22:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787609600;
	bh=66gAA5F728DPnLnV0Pk8J8UFXieYvHaZlM+jBjqe1XY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=SxJwOxgsrzi7SmdL8jie4tf1H8drC6VEdvfX1KIMUuab14kW6auIdpHfbfh/ojVpI
	 rxvCAJMB6aGcQZyDuaVYM/D7+N3FFeQHufD1n5v56OqGZ8ePZHZeFSIdTaGLAbPPUO
	 jTi8sVMijUhq0V+CSObZoALEkqhAjNBe+7QkvsyyGgGa2BDXz0Zz8Ukn1gwTX0Gy5d
	 qVRghu8ClWwzVtnv7CnqcJXM6ym+itAFGCZEH+SVdqGdUMOwFBS7/fwSI5Hz/YvKPk
	 vlM4UvMRqWxWjXa/gAy5wnMsN8ULZvBQA5PmyOozrdVC++i/GEedzjaA1+g+wHSKs7
	 9i1aqYanRt59A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BF9C5DF9C;
	Mon, 24 Aug 2026 22:13:20 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Tue, 25 Aug 2026 00:13:18 +0200
Subject: [PATCH v2] dt-bindings: hwmon: ti,tmp401: add
 #thermal-sensor-cells
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-for-upstream-dt-tmp401-vcc-tsc-v2-1-cbc360ec51d9@free.fr>
X-B4-Tracking: v=1; b=H4sIAP3BjGoC/42NQQ6CMBAAv0L27BpaC1ZO/sNwoGUrPQDNtjYaw
 t+tvMDjzGFmg0jsKUJXbcCUffTrUkCeKrDTsDwJ/VgYZC3bWkuFbmV8hZiYhhnHhGkOqhaYrcU
 ULQ6iNWT1pZGkoEQCk/PvY/DoC08+ppU/xy+Ln/07nQUKJGsacld902a8OyY6O4Z+3/cvYiyKd
 MoAAAA=
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787609598; l=1359;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=7IqoE5ZhPOxL10nbXpkCyJzoAu6XP+fD0RzWcN2r5M0=;
 b=FUecG8K2/KSvdtWoot2MzPZMd10LKgOCutZ3Ibve2Tw8iklA7KBFKzC4XRGE6aYixuT6MTf/B
 Fz1OS0VcCQ8B3eARhsiJ/9oMUdqm2/gFH3fTRzpYkLWuxCxgQ/Mo79q
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

The property is missing, so a board that uses it with a thermal zone fails
with dtbs_check:

  tmp411@4c (ti,tmp411): '#thermal-sensor-cells' does not match any of the
  regexes: '^pinctrl-[0-9]+$'

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Changes in v2:
- Drop vcc-supply: tmp401.c has no regulator code, every hwmon binding
  that declares vcc-supply today has a driver consuming it, so declaring it
  as description only does not belong to this patch (Sashiko)
- Adapt the commit message
- Link to v1: https://lore.kernel.org/r/20260824-for-upstream-dt-tmp401-vcc-tsc-v1-1-ecb5ef7898bd@free.fr
---
 Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
index 0e8ddf0ad7890..f283b567d5b6c 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
@@ -50,6 +50,9 @@ properties:
     minimum: 0
     maximum: 15
 
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


