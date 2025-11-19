Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022074.outbound.protection.outlook.com [52.101.66.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D5135F8AE;
	Wed, 19 Nov 2025 12:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763556738; cv=fail; b=nFX6WbneD8aTChcQjzk6xmhH51l0s8HXmuObwIHstMAPlWWfxPNqRFjTp6RK187Q8hE4H2SRS1E9c5tMd3mud5LCxdT5u8MVeuVCB/xSny+Wj13dlOtG4xE5ngV+TOnK2dMMIffmMJ5HOBYHxTYU8FtMUtuxw5X50eTXmApuKjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763556738; c=relaxed/simple;
	bh=ns6v0H+DzGgdAbeIu9xYh2LvQXbv0XHgxFXrl2JWkeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hy5tWbDuEu5YEzgEHEI8be5Gbl+IoGvHZefDHLPyy1KXw6ECkG/FItOMmAaVuPVtvOBV9jVZCt4+T7C6WJ/Fwq+NAqUnzlSIH7Z8SwWu2MHtAzYCs7lvRsr/zyP090TFXqersfw+MaFiqvtD6bRBh9ZN6h25VONGHzTeBkLJmuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com; spf=pass smtp.mailfrom=becom-group.com; dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b=hWANjWjG; arc=fail smtp.client-ip=52.101.66.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becom-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b="hWANjWjG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUaraMror+hy+pHlptnR4vULOApjmeTE9oPmF7u3EJi3CcOmh6KrSaIbFgkjvRZoR5IZJ9AZRbOua1eJpLo2UcNo3/ciBJF+NqmvWxLgG+z9VyGFrrXzJAL24afkuMrLpeO5XkmD7grJ/b8OVz2IAh5HTjpvzUt3MekkAv7WZ697u634F1AMmFPa9J5niS2uGgCYzeSjBuiXx4O41cayZDJwjD6A+QEzoHo1Q0maqigwwHFDQMBDsR353YXRtUU1Al1dvsKd9BzAGMwGjfHd3V9d5x+jpFWjAgIr7qXX2BKepQv3nPc+QxM+WZHpH6JlwB+C6e3IWJmdcxtXYGNxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWKqJiXbjgz9ScOOlDtnJbfoZgLS7eHLq/yDk++Y21c=;
 b=CHeuv7kvTpmCTAJf3vjRHV7rvSYVszTEHSYhEN3p3mHg9Y/rWAAEPDwXQ/vRK5/11w8F/pMza/XrvPhJZK6FzY0F9xyHtcvz4KXIU4eFW2HkCvuek7SRo7HzRpdXrqlq9yPNlgQk0Q8Ld5IsXbvRIKbV4nK6zL8J6lPphOLLiQtlK97Snoa/9VzjPO0vvoyZN22VpDK9633uxa2UZ0dsI0FdbEB2mZT2IMgkBp2OTe0GG/i6dGAsDx0zyxJxwb7p0h3gX4bk5FtxSCla9jj+vD32AefPGFdHuIQ85GtyKalxk3RGh88I5TwCTwRmOjSTcUmjMuyKA/Vq7NcBYnXN9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=becom-group.com; dmarc=pass action=none
 header.from=becom-group.com; dkim=pass header.d=becom-group.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=BECOMElectronics.onmicrosoft.com;
 s=selector2-BECOMElectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWKqJiXbjgz9ScOOlDtnJbfoZgLS7eHLq/yDk++Y21c=;
 b=hWANjWjGYL7EFbkPbNnaQWENPmIdW5FiEDwr39yvLmoLQz9hSQgNqmvPkSTtOOhQBAUFITULSd9K5/sDZn1E4A5yc42kwJOHVBsP5rl6sNj+wOgLzXoIToFaXZHijaZNEOAERE5nh30TfMFW9Z0suUgb2Gm5bTe0g7Ww1cKQtw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=becom-group.com;
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:232::12) by AS5PR01MB12563.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:753::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 12:52:07 +0000
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab]) by PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 12:52:07 +0000
From: Thomas Marangoni <Thomas.Marangoni@becom-group.com>
To: linux-hwmon@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	corbet@lwn.net,
	Jonathan.Cameron@huawei.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	Frank.Li@nxp.com,
	wenswang@yeah.net,
	apokusinski01@gmail.com,
	dixitparmar19@gmail.com,
	vassilisamir@gmail.com,
	paweldembicki@gmail.com,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	kever.yang@rock-chips.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	mani@kernel.org,
	dev@kael-k.io,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Marangoni <Thomas.Marangoni@becom-group.com>
Subject: [PATCH v2 2/4] MAINTAINERS: Add tids driver as maintained
Date: Wed, 19 Nov 2025 13:51:39 +0100
Message-ID: <20251119125145.2402620-3-Thomas.Marangoni@becom-group.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251119125145.2402620-1-Thomas.Marangoni@becom-group.com>
References: <20251119125145.2402620-1-Thomas.Marangoni@becom-group.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P189CA0017.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::30) To PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:232::12)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR01MB8613:EE_|AS5PR01MB12563:EE_
X-MS-Office365-Filtering-Correlation-Id: 567f5654-3fb7-45fd-80fc-08de276a725f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tnk0uiSThuBDutmQ8IEpyxyIZIbyMfzkWGbOe35dSlk58K2/Kn3xhTVvzKtM?=
 =?us-ascii?Q?pzu93mhLd6rkMC+boxQravQMqeu04u82Wvz6xSZ3hdTkVfYM4BveqEQWFRYg?=
 =?us-ascii?Q?1VAdGhRjOqg6lW4jrSZKXX1SJtOq356RryURgqro2jx9918+Er+6yvF8WrS2?=
 =?us-ascii?Q?nOdGRHlxsibrbyi1d4wuLU1TcQx/noHc0UfYS5aPEERdtlQJG9d1BoGYxl/v?=
 =?us-ascii?Q?VHpAsnarcnKvvZPzLphSKqz3lzLuO43LcabOqSYsfGMy2kxeYuud4xyuReiz?=
 =?us-ascii?Q?9uzuYkfMBJGBKugZw4yRduxVqXv6UJoKZpVW7y3t62ClZ5xxKq2+nrngatf9?=
 =?us-ascii?Q?0nkCv2sWzfCs4i6iY/gH5quJW4XkhcfCrvt78VtYN+cGzclAy3CRcjmZ4VoV?=
 =?us-ascii?Q?PT1Xt4QgEEzaNL3cHkkl/QmWYM7eMP4zHqB9C7yBGNyL5BYv+sNIDPjrnjy+?=
 =?us-ascii?Q?C2F8j5+M9hMO1C0oa5Vj/K3WBnBCdmOOUGu4cf+SbYm8ZWcs8HgsNKSRwCl+?=
 =?us-ascii?Q?vmdACwa0qY3Wtk4+gCcS8so2AenyiCJhFXtSXr6U1ETtkq/eMJ5+WW+31itf?=
 =?us-ascii?Q?3Cp4dcFqyA5/Fj3upBwN0SMnkFnHfPayeJgOfoZUIY1Ugn1ELnlHgzDNv/HD?=
 =?us-ascii?Q?9TWlkAb14wsnZDk/1+48kUdQ6ppmBlBBMpdVbtXpMRCjOrMe3G4y4MvEFh5p?=
 =?us-ascii?Q?e8WWBJ4K186/XFxSH3g6YVveBV+00KuewBx6DWNVgn5tJ9dUNpEiG9nG+0T1?=
 =?us-ascii?Q?TY2TVLVAznB5qjnhCkHdKMzHYC5WQmHuWyPIKFDgaYSb6n9mwpQEpieg9Fth?=
 =?us-ascii?Q?QSV9PCT+Ql98ioi8L2SNlJ/qbMcE9it5FSRkF7qDyh4J+DUPj9AudCCXWfqK?=
 =?us-ascii?Q?j0oRP2hZH8dAQrPMELmW5zZzf+CMmRy3iDt6Fd60wQJTplltuawHOrCU5Rsm?=
 =?us-ascii?Q?F76DLhUb7KKr3aDmjoFLPqTevm4K2qbw3CMagFLkRqVpcSFshPlwkgZ1Sjm+?=
 =?us-ascii?Q?AKFSVo+BrjaHbnqiq8isKlx9pHGEzkZc4eO9M3CLmAR5X996sB35eMDIlgir?=
 =?us-ascii?Q?fWFMetw0a967Y4d1M79rLY1XstZlPpo7mJuZKf+nQto0kNOM18wL7aOyrIPd?=
 =?us-ascii?Q?bFWI+BD8G/311tmgmdzpInsg1A3MLi+0p6/65/8JCTwev8+iPwI8gdHk2JCH?=
 =?us-ascii?Q?h/i52DnpXIpLl/SxxGrxd2D+S4+knYltRuPlz3cmUqu10DPAMhpJbYEcwEwu?=
 =?us-ascii?Q?c7KvgdJwO6izrOP2V/wg5ZU8HwhA1WPpIA6+cVnSZ/ByW2IWQpUu11eLCBhr?=
 =?us-ascii?Q?UVPJFdRpWXP2fp5V/d28DNoWlgMbr/xdvfkffl/+dEpkPJ2W7nDGuTtQJ7Ax?=
 =?us-ascii?Q?+3jfdrO7Q/dJ7nv9xVTj7VkqNIXdaqoC7UAhnQWEigJ2GDYJyf+bbhH3Rhyd?=
 =?us-ascii?Q?bcszSaesr/0KjABaiuSp2D8m6gWq0ABb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR01MB8613.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iwy8ts5tH2KpFd5BB5YLEmoz2V3ntg7lK/EyOSgRU4biIvsaxSFuhMTeYD6m?=
 =?us-ascii?Q?893NLCZFMqM24E7iT+TFioz5hI4Spf0hA0bD9BrZXRqQ/cQ3tgzET9nJpGYl?=
 =?us-ascii?Q?tBkSsZau52iTJ0dbvRL6lu6GTOq6MOrCFOHX3IKwy435egyc5jq05xyotNyL?=
 =?us-ascii?Q?y1RjLjI7BI04is8nWZJ1kcOIQFBS/Ra+Du+qGqHSvh8FqyCaeaFFU2OrD6mG?=
 =?us-ascii?Q?uNtgZsOSyBOqqx612LosT39cwbKhQ9MVgdOFrpDT0qp8lkiRs7v0CxmBLnHS?=
 =?us-ascii?Q?SqcDMrakEMoxYCQMbp1ucIWaycjBOXqZ+KGb/jnHuXSQem6IPVUUgFve3IZW?=
 =?us-ascii?Q?0/unkiXQ6PfbbMAlvFPi8kNoW9ykw1wxmFhlrL3qpczYxLrP1PIMkLZbi/Eh?=
 =?us-ascii?Q?svFtfxVP9QuStFDJWhO8xpmnPZbLsK15sWCs6bvD0izshHCg+YNGig7vAyOk?=
 =?us-ascii?Q?XskxVXfZql1whow8JztW97yTKjs+jk/+MduX2jgeQ0a2X+ajLwe8NGSCIiFG?=
 =?us-ascii?Q?Pb5VpFN5OS4zxPGNLRVO13y2/XsmFTcbkY/bTvwmLZQwuvVkaRt+TVggNbYi?=
 =?us-ascii?Q?Uae9swYimcfA9nuOToiuMM/g+mQGW0htGWid37FZS1+qdlDgGFN5WJURZG/Q?=
 =?us-ascii?Q?D5Yq6yT9jGn9JCi12efHK8IytG06pY0V1Q3kmuQU2a9+98oYTPSzUZXntpmx?=
 =?us-ascii?Q?1gMCu9vJ/MiETibGqHGjv1Zgk8u+V5fuHJLf5ELyGXyf6DqB99rxg79wBlwL?=
 =?us-ascii?Q?Jenn/T04HxNCkxXTng41JMtmoR1X7aefga6sOkEc/Ha9TvgR3a5NuxLxfiUn?=
 =?us-ascii?Q?tRZgSZWPg9dcYtE71qzGR9MUS9MNR4l4SgVU28u7WwGygxuMnFSZ4pAsRPKq?=
 =?us-ascii?Q?paZNUb+7a9v/jiueZqHRiHb2ih63IdP2Jx9WGJirhiXqQ8F4YFnyEAof30NE?=
 =?us-ascii?Q?0E8JLQ7VhUkErKfXGl2dtuzOAbENwCXyRW5tODZ0PInVJwLTp2/uiriBhcTz?=
 =?us-ascii?Q?9xVavxCeNGO29Hgxz62inmLxHN5qRdnjXOqrbstqro4BjhlN4DMBZbtc9hbI?=
 =?us-ascii?Q?oHBErDIUg7bE5Ul2oFFZ2jz+uROeMf3prjF+7h+kw3/TNwo7Rqt9Z1i7cjZu?=
 =?us-ascii?Q?kcWf4qAvWoCSr0ae/5XDGGGsx1+NEjh0StXNFdAfqNVXfACboYnTQq3OsKjV?=
 =?us-ascii?Q?1AzPdb1LCWnZqA/m2ETmOQM7jioBAVwUzV+Ar4AYHMQECHEJKh/jneDdCt1R?=
 =?us-ascii?Q?SBIZNbBRRZd1h9kuFYZ8UNKrU7c4/u5JZ0GZ0obIUy1zMJfjlGkmFvhU55/w?=
 =?us-ascii?Q?2Z0OXasqcoh9AmfhIXVNqvm2P5Vr6k7W7tO2osxjsbCfaTgjgkFXygvYKM9n?=
 =?us-ascii?Q?6oRT5X//GrTdL5+epEY9LymtO9OqCHkeCwEvbbUxt5LpaWEoz7L6GWCUzb+N?=
 =?us-ascii?Q?9LdQnEZogPKOT0d8slaZqcEP5npBzrClHZrH2puhC/Hpdx1+AfIlIXHAEyHa?=
 =?us-ascii?Q?8zXsQhRXoRNr5pIPm3th/ZXJV406Q8XUrmqzkb4NIgshJbkLvWDByzWT+kvo?=
 =?us-ascii?Q?2nvIqw5sS6Xc6AG0Wzho0PR9MeyY8dLJwX8YI1weQhhhkV2kgI2oc3wg/gS4?=
 =?us-ascii?Q?oQ=3D=3D?=
X-OriginatorOrg: becom-group.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 567f5654-3fb7-45fd-80fc-08de276a725f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR01MB8613.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 12:52:07.3316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 738f6472-f50a-488c-ab88-c200fd976533
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZNSpvdq6X+pISBAwaJWuHyNP4Hxz9HKAB0uda4Q6H+MnfK07UBPL3trG7/KSbVn0NkT+6syPGIpO4Q8MeaGwpj2/s5mAWbitY6ltvCmDgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR01MB12563

I've added myself as maintainer for the tids driver.

Signed-off-by: Thomas Marangoni <Thomas.Marangoni@becom-group.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 59b145dde215..7b74461b9fa8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28042,6 +28042,13 @@ F:	include/linux/workqueue.h
 F:	kernel/workqueue.c
 F:	kernel/workqueue_internal.h
 
+WSEN TIDS DRIVER
+M:	Thomas Marangoni <Thomas.Marangoni@becom-group.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/tids.rst
+F:	drivers/hwmon/tids.c
+
 WWAN DRIVERS
 M:	Loic Poulain <loic.poulain@oss.qualcomm.com>
 M:	Sergey Ryazanov <ryazanov.s.a@gmail.com>
-- 
2.51.1

