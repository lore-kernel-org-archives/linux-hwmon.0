Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012009.outbound.protection.outlook.com [40.107.75.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF933AFCFC;
	Mon, 20 Jul 2026 06:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529496; cv=fail; b=CwWsRw1KCk7fzbX/FGBiZkU6DtRdWmb7BPboSJw216oHj3Ju3kwkvCBYdNj1X05hU42JdJx53S64IMWCIIntb84F5HX6bTwu4+iN8EwiLmDYaS3H7CwPfqspPgWtYwFrlfXbomdTP/tak4uviR7COOMxcK3udCZC2gqZ6TZRJ/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529496; c=relaxed/simple;
	bh=+3bV04wFO2zwp/Dx98XooHvwHzBrzhsz4Kv04B84/1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kw5j6WyNKheR6ug+5se5/Vh46xC1P+dj9tJwfTdoDX7dhUO+vUOhEDWuS8ZuSUURlB0l25BlSP0/aJmOtguFcdAVlxlFkuySFMnEmK93yZW0hktwIe4NUeK+WwHUM+qdH40s2KA4MbpxS82YKUvr02Pkn8OHJw1wZEwgqmofMuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=XNZC1GYp; arc=fail smtp.client-ip=40.107.75.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="XNZC1GYp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SeEwcZoqZ9e6VUinVZha3bhBUbxs4rDYKp0FhFYs8wg/GdiuP6NdxEH1+2l5i7DLlBxyh3IuNoYH2gFrSo1PF1Do3+qyfQ7oKiFz3Ic/CSh8RvRPb5eEBgWBFcTjghfk59JWIhXBRn5qG324YYQdZNDuCNyq2Ebosk1p83Rk/eRssp+mJ67A5L/TY27AbEtsw/U2ggjphwUZqyi4DNd4foPy3dm3xQ7VIB0IpMxwr21/Ravb6KIM0ptB7HTpJh+gNCXKmkc8aawG3xDN/gqir75/gMzj/Ey5sY5/jYYNTXSvkTbXzOlagK6xNR4f+g/E3LWjreRXdmBuoXpXOHe4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KClTKMknmw0jpWqBUhv3J1Wu0S/YqrD4lk/RdoVTID8=;
 b=ujPRdCrNDbvMhHod0EVVYTyYdjAnl08BEEgvozl959Tx1Pdz1+kLxitxiSo0ZdIe6aKFeWskHV45cB47QOL2mNIXP29AuEO8ZOk2s64Umn7GHjRsE4HWvMxly4Jysm1iclleXYbSQjARfIwww3uHAvOUOJ3t4iAjvQLD0xG+sxYy24Z7KUsZog0fyzGyCCGLkYh1PDcMq3bflqY0hJWLGx1+euXaCUkf4+jaQJt8uRuiIe2uUOyFiq0skHK/E8wsXgXq/DyS6ouLAixkDPMs0SFhnwYuYvpQBEAtgmMmnAXXQiFNvGxO4QjKsmEsPAkItHhVGXUNHjv1FL0sWOph3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KClTKMknmw0jpWqBUhv3J1Wu0S/YqrD4lk/RdoVTID8=;
 b=XNZC1GYpm4ocJ2M7HxGec2aGA3NXbJ4q6Uv3WQl7cFimlF3vjUHrKwIhz6nT81bn3P+BIa3ffbeuEhZS0z2+y3JKNt4MQFSVGM4sMpTermrAOsliXltvv99DRAPIZBjAtgFm/m/Fvs5/4pu3wgycHBXMBWeX9V1bTEbRlXGJndGoCYYAfFnbJkfIIfgrnS4cUb8zn5T4bEQdMPeyBCDdsOLDSwlrj7v27+eO1GlDN6pwcAh3WasWGSdCx/eF3kCTKLjCuEU/QmfrlrZhRLk+Q9Ak3cy6gVVxraayk9Iezm6Z1USFuaxjRKiEj/diGHsl0ohryuY3Pp/XXqUT9+3+QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SI3PR06MB8491.apcprd06.prod.outlook.com (2603:1096:4:2a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 06:38:01 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 06:38:01 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Guenter Roeck <linux@roeck-us.net>,
	openbmc@lists.ozlabs.org (moderated list:ARM/NUVOTON NPCM ARCHITECTURE),
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH v2 4/7] hwmon: (npcm750-pwm-fan) Remove redundant dev_err()
Date: Mon, 20 Jul 2026 14:37:38 +0800
Message-Id: <20260720063745.309331-5-panchuang@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 344df1a4-2fc2-4e46-7704-08dee62971bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|7416014|22082099003|18002099003|10067099003|56012099006|11063799006|921020|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info:
	BOBEE9xeyiS+J5zOGPo+dhdngfda/xbLyHs9PMM6v8//NDcFei7rLdwSmupFY7wyU8amLlKx697w/XmVjjW9BLqSiQ4+Rx8M01qswCGAFAliAqeIIUEaif/n6kcnlcNmXC2k2a428VJAd32AkfvdYvSw5TSjT48r8tGR9/q13DVyuI/IkUCsnm2rC7OnY4fNZdZvNpKXZv/lzbnUOwZZEUtxNH7rcJCsrI9tnxMenXwXJVyNz9Lih69Iow7VFMt/Ce+raSASDSXcU6SqCEt47UsGaKVxLdTLQ73K/vYaGTpjqXFIEqsdL6e97To8p0LKw6AStARgxh/4jX3cv6TyyFiFW3W6uGrtI/cU6qhJcthxX6GLi60ReNXixiKrAZoR5L09/ctDPhyU8Q37K6AkdQnfLeyfdAthac3mNjxAAyKLouDIYshGfV4bX1yGD3t4R35PHzVoa0z0TXrTEo5vjDRbPINs3F7r9d7fK0XB6xiC0568Phtiol/uzvLyU4V6XJHjFO+eTYNWuTsSZ9EkJHuua4znbaELFnrUmkNEtc5TGXi6TCIs0aKYO9kwOJVPhvTIHfP1PkMjGn30FFv5JWBAvct2XCrFmTOdOj090gNBa9yVq/112YcDOFV9TGRD/eQFS3hIxdZv5j+ZxbojGxgBWWSvo33QEf0a3c2ZZwIXeQ2iBSO+3+gcDJ7oLpurFi9aLDf94gFkbtzFD3GOYchQG86JBuu11qdHS6cWi/xitLLJp/SXzFwXnGgea4me
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(7416014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(921020)(38350700014)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vDBCcd5vf7d6JCVl4KbAKLMCVfDLWD43YwjjqSHM4yb0h94D7UmzQZC2VWtv?=
 =?us-ascii?Q?dAIwuzpFaRPU71giULoWB++D1mTlPk9siAkAGaxiUK4XcgHTRjG2xXw7bwqh?=
 =?us-ascii?Q?MXdPfTv5XFADPkZahpgPCBsChVU7SK+iXuU1pZLQD4ZhxT2A2rfA0fstGw1a?=
 =?us-ascii?Q?MaxaZqTw6yCYhSAc5Hhyb0PT53oItKCtbhmEJ4bfZ504A6F3f4YsM2WkQZyl?=
 =?us-ascii?Q?gduVaZWPUjxG2FtUivs6EX4pjZ3dycxRrhslMjLOaidyo7bJQw+/rkGKXYKG?=
 =?us-ascii?Q?WO8w8/m3P4RJNSw07GRDHA7oSF1AkPLoMH9ebxvPlrpKAF1o+EYxo8pDBsDr?=
 =?us-ascii?Q?AHE41NYw7xWP2+AD2gKxVyzgz1V5b++iFR0jByrjaeihuHtCb6l4w7w18ogG?=
 =?us-ascii?Q?zymrsY4B8Ut0Cu8j748/OFf9mk8SKEySXYQ9asnQvT2+7z3c7XjXb0sJVC5V?=
 =?us-ascii?Q?CpPRd87eXlCsmuhd6ar0LCzPGzkr3M7H3uFT/MCi+VwJS1cOljLP5bip/cjb?=
 =?us-ascii?Q?HEx9/aFcegGP+o8JT2moEH+tdxpcmToTHspzreKs7r/DcKTRVSGyGMd20F4X?=
 =?us-ascii?Q?SN1U3sG5sqYOGnMoFH4A9q0ATb0Omldx5VTQKiiwewVavDltAT8qE3PbyC3S?=
 =?us-ascii?Q?a3m7f9duuCq9cyNl+MJoEiBxLvpmMKGDotpFRkay9CpIujfWTVbCSRMfKlnm?=
 =?us-ascii?Q?TCPyzvlSqxH8khpl443fmJiIJU1B+aoFTdiwHWQn6JLGrwTSJmglvYyzT3iE?=
 =?us-ascii?Q?jDRx/DmIXfD8LVsvFd+1I6Af4Ch5F6vUeF4xyNaD68Ss65Cn3OFkB/fQVNaM?=
 =?us-ascii?Q?z24TYauCdVam2ZYeVqraQp8GHeOX8Jh4S56HnTIgtyoknUmXUjVUc+LcC4iV?=
 =?us-ascii?Q?Nlgfwm/CnephywVbxDJks/mK0iIMsqyobNdfW3AIXNfCVWPl4gVY10q5wqhX?=
 =?us-ascii?Q?sfg2wklE0NGJEhz7QkZr1TI24Jmd2pIa1vpTkEfaTUZpIyowyJz2qrYAOREb?=
 =?us-ascii?Q?D6/l0VFe9Z7a0wu2PgEHcdYmE9GaG4wICvCDK67G1x/x/vCm1WXTjtybC8UE?=
 =?us-ascii?Q?HqKYIY8H5/xQrN53LqrxmCYVKoWfTEsViFYLgGMDdph88klxrNnCfGYG9h87?=
 =?us-ascii?Q?e9lGM02x9uhdEr+eldeYpCFHUeM1tAswOvPSBH+JtR44Ao9/apyLawnMHN3X?=
 =?us-ascii?Q?3ro2SfY6T4xxWexOt504YBk9AXO4n/DiCbHrFzXVyvrWtJZ+Yrx5Vjt8HoLC?=
 =?us-ascii?Q?2Bp4AVSMHtoIWrpqekjKyV0pztFDv9qjtIhE/Vyl/g0C5cdOvoUt45qR761b?=
 =?us-ascii?Q?8rb7mSlIx+OtqU1EP7v7z/CcseMscHK9YcMHMUFuoyT5j5oW5wHC9zHEtfcg?=
 =?us-ascii?Q?MvKRQrdUwk0FymSnWil82gT08FpPE2AAMTvyha/NRKBoN7tcowyjYd4/+uVO?=
 =?us-ascii?Q?0xAXVdreRmP+dgfJCR24AQ+W0nHSsKD+nQXxJBF8xbrZZ20L5iryenJFcD4a?=
 =?us-ascii?Q?aDde8zT/EaDhkuyeHEVVjVyynVH8MK5pMdbL5NLOuH3n60bzSjwnI9ojkUkh?=
 =?us-ascii?Q?IXVP2AE1XMsSqT3Fb84u9YNeC25MTdWX4CHDSWCyYIZ9r2HIaNU8nGbkkGQ1?=
 =?us-ascii?Q?zUk0tJkGg4WcwCbptmYAovsvS8Aopy4wcQCnOVflUAXPvt48jmlASZrNK9YR?=
 =?us-ascii?Q?WUSmrHQd7hIa6hnq25cW8mTKbsau15GSH+qbcxnk+v12psKECVRFX3QG+SYL?=
 =?us-ascii?Q?QsmQ4ECaJg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 344df1a4-2fc2-4e46-7704-08dee62971bc
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 06:38:01.1818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GRMV+oCujrAXg3v0q2ngBfHbkPYDqMNugr5NDRCaSiKci3tELQePuD0FsYN913CYDDGlWTTmj9AlA4N7Xh3gzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR06MB8491

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs detailed
error messages on failure. Remove the now-redundant driver-specific
dev_err() call.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/hwmon/npcm750-pwm-fan.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index aea0b8659f5f..df24dec78e77 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -991,10 +991,8 @@ static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
 		sprintf(name, "NPCM7XX-FAN-MD%d", i);
 		ret = devm_request_irq(dev, data->fan_irq[i], npcm7xx_fan_isr,
 				       0, name, (void *)data);
-		if (ret) {
-			dev_err(dev, "register IRQ fan%d failed\n", i);
+		if (ret)
 			return ret;
-		}
 	}
 
 	for_each_child_of_node_scoped(np, child) {
-- 
2.34.1

