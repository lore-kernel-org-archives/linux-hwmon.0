Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D584C1DB120;
	Wed, 15 Jan 2025 07:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.139.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736926564; cv=none; b=UtiGwE5c9B9u9F+seIFF0MjP2fsPln+ueX8xZQNPz+5BYn4HNsntmv//4bNFO0qz3jPRaperCokPa4KJSPdnTavt8PsuAId7N1GxfzowR/Xv0iperiOG9nnK0xowJotHcVyTTRo78QNpbp3iTTXnKaJko1TfhswX+m0gdZZs93Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736926564; c=relaxed/simple;
	bh=75fdSYiwfdXQPnh/iEZR/5rzB+mRS2cJ3tcX3OV3VEo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=QF2jhAp+YDj3vAnFn3aynT31PysAWiNyZnTsNv/U2jzGDQldCKx1Axq2fyhhJVoNqHZhU3o5uSHg6FyN/ikQUhu8yGTQaO3mhC55hauugCMbHGcDWvjFQhlZE0tAhVN5kGlFUtwt/iHOuwStL4JVwZDRn1CnhIOl0yqRdok6LdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aa.jp.fujitsu.com; spf=pass smtp.mailfrom=aa.jp.fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=RHmDW9cn; arc=none smtp.client-ip=68.232.139.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aa.jp.fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aa.jp.fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="RHmDW9cn"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736926562; x=1768462562;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=75fdSYiwfdXQPnh/iEZR/5rzB+mRS2cJ3tcX3OV3VEo=;
  b=RHmDW9cnfB5FLVelfVie9XL/Qn7oXOmLA/SKVj1dirsUiluUSAjrBSKW
   mGq7GIwmddajsUsnkEWhqB5mAEaDzPizMnKlGkNa24ToNcEz1giIK/KKu
   rP/1eUpGK/tb7R8iv5J4vte7mw+IY9cNjrO/nI+OB6NeNwhQVBfGnRTeW
   PLK1E+tbVg/bd7InX2qCmE765vg1p95EgnQL8Ld7fPZnUtTp/C3IPGt+B
   2NfVpZ0uIjcPJIL7sdcl6hGNqBNkYDDT8k+XNdAPZf9EUNuE/B31wdbmm
   r5ncdYNqpb1MQnqNoAfmXM9MLqQ3v5mHcKR6IocpKzWoofOVkEDujA4Mj
   g==;
X-CSE-ConnectionGUID: nhuUKhy5S+uDwTbhOWhz+g==
X-CSE-MsgGUID: z6NE+IuJShu2fUmF/0In0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="186839168"
X-IronPort-AV: E=Sophos;i="6.12,316,1728918000"; 
   d="scan'208";a="186839168"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 16:35:53 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C9D2796742;
	Wed, 15 Jan 2025 16:35:50 +0900 (JST)
Received: from oym-om4.fujitsu.com (oym-om4.o.css.fujitsu.com [10.85.58.164])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 99F6DD50AC;
	Wed, 15 Jan 2025 16:35:50 +0900 (JST)
Received: from sm-x86-mem01.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by oym-om4.fujitsu.com (Postfix) with ESMTP id 3C6654005AE75;
	Wed, 15 Jan 2025 16:35:50 +0900 (JST)
From: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Huisong Li <lihuisong@huawei.com>,
	Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
Subject: [PATCH] hwmon: (acpi_power_meter) Fix a check for the return value of read_domain_devices().
Date: Wed, 15 Jan 2025 07:35:32 +0000
Message-Id: <20250115073532.3211000-1-fj1078ii@aa.jp.fujitsu.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit fabb1f813ec0 ("hwmon: (acpi_power_meter) Fix fail to load
module on platform without _PMD method"),
the acpi_power_meter driver fails to load if the platform has _PMD method.

To address this, add a check for successful read_domain_devices().
Tested on Nvidia Grace machine.

Fixes: fabb1f813ec0 ("hwmon: (acpi_power_meter) Fix fail to load module on platform without _PMD method")
Signed-off-by: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
---
 drivers/hwmon/acpi_power_meter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 2f1c9d97ad21..dbf2c606fe15 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -682,7 +682,7 @@ static int setup_attrs(struct acpi_power_meter_resource *resource)
 
 	/* _PMD method is optional. */
 	res = read_domain_devices(resource);
-	if (res != -ENODEV)
+	if ((res != 0) && (res != -ENODEV))
 		return res;
 
 	if (resource->caps.flags & POWER_METER_CAN_MEASURE) {
-- 
2.34.1

