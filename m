Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D5A3A6B82;
	Fri, 24 Jul 2026 07:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784878163; cv=fail; b=qKfi5btveVebr8XaEtjW2Ez3OF1njgSv3r9gfmgocfKmvhQ6t6pevH/A/nRxmaaU4ueiQIUhTEKhREHxs1N5S8Gj7LryFFsb3LFlnbDfjkibk2jBiNoAXWa8/2FhHlpinWx2dV0qFi86AV/uOWKginFUF/63t4i35FgfS0y3qnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784878163; c=relaxed/simple;
	bh=PhSpGppKZT2hx0KJDkfUt2TZZ4oQRE9LK5Rie4nh6y4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KZg5Mnn1W1YUGm61vYZco46otJre8hV1DQynoO+vvLGRW3KiISnCUX81MiaICchfT7pRTQUcjnOA93MbFZ5jNY0ZAZjNmP9nNfRPjw6Kq0kXrAmNatBuZKFyVOTCL3yHdxv7+hoAX+OoxeSsFXuCFYfN7krOycRJ0+8g6hmxe48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1YR6XW0Y; arc=fail smtp.client-ip=52.101.52.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1YR6XW0Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEKPNEZnNDHcQqYgE0+lCv4HVgeEh7wGM9P+VixUSIxDqpD5UFtp8pDGySkF3TBl4uwT2+MgxOunMCANz77WonRqbkAzkSLkorbpJLd5dtt+LMNNoZteW7aLGLahFDkz7NShfB593d2Uimk9yKxi9crXM4OdOte/oUHvHoxygph7yGaAR86Y1gpYlPfwtfXHcYWb0hENo05BInrdpeWLCxhsItDgnmxBon6jVtoQV1lxWFCFn3kcHb0//PrCwFXORFNUeU6KOYt7h3jxvsBle8RYptnP/K9bq3ejoVCPVp85GAt0CUmTez/pi7Rk2ByqcUpHs4BFOSwUMhR92MGE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhSpGppKZT2hx0KJDkfUt2TZZ4oQRE9LK5Rie4nh6y4=;
 b=wWCP+p7gUoOn80Mdm7p0pP3I10oeKQ2aFVgOikD9Jr+UOMQIsJqLoCLLp/VUKbll3kJdXvkCc4qrjQB8p+WEoJMw15XJGMMBeXpK4nTMs4coEHhIla6t5WxSWMDhvnoRlWbxNpo2SwCVXSau7913mIlcMxAK5mSwZTh+1CKp3L+xrxvAcS6meHONZbPmKtlNzBrX95UILh/BRbO0+iE2bOT2VNSYkUTIF9FaljRvfEvM1/a3H9ZUkJZMqJfbQPCXEBpf4s1CEVf/M2xBPTwdB8e9fWip7sodvjRXyq8AX75qEvr+le6gpKkeUqcvNEaUyeLY+h+m/ubf8GUWYmsHoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhSpGppKZT2hx0KJDkfUt2TZZ4oQRE9LK5Rie4nh6y4=;
 b=1YR6XW0Y3S0fFxTwhJmR+2bk+OR8Nxdqp04Iepfrx4Op+xpSgkahJpg68cxwOeC829DZn06ICLOou63G/5Cd5CyDkVRpNJbPbopkZ398MqK/55EyOfgv87yoP0zT3kWGXUhsLpC1jgzTi3ROABDDyLcUZ+HSRMeK94w/j8tIIxI=
Received: from BN9PR03CA0369.namprd03.prod.outlook.com (2603:10b6:408:f7::14)
 by PH7PR12MB7115.namprd12.prod.outlook.com (2603:10b6:510:1ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 07:29:14 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::a6) by BN9PR03CA0369.outlook.office365.com
 (2603:10b6:408:f7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 07:29:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 07:29:14 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 02:29:13 -0500
Received: from localhost.localdomain (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 24 Jul 2026 02:29:11 -0500
From: Andy Chung <Andy.Chung@amd.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>, Andy Chung
	<Andy.Chung@amd.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: hwmon: Add Kandou KB9002
Date: Fri, 24 Jul 2026 15:28:33 +0800
Message-ID: <20260724072833.2918337-1-Andy.Chung@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722-efficient-mussel-of-enthusiasm-1df91c@quoll>
References: <20260722-efficient-mussel-of-enthusiasm-1df91c@quoll>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|PH7PR12MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: f2acffed-e6a6-4f09-b823-08dee955432c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|23010399003|36860700016|5023799004|11063799006|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	q89VvzmanktKYN6n29fAoi6Hzgv8AAJPQy6l1MQpsj8WO5ag4QZSU1SfzvGV6qbBOSh2nPp7WeTPX4NIardKUKMtOOLUTCimTqu47Qo9H8LzG6cbbzv4vLfl1ttPWWbRAKea1cOSDdTgxBdUMmMdtmG6OGb2Bof+lwOOTiORV8OmX9MC77oudtoPCeIfmCnHs9ajUMYnQ0gAbr2ZN2sz++fkPO9K+AvMUnaiXtvCA7RNqS+OHPfm1WbdttMUJvovyVmu5tBtOxaPXOHLPckWxtdZMaNtmt/y/lwfuiTICO4NhzU7otMTdpcQwXeE4PpcR6GZf2BVZzBwQCAoYcgElxMfAn48oQftf05Hzc184ARrhULl7fSgKjaaXykmxl7UmwTowe7nLExpDL0mZFy3/U+kBivRWkvEOB1dKlDjRKATyOtjp4m+ZPJgKEVvXBkuvZ9xxUApAql5OjS5LhBa5WOrlqnAI70px4k3vt599vOfKHyIKJUkofZNCcM8WlBZnvPxfdwDpu2Xyr/tL5DP7VnfLMkOoh4ZqUQgA3mY1CK+m0Nz2+mCvftC4Itv0TC/STq+3CHFxQWMR67klqhPo8wEmIeeyD/Ka2H50CXeaKS88A69P0ddasPzTg00T0H4MB6/6TKE4fkSNCpy8EYrZ3CzXPx+YeVjUNT5jw3F6ZvS1Bq4w6uwCxXx0BVXe0cu
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(23010399003)(36860700016)(5023799004)(11063799006)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LntpxaT7ZLUKVyiSsCVs661wvLydqkwGIGNCBSSG0qSukFQceMK4OwnLrPeE1Qm6H+UTk3Jd/93Dn2gRUi9NT+teg4c9/G4Xh6aLxmRWB7AxtHZUrSmp68Dt5NPPI5lAhuRixKtqc/0OMz0kzCZn20jPzM/8r1r0T5SJyr7mP41YqSDGOKBMX/isJXhECNb8mekrbJyw5qWcx+aDz7yZXsYpNjUGg3CFCC+LqlxbyD218TLuhNLKWAm8RTBMp+uz7dBmILTIsvj3LoZlkju7TwREDCNZwjwC2spVY4XiWRVzd9yF+zEjE+mAedELL+MAIAhv6dt0Ub27q8vdiK0BCt9SgJ82zrghn7e//0v/LFAqwsc+H/MBW92TPDvBdReCbCsNCPvgDOJWu6Clf2zwDXBJmag0YXR7QLjIbZ6kMUl0IF5+LuBz2AKsox/291rf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 07:29:14.1269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2acffed-e6a6-4f09-b823-08dee955432c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7115

On Wed, 22 Jul 2026 09:41:29 +0200, Krzysztof Kozlowski wrote:
> So a trivial device and can go to trivial-devices? What is incomplete
> here, what is missing?

Right, nothing beyond compatible and reg. v5 drops the dedicated binding
and adds kandou,kb9002 to trivial-devices.yaml. I also changed the
vendor-prefix description to "Kandou AI" per your other comment
("Kandou Bus SA" is the registered legal entity, "Kandou AI" the current
branding -- same company).

Thanks,
Andy
