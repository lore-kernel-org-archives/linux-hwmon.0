Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794812887;
	b=H68n4op0RAJnlMuEy8Qs+GH89eQRX338/bRZSSx+jD+Gn2Y7fCYBtFE+GJNXXr5ZTFpB
	 OGX3bDnWi7u8f+HdOi7PVEQo6ymz4OvUBlepCX908WKIC8D/cOShSGKh45OEdmyGg+pTF
	 pVu6RpCk9RTaA+sIDyPe7XBlviLbqKbaHpnx8ILB0llshnOGVzI/0k0EYZ55YrZoyuQn7
	 L5Mp1QwjEcwx0xYm5ZCNipjlcO0mWoPK+P2Wa1ns5m3Y9yAza/AlobaxAgOT51bGfVMdt
	 FmHrVvFngI47famKGu29AyQiTLHcKlVnZkWQ5ECsCPRXnxNIRMXmhlFUr+h+BQ3IwqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812887;
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
	bh=gx+cZ0m8nw7r0rKwv+CmUpZhlub3hcmtnppNf3nh3RQ=;
	b=Yh0y1hN6+Zm5JfF94PR29XIPwBlYJ/M+q7uE6Kr3sbsRkjayDpqPByE9TQUpshv6TwCQ
	 L5C+X+jJ0oS/WYoseSSNnrVccOWsawI8RMI2qyOiO5fKp3E9U3X8CN/FcKXeh164UiOCm
	 geDXqvNAsWz4ObH7ncfeOcaMS/e6xpAa1drFPMLgcjNl1Gn82+C6hWr7KuFeEKlH5QqBF
	 AXqzYO5DJLsA7PF43vYBSkmJUldaUOVJProczBSwFroVd8APNro6YLQcVEc+mKUycsTFa
	 u8kMePlvX+9VpX/cLmbdSNH2VbGR0h9XLozADVPPDFRnARG5yLlpy32kJOZBJFCe30w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=B+pfZQUT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.62
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011062.outbound.protection.outlook.com [40.107.208.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605A9606A883
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 07:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 605A9606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=B+pfZQUT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aN4KqwMw74T3punviiITJ/5Zs4CygcsnrSww2NcRRGbhr7XaDOv5nZQccQ45603ygNOjJST3je0bLANVlp9IN+CGt30R4ZuuZ3TPlQA4d/9bEAVaE5V34/QUhbQXncbPSWfCEL6H3rwLReMocnPCO+Q6beT20VnVwMXNJ5930vgf1zY4a06GvFWAA7X3QPsLJCLwptaIh4QRwPIYqMc5np4n1QVtluk+/N2zAmU8xnJdBgRJgLxfhBA/gpVLKCtVGbpMSySRduFQKUTQiigqP7FUI5glyDb9CB6YCfLPKc6N83gLLnGbZmUVq9CUEjhEpqdioBqEVRfVxCVO5+Vb8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gx+cZ0m8nw7r0rKwv+CmUpZhlub3hcmtnppNf3nh3RQ=;
 b=H0z+r2pqCkZMapcfeiL2zvnilwZYV/OsiX91ntPYq5jhieVOrvcNhmPLguKkr0GM/j1/BA4MsSoAUp+af8vtzQJP31nKwNKSy4LC4hBRsMZHFDxZ5fJIC4SOr6+Jkh0nEsKMsD0PyEc4oY5Kbm0YJCbDSPkhZbUfOO+c1Gze3ttbKOhY+AIiIP7fSiGd8kVGnTeC+cF1GnYJ0CePxqI6O71+g8ze/edwJ9YwBDgEt7CgakHOgWGn0Shnkp2xKl47Atcs+eqN81xmJBl5skLK75hc0QmNsouJX8oGStetBz66EFUqeourwxCjku5TgmlUK2kEMXzT9mJG4Muk6FAOTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gx+cZ0m8nw7r0rKwv+CmUpZhlub3hcmtnppNf3nh3RQ=;
 b=B+pfZQUTbb2dfwQGjRigmzZ5KKtjPWjNrdrx5EDbJF0lrjE3qeUa+kGo2minWERCrTFGHfbGgLAUXvzcQdBF+sHDEC0j/JEqHiG0LVXEJNQtpTJq+IdvqD7r37tGprCABmo2UhJG/1i2bzOt8lAomS8DvGkKDGHFvJnU7isB30I8ti8CCI7038VlnqzHxSNioBm9TlzYbFRAgzJI8jaBCqXYagwZGzJV+HxjtKDXIyn+ljFw97sgWZEJmsiRDez7c3vvlzilQ7Opm5PDlQeypMNAhKcekTHBZsFZODsx9h7GuvxzM3R3AiWJRy59XopwtaYb+OQByLc6jT8aO7frkQ==
Received: from SJ0PR05CA0027.namprd05.prod.outlook.com (2603:10b6:a03:33b::32)
 by SN7PR12MB8603.namprd12.prod.outlook.com (2603:10b6:806:260::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 07:08:02 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::26) by SJ0PR05CA0027.outlook.office365.com
 (2603:10b6:a03:33b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.6 via Frontend Transport; Mon, 16
 Nov 2026 07:08:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 07:08:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sun, 15 Nov
 2026 23:07:46 -0800
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 23:07:44 -0800
From: Felix Radensky <fradensky@nvidia.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Vadim Pasternak <vadimp@nvidia.com>, Felix Radensky
	<fradensky@nvidia.com>, <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2] hwmon: (pmbus/mp2975) Get vout fault limits dynamically
Date: Mon, 16 Nov 2026 09:07:29 +0200
Message-ID: <20261116070729.2560003-1-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <8e4410db-66df-44b8-9617-1013545d7b43@roeck-us.net>
References: <8e4410db-66df-44b8-9617-1013545d7b43@roeck-us.net>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|SN7PR12MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: a39292ca-8313-4aca-7d4e-08df43b05aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|261021121427099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	8BQlY1mIGqjZwVPiWbqq4wgZ0aYDsVxoPL068P85Re3A2LLtgmMSVfm4pjqUQgbM/KuFgft+TmyF1YqS8/MolaR6+ceA9U7hYrVrtJ+VPq5P/iwrj+JeTW2Q023MAhtKg+R9IVAPPMz3j4LyZdR9vezxLGGeETinWokY4d8C2BhK2DEoM9pRSsQyFYytfGW+0C10WRpznmOOPs9Hu4aLja+j/XCewgPyho9veCjiPs5TsiFEdhcYCsIBdhTQGQTg5QtCL8Z1KFNorh+7SpBovCqu9RWyAsoxkgeQH9muFJX7+mj6rjL1q0jmxH5qFMVFdztpoyk0JNklHSnoPap8uHtV/bi8nHzHXkfRPkA4mhjFbX5qfHLzWYKGadgiO+fGC2tzLsum0wGAE6LECgvb47Y4/0mOZB4b27vk9o1maUC44oM0xJbW7j/XA0+Vr0ypneX6waW2YMxrFKAixKY+e9lCvODj5gxelQW5k36fjFYPvwwiGC0AvVZ77+JgrrAIOTKDV87gkKxQdx0XNxsKUo7u4yjfLI2WSxKP4CvwxTBxSnCECCPeBhvApa7V5DcGTu/cvLlbHB2CFbMis0tRx4qkMX1AEyNuo3YXaIXflI8fOqKo5ewYBjQeaylxRLpmfvYqkoxfXADsayKAwrsSRVVeKP5LDCXHtWm8kXiv2Ai5otcEPHVNJmqSvOQVMwHT6wfN3b9Q5Nvk7O69YBKAIw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SJ66OJI1GGyJrtRlixqZn93NkQ9LutjtgC8k3D0GLW5yIJtZ9gDSWjWTPii4+S4NfjYmRoxfax3D0LBDFl5/7mWLnw+I6jVMxxhAxLGLNyckiEtBYuiXRxjpyf1WrjZLuECBkTn+3kbJsggFAMzZiSS5/TZ6JsgD18k9cd5FnTQfONc3iz7Io+WIAJccljysYsXR/YO/6Hu2WEKotWpiE4jt6eFSbX2R3sE7EEIyON4gvh4pYFxQA8s49ynra3569PJZWQY5LqFptooCsDZSMpY8fmPq/4YrrL+wqeabyGuM4pEcwilk348zVkx0l/b5HSl/4LEVPqnX2aAoHGEPPEuwy5iodAcTODhzIrMGnhwqmJ1UtaGNPkMbZHMc1YqKtcqdBRR2ZCXaOkFdmffmjmkf/TXM7nPyr91ofIz5Ld4ZzyjW2PCThFlF7J5lX3Fg
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 07:08:02.3831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a39292ca-8313-4aca-7d4e-08df43b05aa7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8603

On Sun, Nov 08, 2026 at 08:14:19AM -0800, Guenter Roeck wrote:
> Applied.

Thanks for applying.

> Unrelated, that makes me wonder if we should introduce a device flag such
> as PMBUS_FORCE_PAGE_CHANGE to support page changes on single-page devices.
> This would retain functionality of pmbus_set_page() and avoid the need
> for driver specific code to set the page. Thoughts ?

I think the flag makes sense. With it, pmbus_set_page() would also write
PAGE on single page devices whenever the requested page differs from the
cached one. mp2975 could then use pmbus_set_page() for the page 3 access
in both configurations and drop its direct PAGE write. A single rail
device would also get the read-back check, and recover from a failed page
change on the next access, as multi-page devices already do. Some other
MPS drivers write PAGE directly as well, and might be able to use it.

If you agree, I can send a patch adding the flag, along with a patch
converting mp2975 to it.

Thanks,
Felix
