Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795367439;
	b=EZFZWfr0O6CfBGNun8p6DCWhk+hIlfgyHwHTx6ISAMQaNNxSQn7YXd7vkg1NfjNtud/D
	 aVE/bbQBDISUUumtkkHYsBbHYIG5CwzwVvpc0OTgkPzi1Q/MoXnzRqN1O029Ua+F6ex7f
	 svX+PLM/bdxu8wXCGCSG5WEjcPVsQiveeiVqhZgFjNTmUgprUnD8O6p1rdSAVJuEZPJ4y
	 k72KY671T6nihollwO+inH3yzQc/kfCH7GjTdRkegGAQet1MdmRoSNAWJ7DC7HA8ECYKA
	 VeEX/uW3XquvloBTdJSELg8DBzl6UmXENUoLjXT1gX4BHjFKpiCDZt0nd3ks9zTEWvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367439;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=D75pCHxSDUtCF5Tyby16qHmNEza7JJBkIo6c/wnNvTI=;
	b=re8Ph3t+4T1FpQMz6SQPddr8muqXgctY3r417nUNL1w2qF2JfHI/Q+FMiraAWb/aBt8I
	 b5JABPKalGrPRBH4wwmNN8kN4SLx5g28PVKZha5GQcivJdqHp6WxKsJJoPcVVzbvIjwyy
	 zEzwoAhtK9zJf2CmHpJvu3ZVVacT3mneXCbWRQlkOHKX+oBG8ogaPxRGhO1V+2B2FSB4l
	 RUEEYyh6tqRrP5dqVfFfJTT87IkAbGbmDiVkd+ysrko+KVrP4ByjhYE+Vl62CHOXgusBV
	 mmSoanCUZgzltF0ptnnv2qP6kzqWAN4mk5SFVSJj3feAo5Q0Uvdnqw/nM0T0k6+JOLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="AjlFK0o/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.19
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3516606A688;
	Sun, 22 Nov 2026 17:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3516606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AjlFK0o/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLahjL9SH6VcIxahZPPzbkD8KadYof2+lPz/iDYz8abseP+Em6JS9r3oopu3VF88pxcvP/2ZVTUEILaKfWlRCXpohpfh4NwpK+E5GqrlF0QvUYIhWXNwDa0PwjWKKDXvowuZWjM34wubMm3ff2gtyYYKnErCkg3XHUMlxAgJ1YZa0UGpIGpxKrDXgVjFcGK0TWdE1GL2XB07kqStaPjfxXuuv6mAPjfvALdp9Mv/jQbEt2KjOrSzI4/Zq/s/59nPGNDbacp6wUaive8vmFD9lhU1cLxvmR6cxHZCu8gU4afn1MGSUf0wt0TC63Q9uNpiqU9XqHZZ4zYydlGOfIC/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D75pCHxSDUtCF5Tyby16qHmNEza7JJBkIo6c/wnNvTI=;
 b=FvjJh9KIe+ci1bK/obRQlzC+t8yPmxWhkXNtzCbDRbtrzhOkpM91yIufE75UEUtnOs85Qwfie3iWAS92i6RDWuK93d9NrcFFRDHo0IL9ao+aE01lTYy7hA8KgLT9ukQmGEiYHU2iC0Nh2zpsINWjbtR2lJtL4Nh98BRxHPT/zSlEiGzOIs5Iz8KXIraIiRQWz1BueBzzpgamb+SBwPK27XSZWJhd0829LpRxpmgfwPU6Yu3kKpdB8RBOu++3jkHdBBISjLufY14aDQ84wEqn4cgqdoEoY2dw3vUgzR8w0rKmyctUTLXCUf3yAdpzXLkXQwKYe8u7+wfed86Tpao+tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D75pCHxSDUtCF5Tyby16qHmNEza7JJBkIo6c/wnNvTI=;
 b=AjlFK0o/oxheHncvVBVfWCHbVWcI44PXq/r8NNNEyFQxOw5vWF7F8uGl4Y2wQFO+HNXeYBkKZz0B+BhuF9UYURO+iDGfLmePskanKJciyYXhVFBzDAptRmLjAkXarFl1Hjnq5oNHpXdsJPKUmNtI3ZGH4HLKUA6BbXPN2/viQ9R5yrnSeVxaD/Fmou257RoeuRRoKt6U/7//jMLYdP4SUHztpGFeoVbffZV1gldckvk+h6WBVHRDgMYzy+Xr9sGiz1DuqADlkj9Ag+TLX1SHxwA4FZfa15aYIeFke1khkZlR/Jry3NHd0llip7HsHBhJ/f2SCBnCtlJDIFovUpg/og==
Received: from CY5PR04CA0023.namprd04.prod.outlook.com (2603:10b6:930:1e::30)
 by BY5PR12MB4067.namprd12.prod.outlook.com (2603:10b6:a03:212::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Sun, 22 Nov
 2026 17:10:31 +0000
Received: from MWH0EPF000DD30F.namprd05.prod.outlook.com
 (2603:10b6:930:1e:cafe::5e) by CY5PR04CA0023.outlook.office365.com
 (2603:10b6:930:1e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Sun,
 22 Nov 2026 17:10:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000DD30F.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sun, 22 Nov 2026 17:10:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 22 Nov
 2026 09:10:17 -0800
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sun, 22 Nov 2026 09:10:15 -0800
From: Felix Radensky <fradensky@nvidia.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Vadim Pasternak <vadimp@nvidia.com>, Felix Radensky
	<fradensky@nvidia.com>, <linux-hwmon@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: [PATCH v2 1/3] hwmon: (pmbus/core) Keep cached page and phase in sync with the chip
Date: Sun, 22 Nov 2026 19:09:47 +0200
Message-ID: <20261122170949.3059743-2-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261122170949.3059743-1-fradensky@nvidia.com>
References: <20261122170949.3059743-1-fradensky@nvidia.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000DD30F:EE_|BY5PR12MB4067:EE_
X-MS-Office365-Filtering-Correlation-Id: 47007b16-ebd6-4273-8966-08df48bb837b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261022075727099003|261022105027099003|261026140227099003|261028144727099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	jlQ4sqVCLwangj7WMw1h6QFnuVGTM5XB5/Xk95dDWTWVZeR8hup38vg5T+Qp+BcNRe9p48N0/OCNYCZOVaDVcCCVOgAUakkoGohHXgYwNdqOX3c00p+VIg8WWSlJSbsnOS3ityOUSiwHl6X4yuk/8DVdbN5mVfad3D6nCaB53ccYt7Umnlku4wUzbdn6kU2A8UBWbOh95V7AiTBFHqPQ6+aivCSeq8sHvu8AWbw8zCJJh4eWIzHQqJAvYIhodX95J86euUk4al/i6mYH19k4lf5vI7DTUWim3+iGBNDjmawGLgDOaaWbLNbWIoD7cJi+JiolFMeNZsY2LEiBxA9mXWAMOZaS/wqmjf69dAirtw9tfkesvHAV7MPf/PPvDRqwL9EeFnyZhARyhsRCJyaTB4mHWErrRLH3FN6UHrLKTCDnLmt8duWgByEtTaFhd4x7+Osg/erqaOhB/b4aULWxt6Ue0nUSKPa0K/uJV2LQ8aFCB3ad4P+0F9oLIMkAZsZp5hPYOk6qL1mf/66vgh+2Gu2dr4sCjukl+ee0/Q82zB3yHjh4AAo9yYvx7l7kP/q3oZ2NGhvTAt1SiiW6+bNBy49DjSSMUtrb67R6rMFaeW1nQ38MdnBjbS9e5hcutpI/VgPvdEofdaEAZTQvmg3CLyul3GPTpH31Uzg8bHq6GVrqZxKRyRi/bF2j+Hthg3OTtCnXOVyFiJUDJtScC6hYJw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022075727099003)(261022105027099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rTdb64EHGoQk6uXobqR7Vo3NA7kdqElYVX9YjpjEp5z4sUgO4hd/CTh0qW011z4b3Cjwp6giyOtZ6bTzbr4y8CAM5y43+gxtAoMVEE3TVIykjCtKahsPrspKi5QTzEAhjRuVaw9dQIBAUUpvSXhq0crPAEEVHWlAgybWPeuj/a5BC+geQhzFL/jKhowKqYQJJsYFxKbDII2PBnGtAqtR1tDHWzPwwfuJfJbYAdUZL9+dwcbewLRAywqCcGuyZDKsVyL9XCZSVnSr2qiK1K1x70iJ9WrX+HaC9OqFRsi0gegUVcIJ8dBP+4i0LRhJSLVscfpFKIDpuRB2KqHx5z/dL67RAoY4/J6pjH9xiDPsevkpa6tcJJzZixRojmXnSDpNYUKCwTnwvMF1xLwI4WoILVmngV9NLSN9xjfdScGCGIs7DhLlCtg8YM8Z7wKeC/p0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 17:10:31.1373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47007b16-ebd6-4273-8966-08df48bb837b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000DD30F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4067

pmbus_set_page() caches the page and phase it sets, and skips the PAGE
and PHASE commands when the requested value matches the cached one. The
cache can get out of sync with the chip though.

If a PAGE write succeeds, while the read-back fails or returns a
different page, pmbus_set_page() returns an error without updating the
cached page. The chip can then be on the requested page, while the core
still caches the previous one, and the next access to the previous page
skips the PAGE command. The same applies to a PAGE or PHASE write which
returns an error after the chip has accepted it, such as on a late NAK,
a PEC error or an adapter timeout.

In addition, the cached page and phase are updated even if no command
is sent, that is for a virtual page, and for a page without phases or
with virtual phases. The cached phase then no longer reflects the phase
of the chip, and can suppress a PHASE command required for another page,
even if a failed phase change had invalidated it. For the page, this
only causes a redundant PAGE command, since a virtual page never matches
a page of the chip.

Invalidate the cached page and phase before changing them, and update
them only once the respective command succeeded, so that the cache only
holds values the chip has accepted.

Signed-off-by: Felix Radensky <fradensky@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
v2:
- Update the cached page and phase only once the PAGE or PHASE command
  succeeded, not also when no command is sent, that is for a virtual
  page, and for a page without phases or with virtual phases (Sashiko)
- Reword the subject and commit message accordingly

 drivers/hwmon/pmbus/pmbus_core.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 82dac2c6c579..5138c802d8ab 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -227,6 +227,9 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 
 	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
 	    data->info->pages > 1 && page != data->currpage) {
+		/* A failed page change can leave the chip on any page */
+		data->currpage = -1;
+
 		pmbus_wait(client);
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
 		pmbus_update_ts(client, PMBUS_OP_WRITE | PMBUS_OP_PAGE_CHANGE);
@@ -241,19 +244,24 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 
 		if (rv != page)
 			return -EIO;
+
+		data->currpage = page;
 	}
-	data->currpage = page;
 
 	if (data->info->phases[page] && data->currphase != phase &&
 	    !(data->info->func[page] & PMBUS_PHASE_VIRTUAL)) {
+		/* A failed phase change can leave the chip on any phase */
+		data->currphase = -1;
+
 		pmbus_wait(client);
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PHASE,
 					       phase);
 		pmbus_update_ts(client, PMBUS_OP_WRITE);
 		if (rv)
 			return rv;
+
+		data->currphase = phase;
 	}
-	data->currphase = phase;
 
 	return 0;
 }
-- 
2.34.1

