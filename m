Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364C93BE14A;
	Thu,  1 Oct 2026 21:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790891266; cv=none; b=sdggb+JlBXSZ/b4Lr3b+VaM6oCc/zMPmZDQD763I9sQ1ryxPnpb1Yl0G//wfPMlI9Ov90W/jGwC/M7OfpqiKkvpTvF0jgkE61RY0TkIdqgQTw067oquD9VUHSOcOvDhQmED/OzN3kSB6GG2AWRLcpPuEMGaHUe/Nf0KRvhgyzrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790891266; c=relaxed/simple;
	bh=zhCVovTgq9szgooTqlXFZbg7E2IBRpEqPfNhhr2j75U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bBxJ6gYWoqZqgRF/KhAuuAS1m2H/K5JOawn/qeMKFZg0VuKIeMAgKL+oPGgzBRv9zu3YU+14R97x7dD40pP9IckEaYMnX5UDwIiZxhO51VKtHwxQMWxb6scp1PfMhn8CuiTC3/yU2kww5UkkMaJ6pSnMb8bjVb2cfZMguB/YxVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpRTE4VU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpRTE4VU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C33BAC4AF13;
	Thu,  1 Oct 2026 21:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790891265;
	bh=zhCVovTgq9szgooTqlXFZbg7E2IBRpEqPfNhhr2j75U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mpRTE4VUpAQ+aM7Ub+oeBL+AfXIuv1y7JEBlMs1r7qh7BabrHwt9kkWXeYWqoDdBq
	 SaXSHv89U6cEtByKvwuSqWejPbn8jHtnlQXTIf/YIfOCSGGN6x6xo0iZqErUfuqJVc
	 +CpN4HXf9/BxgbhQZYar+LH+hgB2cbpWDe4mMQbRA2J3+Tsph1zzkFET9vPyM9RW8g
	 pZB7LqEZQbu7QDOefRDM4ooB+04nLUiq22iKr/pVkSVCjhbqjMghK3EXYucOZ5dcrK
	 4zPVClenGq3f3vPLDeMZmotz0vocMhjcM55UNddxU2K/mPbR7jUdfTC9f18Zgr0RZi
	 yXB7yZR7Bsbtw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64FECA5FD2;
	Thu,  1 Oct 2026 21:47:45 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Thu, 01 Oct 2026 23:47:39 +0200
Subject: [PATCH v3 1/2] hwmon: (pmbus/core) Register the thermal sensors
 with a 0-based index
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-1-bfafba9fcc95@free.fr>
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr>
In-Reply-To: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>, 
 Eduardo Valentin <eduval@amazon.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vincent Jardin <vjardin@free.fr>, 
 stable+noautosel@kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790891264; l=1633;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=mG65M6EasOH/v1ceIH1BpodMnyEQw2kyvmfq+6YKBMg=;
 b=hWMOs2Oc1wBtE35LiijSma8llAZhS0oY2npML0aD8qw/ZS6RHruuUhciyRvn8WsGEt44R9xYB
 lT9gu/eHu6yAJuh9TyCVf3Bcwwh8bYZj/WQLeTao1QrjXZRVsdDCNJB
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
 drivers/hwmon/pmbus/pmbus_core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index d69f1bde1795..af13408c62f9 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1524,7 +1524,12 @@ static int pmbus_thermal_add_sensor(struct pmbus_data *pmbus_data,
 	tdata->sensor = sensor;
 	tdata->pmbus_data = pmbus_data;
 
-	tzd = devm_thermal_of_zone_register(dev, index, tdata,
+	/*
+	 * The PMBus core numbers its temperature sensors from 1, as the
+	 * hwmon tempN attributes, while the thermal core expects a 0-based
+	 * sensor index.
+	 */
+	tzd = devm_thermal_of_zone_register(dev, index - 1, tdata,
 					    &pmbus_thermal_ops);
 	/*
 	 * If CONFIG_THERMAL_OF is disabled, this returns -ENODEV,

-- 
2.43.0


