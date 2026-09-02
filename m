Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8C749C4CD;
	Wed,  2 Sep 2026 14:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359682; cv=none; b=jV0BaNKIf0pjEOb71fHpA+7CEsC85duY80zIlMA4TTPI7yr8DPZ8Gh4U0MMCnfBONNikMj7exAXJZjoj0bNIrAhwanOjxhZAbPfYKBJQdih0btyRucRWdNhbY3ZA+JS17UrpEDQdyHX3TPhXG0jpAaEj6OAE1vPV4DscqyGA6WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359682; c=relaxed/simple;
	bh=AVdaTgc5J2CZct1mArWZNY96rgu/WyPsFUSO1GQ8uJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cGAOT39GzmHTlKWe3VHqSLKPmpoWyHobZqu0n+KiskL14ow+qTro0Zpzj4BwJEchqMTf1bagGb8+23hiqkDpwmJgVWLeH1UfRy/redhu5LZq33lk/L9CP6nxy6JW51ziB8zk6eA3QQnaHpnFKdiDlHJVVaNWbnIEor5IzfZ4hDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYG6sg41; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYG6sg41"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41E23C2BCB3;
	Wed,  2 Sep 2026 14:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788359682;
	bh=AVdaTgc5J2CZct1mArWZNY96rgu/WyPsFUSO1GQ8uJE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=CYG6sg41tyuBSEbIvBt+L4ZEtiT3g1s8s0DC26y/QBkZnqkIEddIMSxsSHIFGjz0W
	 PhYVG8sU/6YkMEY80Vb9025AoGIoETBepPW/xOdwnM/mUEju4Cw5LnaTOaoTUz/els
	 JBLYQjkBS7VZYtEy6aT4cGTGvrRbQgk5PDi5fSBR4AztlrSSTdkHMYz5XU+1MpEj89
	 v1+j/D3N8goAkovxqBUpTH1T69XqgSN3rbBqadxdvn8RmGBxXN0MED7OOxKZGFDUN2
	 HkjV/zN7UhqGZoj+AAEm69hmeLp/NlWd1Kio8EWVija0K2zeL/+DSnMkhDEcl/wIvG
	 AVCopauS6IMEw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D656C61DD6;
	Wed,  2 Sep 2026 14:34:42 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Wed, 02 Sep 2026 03:54:00 +0200
Subject: [PATCH v3] dt-bindings: hwmon: ti,tmp401: add
 #thermal-sensor-cells
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-for-upstream-dt-tmp401-vcc-tsc-v3-1-49c484d2f08b@free.fr>
X-B4-Tracking: v=1; b=H4sIALeBl2oC/43NvQ7CIBSG4VtpmD0GaKmtk/dhHMrhYBn6E0Cia
 Xrv0i666fh+w/MtLJB3FNi5WJin5IKbxhzloWDYd+OdwJncTHJZ80ZWYCcPjzlET90AJkIc5oo
 LSIgQA0Inak3YlEpSxTIye7LuuR9cb7l7F+LkX/tfEtv6N50ECCDUiuypaRttLtYTHa1nG5zkN
 6Z+YjJjqLGsOaESpv1g67q+AR7SCHoXAQAA
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788314042; l=1832;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=7R3pcu6eseDa7fzzVvZHfd5ptFboQq6wZTkdZSwBKr4=;
 b=ifr4eNv2wadubCmVyxfaX6jr9pERAMOm+qJqkhJXZlWlgfvo3mfSl/ukqc5N9ujyID5g7C0/R
 pdRNAGAXfLlB+KBbo2B4GDjVmHwkiH5WvytTVm52ut5QMCGvt0hUvSh
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Since commit
  a3b61ba2558e ("hwmon: (tmp401) register with thermal subsystem")
the driver sets HWMON_C_REGISTER_TZ, so the hwmon core calls
devm_thermal_of_zone_register() for every temperature channel and the
device can be referenced as a thermal sensor.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Changes in v3:
- Rewrite the commit message: justify the property from the driver,
  which sets HWMON_C_REGISTER_TZ since a3b61ba2558e
  (Krzysztof Kozlowski)
- Keep "const: 1": every chip in this binding has at least two
  temperature channels, see national,lm90.yaml
- No change to the diff/code
- Link to v2: https://lore.kernel.org/r/20260825-for-upstream-dt-tmp401-vcc-tsc-v2-1-cbc360ec51d9@free.fr

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
base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
change-id: 20260824-for-upstream-dt-tmp401-vcc-tsc-a16bec8352e4

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


