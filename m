Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2126.outbound.protection.partner.outlook.cn [139.219.146.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883874EA368;
	Mon, 19 Oct 2026 11:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410334; cv=fail; b=GRYzNUczF6nYRDSfiJFdjFWWpCj1UHVcDjpJkLKME/gpS3nt7GF8BL/rlvA01ct9qpel3lJR6VyiQjqw6iEBQF3p8bDP9JCGudFhdid/wgjoDPcdmcrOE1QqbUInAbtVch1xTG9u0feRMjd3G5B1ejC9k560W5A449K88nnmoqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410334; c=relaxed/simple;
	bh=Qrleh/ODIEG4UMYJvPAHP+qMU8zmnjjfk0+WMSJN4ho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PZ2q19Giqzc6eOxcy9d80GPBt6msHwtlgYSIu+ARiPeWv1k8mP2QXIlDfACcAStX/peCZK97UamAQYXYo6NPUNPTNz0r5HVEIZ7DzckGZYT6TQ3xL3EJZKFfr9TKaIZ2YDUR5GaWg4+IgNUDuM6HUGCXq4AFXN2AQngN0sOaDz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3W3/311n0EZsjnaW+ME4bxVLqWo78jF3y6KRGYL2uNXR9qX6EYewXlUwvcDlq/C2bsEDVt6TQdjitBTDKRRdt5nBu3VRSnCFg+15Cb4Y85BocT9o+YUAeh5l2K64jJGd4KHZJ1hkqNMscjLbEghD6ODTmwBBLZoKQ2LgzF9t6vWU1gMW4+E8erd78iZQnDM4PtUJhTd0jgz/NBW3Mc0uLHUch1tmCkgtzWAIx2NaEo26PoUS24cb7rRRP3CmaX9ym+9lrAC+O8z/7nFRJGbeky7YO6eoj0VlAMot5Td65F/W1KVKqtYQu6KIKdUHJw2f5EDwpcdF8sJXcCJ2+eYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DC6GCRU+BLUb5ZtdJXIUsY5Nz//OfIIeMwHwvCb3VC4=;
 b=PTj5rymwIJPlU8n0KFgF5D30k7/uBBPSqZME2iFuPmeN2Trlnslt2ApFfTqP8pIyVjEUpi1wRaS6AFCWeMq2WRU4zDjTHV78SO4NyVXJIMVvI0a5nMwmImZTjSpzBfVpKdFhBCtc0I7nuECHRTq+WvdSZFChyEHOrF42rkMAJxb1J2NqQaV5tyuehrZ2fXF29p8xwCk7qfmayjEMzNeROS2fP/qqEOaHb8pHrks3M3N5RGQI7vFl7Q+HSbdXgm3RMleskdonneoordp3aLabnf4hskUjPOl+fqs/qAekd/qWiLy9U/+25amIvRMeH3oII4q5h58yf7M49DzSiUeMMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1316.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 11:45:15 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0522.017; Mon, 19 Oct 2026 11:45:15 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v4 3/6] peci: Add support for PECI CC 0x83 retry condition
Date: Mon, 19 Oct 2026 04:44:59 -0700
Message-Id: <20261019114502.55307-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0010.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::17) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1316:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d2c61b0-291c-4d51-611b-08df2dd670f7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|52116014|18002099003|10067099003|22082099003|38350700014|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	5HeR5vlQUYMvd+2Wv/sV2UUDpy9jTTTjQd+s2aAan1x1yaY8MNcRYXQsQQcJ1Z28ZA5j7B3kgTb/rSBODddkhfWomtUS8DDtiSvFefgypXxV23bt2yWs//LjHHeAmhVRyKuRVz59ikR5tnuQExrfh9TGZ2RmLIkBbHIGjbwQfo7B+332UU1WnLO2+GDyVPH+NYcgFPlqQEWPmarZoRPzy9PskYFqirsUUWamldG1maZtvOsVYXMx9DkySVOVjmFQANHRd4239WdnlNpBXiyGEEKQCtVSQQKkmQfelf/2CJOYKUfo62HuOM1ExpLZoE8M99CrgRy+LfdlFdFNS98r56pZESdPId+Zl/iYsYTFi+3kp36gPC4u/9vCyWQ2ATGHA9fPQEB4r/cjh0o7BudcrH8MS/uqwWxBMi92RQMz/2K+otjhbAXne2JBkkd6qfZz2NkJO3E+jbfPdMQcbvG3i3nthXhmOkT8fM4q42iDSvcWo3jgMiW6WVdB43ks/SYBW7h2GkDaC3VCgoIQRM5XBlrMnmrJIfH1Wg/9HDbG5PQd3/S/5TA/SR0AXDpEu3ag
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(52116014)(18002099003)(10067099003)(22082099003)(38350700014)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1eC9yPsMYrAWV989v/jZhkHi4Z2Emj0NF06bVMjDdB0YjL55+ko/EqqYhckJ?=
 =?us-ascii?Q?oEBp0HkL1tyqjdPxDqx13/rU2yo9PY/HBtVgfSS9Pkp4Q5lW2+MCc4i75H3U?=
 =?us-ascii?Q?DaS8M/BAq2n2T7fdUVMee15ZS36SqXqsSzjndLaScR0glrXLv92sOaRLlm1R?=
 =?us-ascii?Q?LWrJRNTaeNvFSDwwkOnesJRaYt4p6OIkq+j4sK+DCtRnnXTJC8/EJSu/87Gj?=
 =?us-ascii?Q?TjqdqZKVYDR/spjHNBk1KfLZIYqIsBqDtt/lRhf1Ie1bTwKsHWWp9axbs8hx?=
 =?us-ascii?Q?KBsRtHtTj/POukFygd8EEg4TgdAx2A90UdCRCwkVMcqkRyI6mEus96CDSqYL?=
 =?us-ascii?Q?J76HL/5M7hrQDbqLA1tJLJY+ARgt+H1c6LnDQ6jrD9UeFIHw448CjU2mMk4X?=
 =?us-ascii?Q?F9UgY6ZFCir/dFEyPfibQR2weaU/lojWb9tE9FiD9+ZilqFzr4tlhTRkDcp8?=
 =?us-ascii?Q?RME2nKE4Zr/Un3StMqpoD6Lg42U7lr6+ZZV1I8/Mn5SDGrS3k4zaDx1cM4gE?=
 =?us-ascii?Q?5qkXlSOgURZa5c6rn3FYg/RUXm5WaRXF5b+FJ5Rw3FiWWW/Ww2Z4EgyiXzNg?=
 =?us-ascii?Q?G0ayMor7D/Iwa9NMKTuVEjA9fB+oX90sUJG1IHqV7ng4eyXlp6qyo7fs0Cpa?=
 =?us-ascii?Q?ZKdm920FLn+yjkmbed0NgxD3Vi1bDJYdY/1LEW1g4o4sjdVSLgdPbBz8SbtC?=
 =?us-ascii?Q?9KLJip/6RSvA7VHspjel6wMF5x1jiTzeWs1s9iMthEuiN9lGIHHyCMgBM+Xk?=
 =?us-ascii?Q?ys9RRZPpTFmlYCOXfveHwPK2krgnFfMclj0GIzgtZ5XzPIzYldh+pYTez9Xy?=
 =?us-ascii?Q?szjmnNPAlyORzl4LpaO6ewFf2vYTg9FrIMYyjtheyBMXcymYNy4US9f7c+rb?=
 =?us-ascii?Q?ZIWoaFT3Ko3vAzKGDK47Xsv9ixmGmLb3ZFhBLDg/niMdgs8FL3mnXH2RRMTh?=
 =?us-ascii?Q?FVIsPBL2y/P3+won9y/TP5HY8X9Zi8gN0VYNMAoBDDFVRNBKL1lfLam1Zupl?=
 =?us-ascii?Q?aPUpofMgbs3KFn46lDnTf26kOBAzfJjck5plmdah2wQzP9n63MjjBtiVJKEi?=
 =?us-ascii?Q?ESUBbiWp285xLB17zQcWiry0MB+FEl2B43pO2/g02jh/tIC/fKa/Ro+seUrM?=
 =?us-ascii?Q?u3iGFnbgAW+pO+VVI0Hpb7trIxYegYfYRtYlMrVqQS0X3WtFZ6LOhy0rGmDO?=
 =?us-ascii?Q?lmVFVvTWxXG747woadRfPwiZW2mMB5LQrMO1+Oj3KjQ5CX9Kk7snAMFTgC7U?=
 =?us-ascii?Q?9O///BL/l1Z7zOnZgSk8v7Q6lMbxzgqRxqQ09gnuH3GEHbbrlepiuni0Wwvk?=
 =?us-ascii?Q?r9UoKIAYK69i5kdyKgH/K7qXg1EAQDqYcjhbr2qVwSbAWJNw5yj2TD6hXKg1?=
 =?us-ascii?Q?nL8Rx2PTawLhMLTY98v3Kr+dJlotfBnwKrjxxy3U+apVvHxe7yKtjXYzr3gZ?=
 =?us-ascii?Q?CHv6dP4iW5wPYQ9zTblqYX14jsImAzmmxqj8p41g/1H8m55nENkE9genHsKS?=
 =?us-ascii?Q?e3bn5WEIHA/APzgxgYiFzCbH2soMi6L/74ijoQUeoblKc+aDOju+hxMOGnmL?=
 =?us-ascii?Q?ZFIjyoSX9vinzIJZiJ+RMWox+InYK1NKVKxjUyG2OhFml9PrqAjQB0wZGmel?=
 =?us-ascii?Q?hSwN3enfscXaKIYA5QM0nt3VUJ3yi52WibZtwy2EUKQDckwLNOwGVwyILDjy?=
 =?us-ascii?Q?G9FLvg/C+XXQ/GjdHFcIbV2ka7CCYcPtT+Zmv0Ab8lkSwJpWTEHzllntF6Pj?=
 =?us-ascii?Q?3Wy/TDCdCU7ePERXUqPxGXTVO/wYXV8ugERT0WVvNWrtZS7ZbtsU?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d2c61b0-291c-4d51-611b-08df2dd670f7
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 11:45:15.3007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dLcOCtseIKQ4stqsH7H/806RaThsFFUzWeslURFWD8v6ya03RLmGYBg55tpV6CuShwLr8IQGG/7HLCfRYf1f5KflT7tabzO5uHN6XnW4KmyMybNtPNQzrOjLOsTAsULQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1316

Some PECI client devices may return completion code 0x83, this
completion code means that a command response is in progress, which
is not currently handled by the driver.

Add PECI_CC_RESP_IN_PROGRESS definition and map it to -EAGAIN so that
the request will be retried appropriately, similar to other retryable
completion codes (0x80, 0x81, 0x82).

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>
---
 drivers/peci/request.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/peci/request.c b/drivers/peci/request.c
index db2cc30a42a4..bf80bd205e60 100644
--- a/drivers/peci/request.c
+++ b/drivers/peci/request.c
@@ -71,6 +71,7 @@
 #define PECI_CC_NEED_RETRY			0x80
 #define PECI_CC_OUT_OF_RESOURCE			0x81
 #define PECI_CC_UNAVAIL_RESOURCE		0x82
+#define PECI_CC_RESP_IN_PROGRESS		0x83
 #define PECI_CC_INVALID_REQ			0x90
 #define PECI_CC_MCA_ERROR			0x91
 #define PECI_CC_CATASTROPHIC_MCA_ERROR		0x93
@@ -112,6 +113,7 @@ int peci_request_status(struct peci_request *req)
 	case PECI_CC_NEED_RETRY:
 	case PECI_CC_OUT_OF_RESOURCE:
 	case PECI_CC_UNAVAIL_RESOURCE:
+	case PECI_CC_RESP_IN_PROGRESS:
 		return -EAGAIN;
 	case PECI_CC_INVALID_REQ:
 		return -EINVAL;
-- 
2.25.1

