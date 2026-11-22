Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795332839;
	b=OrW15++zEUuku5VPT0Si4gpbvFyqY8a0dqKdMTuToPqesUZ3VDm0W8MXrkN3dNmO8Afr
	 MhpIw+fPTMkg/zs3lTHkIhRmikZnYpzPziGlXcygnKKf4TwwdcLjb3ZbPAwDFJYQe2wk+
	 OBv55OEOEHP+EOUXy8ljugLIlBGaBrfv6serzqoAMIpvDfzpuylgaR4y2CNpHuTRa32+Y
	 mLor8tySMNTZmTzMqQcL8GpTfoTaffbiB3eGzoF0TdU8Z1mbTS8pwPckKKYKj3JiBovzk
	 TBQYHbhz8wjnFgkQcE0IVTiEoqZUK53Zd4CmOYFg99dz8ziz9f19wPtumgUL0uKhofA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795332839;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=S9wRRsqvec82oAqo0hg2e4rSWX1JSqysKSQsf84QoHk=;
	b=Z5sxlWijxqL5lCI0NV0IAzKbOnFdiek/Fg/0d6FavlD4xwZzh0Y3wbF4/pH+MtJUibmy
	 rattOrUbHcUDJvPuh4F5Q/kKlRpMmoiX5ktFLfFcj/3t06PSJ0EDOedqjdRPGYW+ET48z
	 lnj/iVQ7wFW2wap02nNhC3BUP17M793WJbMF47wAoTO7f3tIrpN4LXYj/RctQwPtnIWY7
	 qFSr7+ZQatKutINA++7rK1IcavAJzoNWfcody1RryD6YYyZdp2lTfgcR1yiroH9GFQQ6h
	 IvxfddgoICw3pNOEHkOTW9XbB0WBtrBc9HzPLwaPZNPVPFGHTSij+3uYRebhQxXWmBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=isZCx2cT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.28
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011028.outbound.protection.outlook.com [52.101.57.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BCF606A320;
	Sun, 22 Nov 2026 07:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29BCF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=isZCx2cT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4W1BfyBKnSU0tZwqBGOqV2hxsjqDwO44/XbHtoh7HPfAGIzV++aNDTsi8j1lJTSGp8fI9uXFFGoV6QQzx0XSCqnUhlMd3dqNS0hTzX5Qfao3MAAmCiHZlVSgt6fDTOGiQvKG2ZOUfcwqJkHuSuKhiadGUL4Rf8ewRGAv6k2xbOHYRmXxvps1svKu9JpQSE2jRjNFofVVZkeqzTT9Ril1f6Qt9QvpiD2naz0gAGmb4O9lW7YO10CeD1lpcx7q981DdeXy4Vq8lqmO/+HSe5WYw5hrRETeaq63mcHSqmWxeN5Qj80UVgPmsLxbYkLa5bYv/EizvYfoB2OZ24uFYBxcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9wRRsqvec82oAqo0hg2e4rSWX1JSqysKSQsf84QoHk=;
 b=Cn50E2qXIXkkz1Hn2cfE6z3Q8OgCa82O4fAfMXNtx/tP5HWaGWtqDl7Fw0y6eKrSF1jSftLP9Y4DsoYccC+NcZZ5jRVRYe8r5pxgeIp0xuQVEpjfcfJggBFa32x+Jc4DTZcKG12BwRkq3lYA/aQvODFlO3XDFAKWQ40s9JMOIMkQbpT8qHTz07s5vnCqydpIleFivSs9gQnytJArdza0wu+4TBQ+/tJyQeSlnjF5jJ2cjAntZaG3h8UuarPOxFbSr775bLFwaXIleNqAx+od/E+HthCI52I5wXRvAN4CvHBV5hTHHocXtYj55RgGKMcKPj6fv3D1OK+Vvuh3J5B0qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9wRRsqvec82oAqo0hg2e4rSWX1JSqysKSQsf84QoHk=;
 b=isZCx2cT3gY1GarVlpp+NO+68vd+sW/nGAdElAD0CMECYCwaCkP/hztST/shVXHOZIdzcP9dYxi5+7/38owLXJu/op0u+ZqQXH1JZxpWrc0NSQT+jT0u0RQMTxH/mb3T4HPa5OA0+Jfough2bn3gxBrJE0Gn96poCB2GOZ04Jv1Er6IRd3DnVi3/lM9EvzdO7ktj1IsWBxOsWqWybgijIYbu2eXl8Exrs0Ml4wQbrmiPX/vJqazeW2HwY9wqp/2Qv9IRk/M2txJC//LdKcu9tyLBZpnyqf67i3HhuF1T1QRcRxtGbO64tNbWxG+sz4x5mXI+fkKpVpS8HJbj/NCrJA==
Received: from MW4PR03CA0347.namprd03.prod.outlook.com (2603:10b6:303:dc::22)
 by PH7PR12MB5926.namprd12.prod.outlook.com (2603:10b6:510:1d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Sun, 22 Nov
 2026 07:33:55 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::86) by MW4PR03CA0347.outlook.office365.com
 (2603:10b6:303:dc::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.13 via Frontend Transport; Sun,
 22 Nov 2026 07:33:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sun, 22 Nov 2026 07:33:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sat, 21 Nov
 2026 23:33:43 -0800
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sat, 21 Nov 2026 23:33:41 -0800
From: Felix Radensky <fradensky@nvidia.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Vadim Pasternak <vadimp@nvidia.com>, Felix Radensky
	<fradensky@nvidia.com>, <linux-hwmon@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: [PATCH 0/3] hwmon: (pmbus) Add PMBUS_FORCE_PAGE_CHANGE flag
Date: Sun, 22 Nov 2026 09:33:19 +0200
Message-ID: <20261122073322.1712843-1-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|PH7PR12MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: 296c2294-7355-4a56-6b29-08df486af65a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|11063799006|56012099006|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	vIPz/UvS66UhMOK2WyRjNrvYf+PikO/QIQFEI34okB2eYPX/wGvC1RReIj82EjwqWKDSyfM3VO6+dUgW8WgnGpdk24kgomY7LEmaTRSeIrlcst0jznCA4yHcuP8HWsDmDx7UkgQTcNMRXOvj8WpK9LRq1Omc3T+9bhmKOztfNtNUm6Ash/5hWPiLLkbJosrZ1SI8GhJSMKy6CFKcUlFrUppomzi89Pq9DaOM8NJFhiDXnFdTt6Y+w0OWCaLby37IJdKQKQYHqLIR9L9MKHiL6an4cwC9IgtUEMVR0sYkSwKjEINz5ih6R+olxRSoIrQFhrHv7R29HmZuPIbZn1df14OXqfSFzhpdGe7XlzhclWZHxi+GZCInHrDgf3oZhjfyIImjYl919/uI4Actf15ZvfKnnAk5yu9eS4An2pEejyutzapTpQL2QAJjMwfKSMEoTYEx4pch6yTAQ1JB6XRGL1EsGbVPtakYR4RwPdbWr28hk7tK3R3oCK/6JWgGWR9UyqC0aiCrrO+sjErcNxvjeJJ9t6SPWh7MnjQxBEhLOwb8ZUnc55o7NrF0yaNhPfeoRKIuw/ILNI8l1mpKy/Z0S5FVQVMuTfwSwWbDCRt1yI1bdpsvtmEV8X4M8Rnbvat+Ci9DnGL7NKqBhB4NIUuLm/XrnPkq6OKvD5afVUY7dgHbsM/Aed9JHtkqzFO26+P0jXQQDf8ZF5SxmBswIaFG8A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sw9jgkLXoBZTkQK7FyiF4ghEX4GadS4YItjUZ5Z6r63VA1ll8vtk0yQMXnWKDyJNnO1+l+YR0Df50p0XXe1BiLbbP5szEI6TL66jBlhfi4C5CVRX6k6c9piSXb1rqssEdcrLWKVOJyznZtMlfedWO9qUmGXfu6pxOWr1E8UY8XDTkjC0dKMrWB3mwICqqnm1TX6b877KUDKfVacTGRKYc9VOkvpOJZfLsFlQ50OoPojarFRVrCzJr31NvS5ZsNximao6mvHlB97HYf63rjCExmww6iTg8mmblbUf5x3pl6xk3P0TtI5tjdAsuvBx1DjWxpVUCob9K+cS8eNUaMa7pcgKlFu9PPsGNBsgZUQknbDwa2hvGOMOe+ayY1wmUrDcwZ8RGZjNanbZJUxlepP9J+UxICcGIsJC1UZVRBHXsbfHhvZ53kvkve3aoGCm38pK
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 07:33:54.6409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 296c2294-7355-4a56-6b29-08df486af65a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5926

As discussed in [1], this series adds the PMBUS_FORCE_PAGE_CHANGE device
flag, which makes pmbus_set_page() change the page of a chip with a
single page as well, and converts mp2975 to it. The mp2975 driver then
accesses the page 3 voltage reference with pmbus_set_page() also in a
single rail configuration, instead of writing PAGE directly.

Patch 1 makes pmbus_set_page() invalidate the cached page and phase when
changing them fails, so that the next access sends PAGE and PHASE again.
Without it, a PAGE write that succeeds, followed by a failed or
mismatched read-back, leaves the chip on the requested page while the
core caches the previous one, and the same applies to a PAGE or PHASE
write accepted by the chip, but reported as failed. This already applies
to chips with multiple pages or phases, and would apply to chips using
the new flag as well.

Patch 3 depends on commit 00944852275e ("hwmon: (pmbus/mp2975) Get vout
fault limits dynamically"), which is in v7.4-rc3, but not in hwmon-next
yet. The series is based on v7.4-rc3, and applies to hwmon-next with
that commit on top.

Tested on a switch platform carrying twelve MP2975 devices, twenty one
rails in total. On a single rail device, the change to page 3 is now
issued by the core and read back, while reading a sensor of the rail
issues no PAGE command. 400 page 3 excursions on a single rail device,
and 800 on a dual rail device, each followed by a read of the other
rail, showed no page 3 or other rail register value in place of a sensor
value. The limits of all rails matched those reported before the series,
and in2_crit of the rail supplying the CPU core voltage followed the CPU
between 1145mV and 1725mV. Patch 1 only changes the behavior after a
failed transfer, which was not exercised.

[1] https://lore.kernel.org/linux-hwmon/8e4410db-66df-44b8-9617-1013545d7b43@roeck-us.net/

Felix Radensky (3):
  hwmon: (pmbus/core) Invalidate cached page and phase on failed change
  hwmon: (pmbus/core) Add PMBUS_FORCE_PAGE_CHANGE flag
  hwmon: (pmbus/mp2975) Use PMBUS_FORCE_PAGE_CHANGE

 Documentation/hwmon/pmbus-core.rst | 12 +++++++++++-
 drivers/hwmon/pmbus/mp2975.c       | 29 +++++++++--------------------
 drivers/hwmon/pmbus/pmbus_core.c   |  9 ++++++++-
 include/linux/pmbus.h              | 11 +++++++++++
 4 files changed, 39 insertions(+), 22 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1

