Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010054.outbound.protection.outlook.com [52.101.46.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B672206A7;
	Fri, 10 Apr 2026 05:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775799137; cv=fail; b=KPasICGj/2VkIJS+91CxvyicG30KlKTE3tooGai3EB5+tKXhwHbNeKkqsyyfpRP/oc6Rndy5mwyFDEz9N7OexefdcPEi56OrB57sNIERTfDQrxX7OfpaDHvkaoWOKRRjnOAFkglG284TVebTTzkTbBqy8hlhtW3AjuPWVIxyONQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775799137; c=relaxed/simple;
	bh=fsl21huZXoCNnpwfwtoi35m6yqB8O0q6eyxyQxZgDYE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LFxFDPlkTKNxN7u0pmTDZ2sxDNUCLtDYnqe4qBQ4RFJonJwFDjy+MpjfV2ZXKg29eSqb5TF0xtXJAljBOaSqZURjkWb7lVcUChQn+QsnT9M5n7hN1fw2wPXhbLI5zHk4brIF0wJIa0g2I3Y2zzCGDHYauwGAI6Q0CGfPyeipmco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SblFccx2; arc=fail smtp.client-ip=52.101.46.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SblFccx2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLokgZaj/kcw0r7GsqFIdNgDIqmlddAcoGoZcYC0xre/GrARAJDX8nXS3UhUw7nqkj0ua3h1RXbOVT26GggcpwkJv6wBqfsFEXGFJVtblkMSWFOCiMGlB59St78pqRr04FIkKUip3KkGW7ZJq9vGwWNQIYadPKmdzL+MJfuKLSSfVX/QiaUd5ZkLMwwlq5L6uiU5dFSyAshQAVbWFPd2cmYktr264RxWM2GlPnfKVdTKtJ0pEBvBhHIo+DOqvb6GebPNyhEmUP27eHoagXXs17nPxplz0OMObxn54/mT+dWUqgngqrEn9VX8Riw4TM6DE4mqOO1oxWxtXAy1T2rurA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G11anRcjoPQuX47INYkYStyOSAHerGiJ/MWi6FFd0As=;
 b=FB8ho3kcKaVWEW60rNdTnNT8aCOBY6PvYLWQp3i5qt/sn8riM3Ld1eLPXKdBvTED77sTaaws91yHnT+yx+QtokHxFQ/S2gR8K9NJ2noAByAQ0hSiSLxqUDvhVDOSCZ2kFRXS1cgzoe2ZMNwjaobdQi0fj38UwG8/hLvUEHf7aypXrTlthIzhXrFQfZRf6mXUkQwbkhhzXQs06B+HCaAv58JfhrSV8jQ31xt8a4LORKd8+ZS8DGyKiVVqsbHQKguL51K5ugwk2g8l3m3bpeBSJRUVAxjp8znEj84d5BWJjznHucErcKZXD04smYlkR4w83LijE3y7ykn5YUIaHuw+0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nxp.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G11anRcjoPQuX47INYkYStyOSAHerGiJ/MWi6FFd0As=;
 b=SblFccx2PR0dbNKPBLFxB4DMWdv261y0wx2W2OtJhC31Cbk3XUKthbxzdabKGmfEKqbfT9fYC6cVscFWAbELwefcmGaxQxd9POG7cOf8sJVMJe/W6T/bP1RrkpRXMmXaTly8AV3he2yzNFaVZ0phaf79BXVM4D7wsEGCVcSDp66XwaVF5mz9TcHBrOf0Tn1qkRW8vHoVqcUeVUfYonUP48X1xHpGNrkT9bsyXMnwvdbNHzhcgkeKkj1cHMehkVuSOopamcoweWA7cuRYbzcQQTGElePh97ecn+lXYdt5kI/1LtUoObvi0za/bnkVMO2f3H3WnbuhIIYHW3tsuvVfTg==
Received: from DM6PR07CA0120.namprd07.prod.outlook.com (2603:10b6:5:330::10)
 by DM4PR12MB6279.namprd12.prod.outlook.com (2603:10b6:8:a3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.34; Fri, 10 Apr
 2026 05:32:08 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::4d) by DM6PR07CA0120.outlook.office365.com
 (2603:10b6:5:330::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 05:32:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 05:32:08 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 22:31:54 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 9 Apr 2026 22:31:53 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 22:31:48 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <frank.li@nxp.com>
CC: <acpica-devel@lists.linux.dev>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <ebiggers@kernel.org>, <krzk+dt@kernel.org>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux@roeck-us.net>,
	<miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>, <rafael@kernel.org>,
	<robh@kernel.org>, <sakari.ailus@linux.intel.com>,
	<wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 04/13] i3c: master: Support ACPI enumeration of child devices
Date: Fri, 10 Apr 2026 11:01:47 +0530
Message-ID: <20260410053147.27344-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <adhdsn6u4RAIL9wC@lizhi-Precision-Tower-5810>
References: <adhdsn6u4RAIL9wC@lizhi-Precision-Tower-5810>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|DM4PR12MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 915a5f48-fae2-4cf0-7595-08de96c2823c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	K8d8MHttgKZ7sZLXz2L3jUVQyA832SVAsLtyofK6LBtKXmYtdIyOP9pz8T0qBDguRPt3aDmn4pfo/Cc+G7fahrIP6gfIZCa+rXmvjClGbjqx+SEieQQUUPoW/fhcbSGn0l1bZ+N57o/GuIMpCGF9eG6GVI5Y2cOQd/ozwwXX5HuBadMu0ENyNqsQeARBRw3BZ8pg6JkNDJjytpSVcLgNqW/DFQhbx/REYz8uF9xzZw35hGkrjja4KVxicjaRO9cyknld9aFhMBTHFH80tmLVdfEW9EWgNmG0N7mY1oC7iEvqJ/MrJRIF55XPnNuJEE49J3I1jhbM+LYjktXqkuahUd3WH5jhLdFdpT0iz/rlmRdfMV2GSmxREBPwGiM+hNp8BKX61Q7yD5n2cdm0pZCTjosDZuTfatQ9RehLcUDifTLTkWp/x088Vjq7paAvUvUh1zimePukVzvS3N7JZ7vmClGW9p1GX53ayqqc4ksWQm0aWuLsYdlxCxSUw4n4nl7S3xWG6HJFQVJZ6zeUSIAXyNvX3cQyyyYWQu/sDX08+LmWQTOH46AqgQGIXfGHXrHDMnrCdgX5lprcBu0jpgYg1x5Qxe1Kh2ngLdaKWNw6A/oZjV01EQqD8l2QD6VOzbLHn53lQgGzaN9qKEomeJZ5ddBuxEPmjGuNuySo0UEmaOv/3x39b2jG3fen1avm7kBoYRj0cngDyZKbx34UxL9aNVPjxrlnSNmLI9L+2508kBnoaFBxCzqW5Y/svViLeiTDx3RqNHRF+zs8khqv8/P5Ug==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iHHU4o3JbNVxjulDzm9wqfzfCXhwMBCz8iO/jQZQfbjPSlfMVw3lyYYYf1kUGoXgjnl/mHvkaAiGpdQGTER4JQeg7b2O5S2Z4nX7MOskjCvvBzRw4CIsZKVS94uvznB7tU8zUq9Ay5ApOvpc+O5GbsJ8btwnVmOw8RAylfvrdtWJ+kzWrx3Mb6cP2PtH6X1VwrzPUO3yUj4F1/DOeiNIUveopBem/i6J3NUlXR5R8vONJsTIT/iUCemhqIU9SrTx3GdKBVNzRUoNGc0F7+ij6BrvQ/ep7L2IQI3M0IcbWbV3UuARzwIotBAKSx1HRmUU52LpO9ESzsGOnRXt3lh3+IqixgO/Zcf5/RvKi7lQ9DXI2AOKDFL+0sbF1IC3lAfA65oPJYhXHjfM4PtN05m7aPHGphN3/e8Iv4axTgFOUye5LJpDz3RaYM28j4c3zIKS
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 05:32:08.4555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 915a5f48-fae2-4cf0-7595-08de96c2823c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6279

On Thu, 9 Apr 2026 22:17:22 -0400, Frank Li wrote:
> On Thu, Apr 09, 2026 at 04:27:34PM +0530, Akhil R wrote:
>> Although the existing subsystem allows host controllers to register
>> through the ACPI table, it was not possible to describe I3C or I2C
>> devices when using ACPI. This is because the driver relied on reg
>> property to retrieve the PID, static address etc whereas ACPI uses
>> _ADR or serial resources to describe such devices.
>>
>> Read _ADR and LVR from the ACPI resources and extract the data as per the
>> ACPI specification for an I3C bus. Also read mipi-i3c-static-address as
>> per the MIPI DISCO specifications [1] to get the static address to be
>> used. Hence enable describing the I3C or I2C devices in the ACPI
>> table, which is required if the device is using a static address or if it
>> needs some specific properties to be attached to it.
> 
> Please wrap your commit message at 75 char.

Ack. Will do.

> 
>>
>> [1] https://www.mipi.org/mipi-disco-for-i3c-download
>>
>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>> ---
>>  drivers/i3c/master.c | 140 ++++++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 132 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>> index 5e0e926f61f3..08d0fcabd6f1 100644
>> --- a/drivers/i3c/master.c
>> +++ b/drivers/i3c/master.c
>> @@ -5,6 +5,7 @@
>>   * Author: Boris Brezillon <boris.brezillon@bootlin.com>
>>   */
>>
>> +#include <linux/acpi.h>
>>  #include <linux/atomic.h>
>>  #include <linux/bug.h>
>>  #include <linux/device.h>
>> @@ -2403,6 +2404,53 @@ EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
>>
>>  #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
>>
>> +#ifdef CONFIG_ACPI
> ...
> 
>> +#ifdef CONFIG_ACPI
>> +static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
>> +				   struct fwnode_handle *fwnode)
> 
> 
> Can you move this and below function to previous #ifdef CONFIG_ACPI block.

Ack. I will update, but there are some cross-dependencies. We may have to
add a few function prototypes with the headers if we have to move these
under the same block. Hope that is fine.

Best Regards,
Akhil
