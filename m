Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794223141;
	b=wB8R0YGujrAKrAx+JTEi4jo8H/7h+tGEy+0nUuOTVEEomgxM9/VsS6rjx5MpNbaGW7aq
	 GPxkVOiWfT4HT02eS7jVtuGUInIgZq7q3oIlZMiYm8C+LLjGj5iuGhV3Apj1ipBr6OKUw
	 q1SeSVXDPEP1+F694X97AlF2RUmAXYJf0ycj07gtq4HS4UeEz7JPP7r14BZtLqcZUZEHA
	 B/Wb/IX/Nq5KDsjfggndApni0HrTVzh1mYJaRT2feYpIXVT8+o/TQeGHBS/ANNXxDwfw7
	 5xThdMw5z1eREPQYl+jTIAmPRpotqqj45wnNLQLbeRZXh/P8BqW+dghr+rMu/sv0JvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223141;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=9tMRc84rhThnaE0F+0Cspolkfp+rsprUlPWr7xzG1OQ=;
	b=JL/0iY4l4G14DSPSczO0AGi4hS12fS3C0atbJQ5JAn3eRSJzvCbiscVwcCNiErxD+oKk
	 YTx5IXpscO3kf25JKrYali9JToacSW/lltfiaM7uXdo84zyXW36gz5QzAnCwz/P2hqK/U
	 EvcNiuQIBRiiHJcWkmI/6BvoOjmlhduhtMtX35oxHwf4NDTTf3Z1cS+Y1SFyfGhFVLVqH
	 Ljmk3W99QudkyTLGx4WY/apNSEbkRrhrn80eRwoLDLLwynQ/OJIiUyUGNN/WVZU+m8PWU
	 +uwNhA2QhLEDdl/kEwMTbJqQcT5zYCWaDvrYH02Gr9Y/UB7zdQdLwekkZhPfGkhvQ3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=HNikUu1E;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=aqsrj6Ka;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD920606A31C;
	Mon,  9 Nov 2026 11:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD920606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=HNikUu1E;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=aqsrj6Ka
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99wCRX2092928;
	Mon, 9 Nov 2026 05:18:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=9tMRc84rhThnaE0F+0
	Cspolkfp+rsprUlPWr7xzG1OQ=; b=HNikUu1EtEVmgPzmu0a/8lQC399+bwvrFl
	6OQ0tAvt29BBGedZO4Gykw+BIQMq1tYWcw1McSWD5h1oVfuDz+P3ypRXy9E+w1pE
	J3hBH6LkB2s6mxjgDrw931KKeYBVZqz7QRr4fDU1FMkIcMDkMSgE1br5od9ttt1X
	HLOf9hkZ2/7LjlSuRpRsuWayawh73TPZQO2Qki+Wzjzvs3NhEV9xqPuGT6JetZpx
	/JdF4As6W+W7ncG+BP0qqtJjBZrbMRQaHV9RvaLUKFnti2RDET8CsY0BoEwSEIVH
	4EFkiaXkAtn8NGuVLsQvcO4j6m00VGdOFFggsrPy++t16aaWf12Q==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020118.outbound.protection.outlook.com [52.101.56.118])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ht29h9vtu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 05:18:41 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPohWbYSU9ebFh8Q8lQ9X84ag2RuTUApmTR1bWdBqgtSLdT2rUtIWNnHq+Q1NNiG5wWlsa29VL6Y5sjogm5QhKKJ/zIEZjrY1SClhNl7QavgnDN5SwOxj9NNkEo7pKPiAImHqJSc2fXCT1WnWkE1XafylxPTV0Pdp3OT3y2dWI/ShrCGnlHalZuqqWpeL9VZ04O/5Q1CIA+Wh8KQ3dlHfZBT/cIs00EbeW8ioMd1Ush8M+qwF63Jv+p9OWB4PELtDoXblmv6vMkh44x++Vq4hZLLxiSgt2XVzNmPslodvpkP/EJELZAmG52XIrGLfLXlkUeTx0DRg/KwT1d0ZVIXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tMRc84rhThnaE0F+0Cspolkfp+rsprUlPWr7xzG1OQ=;
 b=mq+3aHET9Qz6/QuDnHBB5hfWbG5NSSkSL3pG0s4k2Bm9RIPW98ptKAFTMt46uAHWX+iAnSwx3wneNOaJjiSYgEtQEGVZSQRavRYlm//UvK/bXKe2DXf+CFh8g+iLxoqH65AMued35bmXPFBZvuB+vfwYcWvNwpmHtMgBdPRRfvueFE1xYwQG2aSMffqkkp/lt70fPpBQsOw9BWtYica5cOTRCTkYBQmH80xkH3m9uN40b6DkbZ7k2adhcIXd46ihbe3pS8YrOnGZevW+ZfXgeS1s79ldTCF1TVEVgaJALMUdaG7RSBqoH9ubIQBFVqPuVX+iRpuYOj9p/N3WzE5bhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tMRc84rhThnaE0F+0Cspolkfp+rsprUlPWr7xzG1OQ=;
 b=aqsrj6Ka0CrGpABFAxCIT4gUv6yWWVq9+gU6svQPDtWEYvkn3a15n5Hndp9rDNc2HdM2TrwGIyiZTUxGppqtf8vF7yY7RQjOCnE/VYyAZb5q95VxOzftsHB7OvMf2H2XikglyWGFtvbn7F8XoRwJLBdkR33ca0mBP6ccb2FGWn8=
Received: from BN9PR03CA0357.namprd03.prod.outlook.com (2603:10b6:408:f6::32)
 by BY3PR19MB5042.namprd19.prod.outlook.com (2603:10b6:a03:365::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 11:18:37 +0000
Received: from BL2PEPF000352CA.namprd02.prod.outlook.com
 (2603:10b6:408:f6:cafe::ab) by BN9PR03CA0357.outlook.office365.com
 (2603:10b6:408:f6::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 11:18:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL2PEPF000352CA.mail.protection.outlook.com (10.167.249.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 9 Nov 2026 11:18:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 64E1340654E;
	Mon,  9 Nov 2026 11:18:35 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 40927820273;
	Mon,  9 Nov 2026 11:18:35 +0000 (UTC)
Date: Mon, 9 Nov 2026 11:18:34 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: rf@opensource.cirrus.com, linux@roeck-us.net,
        patches@opensource.cirrus.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lochnagar) Avoid oversized shifts for zero
 readings
Message-ID: <avGsCiZK7ChHaHx2@opensource.cirrus.com>
References: <20261109093453.5384-1-zhujun2@cmss.chinamobile.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109093453.5384-1-zhujun2@cmss.chinamobile.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352CA:EE_|BY3PR19MB5042:EE_
X-MS-Office365-Filtering-Correlation-Id: c5272edb-6fd4-461e-cf8a-08df3e533308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|23010399003|376014|22082099003|16102099003|18002099003|6133799003|10067099003|11063799006|56012099006|261028144727099003|261102123227099003|261022105027099003|261021121427099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	pWQU6pbLiBe2iaBkT8DZKpCf7WxMzKncZvXZJ3xa5EeqKmKjZ3MDDmnAXws9r11F78wr3Ze1VLNMrC/GhGobUHi4CQit4JTCRvBilen0Fez9HwQ5MC3se4R99j0NIFT6Ryay+OVlaQM5Pzk3BNKRj8C5WFAc48ISRq7kugG1oUZuZH9FmLqmSBmXS1ci7FHbxzrk0L5ZDMipdEWbgSucFkWBd75V7OQw9VUK2uIkJoAMZCXBLhNRl+B4XkxZubRStA+qIyutwyMmgb1ZkcVWFQhFfp0tDSi4BoNI4LXMr+p6dBhnSuMVOAa4W11wPbVl91a6NXEb2hzi8buiAKS5Lifs47DYdWRK08I7f76h8lTcvba5tBzOejwjy4WY68xU7ds0Zq+lKkONnek8nMEUMzWobh9bAJ46MyCvruBnMcE/nChZ5+5nz1Oh0DdGQ5zTMpXZUGWVgLdaauJpYrIgJSDpjsMQFVQjpj01+AAKuzt22FuzvxOK6owYN0h9kjNEcWZ6iSQf604pSkWk+XrP5C30vl78xgcBRqWslzZOJQ97IYeL2e7kjXqrpwEHLl/KTlHlkO/ftFA7YZ3vQhENW2RVb/OHjZWr5PZ0K5NBoJ5SrmLisdPNbB13ldW3p57RoQr/KXagL0WSWj8vQ6PAUzbiDSSt8WAB++Lz7oMuLwc4hNEhttnExgq/Meqw/t6IjlQetLXFoMZPprcllt77iw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(23010399003)(376014)(22082099003)(16102099003)(18002099003)(6133799003)(10067099003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261022105027099003)(261021121427099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dFSS/USy2vgVEiFM+GYT1neXcPix/Q1fgQC4GEwlwAc/UAsJsOWDcl9CJHjUSdJiVPUwV7cV8TEvpOkHjPdREnXqz9t1+jI0gPdl/wmwjQPuhCOvJqu53jGP26mquGTAZN5mq8XhBEtJn88av00w4nhcODh7EAbngu+la8ntJoKztu1uauZlP2ANihHpyr3WYrCs6SRI+xWrLCCDTCo+c0Sszudz+6Egti22u7e8YJ59K7DmRZBhc0OLx0GGPck3aLaR896S8VfomGtOgjjcQdDM/oVqTO5W4EJI9boOFYSk/I9sTkoBeDxx6T5cq7ANTnIzAWrf3+1ONJ995k1/BWKN8hDXAg0wdbIxjFmWqpt9MkctRwqYRrInJ2VY2U9+7kQ9slH9uiDVl/lwToc83F1nIc2EXnHY/+a1dxIwi8fK2/J36DGv57XU0GFi5j4t
X-Exchange-RoutingPolicyChecked:
	Np5ZuSXW9ezgrROvX9cXWkPf1Qfli1K2A2PfPIEqOuSwjjCu0mFVKYt9ywnFFVq6JnzrNrdCvjZuLcSay24J/A17t0d/Onq9JNM62g0mae+LTYZ2NiNFCZLrwJK56g0ftlkZnb+l+3ugrTpMWrhaqECw8Hj5l7LopKf8vOgf57LAAFI7owz3k3S31Nx641hhLfWIDfj+erfkhuJEd09yk+tapSotAilB0HfgyhoR3izQe41ytj/L1SkvRxNdvgoh0DuqzXOzy23feMNHbqBKpIdHtKIp8vAbnjjzdICl8zBYxnwQmMLGTEX6ykL7MGgY9UREVwpkbyP8ZO/XITqJzQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 11:18:36.7100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5272edb-6fd4-461e-cf8a-08df3e533308
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL2PEPF000352CA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5042
X-Authority-Analysis: v=2.4 cv=PO2aavqC c=1 sm=1 tr=0 ts=6af1ac11 cx=c_pps
 a=WTYiPbwPEgbs67/cDcbz6g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=R5C9hjxsAAAA:8 a=Xc89HLozkjnuUi0iASIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX8BUgPpT5sf+R
 KQgCz5cXWUl+1zmr9XEeY0T5ti/8rGDOLENWwsOC99QgLiCCaj9bb1uxCkBKP0AABhsOz/8uc1r
 LAx4xkdy/gEQ8V4bh/a6pOu87ERkfj8=
X-Proofpoint-GUID: dU_KUOaQe2BMJ4sv3KjKOfqdXBno3Nj4
X-Proofpoint-ORIG-GUID: dU_KUOaQe2BMJ4sv3KjKOfqdXBno3Nj4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfXyIYDfznYyULd
 BgKEW3rPQ8Z/NZG7no2+TfmiUCtQUU5T13AAprYfuV/nm44nV0KwVfXp+QBTwyR9C47dVShwBeU
 Z2IQR+28VMCqPQTM+pnRZYsobimh9E5yTpOaqYb3sitFG2cOB+P8lhNY12WG/npPUBLfHqi0MxN
 6D6g3i2ulfExER6wi7iFrXc1Prh2d9y9Q/SjQpiEYDlDD//tkeNsP+IPHYNxsucgLj/WB03GZmr
 19wqFe3qam3W7jjo2i4GvD/ICgGnYltsIVnX5ppsydqqP2DMmBF5PHmpUNVT4I84x7a6cSI/SIu
 ZP3jpoZsnwOuQ2OkZ8qsP3huUrbqkt6TjPND/Mkva6PkS1NCy7k2eF55R/QG9QwCdyG+OkGkh3p
 VHc3MXaTWAp5Ll72Vbo84eXfXgFscSmkhtkcCV87m6nphsGHsfK412dthPJNIt1e7xICuaGs/A6
 lXauGRw6xDubQvJrzPg==
X-Proofpoint-Spam-Reason: safe

On Mon, Nov 09, 2026 at 05:33:32PM +0800, Zhu Jun wrote:
> From: zhujun <zhujun2@cmss.chinamobile.com>
> 
> A zero IEEE754 reading gives exp = -150 in float_to_long(). Both shifts
> in the rounding expression then exceed the width of u64. UBSAN reports a
> shift exponent of 149, and the conversion can return a nonzero reading.
> 
> Return zero when the required right shift is at least 64 bits. With the
> supported precisions, the scaled mantissa is too small to round up in
> this case.
> 
> Fixes: 4cdb56214746 ("hwmon: lochnagar: Add Lochnagar 2 hardware monitoring driver")
> ---
> Validation: x86-64 and i386 driver objects built with W=1.
> Source-extracted boundary tests passed on 32-bit and 64-bit;
> the corresponding test fails on the base revision. I/O is mocked.
> No physical sensor hardware or booted-kernel test was available.
> OpenAI Codex assisted analysis, code, tests and changelog drafting.
> The human submitter must review and add their Signed-off-by.

Yeah afraid the human submitter will need to add their
Signed-off-by :-)

Otherwise the patch looks good I think.

Thanks,
Charles
