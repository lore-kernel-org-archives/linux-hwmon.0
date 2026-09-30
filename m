Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2F14E2342;
	Wed, 30 Sep 2026 13:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776606; cv=none; b=m3liyQMgHEUqBO8vUOnB0eBhRN2lC8tDEny/ulYzAIadfIbrUJ18u1p3+WFYDb6+l5jIQkacBmZQ9Iv1Zex5UXjYo9uUgnIn5FOiQvguKjof1f3/dF9QOzcWR/vw4UcWfqj6Izq6NUvbZghN6GNeUYs1FI0DOz9rihzE8pcFQEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776606; c=relaxed/simple;
	bh=2waaTEMIfVSCYtkKqXR17NEFU9n+6QDSCM4A48otUBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JLh6FUAPGDO8T7oaqW/d4tJ05PJGH96bKFbM6grNJHzGpeRfqb7B4UxNYTbwomZ42B9x/cWd0xBknwZLB5d4BC0cy+Foc/w7BFx1slhnA5sFLe3O6N/xKfQ+2Gi7sdidOmtoYLYWhyXjDaGbuiOeCtKBB4RkN25rNNIlE+5geTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYhR16B5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYhR16B5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 056E5C2BCF4;
	Wed, 30 Sep 2026 13:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790776605;
	bh=2waaTEMIfVSCYtkKqXR17NEFU9n+6QDSCM4A48otUBQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=oYhR16B51aURzCGvmRDT4mNzI+Uo5kslw1n4BweZ5af/dXvL9VRj7QTt0+JX/QWlM
	 AynwCKORJ907Irexa6UWgUhwoYJiZ10zTK9yRSs7KiVofLfafIrN7/RVEkJ5IVtu4G
	 LnWMnXNRoGnDooEpJLVFR4RiRUEs+LQz7pfAHkRYUEUggVK2wyWtPkVY9PCfrSyHyQ
	 tlqhq3Dx2sPTumM+sn9/LLNpHwCwdfDQJwPC/esFpeAknUKkeL8PFAFykIW0O5G5Cg
	 7BOOGLLgF29s1cQUC/kuZ/X9qN09RkQJZilwEUh7TWwnfpNHxGe5QAgi68toJkUG/z
	 AhRpabapm3QiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D77CA5FC7;
	Wed, 30 Sep 2026 13:56:44 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Wed, 30 Sep 2026 15:56:41 +0200
Subject: [PATCH] dt-bindings: hwmon: pmbus: mps,mpq8785: add
 #thermal-sensor-cells
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-for-upstream-dt-mpq8785-thermal-sensor-cells-v1-1-6573c765eef8@free.fr>
X-B4-Tracking: v=1; b=H4sIABgVvWoC/x2NQQrDIBAAvxL23AWbNpr2K6EH0bUR1NhdWwohf
 6/0ODDM7CDEkQTuww5MnyhxKx3OpwHcasuTMPrOMKpRq9tFYdgY31Uak83oG+b6ms08YVuJs00
 oVKQrjlISdMYEq72drkpDT1amEL//3fI4jh+/nZ1xfgAAAA==
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790776603; l=1384;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=fJu0E0lhwn4WY7ROYdjtoIwXJWiiVnoOzna2Uqs/R6o=;
 b=S6v23x2y4mhv6bbX+x4IkpdMvC+sfYk/SsxbSh62xvhhP49+cA/mPtYtXG3oOUdxwc9xlsLEg
 FzUHhNvdjjuBPWNJvP58qKCee6m7m+bpvh1PnxlI9q7Ox5FR/tu4T07
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Since commit
  3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for PSC_TEMPERATURE")
the PMBus core calls devm_thermal_of_zone_register() for every
temperature input, so the devices of this binding can be referenced as
thermal sensors.

By code review, it should work for the MPQ and MPM device bindings.
They register a single page with PMBUS_HAVE_TEMP through
pmbus_do_probe(), it means that one device has one
temperature input, temp1.

The sensor id is the hwmon index of the input (temp1 is 1), so one cell
is needed.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
index d7a32fb3b7af..36760d89f665 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
@@ -34,6 +34,9 @@ properties:
     maximum: 4095
     default: 706
 
+  "#thermal-sensor-cells":
+    const: 1
+
 required:
   - compatible
   - reg

---
base-commit: 4781ca52761e666cf18b591e6bb0478396c90320
change-id: 20260930-for-upstream-dt-mpq8785-thermal-sensor-cells-c77fa6da5406

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


