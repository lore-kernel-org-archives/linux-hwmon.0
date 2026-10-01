Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3643337187B;
	Thu,  1 Oct 2026 21:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790891266; cv=none; b=QTvCXCNvXj8is1xs+ZHhncQZv53GERGVNHYigW0V6rRA2c5kkgyHHf5V9NpaII2jJJ869j0BlrfWHDGqqJlBxktyMj7WsS1x4Q5QuG6CpdeZXrjhDZ0wy7KKfy+GFYUKKI5XClUsnzUsZJlxLWOG3anDw8wMTSbsiW3zLjep80Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790891266; c=relaxed/simple;
	bh=XgLCMU5zIrZZwQNutJJesO+eoJC9ZiYaGt8sH98H9v4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TqDHaH4up+0zd60Dnfnp0dH6RcP6IMHbSPCTqn35OLFx2y44LCeMcp5RPqYtfF5Ni4eJ0h/FchqckoyiBvCgPmYwm8m5fq0dFP9sau83r9n9UAVZ55qvJZAzF+husNQGk2s232SG9GL+cYtDh4+1M9ZM1fvgpW+EFqsMBKJ2zSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KbfWut2x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KbfWut2x"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA8A0C2BCC7;
	Thu,  1 Oct 2026 21:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790891265;
	bh=XgLCMU5zIrZZwQNutJJesO+eoJC9ZiYaGt8sH98H9v4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=KbfWut2xrF6Mrd+AAn4xDqBfB0ovRn1rJX4rvrFw++t3o5ou8L0putrRmEUC1I3FL
	 QfSh+53tPDNoWFxF/oLG/bStB1YSEjww4J6Xe6RdzIGeX1ML1l4lcU4gx2MMx2+XWk
	 TYVgP3NPDKsLA5NLgCV358cfjL6kuKd6oow+A+bYvMPs3eEqeONNIsm4zEb24RFJv3
	 ORYHG8z3LIQuGIZwsbBUddM/InVtvOihYoH6n32jo5mX5ST3Ckh0Quq+JEjzVFLlX0
	 Gq54krzLlBj0pECq3GmsqBRuG33CQeqZ8sPXPjZDEL2SnWTCawVls26BdwokAv4dh/
	 QXd1GQ80Il1zQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F74CA5FD4;
	Thu,  1 Oct 2026 21:47:45 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH v3 0/2] hwmon: pmbus: 0-based thermal sensor index,
 mps,mpq8785 #thermal-sensor-cells
Date: Thu, 01 Oct 2026 23:47:38 +0200
Message-Id: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPrUvmoC/52Nyw7CIBBFf6Vh7RigFqor/8O4IDBYkr4csNE0/
 XdpF7rW5bm5OWdmESlgZKdiZoRTiGHoM5S7gtnG9DeE4DIzyaXix5KDHwgeY0yEpgOXoBvvta4
 rSA1SZ1qI2Md8sdi2EazW3ihnqgNXLCtHQh+eW+5yzdyEmAZ6bfVJrOufoUmAAFXp0mpVIfr67
 Alx74mtmUl+1IJz8aNaAgeuXalqZ61S8qteluUNz02paUEBAAA=
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>, 
 Eduardo Valentin <eduval@amazon.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vincent Jardin <vjardin@free.fr>, 
 stable+noautosel@kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790891264; l=2006;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=XgLCMU5zIrZZwQNutJJesO+eoJC9ZiYaGt8sH98H9v4=;
 b=fXUoPBMKKvQprKkl0wUD0skaHgVFwkMC52FnO4MHb2Me/JVNUYMbXtQG75cy3z/Y3Z5+WiC0u
 rfKVnywva1PBb7YSxhHUi1Hu6IWcVmIwjOfoqTUIJ7Sr++RvDiCsn+J
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

The PMBus core registers its temperature inputs with the thermal core
from index 1, while the thermal core expects a 0-based index.

Patch 1 fixes it, as Guenter commented on v1 [1].

Patch 2 allows #thermal-sensor-cells = <0> in the mps,mpq8785 binding:
each of its devices has a single temperature sensor, on its die.

[1] https://lore.kernel.org/r/37298c5b-aa6b-473a-8e22-d29ddec12c04@roeck-us.net

To: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Charles Hsu <ythsu0511@gmail.com>
To: Eduardo Valentin <eduval@amazon.com>
Cc: linux-hwmon@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Vincent Jardin <vjardin@free.fr>

Changes in v3:
- Patch 1: comment devm_thermal_of_zone_register() for 1-based PMBus index (Guenter)
- Patch 2: commit message enriched with hardware,
           one internal die temperature sensor per device (Conor)
- Link to v2: https://lore.kernel.org/r/20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v2-0-07d368dcc662@free.fr

Changes in v2:
- New patch 1: register the PMBus thermal sensors with a 0-based index (Sashiko, Guenter)
- Patch 2: #thermal-sensor-cells const: 0 instead of 1
- Link to v1: https://lore.kernel.org/r/20260930-for-upstream-dt-mpq8785-thermal-sensor-cells-v1-1-6573c765eef8@free.fr

---
Vincent Jardin (2):
      hwmon: (pmbus/core) Register the thermal sensors with a 0-based index
      dt-bindings: hwmon: pmbus: mps,mpq8785: add #thermal-sensor-cells

 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml | 3 +++
 drivers/hwmon/pmbus/pmbus_core.c                               | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)
---
base-commit: 4781ca52761e666cf18b591e6bb0478396c90320
change-id: 20260930-for-upstream-dt-mpq8785-thermal-sensor-cells-c77fa6da5406

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


