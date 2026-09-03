Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11021074.outbound.protection.outlook.com [40.93.194.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8440A37999D;
	Thu,  3 Sep 2026 07:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419404; cv=fail; b=lu15VD+huAm+bBB3YivfavFWBWGROZ6jqFgACamAOZhYTmQYXg3Iu+/kEtujVk+x3turtvhS/kGgCjTA7Y5+FU/kFK1R/ZodR5jtDQf6ZcXf8w9hIHiXdVah3921Wyo4BrcL1HYNt/bdm1b/KylPiNTqsYTt65YGPSomLlmDO/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419404; c=relaxed/simple;
	bh=AWTDGP+Y3GMJuXhjAj9aQs35vNsykrdoOaZQxfZLj3s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kl1UY/1MMQ8ZlTbiH9cj1woTKx6mNwIGSVRSkEfeiTDREkm+dOLAw+1NkE5CqHoOrvOXvGfAHiiC6y72w1QNHV9toxChQuTJ/i8BCXn5yCIdyD1m81ztTC4fAlgXczDgieDT2lH6skczLS1a2hmoAqSugDiQkZ/gtIcXvE+PvIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=GHh5cEar; arc=fail smtp.client-ip=40.93.194.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="GHh5cEar"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJpIps9LadbzldBWm39kG3j6xnFyTV0AKaP51X+7G0QUaJVNPPwVaX39hfZWQcMOIVmNwilVARrQL7I0ZJvetCSH76JOj/uo7khR6OqWqmeiMT+vIiOgFUZM496KwLIe76RgWAJDtfIWvLoA0SGXGM1CRaummDxmrlnS2jn6iuhdRM1RBSta9+D3AF4jBPuYX8e+n1yiBMgI2GGxRw8C/TZcSho4vNjMerAgbshKSbNzuXr7+Cm0W9ScRJXb+Vtbri3eMoQAhk+6RF/KnM1bcUIXo5hUCEqJwAuhQx7RERNIfyeZaDVLFpl6ipg4DqqLP6nFfpt7tFgcVBu+n1qYCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f12J5Rz/9eHW3yt3/ueF6OVukjlaxuCuUKukykU73N8=;
 b=XUFcNHltYv+H838h8BMAp9XqVHsw8MAs/sA45dFtbiA9wRHNDNksUTzLrLGsda5wkvHkS/cjDmSjB5i7WaFMBGocd7r8Xw0ZKa/rjsCsj66+5ciC/PFyQVxe9dqxkhexYukv3VkiRj6ipxjnBOO7EyfvrZZ6mFeMyLyoacSFndiMxgKXvglSHRm4Prgwb72irza90Mu1EFNPbXxVh0nlTcWLLVopkLLktwqB6KUaCibGk/lxcmPD/roY59O5AlqSvpFMlSXnHj8laG4N5ZXomleJpL8O1NK466M1fzZZ+w/riOCDxhcudaNlsjjEN0YmLZlN6HDbjN4wPMBobBDrQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f12J5Rz/9eHW3yt3/ueF6OVukjlaxuCuUKukykU73N8=;
 b=GHh5cEarNyvixOjAkvRJUZYQcEx4FAcvFFP/D+C6UjrYo+dUu9wHyHCNb8CDetb2qarc+MUY2t7gu6tfdQOLBhlfUbSAIZMqBVqy4huqxHSS9+6qbd3g69ffW5bjBHLDpwAISlXFosmJ4Oh191vyL0IW+oND9PdjAosUCcpuIF95F27YUAD4KNHLMpaRWJgQ1oq28D6sEPFftNp6jRc5gyRTX0sPFmuRxvbR1Qzp9FleV/hzvZcPnTokfxqRBjzrn+mBxGZD/8uXThsP3vDEe58EDBwylBM1ybXpxbF2XXQeYAzSs52RVfgWOfNnay65i3b9XunWzHHDbSxtzRtFyA==
Received: from BN9PR03CA0950.namprd03.prod.outlook.com (2603:10b6:408:108::25)
 by DS4PPF96A509F30.namprd18.prod.outlook.com (2603:10b6:f:fc00::ab2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 07:09:52 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:108:cafe::3c) by BN9PR03CA0950.outlook.office365.com
 (2603:10b6:408:108::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 07:09:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 07:09:51 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 123F04186B51;
	Thu,  3 Sep 2026 00:09:51 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Subject: [PATCH 0/2] hwmon: Add Axiado AX3000 TSADC driver
Date: Thu, 03 Sep 2026 00:09:46 -0700
Message-Id: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADodmWoC/yXMMQ6DMAyF4asgz0QyoELoVVAHJzHgDlDFKUJC3
 L0pTE/f8P4DlKOwwrM4IPImKuuSUZUF+JmWiY2EbKixbtFW1tAuFNY8DSKapBS86dk63z/caDu
 C/PxEHmW/qsPrtn7dm336p+A8fzMpx0R3AAAA
X-Change-ID: 20260818-axiado-ax3000-tsadc-9e8bc95bf87a
To: Akhila Kavi <akavi@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org, 
 Petar Stepanovic <pstepanovic@axiado.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788419391; l=1656;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=AWTDGP+Y3GMJuXhjAj9aQs35vNsykrdoOaZQxfZLj3s=;
 b=IE8UFEQa35degBnaEioVGdxWEQ2swNSln0ysCPv5BCzJTynGiSEa93JWWi73Mp1cNnZhgXaZb
 3HcNNO4VLxeB/3n+kBBJiguZ8J6SQOxIm8SjG6bf6EuBK6cEA/BG+Jz
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|DS4PPF96A509F30:EE_
X-MS-Office365-Filtering-Correlation-Id: a2e5e8c1-3899-4b93-7547-08df098a5971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|36860700016|82310400026|921020|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/CRU4Kschyftp7LMhPB3oWJkaRxt6tS8m1kiFA4gPCBQj+HKXTkockKpBhOlH4YEnyuucmN+64HeYjQ+CNwR7JNZzOINKwl8phYD/PVmIHxAweDwasYKe87473XqijPd2klFribRPbONoNcyqsmgOlIGs3FZiLT9DxjLKVZ6xb/6KiE8fWE6Jpd5qbpHQg8My3kAzB9JM2C7FIWbTyuEMeDexGkdu/FfNadwaw2H/BOzaHr2cS5D2MkaVuOVBFyO0ftiXNTokqf/0UVBTjqBxuiOOkFHd7AyHV0Bs40xf9AI9l3HDycWpRUJCzM3Sw0cgWuZNdjNdkJ4EolZVBh0ZXY79m7aDMT6X4qUILefpa3JSj0KKwRNG1ZEcxK3vwbkfBS+Dsy4tQ7gQGbAW6WnamTHyK2NexQVUoS8o84nOJfWGILJ/Y9kgzA7PCWpaIPVnbuWnZjG2pNymgQYY4OwdkIFWEpRhGvA93GRY+i3h/Xe0ubi7umdtfgPWVxus8z5uhKPuFXt77FHWusEaHuTtT1EzZIEhDTB39ekUy/EJb3SbHd1w0cR31L5zsaBjCNcWB4pr6dRNsH1vvGxxuo6javW2/jDci4Lrakfxs9KPJ+y0+TcwIFtvabRG859IapYHSD55QkwebLujFoZZ4IEvIjJNEyk+BQoROJQcYo/U5gFS/shMVribfIMkXHAZVgoBUX1e01hGj+DIxrnbWEqpD5avyRqYut/F4Gs/u6eW+i25TLKbhquOBjbwxS7DC/Z
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(36860700016)(82310400026)(921020)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yXt4Bq6Tvokx7ZN+pxYFwQQ4dQfYjxC5u50HjSF1oJH71B2kOEf0NCQctmm08XwxMnve9mQbWbj9MYzS0r6tmfEVdNYxSEWDZ7v928HX+MCGs1GI/qTbtwazQF5OFt91xT2t/2/JeCnp1Hxr5kOBYbHBRhLp7Z9jj9mIn7hPA5V77NbF8LzdbPHpv85x9IER2gLHTVrdWgyyXMIblNUvDk5ygA046J1SPpoDwxbJB2zkHX6GDmQC0VKF8RFdF1+JY8XLPfUb7H7a0fNRvyQ1MdDOFfZSvUy0tc5bkVlobVZlFKGslKR9qzOf44t2kPOKdSgUBK0MAbAckR/jOrSS8mDai2UN0qTTqsDK/6om4gMlYulmkB7JlALupHl1+7zmiBzqUiQZtPL5DnX+aLb0SiZMMvQCB9+hgirjMM1qwNfHe7uNZkMgE15fpVqp3OFB
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:09:51.8976
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e5e8c1-3899-4b93-7547-08df098a5971
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF96A509F30

This series adds support for the temperature sensor ADC (TSADC)
controller found on the Axiado AX3000 and AX3005 SoCs. The controller
measures temperature at locations within the SoC silicon die.

AX3005 uses the same programming model as AX3000 and uses
"axiado,ax3000-tsadc" as its fallback compatible.

Each TSADC controller is represented by a separate Devicetree node and
registered as a separate hwmon device exposing one read-only temperature
channel.

The sensor is configured for continuous conversion during probe. The
averaged 12-bit ADC code is converted to millidegrees Celsius using a
lookup table with linear interpolation between adjacent entries. Raw
values outside the characterized lookup-table range are clamped to the
nearest supported temperature.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
Petar Stepanovic (2):
      dt-bindings: hwmon: Add Axiado AX3000 TSADC
      hwmon: axiado-tsadc: Add AX3000/AX3005 TSADC support

 .../bindings/hwmon/axiado,ax3000-tsadc.yaml        |  45 ++++
 Documentation/hwmon/axiado-tsadc.rst               |  41 +++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |  10 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/axiado-tsadc.c                       | 275 +++++++++++++++++++++
 7 files changed, 384 insertions(+)
---
base-commit: 8ce12a5ddf8b86bc5b92c454e85591b1729b78e3
change-id: 20260818-axiado-ax3000-tsadc-9e8bc95bf87a

Best regards,
--  
Petar Stepanovic <pstepanovic@axiado.com>

