Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013052.outbound.protection.outlook.com [40.93.196.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424243ACA79;
	Fri,  9 Oct 2026 03:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517922; cv=fail; b=HmOkMfQDWgxsdY/+ACWEVDTRDpg8AAyzGDzmmgvL5iCypNxnvpt8e7ntNgNAFmWjZ+C5I91E53GTmPXh/9grufmEMuTfa8j+4Z+z6CfaN8sSq9fgpZkqPTHnPHjxDsKvF4zFS/CtlKbAI3ExYcWYZKBRWTPa2Ey8SRJEGz3YCv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517922; c=relaxed/simple;
	bh=ZtOv+Fqha8w0tgbrABZdpPiMknvLIOb+FsteFET5Uzg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JSzBbG2ZugDF/9zzPpcFIuXPeWrlGNqwdfXOtFn3L8s0AbVEkZ0sZ5nBkaBfaISARNQiSTlWVpmrvb+jWtlGdN31A12uTZUPls4qANyrhcQWttHiSRS+mNxpsnBja32noAXUaZlYXxqq3oxBKzcG1KrtsMomV7XW5fDnPp4pDlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dYkH+r7j; arc=fail smtp.client-ip=40.93.196.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dYkH+r7j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmdLkTxNA77qrzi/Y47h7tT0NpsaOSyLkJzkSWeFQMZyzj/Z5XXanA0Xnhq7ZMHxmfCez9Yhj5/FDXqIezx5ooobSBtc54Erva6ZlF0NtupVJeRwexYZl+qHdmR0DtJUxIT0lEyXQoTcgoyijTP2Do05jKo6Lt/opcJHYOVvNUjArRXv3eGfZ3EdjzhOkLjwAcDYDNUOvYYYrfLdgb7VZZ4GhkLj2+vKqQIABLkN9v6lmNk29uebzawhNDGmlsfQ3J7WP+yWV5hIZCoVjubO7a/G98EdAwbB/bMCvrq0rRnoWxE5mYXknpddONhhnYPcvRYA3SanBCst1V5Hp/MoIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBVC2dZTu27d1cRtXbCfYdM+TM2DzH3dWzGR/9AtXVY=;
 b=JlmARuVlLMaryPeWtPKP8BoWD8AquyVSoKwKdvPrDIkquseHa21+H1N+2UuPIgSoXEk+edtktrw1FfFg8fvwNMVyFTQ1tQOEXo55YLPwUJJHwyp2r1k0kLwMQeUWNEoPEZOAJ6Mq8zEiUj03dEshE0h0Jbrb2PvQ433aNQe0gme1AJCUTqJuKpqtbzhGfNGALvUOGbjZw9NTm32MR3LN5N80yOzd+KTp4VRimRUemut+9QD+jpInF+M1eR9/ZnOub5djz3Nhbc8sX2LYr7lm0BxGoLHCoXb/rjODrrPYFUclWgLrJ7DzaSznEqILYzzerFobkkWhDiJkEZAHGz0P9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBVC2dZTu27d1cRtXbCfYdM+TM2DzH3dWzGR/9AtXVY=;
 b=dYkH+r7j8lGszSwM1koafsUqQ2Js6ogI+tNy/lHSlf3G/k7wGNt/9Zmn/eDm4b71SiLxnaU/s3nqOdiq5gVd6dQDYBmikxb4LRMpam7wlHaWowzVQk+jlXhe/sSfGO7njyU+Y8Jgu2bAcg4U8XMIU0LPo6tCEEPwJ6RTMNL5D98=
Received: from SJ0PR03CA0037.namprd03.prod.outlook.com (2603:10b6:a03:33e::12)
 by IA0PR12MB8716.namprd12.prod.outlook.com (2603:10b6:208:485::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 9 Oct
 2026 03:51:54 +0000
Received: from SJ1PEPF000037A7.namprd04.prod.outlook.com
 (2603:10b6:a03:33e:cafe::6a) by SJ0PR03CA0037.outlook.office365.com
 (2603:10b6:a03:33e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 03:51:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A7.mail.protection.outlook.com (10.167.244.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 03:51:53 +0000
Received: from lab223.rund-run.pensando.io (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 22:51:47 -0500
From: "Nikhil P. Rao" <nikhil.rao@amd.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <netdev@vger.kernel.org>, Brett Creeley
	<brett.creeley@amd.com>, Arun Kumar Prakash <ArunKumar.Prakash@amd.com>,
	"Eric Joyner" <eric.joyner@amd.com>, <nikhil.rao@amd.com>
Subject: ionic: hwmon in the NIC driver or as an auxiliary driver?
Date: Fri, 9 Oct 2026 03:51:09 +0000
Message-ID: <20261009035120.3098398-1-nikhil.rao@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A7:EE_|IA0PR12MB8716:EE_
X-MS-Office365-Filtering-Correlation-Id: a39d6b78-0390-45e7-4113-08df25b8a845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	X5FDQBOXitUh7TLqOG2/4aY6loA7aibjiyD+b/04nMabBONTaEXUN1Vmg3SQtOGKv8WiUQNwRKjBrvWPGdrtzC7hr2VOlxdtZFNG+f3yhXGO6ols5LHEct5fxBP+fmPIrWN/eSER2NwGG3p8k0qyGPNvGDG5lOd737hwegHtwkYNrETdfbssDg9LrzVs0+eJDeUasQdVylIpQQHFmxBrkvmgHtdds6Ax5DwvD8j7fOmf6tWgR8/GOrjPlnfNwBZyF7b+KbtOqtfbmJuuNQJ4cpPXh9GAF7eB5fvVD2v2pR/FszcwFNCAQlwPX7JBl6tlFzVDfJkWA34ZRL0judaQdoH1VuBh3I2n8FLSDBnSR2EpWF5EmEnpP9SisJAN4P0cx6o3YPILARtLF6u9gvdhEV46Yx5mslxhlunUD6y7MQhO1SPuUCvTLAsRPcu1znW1ILDOr2ir08+QJc5q3KKViIEDCNTycsdLp2iq2j54m7IR72oGfSHG6gndJmNJtQpY+2CPqFNDBxMyeoFdhmc/fSiZWlMHAZp5f7CneKJ6GeQVgMQzMxq08MkQm5ELqYM4WtrvQ2VNxjOdrvReHAeYDs9bGWgETWQane+tvRnjt9dysG/L282wId8HWhYUNcLUUZprab3mi56iuTa/cnwauDBSbWz3wSiFyVm+suwiRxeoxmsl7CTRAQxC8QxLgVg68wh/Y5/+VG9FBORTSqMUIg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ojoHQAT4QHBxfEayjAUDXX9/lOIJzcLFZBAKgSD1y4v6b/vfUWVB477nIK2PrVx+3j7OVi5hs8blgkL/D+C5TW+zqckkZ+8lFcNbXi5+4HFG6c91pPsS0C+vY1LLBvlUZFEsrezUub5WB9Q+QM2fVWoosM89AT11ibh+yCeBrZCtllbztwwJo5cDM5RyIJtQ9jf0i8P4BfkNQLuic0bXs36FLODBqVkDtV9jSAC9SV4Bm92vMvYC54/kT4Lgy9HshLhbvSYTEpjU8juMmqg+KK+Nz/x2dB29kwm7kisItgcYZs45HzFw1W9tmvntpnnWtEi2BlmOjq/z2JQHLNWJDxJBySa9LL96S/txY1PxrkSm/Z55qKr2jLSwefdd94h4Kb+3Mq9ADJmm3NuVEchV4Wu25b46pGCAZBBjRwLHAfh/L4xAWbcPe4vY4GTmt/XB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 03:51:53.5924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a39d6b78-0390-45e7-4113-08df25b8a845
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8716

Hi Guenter,

Before posting a series, I'd like to check how you want hardware
monitoring for a NIC structured.

We see two options:

 (a) Register hwmon from the ionic driver itself, as other NIC drivers
     do today.

 (b) Have ionic create an "hwmon" auxiliary device, with a new driver
     in drivers/hwmon/ binding to it.

The hwmon guidance in the Sashiko review prompts suggests an auxiliary
driver in drivers/hwmon/ for chips whose main function isn't hardware
monitoring, which would be (b). Which would you prefer?

If (b), should the drivers/hwmon patch go through your tree, or would
you Ack it so the whole series can go through net-next?

Thanks,
Nikhil
