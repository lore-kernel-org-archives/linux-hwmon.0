Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013071.outbound.protection.outlook.com [52.101.127.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3783B27C5;
	Mon, 20 Jul 2026 06:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529511; cv=fail; b=Jzxbc7b+C1bOrodFY53tmJhjM85EgzgTtCTNHGYqkTY4NvZrm9AElJzcFYXmnLcEoJ0B06Xr0CsPnl86Nj8cKuqRZM1i+8O8CZeeJZmQdqNoBcNpagq51rK7sknd9wT2VNydeOBne/WF+c1vaRfUnIJgJVy1FJn9leWud+PFCKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529511; c=relaxed/simple;
	bh=TtOza7Gv2S6x1yOFTDSyZA1Fla5X5WWrZVkR1ybeIik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pZP211vccMR01KdYQr5U/jmUS+QL46f9tTXT6B10ws6gk5CAFRybJcze1b92EzKQwIshX0zSu0vUav0Vgzg1Ei8I+RZmQNXLi0/MpCepat20JE1WUQzgp0MJvHpWOyPqxeIRhR2ZnTma6QtTZcM05fqLo1g+N6juQhTGoVyQiDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=BgRhfJEW; arc=fail smtp.client-ip=52.101.127.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="BgRhfJEW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aykqc4+JF5nqcrwvFtONCGbnuHxMNWVZBTzL7Y3xOd7iJVyL+f447Pikf5zWNclbP8eojzaZB8o3m5qx1Con0zj24KVwZLTIdvw78OPOtpLuz2NVrCGQIzn1VgiQzt7Jx2T6e4FLvo5TO119YLgZ8Ju8NsuOlMSzFFv3gQdu2IWB1a/i+ggN1xRAp491GmqCCzelsUH05t6HYpE0ExhlIBl2sKkQjdrYSGJCdOYoyR366J0hRdiOXysdSo1kMIsn+zZ/gfte3+8dkqdQJyzZh9BeZpaCgOitHyeAtJmeZlALbPANE1cakcH9cOxD/0DcadP8Js7OTK35ZZURBiywwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFuLR3vGoou5no7ELJs/O8RlS0x7NTdMCbiQK+s22sY=;
 b=hvVP6EplmG7wT2QFUn4bqzd4aHJwMBkxU465o/GFSnFNe3aCmR0OQf6NXRuv5zZS/8LeNlMoLhe4iUH/R1wHocHJAUvr1Jc4jzKHCWIzE1u7cSvaoJyTC5jZ+uiGLeYop7JrtZrITmSIbG0jTt3Miq9LFbaXrTkdUDlnQTaOdccgTIlCOxgb336LD0dt62Y/3Rt4XegJdzFgTAHSPbNrz/d8ZDlRpOgMIoSo0UaeIyDzapOZ1ylryo6+QErW5mIlGezqmzB0cIRhwR7S57kkE61ppI+WRr0z1y8ODRkxVy4BirEwUKlnGIG4KkajmqqdfunryMdxTgCOvdSOi1f6OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFuLR3vGoou5no7ELJs/O8RlS0x7NTdMCbiQK+s22sY=;
 b=BgRhfJEWCmuKL1a2zrpqwhjRlcrEPBCAJcM6yeYWlf1uTltN7ZCbSCGPIQ4mXThq2PLUlVE2x+O2lty5pT9iDnwdV1iJp+bx++mY1So9y9802Yy6dt7ptW5Ab0J/0DUQR0gEpmL8cB2eJjXYMFNMavGmDBQiUuOGhQrnkImMavZ1YuF1yoEcq0YH4PB8V/urXuMF/klI5yd/o8Do7hJXi0ywrXZiCLKHUKm8qLw0gjT8sfGpyThCmWCliA7v1tB/mgB5b0Rz4BU7UJdEEZtIjZcaix7pSplP4ppWEzoa9k9kCKSF1s0k3dmt1zmt209DZHorYT+65JSV1K+pQjG4QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SI3PR06MB8491.apcprd06.prod.outlook.com (2603:1096:4:2a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 06:38:02 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 06:38:02 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH v2 5/7] hwmon: (pwm-fan) Remove redundant dev_err()
Date: Mon, 20 Jul 2026 14:37:39 +0800
Message-Id: <20260720063745.309331-6-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720063745.309331-1-panchuang@vivo.com>
References: <20260720063745.309331-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0107.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::7) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SI3PR06MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: ec8f4d5f-07f9-4469-8d2d-08dee6297286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|22082099003|18002099003|10067099003|56012099006|11063799006|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info:
	pDom3EhtCXFmQb2mVwmJ5bREmhpYn7kgV0M/5wRwApde01S/LCBNR2t3lEZqYuOHhDsL42f31bFAOvXl6fjR74q2bEgxrNCkTiEyoKFHc4DldSr1OX/eksO66mTNokfTf1bMY/0I4dMmAbc93XyHhdVSGh7hcjVq4hH4CMxNnPyYyxO//mjbb9XHv/zuxhPb0hbO7F5Ur8664tLgvkI+e3rqnLGd2e0Rhs/f4rRSIYa5MKxKzsOBFb11Oqtk+v12B92PhMRGZ/8i7MnKcHC92uQnA4B+CeiBl06uW6I4JIjHRjhJaq95C/p/fJclmd9YFIDhbca926cNzKPFNZcwsQ9AS5CODF/C56i/9p7Prf73WaY05SM36HJBdWF9dnQellqIYlrGOTd+U6QK0OetpvO1zkPj69xeCpofUV0/Im+HdKT5E4r1L4pMaOZ5Uh8Ltat2GRywRc4uligGR1IXuDFQWUdr5bIhI0TzUSMerbsC/7pqGxZeSvNFOuneIWMTu+dP3GubDb4rYmIFoHca9lQUIt4D66Vq69yYri5Oo1Qaarok8M0jY7ABJ1k0eR1D4GfQQjuQJUWBdGSpYHF2sX8Zwlyp5KUcdnqZQFaV6Y+9BqeINJcSGICQ+R3rXvk+fh5i82mVTtAAphBeT4dc4880GJ9IxtzEsameFUnBI41FxvfRDcn9WJJ4Fs8Hus/XoYEmzfaRAL0KaBXsiSE1HNuCX0Cizqx9W+WRoUA1rlg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(38350700014)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UG/v7zGZSSuQNG0wjjG+LHbDXpbEFIexfEO72h2EG7KjkybFcHmz3XHmBYgw?=
 =?us-ascii?Q?ayULDlMok58QozU1tBAXxoykXCmlwnhz6NDoX/3UJLIRkX7HgOfxs+aKKFOw?=
 =?us-ascii?Q?eROe2jZAmJhSHr+QeoMERxmZ5suUITnkjMjFWwaVZZYbfZXgFh5G4m2tEI4p?=
 =?us-ascii?Q?H1pQRxPFSvAbcSkT37/Zdc23knZH75w/U54S6UEQTyD/4HQJLoAMc7vedgee?=
 =?us-ascii?Q?TjLcUHIorJHIyL7FcP7C6E0Sqtf61VEeYX/DajBwdEipAhaUane+CDcuMGiM?=
 =?us-ascii?Q?DCitCqyoHnbwWOo6bqEPRV5c0OdUkl2V6fTFZE0vLcWMXlC9IhuodqBELiBT?=
 =?us-ascii?Q?eWgkUExE4rnvA6lvuVSJdbxRoAPouEj91icHTX10nCAJT3mdAw2ZaXU7IgJG?=
 =?us-ascii?Q?0bouAyDJNAiJMKeWO9yvb5bkk95T0wiPPz4YUv+sVX68/oH7d2nAiWRIKRtA?=
 =?us-ascii?Q?sJGhQr5q2Tf3PhLHUh4DLKGP7/EB6OWBKr01naZVGnmAHJVGw4ISHWsSYLUV?=
 =?us-ascii?Q?JrZ2YfE+MQbEUeCi0VyH0uQv/RHHY6IBqvWtljdrWNrmKhlMo8H6eDY0WFzt?=
 =?us-ascii?Q?Je5vuJ+v4rPxA13PRs4E32y3L15uxLyYwbrrqS3P/Zj/B+8Yxx9ewBUG2F6W?=
 =?us-ascii?Q?9hqNbeFB2/4R7ezctql7UC5qIW4eBi+Yx0N8dADgYbrNgCS8graRk6Y27a0T?=
 =?us-ascii?Q?vnmoVCeq4HIfsZzheSj4w2qa0sUWvyJM/gCYPJACZGN/qhpn7y+I68mROghq?=
 =?us-ascii?Q?yu8YEhwekN0cb1voi/+BztfDNfqkLf58UVh+KNp1TjLmvkcJDkbjh4Dzft8t?=
 =?us-ascii?Q?T3Il/IQLg178iQ1bqhjxCuoa+Rkm5ap4MiPIzS2sTRAFzuHQMVrDJACyyRGQ?=
 =?us-ascii?Q?XgnFGQsEf8p8lCDnkve4V2fzdr6DHQdnMQjdgvbPP0dKM4DILN/2jD3oNDf2?=
 =?us-ascii?Q?1XTSDnr9trXHVsox7Fmv1gKg+9lEYnAxPVyq5O3y2PQeOKbTqm7aUIFhUUeh?=
 =?us-ascii?Q?R3EYDytRUiKWfmRYoGvf+Th1IRCCWKxtTZCJvpYsaoGBbLq0wLpSnuJ5UZuO?=
 =?us-ascii?Q?ujsOn7x6kLJaqLQrgMsP329HDrYpmvWPibz3s8dd6rKfJ4343wRsQp3aumte?=
 =?us-ascii?Q?TjWrMFkF9IdZ3uZfH0wjdCD4BNrwLWuj6yg6oqe9AAyIrxBbE1e77wb/87Ep?=
 =?us-ascii?Q?Z/gkCvZYqz1wBnoTWy5In34F/4gke+kbunjaCufwhvwZO27WGVVvir4quhe3?=
 =?us-ascii?Q?jVSyUt0Ns9qDfuamenAvvoRzUXGgnQcTsUBZbrtuG5Vnr6zhy+b51wkV+K5c?=
 =?us-ascii?Q?ik5o6EuPau+Fx6bAphlap/Pi6mnFu7gioi5aJhpT5kQxwnZ91Tx61RSI5Scv?=
 =?us-ascii?Q?FjNkIHv7YlRKolQ5g8/6wmLYxzXdAhBXloga3mq9AXqMwfuaD25jphtB0Lzn?=
 =?us-ascii?Q?VoAL847mpUfO01YeSfjhcf66z/z+vKwWyLSxbfhFmq4k16NOsJTt2KT6V0VJ?=
 =?us-ascii?Q?RIY2e5HKskIPWJsTu+Kl3EqBLsQ6Lmr3kBYW24wE6jiFePxy3HE8xHyZlAD2?=
 =?us-ascii?Q?qsTk6aMoAU/Zp3vRvGy4KEoMegquxmnn/35V7p/Mafgi1wJxTqDdY1vsnQTo?=
 =?us-ascii?Q?PW8Ol3bhz3qFI1mPrsz2JZRxyKyQdoEPBLYEsCArPDoOUgw/hLNI9pEzR3fk?=
 =?us-ascii?Q?Ri6ibue9JfnflhJgARJ7XZySR16MxC2CMYunHr9/F1EhkVK+viiY2UGCrL9n?=
 =?us-ascii?Q?q1am6+hKiw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec8f4d5f-07f9-4469-8d2d-08dee6297286
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 06:38:02.5169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfzl/XuXYhqDbaV8quWWe4ItKvb900cQqbYJRPE+CcSZISXTorwuF2MCdd3aLCX2xn7uBf9VFvRGgdZ76daPXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR06MB8491

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs detailed
error messages on failure. Remove the now-redundant driver-specific
dev_err() call.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/hwmon/pwm-fan.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 37f37813ea51..3b87f65bae05 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -628,12 +628,8 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		if (tach->irq > 0) {
 			ret = devm_request_irq(dev, tach->irq, pulse_handler,
 					       IRQF_NO_THREAD, pdev->name, tach);
-			if (ret) {
-				dev_err(dev,
-					"Failed to request interrupt: %d\n",
-					ret);
+			if (ret)
 				return ret;
-			}
 		}
 
 		if (!ctx->pulses_per_revolution[i]) {
-- 
2.34.1

