Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013029.outbound.protection.outlook.com [52.101.127.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9983C466B68;
	Tue, 14 Jul 2026 13:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034224; cv=fail; b=I320calwzTX8k4ciGyIDHaAkyI8wOfmfTCV22c1euVu7eI+mJuQOpOeSi7O5Ct9u86H/tzynhZkgm+5vqXKhKogNGiDT2fmtCBVqJAqLgG8rB+9St2NdAg8ppTU6dm99tAqoHESpNCEsdnTzAWgm52gbttY7bTieqnkQX73IY24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034224; c=relaxed/simple;
	bh=FdqmK4R0ngTIrWN/atOf0CKYzv/ic6y0wiSj8kXgJWE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BUZALicfSmau9fzUWeagUvUGueQBBx9DfMFhkVoAaIANz5NNmFZ3sAJIAYbmOh6Rn0jQVFf+AfTI/a1FDf+RnWbB3TaFGU5Awyd+SdlFlH0wQkLCWRT2GI5P7T3ZiYNvHjOLcFMdLBFSM4hkJGaBw9gCjGbPp+ipokIbLzHfrgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=NezwkluQ; arc=fail smtp.client-ip=52.101.127.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="NezwkluQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkTzkLqC3SnT0YdHpMqVbU9U1Cp0JFPbHYK8Ly2R8Ait2M1N49AX8y8Z2nlOYr3juoXpZtPL779D/HqNDcCQgWhmFQC8lVf/RVasEq06OlJwhGsmr32ZWRLrak7ZY0zg8xEXGRlSykHC6cxf5OgqjfE2pLp9TXD0cmkX7NZki9R3wEmDV2rTTgcno1XhuZFkkf7w3iyl4SolLuKDiAf5nyt7j+p/aqTxp9porsWycqfGDaEiHxLI9QUOBwKYW39ZGg79tqJXc7UhLAxCi2QT8Ax9SZG/h3m3hL4zoKe/mAMWxh+FDVQEyF1fJRfmXY7DiQ6cOM8BxQz8YFKXz8iq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDkEPnGPwCC1QhctPu5atJ1jJsA0SzjKdAX0CD0CrPY=;
 b=oT7AMvrLGvh09LfKs2Iz/DL7sc+1JcnWT/c7HHNtIH176NikqUK/KLFWuYVEk99AAu2WVzrhTIImVl8oGFottGIbEQBJT95EzRnfok4bbsf03pZJxEuof6Iq+1f3fWBsmO1WLVpI5DFido9/zAVyFRNrOfM6Up+80Rb2p3BIdpJ+HhT9YYSrJOzmoFfcRxibGMJp8/iiEv4aTRrOU8AhihW8hkak7NMHNnIzLnSYV4hN7tUUJgEC8eNaAsz3BlCqMUyuqe9xjgLOQfbbJKFo7iJIOybb5avL2rU5Ed7oHrz4AK8l0ZREcBfnRQ8KnTgLfJ2wSDOQcbxuwod89z6bsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDkEPnGPwCC1QhctPu5atJ1jJsA0SzjKdAX0CD0CrPY=;
 b=NezwkluQVpy0e+qZVFnRTCp3/Wb5s6QSAW1dYI+5ducUyXn0V/MaaxGhg2bHPh6oMIAMgBeRS/ghrkww3xSf8DBZdtErXgGvjprgdfvdM363RfxHSL07gpSPMoxCTgiP8iBtnQ0QeeNNo/XogXsqVRLvbwmJyL77aVqLN67pRUHcyZfKPSNd66v8TsYEsA/dJMYQLf84pxQblWVKK1hU51tF8Py4iA2cy4g2RshA1LjHs1KotO6/jdKlegEoIpkF6sSJUZW+WSOOnVmVdS8XA3uSTAz0myTK2zeILUlVPAeY7Z0qzpCXOSvSg9H1zTnKGD/RkS9Fwq0XGJUsRM4Mag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SEZPR06MB6666.apcprd06.prod.outlook.com (2603:1096:101:17b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 13:03:33 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 13:03:33 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Sanman Pradhan <psanman@juniper.net>,
	Pan Chuang <panchuang@vivo.com>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] hwmon: (pmbus) Remove redundant dev_err()
Date: Tue, 14 Jul 2026 21:02:25 +0800
Message-Id: <20260714130228.449233-3-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714130228.449233-1-panchuang@vivo.com>
References: <20260714130228.449233-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0305.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::16) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SEZPR06MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: df4a620a-166c-4e3d-bb8f-08dee1a84f4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|11063799006|56012099006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	DhbQ5XlzxanbUX6U5kh/BCuAKYLbW7vgAycXbev+oZbXFX9CSMm3u1457KHYbsezimBnNQh47H7scajtzPQHWjDQmxqllESDEyw7rwasRRd8O0F1rr02os+iEHslLESkMphWu6tjInFB2XvUV7G2pe+1DD/JRwkyfsqgOWDbZuaDhoprJAAlnwPC16a0sXhElQbvG/s9j2zHmLcXwimGMZsT3QA/pIaImROV2tvBYK/S2QUirA8BVKdF249u96H/kIG5mupe2d2gyeGbBPIUZuwEXJTSwN4EgBGf/LjSw1YtXjQm0JEvZre7QLk7hoZdVr3tcCdHHbT4K1nZabdknBb40XELl31XLXakEEfsa7IzVAEskiCbM1GlGoqpiBwjPbbEfvLLBD5PkPF3DFucd9zr4+YPXBW+M4fYRvmEOr4MLbOfRnwgYfD1kfv2IjeOClF7wO4nJDUFVRx5bwaJt+d0AqnOUZc/iZhJcrlzw/MYFkQonBEGJ2pPaUOoIq8+g8VBRPsjRGMvAD/4QZQQjz8Ih2cc3R7p8JMh4SAHwV0jEIww61AndmQfr5ty3Xgcj6zB4+Y0t2O9OrCSEWeg469uTRCWjEW22r/aE1rw2c07IAMbGD7U6I7m7ogkSzlKkYfS8D4Qbv+k7QVsBgYTahQhy2qdY+oHZ0IhbE9u17aCalECIBvLuCshUFKFQjMFPhhFGeZGCdPskbWIKzmj0auOGqfWUeIVoNCxXaT0+W8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(11063799006)(56012099006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1fgi7wmz04vXR87VcVvlMmR2okoE1yadbJCOW/zPGsxeWf/NIlTyuTv464ia?=
 =?us-ascii?Q?1eEPUV2AxgJFSXuOugwogQ5eMxx6nZUBsJChrGGwHSfG03QwfN/10MALv/ds?=
 =?us-ascii?Q?23ZK9zFFZQVQ3celgyOjhWQ0gYlVTRmFqdyoTsl5USSZmODCgMCnzd5Tz2uh?=
 =?us-ascii?Q?cxoDlM93Z8JagRGAlUyhOxvOC3F5oSL93yxY2jtGOAPER5ktVzZkR3KbW+H+?=
 =?us-ascii?Q?bQqkuCign1GjO+xslYNH7GGdGH7R0VboaBFi0w5Nx26JHa6N5MjV78kTp8Ka?=
 =?us-ascii?Q?WEMIyOMvVfi/NhNZq+l21cNNT5UMDm7lIlYfiLU+PzYnPChkm5xSyn+kJXSR?=
 =?us-ascii?Q?FImAIMJBtxYTeoe873/cDv3S7eIX/V60/AOO8kzrrN1wggEsSyvPqesgdYpp?=
 =?us-ascii?Q?PQoszoUSmyoed2bT5sQnNAXrwdoYBr+L0UOqSq92I4vb5hzOCvEvVTX6F4ut?=
 =?us-ascii?Q?5uJHkx9rOb1U1A0ecB0LybvgbdoAiTEvw0Kw04s43kHnYPOsqGihIXvNQoqB?=
 =?us-ascii?Q?lUGqCnJielmKg7j/K6N0+WFQjfQdQdTBhSh0aYJGH0Ifn8TogqtWMQ6IgN/X?=
 =?us-ascii?Q?LLUhYO21s2rzBoG6VbkjweubSDBH+By17J5kzU99Udqw6aOEON1ryFyfouXI?=
 =?us-ascii?Q?UMemfZ6HssO6/Xkpa4mZuLJ200mQKTYrsqWvSj8CUQ4r3irKBtKUQq8nHcVG?=
 =?us-ascii?Q?atVx64Kg0cinateKZedaMGxLRPc0wgikthazdIs6/8Ig7NcryoUVRJuKN8xK?=
 =?us-ascii?Q?MPftVCdSGx6Y/5fD0g8AR29g5KzFLb0d8BJNI/VC+nSQO3aEMqvFUu0pEtnS?=
 =?us-ascii?Q?4QkTKErX8BYPaTJY4p6H8CMOe+2Z/Q0l8yETvMuQU7suF7JzHucSCagHQALg?=
 =?us-ascii?Q?I2oxMeNqvSW6bF040wtqloTyhaS4PUN4/rVVvoDXkUXO2LuKOEHk8T2mEwLV?=
 =?us-ascii?Q?eClHDfpNp5dq2YGSX9sAkQKlSz2eRUl0hPW6zD0Ciu3f8YlRPguIQ6XQ0i4g?=
 =?us-ascii?Q?ZxXXbUOCxpuJLzs5n1mZxxKPX2Cl46n6WuNqL+oW3BDM++boUHWsHlhDX1z0?=
 =?us-ascii?Q?0QMCzGcMeGB1IMtHYydy/osKXNgvo6bGUjvA7/rtrVIL+PlHZxA0g1k8UugM?=
 =?us-ascii?Q?8uSRwsp7EmpECfNm0nWKcX6g21VZhxMNdLO/AaZCFWKO2fZ0DfcJjHDg/Zvx?=
 =?us-ascii?Q?kPnWtYmgfF0hS1WLMkoGjuBKHj7i6VQ+FCQ2jKx2GygDs3STtGbTo+FWRJfG?=
 =?us-ascii?Q?c52GFlfOXPd0R6ZegEUO3k9Ou3bPW54+7Qq78LS7ZfSVKEUZEtkMLmVneZUz?=
 =?us-ascii?Q?9jXmZkF99LUFwclIAelo2Yai6yzPvcA213xOnF4rY7tckJ9OCMgn0HRvSFhX?=
 =?us-ascii?Q?jKblByGLosP6fG88ASR+p3VN1oRHg91z/JK9Zj95DKfAhIniBoseClVOa3lB?=
 =?us-ascii?Q?X8hzqW5+bTHkfbl+/VX9W/zjSZBf6xZuEsU4HF/o4pknk0zTJX7XiV62SGOp?=
 =?us-ascii?Q?YqRQ5z9xnUU8Ik2MhqmaKRdZ8hUD2uHGvPqS+c2EHvz54xIlU6mcuE4Wc9LV?=
 =?us-ascii?Q?iWTmywZ+Bf8cddJ6cklPtB92iJ18TKB2QSEnSY7f14Ioxajbjj4H+qRm+NL7?=
 =?us-ascii?Q?w0buGE29Gsq9VmELwZNrN5miV6h/4c713arOsiU5vHixDsgXT6H9Dwi47Xtj?=
 =?us-ascii?Q?GaJgIWzda2HR7m4Mw8nxTKhi/PFHnS37y9eanr282IfDZym3Jv9KLTDjBlIc?=
 =?us-ascii?Q?25Eqz/7SIQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df4a620a-166c-4e3d-bb8f-08dee1a84f4c
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 13:03:33.6218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FttWb33ObHwj1zcoMp5NSf8UXPtkEdTOydQAaef4QiqffE8wfOtZep+B9ctltWOGd1jiJVU39Ku1I7/UwbwzfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6666

The devm_request_threaded_irq() automatically logs detailed error
messages on failure. Remove the now-redundant driver-specific
dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 3143b9e0316c..91771747e2ca 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3496,10 +3496,8 @@ static int pmbus_irq_setup(struct i2c_client *client, struct pmbus_data *data)
 	/* Register notifiers */
 	err = devm_request_threaded_irq(dev, client->irq, NULL, pmbus_fault_handler,
 					IRQF_ONESHOT, "pmbus-irq", data);
-	if (err) {
-		dev_err(dev, "failed to request an irq %d\n", err);
+	if (err)
 		return err;
-	}
 
 	return 0;
 }
-- 
2.34.1

