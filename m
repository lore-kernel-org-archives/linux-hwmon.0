Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013053.outbound.protection.outlook.com [40.107.201.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1636384CC1;
	Fri,  3 Jul 2026 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783069764; cv=fail; b=uZclV+dhnho0S5LonWtbg21vdJRDMhhNkqDtxbvcVy4cbw0clTxBk1QhrnWhpjdPszEZPxzO8zlhT5adAPZnGIFSrr13wD/I4YtsEPx04HCwb8jB78O1kA/UnvyfB9vUOIeSWB0QBhttmllcLBPgvaShWz3gVCYHIYa3joM42XI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783069764; c=relaxed/simple;
	bh=KUpn94OhrkeLrPLpSF0ijpxWajXpR9OGECK78PRr+YQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UtRXAVm3paEPt4ym1Yhy4EB9yS8KqKIjy7bKhdaDSqTtJjc7NEYn8h25XWYNU+ybRt3xtrZ73oXYy30FRklvhCbY9hKjRcOVorK10GG6TFVJQvEYTwSYJ3ALywnZVT/x67DPvATq/gE9z3SzjhoUuQrFwBL5F9AryBo9JOCQkb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dEPt/RPt; arc=fail smtp.client-ip=40.107.201.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dEPt/RPt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZVNPM7HZO54B0Z03IewH9h/w1b7NP9MupMX21MdDYWb/F3lY92uNdwf3dq4JFs1Z5FshsbtpvMKK0dCUFIwi4nBVbVH8RRW5J/3tbKLnpC+ncm4WvBOlNfH8M8lBfSFHXECybWYFx9iiuAdqHZtgqQ8XdgQpZll7/zOoa6BS94uULr+aB+jBeISPSk+ER6BY96HMA/XuQa7yGSLFXXGSmSQ8kUbm6AZo4hAm2O/15n+BFoKQ7AbHp3sUrx/+YOEwtcF+qiVHJqSn7hve9hL295DWSTiO/VvfwknGoJ0gHflejDNSen8uMYy7kc3LpRCYTYeU+GH5vUk3V51izKOnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Exft41be9H3fTpkjBZf1GxTMCejqeC8UyAjMIlOUC0=;
 b=w5/NuPM82PvUH+vlwSA4nmgQyFQdbBlaKsnH6vZn1bnpQcSZEFGA7FP5qKLbJdaA8ItAl7OQi8vZnPqdQY2X6qL3l0F9jyTFatMs0di/64tSaziRXyYhjAhbT2qny4AneOpstbw0YZtzE7iuPkTfBDcjKfn1MENVGlAqtedgvPNAm0NTs2n4WTV/YXA8Tlm0tYwWIaxGssBjuYarB+CLBxu2veeQL4PJeoaKaXI7DtIwzX19Typdyll6ln/E0S3CNEpfYTFxYtMgnJ+pXeWbsiER6R23lbLy1bdwSfCXacKdZ06djCjskN4ohnk275tm3TfQw46hBRFYnfuXMr4MTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Exft41be9H3fTpkjBZf1GxTMCejqeC8UyAjMIlOUC0=;
 b=dEPt/RPtixmBB6QhsxYM11iIhL6jgM0HM28tbO5zOrqWJTgny3ByxJHOMwKKr2omuDMbYryElspt19sKfu5D1R+YeSD56ABoiYQRKR8bfrtqdBxh3k90VX7Adlx3IjxhbbzNbuSiWY/g7fI7vobFN1rvLO8u0+Eqaqqpqh2fqKhm0s25BgAebD8dTNi5cfIGijM+3CyP8iKirHIM+8btQwE9fmWg6TRCYRrXRVjYip1H5AKR+VYsg9an3y1cPcjlU806OPNWAedtRjrMg3Z+UjQT4wUGdrLkbBNMTZUWi10wEkS8EYjcbwHq1KLKMBW/JE0dwCHna2XUYcamZNKuYw==
Received: from CH0PR03CA0010.namprd03.prod.outlook.com (2603:10b6:610:b0::15)
 by DS0PR12MB6605.namprd12.prod.outlook.com (2603:10b6:8:d3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 3 Jul 2026
 09:09:16 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::6b) by CH0PR03CA0010.outlook.office365.com
 (2603:10b6:610:b0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9 via Frontend Transport; Fri, 3
 Jul 2026 09:09:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 09:09:15 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Jul
 2026 02:09:00 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Jul
 2026 02:08:59 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Fri, 3 Jul 2026 02:08:56 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <frank.li@oss.nxp.com>
CC: <Frank.Li@kernel.org>, <akhilrajeev@nvidia.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <robh@kernel.org>,
	<sashiko-reviews@lists.linux.dev>
Subject: Re: [PATCH v5 04/12] i3c: master: Add support for devices using SETAASA
Date: Fri, 3 Jul 2026 09:08:55 +0000
Message-ID: <20260703090855.1519255-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aj0iG5xplWPWc6m_@SMW015318>
References: <aj0iG5xplWPWc6m_@SMW015318>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|DS0PR12MB6605:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a89b163-bfe8-46fc-4e87-08ded8e2c1c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|6133799003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	0OBafjpWb/8ADt2IZ+YaDBmLzAM4nqNQHfYKQ5YDcvpNiqW768/d30WPj0h+9SZfz/5gve9l9ix0F2GJPlYwVlnl8RZAZbfUmAQfAbZh9mmOGz9Hc1w3q4JOELvo7CBfqw5CWJBsYrY5aJ7KBL42UbsEsvpCcKKTnFYLgKoLZgidQ8ENUDPJkEsmVIPqv8d2wctT2zt4J5wWCZW1dt9Ysk3DU94QIJwCbVlEj9fslVCGDzPzd4IfVJrV7QEUXcxpSyBLmR508xfZx0+KUwfQkdQjyNj3xYRDH+C12fhShpu4UJFYjsu4UBM4IDlQvecKcEGc57oFTW7TXFaHKfMXoISsq9wAsYkXmLQoILbohrSAUlrK8zrNmdHnxIMThLly37sjblwtX28hWwBKAqrcI/cyvTsEQ7uMe5Qrvf8wqgoGXHC8eFjm3oqapSsS0DzB8hknTJgRw9sWiKpGc1a/jhzHTFnbW0dtBTeYt2Fj1vH2esedlG/1nQmMYRTDs/BRMmd9C6h/wvoOXIoIzYsD5iDLjU1/FFJtWJQ1sEc1cX2G6/2U+rywHrqq1D8KZAUNB3oQxjdL9dwL1cs4mxWKa0Wu7RI2wyPheCxCLcUtBuhU4ranaYu4KBr1INWhD/phlmpyMcZoBQFfQ7ETJqd3vuSr4FBos9QQXkF0SQVbmDmEu5Sj/+bPElHTg9Bcbn9CGba4Uu6QWyWGwSxIoWWdxQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pV6QeB8jYIlSxAQhp8aHz0JEANKV8T71eg0kKiA6DW4X+FM5SUO+PskUoRV+8/q99AocWTQ/m12HY3/wj+vTFx9X8WpPnkW6pSZsa2VDYF1n6DLJuDWnfnhYc4w7Q0s5poxF6M2eOvmLQZVlgwtleZxvGSOGBO7CfQF0MN4NhZayBUEai7xRPXpIsj5mzj5dI+bXBUiO+Uph9YCwilzOtUvwdjgchD4JD2eSfTLw9YvEmcDKqHwqm6E4qMeyKJLZoNFOXcuAcK+nyL4zJbVqcoWHom5+gN1WozkzeCVquhbnmatuyQXbw1hjnH77QC5KfxGpTqB1ZUn8RQTd58vV8ubO5ECs4X/h98dKRGCf3hF0AgYkSik5rotqaW+jeFYmAoH4Cph5g28LCs1Qp26g8O8ObwZigigGQR5MNYKmH4X1WV29e0mtkFYFDk7HzSKg
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 09:09:15.6461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a89b163-bfe8-46fc-4e87-08ded8e2c1c2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6605

On Thu, 25 Jun 2026 07:42:03 -0500 Frank Li wrote:
> On Thu, Jun 25, 2026 at 09:38:15AM +0000, Akhil R wrote:
>> On Wed, 24 Jun 2026 13:57:46 -0400, Frank Li wrote:
>> ...
>> ...
>> >> [Severity: High]
>> >> Is it possible that sending the SETAASA broadcast before direct SETDASA
>> >> assignments breaks initialization for devices that natively support SETAASA
>> >> but are configured for SETDASA?
>> >>
>> >> According to the I3C specification, any device on the bus natively supporting
>> >> SETAASA will respond to this broadcast by adopting its static address as its
>> >> dynamic address.
>> >>
>> >> After this broadcast, the driver iterates through devices and attempts to
>> >> assign custom dynamic addresses via direct SETDASA commands:
>> >>
>> >> drivers/i3c/master.c:i3c_master_early_i3c_dev_add() {
>> >>     ...
>> >> 	ret = i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
>> >> 					i3cdev->boardinfo->init_dyn_addr);
>> >>     ...
>> >> }
>> >>
>> >> Since the target device already adopted its dynamic address during the
>> >> SETAASA broadcast, it is no longer in the unassigned state and will NACK
>> >> the subsequent SETDASA command.
>> >
>> > Look like correct, but I am not sure if target will NACK SETDASA. Or should
>> > use SETNEWDA for SETAASA method.
>>
>> Yes, this looks valid for mixed device buses. I can move
>> i3c_master_setaasa_locked() after the SETDASA handling and before
>> i3c_master_do_daa() in the same function, so SETDASA-assigned devices will
>> ignore the later SETAASA broadcast. Does that sound good to you?
> 
> yes, try it to follow spec.

I just noticed that the specification says: if both bits 0 and 1 are set,
meaning both SETDASA and SETAASA are supported, the I3C Bus Controller should
use SETDASA first.

So moving i3c_master_setaasa_locked() after SETDASA handling follows the spec.

I will wait a few more days before sending v6, to see if there are any other
concerns.

Best Regards,
Akhil
