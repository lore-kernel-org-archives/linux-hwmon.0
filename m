Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795709623;
	b=wzuUzW6g8PiesvtmaMwwjmAtioZyj74XHFK0WVuQHlnT8OrV8yRXUzUVHNZ4j8+yFTvo
	 SgPh3kAElJXQX5C0pOj4sFNa62t5AO+is3dP7aqhCFr1QIMlb28C/EoghUrpfshbMXzAy
	 AEP/DQjCLKAhicn2qxRkw4utkjrU+vPx5giKPSQaDavzzG5BA36qmHnNMds680smmXylA
	 Y4PCq8/CEfuu+C/guRdw00yPB9UUZv4NU+44ZL2P/9LcAGJHoSYEXQM43suqmgq9UKbsy
	 a5OnXsfQlzg7jFGUwrblcExjuF/CmCFQm3ulXvt73P2Z5vdxRr82Ib0V7YgSjVGoLtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709623;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=QLvfogjr4Ei0PaUqMegkXOAFTbLmw3Ew5FG88MvPGTQ=;
	b=RzPGnXyinGUdWVtooyrOs8VLhce4x46LF7xBPrGxFEw3lxhlFJPIVEhfjQRxOoVj9iSQ
	 CYZcCwrQ/VmQu7Da7iEF3rgp3mLxLSb3Um+nCiSrJWldMvLUD8mebQxrEOxBqeaN64XbP
	 K8COYSiKq6oMms5PUdDrzINKReVx/Cd7mpBWS4yPKJIT4Adb2qw2zG5mPw/Nz1c3vJZpY
	 FpcswXmb18cHQ77m/78MWNHGQJR6j11/p+EN3u0DlFiONMCFf9QL/NgDyLWFiqD3uMgKs
	 NxpRWghv2PNjDxXgKg1cbf1Uw3sUm72QfKXI5FlHO8gtDuPl2zrExitjSToccuAltuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=K7WkRaJQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.43
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013043.outbound.protection.outlook.com [52.101.83.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA58606A32C;
	Thu, 26 Nov 2026 16:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA58606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=K7WkRaJQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMO98HF9w+UmaqJVXzRPGdILyE0gwUHDYZ8eTaIn0qCVlOkDFlLrcvwHT07fdnIKF2SLQzH5PX4IzcPcKYB6DhJlVzulQKUK4BYnB1Sgo7F4BSLxt44vVlj06LpBa9fqIrzbKTDbGWoOz2gLDVSvc2uZ/fyPI80vRSswGXoAiE2G2Asmts0owhdK5n5dTGfsc3avO455H9SJnypeR2uqe2wVeLFKkWtXPZ//VmkRVlhoI7APfBIl8jJL44oTSxUIk7+UrNaIgeUGyoV5Gf+sVy6g/mEHuaJVjl8leNzqnv8hJDk9PLbdw1mjnum7OmmFs6seDqt67rGdaQY8CunU3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLvfogjr4Ei0PaUqMegkXOAFTbLmw3Ew5FG88MvPGTQ=;
 b=jI4Vyv/bPcby3FWYGQC4qUZqdnwic0ojx+fHaiGkIZD8z89qYTpmDJ24VibjX3oZsH7rCQ+6BIcmLr3rB5aSf9uADYBXjup2Op1IMdxJnWhM8Qc6a2+ozl5MDnceEjBCnhDu2W6keRuNcD2qymvUjFYaDw2EBKiDvkPSiD88uzNi3xiYpiUYs8RGa421Jy/HAagDmVHC6X4i0oeEjQ70tF9yQBMykjvW/Vd8y7ziU3lc6Dub+tz/GDYLDNUIX3WoKBrO4VLfxgyRYcCnUGydcrMdPoXEG2UHPBMaFj2VcFa4kwzpOKCDU2J0H1y+yoxH3xmdRETjYwLyMuopDm0kBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLvfogjr4Ei0PaUqMegkXOAFTbLmw3Ew5FG88MvPGTQ=;
 b=K7WkRaJQmjs+iV9so/Cg8QAKch0//RTVfT/dZEB7LRprooC9fL9XovqFwRawaAEmkpLsc1O3OYqFpwXZTiInaX/rTMCVQTFvIKIVR00tIupA8TqidH36OZxaor/v471IWPXtp2X08DXFfOwukab+4SK1a3dGt4Wh8Ghc+tKdNnLlAb0Qp9Z2el/frC2GPPuOAOTmXVd/OymIav/KVdz8//6GZRZ6AZ4F2OzbMSNOka61KTYKIkhN0AiZi81WrYK34C0p1riRWXU17FqHsDnd2b4R1Kg583lrCcLZ5udXDZB3sh/NtUpDfu6d3WpDWY94TTY4+T6OuWvnyow/wy2ZdQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MI9PR04MB923983.eurprd04.prod.outlook.com (2603:10a6:290:87::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 16:13:40 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:13:40 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Lukasz Majewski <lukma@nabladev.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: arm: fsl: Add an entry for Cloos CBASE board
Date: Thu, 26 Nov 2026 11:13:23 -0500
Message-ID: <179570957586.1090217.11418226053025743919.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126124402.3015577-1-lukma@nabladev.com>
References: <20261126124402.3015577-1-lukma@nabladev.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CPCP307CA0002.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::15)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MI9PR04MB923983:EE_
X-MS-Office365-Filtering-Correlation-Id: 245c6795-168c-447f-3069-08df4bd83c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|19092799006|10067099003|11063799006|56012099006|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3LQO6dSgSnPOexiwesyrbX6nlIoREoKs2/aVvzBPhGXXK28ysPKfsNhns86has8EePb3nZ3Xkn9gjqPxOTLTeARaj+ciqW3aAll1CwtfsPo+t7lPgenvMkpT5Or7HwbKGBEg6obBOR3V/6rJqq+ATtcMzvZ8pky3SyTCK4MAtesPMLIJ2zkYV7PnZ2TFrHiKBweQQvXPSHvWGxfoJPBLQi0JpCr4YoiFCcbHoExVD4l94pbsNKhIiHmqat5pUmZJHVA+h5Qc/I2P0mUib/hrCbgR+Rn7F7f0ts/7Jtz5+7lqQXvW/d46wcZwA9SbrAOKqFSI07+Kl/Hi0XYKWC3iLUl8asXXxyE14sg1t0PXcYfgUEysth3IcidHK/lZpUMtzFZBpW+p6f6dxaluUG3/v+vSHt7aVrljp93Gc2mrfDW135dgM7opZKqVOt4dxofbkZkFKslmGOnpbi4Ofsq5/l2irv1pHRq8VevczIjBCWe1Mbd2FksW9wmkPeacq/C02N9tcTeom6Q2Is4z2FugSA1A90tKjhs2h6UC6wHqrYYUU2SEOpWEk4FwJtAvPcEOhD923TT1Q1rOROB44s82c0ivUUl76oZgQw/M3MeEk2/4EuVYrTH7eFXYjljs3/jF0XFHwqlG8o9ZfetQYohC8jjQZd2Oj0EnJya8HbB8LR0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(19092799006)(10067099003)(11063799006)(56012099006)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUNmSnl1cGVXTDE0WGEvbW1wZEtWeGtmSFhSanVaNkJSMVlzb0NOaTlsdER2?=
 =?utf-8?B?K0JZNEd1bnY0aytjWWNDRkFNR2JhR01JYXJhVTY4K1VSZm5ZK2NYa3FjZ1o2?=
 =?utf-8?B?aXhaT0Q4bU5scjVVdDNjYWVoK1Zab1JlQWpFblROZTduYWJuREFhRmJ5em1Y?=
 =?utf-8?B?RjhvMnYvR05ES1dUVC92M2ZTS05jZnJ5MTJJYzBYS1NzZ2pWNlJhYXVCclBR?=
 =?utf-8?B?cVA1UHNYWGw5Smc2OG9pVUdMMG1CbHMwc2ZBazRGbENNYjdtc2NJSTVRc3BP?=
 =?utf-8?B?YUtic2d5d3NRODBYS3VXV1hDcGJHSnJYd0w5U3pxdTI0bi9yWDE2dG1pQzZR?=
 =?utf-8?B?R05PK3VvTWtpcExPSHB1RG0xbEg2d0xNSkRlNGQ3ZE1CTDd5bFdncVZIZXU5?=
 =?utf-8?B?QldxTlhkSVhMRFVJUEp2WGZCc2dYMVFKZUhpb0ZOQWpJTHVHOTdyVXI2aW5q?=
 =?utf-8?B?anRLL0hyUzBWaEI4NjQraVh1bW9pNUVZNGJuMWRlcTJ5d05PNGJaV2hrK2Vx?=
 =?utf-8?B?N2Fieks5em5YenlNcFBsb0xNbEVQYjFUSXgyVVBLSEtVLzBhU2NTc3NoUUh3?=
 =?utf-8?B?Yys4cm9vdVRzOWU4WEx4YlZVU1IxZE5TQ2lUYXg4L0hKc3Z2UG0yRktKSXdU?=
 =?utf-8?B?enViMjV0UktyaVZNbkF5ME5rZHpWT2ZDQ3NmbGVyWnFuTVJwS1NTUjdGRWxJ?=
 =?utf-8?B?c2kyTi9wU0dPMm5zOTI2VGttcklieWtwQXptQ3pxUmR0Sm81Y1E0TE1NY0Zs?=
 =?utf-8?B?RmJBc2ZHT1FaZkwrUGwxS2pORXY5bFNxWUhSbWhxQXczYmNCWko2MHhDd2pC?=
 =?utf-8?B?RnFIWE9TWXFiN05YbGdMVzZldjRLY1FwNVhaMUZicUpsSG5FL3RNbkZZcFpW?=
 =?utf-8?B?c3NSc3ZPbC8ra0tXODJGUGZIdlN3MG53aXdIc0RNcFdpUjVpMHJJQVhjbWRM?=
 =?utf-8?B?V1RaR09XcWwyUWN5WkQ5eERwY1ZJbTRlZVlpNVBibUJsc3BIL2duZ3c2TFVx?=
 =?utf-8?B?MTM3aW9pcWcwUGE1SmlHWnNFdVVpMnVUOFBNVFk5dnQrMDcrVXdPcnl6TWdI?=
 =?utf-8?B?K3lsN1ZZNGNIcjduWmdOMVZTbFVCMXpqZkpGbVp6MkppR1lyVTVEKzJ6dUJ6?=
 =?utf-8?B?VS9Yc2RwWm1CTjRXSDEwUW11dUgyRjd3SUVZbTJxTWhUSDgwc3UxWG5MWE9J?=
 =?utf-8?B?YnNWZWZXcU9IRUg5cHZVUksyUGJoSkZuQmVFY2M4WjlXa3hqUGdHeVplOURT?=
 =?utf-8?B?dmZBc1Bzam9MVTg1MXFmUXF1bjdld2FrMWhBNVRkLzdXZ1ovQUYxTUEzc1h4?=
 =?utf-8?B?S3NqMUgrVUljT00rTjEya2NzWXgwb0QyUWh2SmJFcmxqcEJDNC82Rnk4SzZR?=
 =?utf-8?B?Rlh3VVZ6Tng1cFNraVVWWFdTeVJYUlZjLzFFTVNTR2gyeWNCd1JwQ1BXVk9s?=
 =?utf-8?B?SmVINlRPc2F3bWtQdHhtYWlia1E5cEsrQ0d5VVBiWGYzK2lqWDRZQkh2T0VH?=
 =?utf-8?B?RWVYcDBxK1FzYVhTU2RhZkg4SlpQMWhaZGJTRlo0R1h4SmhER0JmcWM1K0lJ?=
 =?utf-8?B?MncrdHlBRE9xL0NUR21NM3dFM3ZzMnBSbEp1S2l6Z1JlblFHTC82TmdZNHA3?=
 =?utf-8?B?di9SdjJ0WjVSRjE3RWhqWmZFd0MzU3ZaS0taUDRuWkdHa0Mrc2JKS24rRmp3?=
 =?utf-8?B?WTNZZHM4T0dtYnc4SXhHZFhpTEkrTytKcUVKV3lUQWFzaTBFcllYQ1Ryb3Ni?=
 =?utf-8?B?elNWeEs5ZS8xN2tqZTZQTWRrTUNsRDdkTmtpa0Q2UzBseHVCSFcwSDRqNlEv?=
 =?utf-8?B?b2Fadi9KRFhuaHM4eHkzb01BRDdEUjk4alk5bk01TWtjNDNiTDQvdU9Xd0N5?=
 =?utf-8?B?NkJKQ1VWeUlscXArRVNGM2RtdnV5YXJLa2xlYjVEQkx2ZDZCWkZPZjdtYkR0?=
 =?utf-8?B?a05nTU5yWVQxWHZQSEx3cjVWeHhhZThUT3RiaitBUXptTmFvY1ZHZGQrYjg4?=
 =?utf-8?B?emNGQ0pzS2xUWUhRWC9zcDhtck9PRkduc3BPNHdxeml0VEY5TktGb0FzQXR5?=
 =?utf-8?B?bG5ZditJdUxXZzZ3Y0cwdFFobDFwOUl1bkZLZFRPaGhrM2RxZEtkTTdqS1BL?=
 =?utf-8?B?ZFJRNHBlMWl1UmE2MURFbEQwWm1iV0J4b3pocU9tVDF0SGxrRDltdVVkZ1RQ?=
 =?utf-8?B?WTJwQWtGdEFhbm56WVlBdnVvdVBWa3BVR2JkOGl2cVh0elFSUDlmRkw3NXp3?=
 =?utf-8?B?Nkk4cEEyN0VUa1BGaSt0L21HQ3dkVDNvQjJhQnVzY0hYckw1M0lJVWNwVEhj?=
 =?utf-8?B?Y1RPQ2NTaGFoYlRzUHl1dFUwRmFZQzlqaXcvbHZIT0orOVh5WVdLQjhpVFJa?=
 =?utf-8?Q?n70U13Crsf9JCECyaAezRdXIRU57SQuFYXtev?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 245c6795-168c-447f-3069-08df4bd83c22
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:13:40.4578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9yssdE0OYqPuYe1wLaDHl86u+67T+XzRIlMpQHHO9ga8Ykd7WWa0eGwhn5HKeUUVBQCZmjBxvpOGWS0rFlXUmFQfl3p6qVjiG4LMbtRJv9fYOzDOYoq/meESZE5gOSo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB923983

From: Frank Li <Frank.Li@nxp.com>


On Thu, 26 Nov 2026 13:44:00 +0100, Lukasz Majewski wrote:
> Add an entry for the i.MX8MM Cloos CBASE board.

Applied, thanks!

[1/3] dt-bindings: arm: fsl: Add an entry for Cloos CBASE board
      commit: 07b6d12c7f2fd20424dc6c28596e807aa68999b4
[2/3] dt-bindings: hwmon: Add National/TI LM77 temperature sensor
      commit: 4e2aee441a877bc5688ead92e33d9295ef610826
[3/3] arm64: dts: imx8mm: Add Cloos CBASE support
      commit: 24154ccfd63b6d151ed5557f769865e84b26b964

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
