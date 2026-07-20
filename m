Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012009.outbound.protection.outlook.com [40.107.75.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3580F394793;
	Mon, 20 Jul 2026 06:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529486; cv=fail; b=Y7m20MSr+vlDAhhnsqlE0IKaKeO4T8MlQqauz5EcCd99dz6A3RMvyAkYzxIJ5I6QNz0sjM486eYoUxqV4rWFWcN0zbmCDSjjN8MAyv9MET0GzTp1JaxORFNeBgPxeI+j8OZwOeFDxaXJa4x78agsWF9Nuj+6fERhyWhRcxjqPEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529486; c=relaxed/simple;
	bh=c1xHL5diieBShAHE/fzG52LXa4b1QxtaghqBFjBPOW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DhBMR7KTEQ2FB5hKo76m0ni8ocRPFHMBtlMEM0e3n87m3WfT53R5iiJiUwD7znkHW14IiaUCMlmtic8OCZ212qCiWD34NHKEKE7FBoMxA9ksKX6kJkDscacnJaz+E9FDPu09+FoqXJzXHMyBCg06vTmEOfCKXFoKHADbO8mRslI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=aKzoQWta; arc=fail smtp.client-ip=40.107.75.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="aKzoQWta"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWEjp1WXqJkGn/BWnMXaxSSWLqzmsRbPN5ibEhyZtncjtiHhH/eLbVuWQvx5JixXqo0iNQ8c3NlxzWB6fGdg8mKRsEkX+nDKWesffReCYWgJlqSwuwWTiqjwmfeLXeKEJPSlFgni7v5DS5qFqdfSATpfMsKMKUqKK8ucOPLz1muuHxvgQNOVc7M0wcgVDmPjXwoF4Y0zgIuL1tAbCvqAgNmqrNrgVDghFRsqkwalUd56J40vnIH9WMcvc8cwJB8fEjhEPV73jJHwIUHuFEByixuOPmgXzcbvZfCpJ7Pt7JxfdNRe559Gmn+KqIPxZdjd+NPR9UUyjg3m9e0uR7Tvag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdJCqpg6SzP8lelE/KnsMZz512sYGkhUzBx3SUVulnM=;
 b=LOf/vzeiuZLtZwvovgybxQ3KNc3LtUaLWpdOQsHtHVl990R69jXJ7lShVcUxD+B5SVJhSVXsuMX5ZElT9zAx59K8eyhJYm8ozHDDI6IbmBgcbfzdlcICEdDhMdbl4mIR3l7VrQs3xXmCbFMie65JGnyawpvzPPtAhy4a+9z64M+F9nj21e//8PHf5vnulJKEFdbxJF8ohWgG1G6zqGlZLYpfiqfXg3LlzlUs8Uodk07hIfDUCa6lKbtimXRqNof1PVGiHd0U2X/b3dkWaXYe9zlwiDgPZ8DzEkIS8T6CvU7AhyzJzBFmbSZ51qhzZBBdDW+YVyr7A++xNE6QOBUMKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdJCqpg6SzP8lelE/KnsMZz512sYGkhUzBx3SUVulnM=;
 b=aKzoQWtatQM/RHn2rNaFLEUZTEUaVPYW6iOcqK4L8ko0AvldysJKOFNt799gQY08yjdg+6FaOrY+TfZfpxTVRuWINbmVh0FkRGMd6VrqDPzN1JzVrJqGqxvmbwb9Iknohr3GQY0EFXb/dIbHkyaNwNVFKyGzC4prAIK0frUhkDVshx+MPu8QV/P4RTLS87M4LC4rfwVy4lArUxhuxbFjVISNdENK5vYKY4aCPP1dwGcyyXA88KstJWYwLGrrk6YulpIxFNAYaEfeFZmYDJ6w+/CAieOqCzS9z6ZRiS15dAnXJwg+m7vqENIyg9E43Bjo4tJ2WX2azBB/9qMh1SE+3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SI3PR06MB8491.apcprd06.prod.outlook.com (2603:1096:4:2a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 06:37:57 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 06:37:56 +0000
From: Pan Chuang <panchuang@vivo.com>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:AXI-FAN-CONTROL HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH v2 1/7] hwmon: (axi-fan-control) Remove redundant dev_err_probe()
Date: Mon, 20 Jul 2026 14:37:35 +0800
Message-Id: <20260720063745.309331-2-panchuang@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 77659f9a-b85a-4115-0951-08dee6296f27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|22082099003|18002099003|10067099003|56012099006|11063799006|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info:
	PGOtpjhb0PRlaAlBc6E8l82ZTSCtECN7p9xLIsQV5tCSOUYV43fWT2FxFJ95U6U9CahkD1bm3z4cxzwI0ibh0xNVfnRM7p8Tb5olKY/JgOORgAu9z6v7p4p3sE1A98C7Y8E0yxx/R+9owYMVIgKiU3qUQok7bZlFr2m+2Sy1GnAq3cCnHjhC97D7zPdCrJhgmdQUCDhJNK2Oa9babuu8yiTNefU5L0ktieM2Sk5bcJeMN1zWvU02sf8Q+uXmId/x/osS47wIVdtIflcvKbNChKK4+YT33yCH7V0KDT7VO9hBph7v7fFsFv8dvFo3cWGMHtkg+MV3TOAeiRkP9ccakmyUbbNvfhFzE65xslmn1AKVTp1An4LSYJGqFwhKn/paCJ11nlt/SaBBqmKEPuQIalxPwbs5sBG9fsZGWmn1Go2shQhLyO6MHh0u9nPALzoIjuxzPeoc0sYLDKEh/9iKu2f6AR8lNRAEHAzk2Tu88wFzfiGoaRw6Xq2F5BkMDGsNyvMMIHWRfI63m9vnb/xQP0ue3MHcwdM2YF8osUFq/VdNqmYHFuwnhJN/ElUCl8JFilsgSecctAtk9l6cRTctOTTx1U2GzKkcwHQ9nT0IJAqInuQCnscRSMIbPhTz/QHFrJg6o2dY7IM1TETmgQUrxZJxb4gH0G+U82H2L09VlTk0BhLHTOuPs77a8mNqWJ78CLokgzPg0zk4YtdehbKp7gRffAQW6DpdagcK14/lIkg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(38350700014)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oi7cacbfSc6qEgqn5HUs9hf+0cVEz5gGB+9h51EKD2TdAWEGk/qo12NYCASP?=
 =?us-ascii?Q?kTDo+lgmN+CALEThB86RdqwYw8yYkejSsJbBp3kp6gclVRAvZU/c7nImi9cS?=
 =?us-ascii?Q?LkoJvWgAEjjJ80YleO1UebHZ3LkqWwsd1NPyQKU8jK5mCsLfEFISfLqGFNWy?=
 =?us-ascii?Q?K00JJ2foFm1xkgHuUMwUxEHNF06PoBhhmIxvyktlwibTXcoZhm8uJunyOeQX?=
 =?us-ascii?Q?vYkReyWSelDM82sKHd4hV3z0pZcWZNctH+WnRGtaVXe0OCJ69LC5t2yEWcCp?=
 =?us-ascii?Q?KfW0obbp94/0ce9t7NDSavpsg7hVe9nnQ+sQe4OZtfaSLfvPa0+jrTa636K/?=
 =?us-ascii?Q?Ma1jmHBDQvppA0LaUxLDk66SiWh3CJbhbZQ6Rapz+JVTS2Ti8SgRVPshL0Hu?=
 =?us-ascii?Q?g5m0/c1mlCrgS0zTtakDz0syogZRMulzk+NbQ1TqzNMMrOHJLmy2Xx7BlniJ?=
 =?us-ascii?Q?UICAGe+OVPFqpYC1R6BLFzcD4s4LVdt9k6sPdOI6EQfbfUJr0I1GIlPU3JIB?=
 =?us-ascii?Q?aL+z0EAzc6FVaoz+k9OBoj5XYGGP1nlRYt9yZrjp2I2Ucb5N3wK69RwPkxJb?=
 =?us-ascii?Q?8HWl+e3mDaTKB7SvfO7ZPxOY4g0SoPwPyj9bbXKEOEFgHAEm+LHLJ3hSwaRP?=
 =?us-ascii?Q?A7dfIu6kmqDwpTXGL6DYRopY4Eic98hPVl9lrIOn0vYHbUMEQ/7bHsCBaPUI?=
 =?us-ascii?Q?uz5Pp39MW38Huouz9dNHAQr+x+2Cpbd4Bbnog+Mbxj+tVUfSsZqKEzbhXE52?=
 =?us-ascii?Q?ubww7EYfKC0JuS3whuGiwcYMeuXUfJ01h2HJBOSrJ2UFumk8IjeDJhkIticw?=
 =?us-ascii?Q?No9HQRlXH+tRUN/FSSYu+CAMdlapHnrQrYT6nWxw4aeig0O8KIWIB3EhTQRj?=
 =?us-ascii?Q?cQM01FfTypWf64pUITmGsdiDd7yW1cMWc2p7KQiYcmQeZDuhlI3ihDmqE8vT?=
 =?us-ascii?Q?CyozjBaeBE2O9FZIWWRNCM8lbWLPOpYdoYQuXFidEbB3anBUqJJsqIE9y6gu?=
 =?us-ascii?Q?pKFmy80YeJvqh4abBikKvzmt1PI39y+6r/r5R66j+7qGpWyfTqf7ovrbIOt8?=
 =?us-ascii?Q?lvomSKQTYGaax+F8pUIaNEJaVgLLmzLsf9lttSQpSA7K7mV+2UpZo5vxPUSv?=
 =?us-ascii?Q?g7u1wu2y/d2ycZ6FB3wJ3ykaUyffhcMzk2cVyhL5Ghm1KACcMVMZFD8+xOy6?=
 =?us-ascii?Q?6u5KUHKqv/d0djewjkGhdAaW9DyyAyt87lrrEyZOuqMTOjgXace0AOIuQzRk?=
 =?us-ascii?Q?Zk0GprF24T4+idzLP199YetlQqlgjFIWBOTBgAqtwNX5+wZWrjLQj00W9Gim?=
 =?us-ascii?Q?k5g6WaCj/vtzupJ9y4P4m4FdZewhJUkKW6i2Mz0wUaIZfnaWt2EyA3Q4/M3x?=
 =?us-ascii?Q?l0K2KgdRJFVBaAc1hGc8FYLdFmGJ9H1mVnqYnRynb9ZKl6ZKpz1pZoxLDJ9v?=
 =?us-ascii?Q?+sR65V1DoqXcOFd9+IrknfxrD9nXLGNjyVPC/cNegb1FsZqLnAQ7xP4wzy3j?=
 =?us-ascii?Q?XRI+tZr9gXBEigGZMDqJaXLAEZlrg85J7T39JoHFQ1ycN7eLxFEvA8UHYV77?=
 =?us-ascii?Q?ie4OgjYICBkkZ5xhnq8Vg7mWkc4aKcxxpnlHhPuk78DN0NZKfXLCKx0Vk2hJ?=
 =?us-ascii?Q?PWfqLnsRUeovExI3cxMpIEFatBWv5J/fHoaq0SOTSyX7iKJ0tnoH7iNbBAxG?=
 =?us-ascii?Q?Tf82oBiQLUze8NpJExFzM05aXiq8Y7/VpGqp57Hbg1nvK5qA8JW0xwdwwz/5?=
 =?us-ascii?Q?GGFzP1ZnVg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77659f9a-b85a-4115-0951-08dee6296f27
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 06:37:56.8692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gv2ZPjq2J1T4OlDNDklom9/DDWAQt+U+vpk/ih34gv7SYvAfYNP26O+s+xc0Ce7bq03PtMV0q4f33nPbotXipg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR06MB8491

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/hwmon/axi-fan-control.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
index 1cb481a1ad26..04a767d762b3 100644
--- a/drivers/hwmon/axi-fan-control.c
+++ b/drivers/hwmon/axi-fan-control.c
@@ -508,8 +508,7 @@ static int axi_fan_control_probe(struct platform_device *pdev)
 					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
 					NULL, ctl);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "failed to request an irq\n");
+		return ret;
 
 	return 0;
 }
-- 
2.34.1

