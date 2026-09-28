Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2133.outbound.protection.partner.outlook.cn [139.219.146.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827B745D1B1;
	Mon, 28 Sep 2026 08:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582529; cv=fail; b=l/qrvf/CjFNCfw3FZlHC9u2q9OIBb2jgH4pBgwaqBC9vGJ+MAehaNbFIyNP4EmnmLsG4DJVqt+7MmfAlpimvupDAoi/MDb1dISP3oTTnouWAr3n65Y50JczNnahZHONgNOFWzjVLGQQ7o40mTGPQSxlRmcqE+wseM3VZs5O4IMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582529; c=relaxed/simple;
	bh=1xMCmJtN//QRzIYl2agzUateDWLony8u1OfUiy4elFs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZFVkrW59HO1bVTNfNVbO6dM8KeSV8LB7cGw5St/eB9OGixfxq/VGZ6azLVbULu+lCPLAVSfm8fPqPBcej/u8U8RGyJ3qu9xyFj5D9nl9T3YcVaBSjdAunroyZiAoGujprNThWuobLrN62dmDXLrzSigIthvSvIgB72w0ILi9Z4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNi3UhXo+LQlQVD6tiip87+O7vhivf/Pe+0Tj8O4qxxAayaXeu32lLKgf8G6QJvDnfTHUAxt3FmLrk9iGUtBQRPlP4Ood+4lLOTjSfzApzCMSDjKAjojuX0yOVpFI/cWNwWK+FoyMK2uuuN9R8fJr78oRVcdOy837oQXMO5/4xi8GC5xVliwzLAnJmbJBR+QRFNXp0FZjJDEBeVS1HtKrc/mXd27rVCrlpaqpBDiYiA25BkHu8tzdKRD+iD9LDkq2h9MZT8MzaLkkeGrTRL/zfeO16XVJj4ViCffB3c2CRb30SIwq8HAHge1gu7gGOcNFTX1YxVnXYDiVDI6UnVM3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbD+fCMQs9F2y9HugW87A9X0Dh2zoTW+5Jc0v84ex5c=;
 b=FYgTRSrV1hMogaIKFVHUCu5/1dMzbsAhdtJw3I1zTm7cFy8b4h2FdNwMfZqsEHATcX0Czkw6C35V/46ixH3hNUgvh6Cms86+kMTZFMLySL1bxUNEimK2mFh1f6NtUDVcFWzP94TAJ/fC3llobtliQ46iayzUuwPGVWLifLcbaHsVaEksaOr5x8emhukvTQyeypsJc6ebnwrk09+WQJUhS8sPdrGVIsTmqXwWAUVoDt/vsSZUGMCPPXCw7+3sg0sUvTNnttM5Q7lIX8Ice/+5jZHE72EUCqazAy8H0fkjWN2povZLLYOItomhWsjOIW6rZqSlfSi5zD1E+dtxaQRptg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1236.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 08:00:38 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0451.022; Mon, 28 Sep 2026 08:00:38 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 3/6] peci: Add support for PECI CC 0x83 retry condition
Date: Mon, 28 Sep 2026 00:59:53 -0700
Message-Id: <20260928075956.62298-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260928075956.62298-1-changhuang.liang@starfivetech.com>
References: <20260928075956.62298-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0022.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::34) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1236:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ecda46a-3c53-43a8-059e-08df1d369584
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|7416014|366016|376014|38350700014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TBFUuwH9FQMq4TnNPKvz+ryUfTv2Fs7e8+2CNYp5byEoKbjgBSgDrir2hKJfKEHm/uCyBi6Ce0sYhH8G+u17fzwKzRiSD+119PISaghwTJM7U8iNj5hIKg5bD3hHhMSRONBrOwK68EtcDMBm2rAemaV49oI0UeBo4e9GyRaR0zGML/0g4wAw1X5xQ/++c1chwPwVkPP95ioh/mRdOmJx1mQ89OSFQuCFsFZTgjHsmnp4o/QjY/ZlTM9TIQgCuuuW56B3adBLvgVLmkr8zLg5lATIO50ELJjBUnG+ncPNPCvHWGgIwOQpGTwUMEQRQia0Uf5bfAtBNZAAPEcGFzGBG3bUM+UrC/sgnkOzwjpohGkIIH3ASZFEad7ZIEzg66YrqsoFmnD/6RrPMrCswIefs447ClT04sTE1OLVR+nL9NhPHY7LWdV+mrmMwUsJgFW6NMjZUN7m5lADD5HMa2Qt7JHuQe4MpnQFTSVap2hsWSFyf9cjuu4uup17i/gDMTxWlfngWnSRHkzdJi+AI3jmusruwiCHySImV4Rm4+PMYAY3D7KMRHzvA8ZMI9s6nAoJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(7416014)(366016)(376014)(38350700014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kuZOaFcZbnZGg/eCQBxSHDvsXLntr/J/CHXXMXU3j8B5/NN9W7CRH7c3dMm2?=
 =?us-ascii?Q?824wAAe9Bkccvk04yR4PT4yj/8OUlyScOyZmSQXMGenyemltKVNMR+Mx7vr5?=
 =?us-ascii?Q?lzJKtuvp1FkBGcb3hP9HynRUww21R4BUAIAN9VxXvauXEamhEB28d47fxSyh?=
 =?us-ascii?Q?jS5TfrEmBbRhg3wjXbx/2iUp/vchA+uVjdk7C0m6CU9hnlkjH0DlVc9oO5Ph?=
 =?us-ascii?Q?qExz8Kq6RftTDQupvD2DFGhhIEeBE6p9U9hXRgGyeIhzXeZs7FZ3rFzUrXNi?=
 =?us-ascii?Q?h0mo4Zocqots3jyL9xDysOLa/u9d/sRMhbJ9tL8LkiAsb2xdOduEe/Jut60o?=
 =?us-ascii?Q?H9fgTUqXqS4UQ0i2bIamgbgqYAMqizIObIiMX61ydnvzTtQa+Az+Yz2iFYVt?=
 =?us-ascii?Q?PCqr8C1yzlCQ+sk57Hs5xPOIdtqCgczUyq8m0n8Al3jANwMJEakjZp8CiLdR?=
 =?us-ascii?Q?OZIVtkuH/U9n9kSPLlaKQ+2brrYFS1LbvwrZd5qb1slL2V4bN3Y1GhJG4iP2?=
 =?us-ascii?Q?njOF1BElkb5IIse17rBd7p8VxXUuYoR0asKO1RdeCRwehp4DpWe2Ec/L2Xeq?=
 =?us-ascii?Q?UDwK81DAhQY9VPWix+9Xikl40HQVz/zm12N9pIOA7boakf/rpYc/SN+dIV1q?=
 =?us-ascii?Q?MFs21sihz0gtlgfoYYD++ioJQJ9Djbp8DI71KdN/Its9xQ/67a24zgFLzTvI?=
 =?us-ascii?Q?ZzgHufksCcCgtE5K6K1Tv4r6BRxUEP7sSGj7GXH1zpFkJUF7z7YJWIv6JkIq?=
 =?us-ascii?Q?zFFLorgl3qMm7o9gSBJ2SIV3Xstel1e2TESZ++Hs2SvTcReWP3ABeMGoHB5D?=
 =?us-ascii?Q?0/p+pBfxy2som9Drui80FnKrwW4gFQ2RKLhXpwTZULoAuuZX7o9J9+37yFgl?=
 =?us-ascii?Q?IQqOm5x7Ubgi9Oc52oQ1cNhFvhXAWRQvVI5BhQKaU29ivbgdtF6ZBLvTnPsm?=
 =?us-ascii?Q?eGgvDDXn14fNE/K+ESZ61soN6a4C/t06aCo7fCkR/853vsrTx9gtlj4RAQc0?=
 =?us-ascii?Q?VYNBt3QvEh0zvNMfh9/Orz79ozkaGzgu+zo/g1LbXDGX0052fnZmETK5OC9h?=
 =?us-ascii?Q?Qtxs3zrN824WtfiJAAf5i8s8xr2yN0KxbZzrDZ0Gfy+O6ETWEPK3GT9QhjD9?=
 =?us-ascii?Q?GV3+wCI8Y+yM4pm7RTg/n4iiTRXfYTJjqCFQO+nYKsMvTT9yDxwkdjlI4Skg?=
 =?us-ascii?Q?XHcFSTFk1bxd+zjbotoVmGMGAzfmLWrJkfoaoUa1Ltnt5B7fWHoEPOxatczN?=
 =?us-ascii?Q?NyhsrLO+ZyVaN1VrTg3H2t4UDqkjCKOGRTSxw8ky2eGsap+NHRHpgbmvcmEY?=
 =?us-ascii?Q?si+xAZCnBF/nUts454Fi0dJRufE+cl7yD+Fm32QIUvAHtMoVAZQ0Ct98FQnj?=
 =?us-ascii?Q?4kzY12LCT7HGVbMpri/exJHzfQlJpdRxAv9ZgzBDPhFocMaFC4+xNmdXA/zV?=
 =?us-ascii?Q?9wUtHbJrkSuTCNqlMuDYKoVCifY3IQ6E+nmCWSqSdqurYRMGFaFhgIX8jlc0?=
 =?us-ascii?Q?7tr7ESdRTky96InS12wOPPF/d+lp32m3DeR7YtLW0DbA/E/fDJRkW6iZTehi?=
 =?us-ascii?Q?xwafq2sYHEUxM78kFMJcBTExK++NKKUkfz0gwAr5LfTyFS6dCHVTpjcxzGXw?=
 =?us-ascii?Q?7VWzQck3fH4PMMOfknt5wrsDQ4Dj+ekYBOi8C4MxYlhWwEFMclzE+LVyW8of?=
 =?us-ascii?Q?M9jGEBGR/QvfczrlnOtV7c0MP6bj8zHngCjkfbFFHUSvujFFTX4bRkgWB1Y1?=
 =?us-ascii?Q?+vV19dRQlHmO7wFsl4Fuy/UHkHGidVWlyqAmKFXHWA+Ys0PWPq97?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ecda46a-3c53-43a8-059e-08df1d369584
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:00:38.4984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZw3YDj0tV3EqsDm/ulN+Tfai0KuwFjoWdEkWRfeaIpkMH3MjApE5/CN+1jvIQMt4m3+6RvHqX+q05HNB9EsIWISukTkTEPGwbtA9SxqC1BQph9K9G+hNp9+17H67Vd7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1236

Some PECI client devices may return completion code 0x83, this
completion code means that a command response is in progress, which
is not currently handled by the driver.

Add PECI_CC_RESP_IN_PROGRESS definition and map it to -EAGAIN so that
the request will be retried appropriately, similar to other retryable
completion codes (0x80, 0x81, 0x82).

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
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

