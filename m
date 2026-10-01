Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4A74A3852;
	Thu,  1 Oct 2026 07:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839715; cv=none; b=HS3unp9Cm/t3eodOBWfyW0YmvCyr3psiH3swXByVjHrFWClbasyC5CRhVrqSmEeIlozA9Ht6fqPnIOG6gPrpHfetU/FQ0Sc/MUMYNyzNZOn0zAo6Z+H0BhpQfTbuSGkDmFp5Idf4g28u3y/1fwSX8DFj9YcCerc35l3HCQcPP84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839715; c=relaxed/simple;
	bh=vjiDJ9KI92HiiVf/P+QFIoEaMD0LqqiZ24GgMBN2aHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gB8/r7c7Y77u4xj3IkwmhBaDF1tSYaNtthp40+CT2AQutIGtDBOTNzaGjYhFsNXILFIFDMnXHSlJGyvUgQdGJBtqKXW2y12xtXZNP9YjstQ7tDXeMefZQzWRjoX5OgTZHV9B6jVI0sBK/TxekGbEVmmf0puvsOEwfcNza3ON0ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceuqMKFX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceuqMKFX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42981C2BCC7;
	Thu,  1 Oct 2026 07:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790839714;
	bh=vjiDJ9KI92HiiVf/P+QFIoEaMD0LqqiZ24GgMBN2aHE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ceuqMKFXm2ysUTz3pc7V58qxi1UIhd4pBzWlZ6y6Al4eq0h/633X3dysJ+MH6u9eL
	 FAW3p2Iuo4tLql1e9CPAbS2zou5fQJ8bHeEJqTGaD11ZExFoMv/IbQp30PbJIMnWKT
	 4vgQu7tuCdkihe36E49BYiStl5I+8M4jTd/rhnrGTw+evwKvHbm5h4PE7wVMU2TQPg
	 vZNzrfh1shHfh2sfUv/c00k+vOtefWlOMGuh+zVtJ1HOajINF9BzR3Smxydf321cIj
	 r0A1YtEYAez3gN0x0GRBEy69bZohFtCPcMa/Ewzujc8OwWN9g14QGaEfL4UuNaVkGi
	 k4BpPam2x98FQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216A0CA5FC5;
	Thu,  1 Oct 2026 07:28:34 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Thu, 01 Oct 2026 09:28:22 +0200
Subject: [PATCH v2 1/2] hwmon: (pmbus/core) Register the thermal sensors
 with a 0-based index
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v2-1-07d368dcc662@free.fr>
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v2-0-07d368dcc662@free.fr>
In-Reply-To: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v2-0-07d368dcc662@free.fr>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>, 
 Eduardo Valentin <eduval@amazon.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vincent Jardin <vjardin@free.fr>, 
 stable+noautosel@kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790839710; l=1454;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=q5/I24AkB1B38hg8vCeu1E6UaqF6E4IqFocqz4YLA0Q=;
 b=9icNdxt6j/VSWtTBDselsU/nPTPkjo0NdR+y6lHscJsZzsRwqXXJhJVnfNd5/N/GI6s7c3v0K
 DPh2BhMmWbmBzFADT6LrMZohyr0yTbl+/YVrFX9M9YmsV+KkLe1ugUV
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Since commit
  3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for PSC_TEMPERATURE")
pmbus_core registers each temperature input with the thermal core using
its hwmon index as the sensor id. That index starts at 1, so temp1 is
registered as sensor 1.

The thermal core expects a 0-based id, which is what the hwmon core
passes for the drivers that set HWMON_C_REGISTER_TZ:
thermal_of matches a thermal-sensors phandle without cells as id 0, so a
PMBus device with a single temperature input cannot
use #thermal-sensor-cells = <0>.

Cc: stable+noautosel@kernel.org # changes the DT-visible sensor id, no in-tree user
Fixes: 3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for PSC_TEMPERATURE")
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 drivers/hwmon/pmbus/pmbus_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index d69f1bde1795..dc1767d9f1ff 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1524,7 +1524,7 @@ static int pmbus_thermal_add_sensor(struct pmbus_data *pmbus_data,
 	tdata->sensor = sensor;
 	tdata->pmbus_data = pmbus_data;
 
-	tzd = devm_thermal_of_zone_register(dev, index, tdata,
+	tzd = devm_thermal_of_zone_register(dev, index - 1, tdata,
 					    &pmbus_thermal_ops);
 	/*
 	 * If CONFIG_THERMAL_OF is disabled, this returns -ENODEV,

-- 
2.43.0


