Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11021143.outbound.protection.outlook.com [40.107.208.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581A43B893B;
	Thu,  4 Jun 2026 16:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590801; cv=fail; b=i6EeADx1NAsD+FP3yjnoT0ePfRT7y1nKtpwUMBb0QORaRuk9OQn4WsEJz/vtl49IRUTnxrpYcbPSSN0wa6S6ynsMIPIE03jZmgmvhA4RMiicozAvijd6YtRBeR3LXXhrc7Npry5RcBQpRxygRWeyzRjQxtPrDDkk/3UD4Zo9t/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590801; c=relaxed/simple;
	bh=jEy4JQsA2jLqiwcPG5Jdm5zrxdWfDdkaZq8vk4A+Cxk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=O24Q7KLTD7vvi+Evp8NL70xGy/XJ4a2J2k6TAUqTvT8r2lO77umRFHz9yDQ/cdE8onktpZSCuekJTI5HhLm2vzwR0imj50VT2mYEO7xtOZgKjmKsN7zBe319hi4/ugSy2/E56ggIu7GfhSo5uIx3E5jHgHxaelKJM2WNtz541nY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=Mk/H5gJw; arc=fail smtp.client-ip=40.107.208.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="Mk/H5gJw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAx7xHHyQx4svy5NfeRtI40ec2K4JFDtUgak60qwqJSJwtrpnlwNSCT4s2uupT4zAjSHHR1Fph9pw8R0JlginH2TeYIbrVC5Hn76SCT9ks4wGPQ7ahkA8UYFZlJZQu6gphuzOwItqPhmZKK4tvqrtfuPxowaeVZOt/d9AR/C4xUCpsfdbWLoh3z65Y2Xlr9uDLSdHIPXenb/+mmcI31zpp66SM2byktF6xO9Hx1/xXNYa0hE6hPuufl7LD0rNb/MN3lB7XV97J7laKjo26wSJ50RuzC8a8a2Xj1JFAJN6fH03VUmWoY5OPYCA0k/DQDh0+0iz/hYPPeV8sNaHJDwFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DG8GjE/2pf0eEmsCyZ5/T9CuEIqUgNmeH2HmwIljgs4=;
 b=DeHoaN9OXzsXbuRWksBSAkkyttSt1be+j06lVl0i21UQha/ALKsSQZNQmzwU59fTKWd2K3SguYe6mI5ARQRP5743ZHJyMObvOeNZlqRNB5Anpus+PTP1+ez2GjDoA30qdR6zUL792vAvweCeU1vxTVDoLf5Ma6oFmqo3kL/Xxo4CdDEvDhkM5EweJCNMmEKWTcMDcvUaubkIKtXgAnxjNMwWwhVyewFHhbL3uQhIa29MMDUM7SVPb0lldGrINLWGQP+G2bIoEaaKt1pGoA+Z6uWFLfCqFT/F4YmQSfEFO4rkkaOtSS8RSdF5sT/WmNNDSem3x75ZO/AQMq102wsqjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DG8GjE/2pf0eEmsCyZ5/T9CuEIqUgNmeH2HmwIljgs4=;
 b=Mk/H5gJwSrTk1UoHBb0EHqyxv7xaLp8SPp1zJMQfXN8sQzyW4qEn6zQRN5NOCHbMV/WsNV8keQUaLtHuLVDs7DiipODL241RtdqDtJG9UyzraTHEBPxjAndgXuMm8Exmwv3BUhscIixsTkffCE4mWu32uOsZE0Gb7KnzWyfAzzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN3PR01MB9212.prod.exchangelabs.com (2603:10b6:408:2cb::8) by
 SJ2PR01MB8530.prod.exchangelabs.com (2603:10b6:a03:554::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Thu, 4 Jun 2026 16:33:15 +0000
Received: from BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9]) by BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 16:33:15 +0000
From: Adam Young <admiyo@os.amperecomputing.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Huisong Li <lihuisong@huawei.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v01] mailbox/pcc.c: ignore errors on type 4 channels.
Date: Thu,  4 Jun 2026 12:33:06 -0400
Message-ID: <20260604163306.160017-1-admiyo@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5P221CA0141.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:6a::14) To BN3PR01MB9212.prod.exchangelabs.com
 (2603:10b6:408:2cb::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PR01MB9212:EE_|SJ2PR01MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: 42219d0d-dea0-4a7f-5b57-08dec256fa00
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|7416014|56012099006|18002099003|11063799006|55112099003;
X-Microsoft-Antispam-Message-Info:
	DdgX4/aIDgFrbv7VyP+RiBeAfC9GFpfXpYhko4yRQ45yGj3vWrbR+OT9YMBzqmYGPxyd51FzV8yU8KkpNTTQzs+ttr2zfnvCilHFDI4BeW9xv/HL1+Hht5fNLnLHTLjR7Doqty/iPiJ5U0pQRTFWVggdMHeHzhP732DvWyWMrJj5zDpGjM+E4H1v5BSCVyuOjJ+EU2c9gVoXH7Yp8Q8Dxu9FmQ5dG/B+O06OW1N1X2A/baFShInbG4sbmD+TSt4QDt4SZZJ/3NX55Fdz8hIXwoOxHby64GRYFBz40TRKH6XDVTBgGiAm7mvcXFxMa48l8fPihYfvRarjjiV9s7IsNstB2Ai/+SiU/8B8Xq39w39U4aWilvD9e1lwvUrLJ1JXLlvV/t12vKWCCtPLWDnxR8g2D2XQtS/2Q523q6c/m1YONkLlJE6UOlf9RcZSPFpZ/+GAur2XBV2i1KyUL4/MlG+bewWrNV0RW9j9nDR3op6ubek9Au1JzF31bKuO610mhq9KKd5l6r1sgB62f/A5QGOTKmuWMrhM46zyuPQr4sxmKYRYim54HbgkpJTZI89U+2LgrS5r33mMCMrUZWqp/o1da/2RIvzNA+T4kIKRc52Is/rsYAH5rRbi+T/HYlDKtjFMD1t6tE+mtyHl73/75A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR01MB9212.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7416014)(56012099006)(18002099003)(11063799006)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0rcoGkNGXlMUvlGwspnNuFpuNJctZWblLA0+l1BFmpm8J5BFKDUBc8kVWFVV?=
 =?us-ascii?Q?Fbi4/VFOOW0T7lCZWS4C+BMclLgx5jIIKHQx9ze44Pb0gdqw64my7G3vqMek?=
 =?us-ascii?Q?7NdOECebYL/L6I1MtyTXAF/pi7gpUFm1RTKdYKC4TCD9qMYkn4rGPshK/Ed5?=
 =?us-ascii?Q?d1KtE+TOmuXCyY1nq4OMuIiU/4x4CFKwZSEK8Dw9tNOMsqR3bAclQUuaWL9A?=
 =?us-ascii?Q?7fSs7lsFTeDa+gX3rz7a27Bok51W0LvVxILRWsPAmhvHkvvradrTFMbv2+L2?=
 =?us-ascii?Q?/ZHrp0MNiiNtXI3AkE3ANdAX1WdOs2zlJYyw28hvSysUJS0smNOPttvj+Izu?=
 =?us-ascii?Q?ZY9j0HU5xyrzyRAi6S0S7orcJ2babw5aNGBsAem6S3S+ExquSQ9NDBac9Z56?=
 =?us-ascii?Q?dhYyltdYaH0yu9wAg2dAyJoTJOrzvO3fGxzd0O4uqdlm/zJD+o11zPzu5lRg?=
 =?us-ascii?Q?Ey6Zk/WtVpWb1HeD/bqT5FpSDIFMxcR52RxN9h/YTTbNWSKiuSRoKmXS8SHV?=
 =?us-ascii?Q?Y7+YpEd9dUQKZspjmKvL+K8fm2wD+H/xnVcsnJLkoMSSkb16ntg21+vGyXp9?=
 =?us-ascii?Q?mYuwcKQ0m2ODlLEEOX7d6WKEGHW0GtNInG7j/6+d0SyboirVmp8qHongQunE?=
 =?us-ascii?Q?c3tQ/bURZgZWc93Xqgf8Am2iPX4MWJfp3BHP2QQUAa6DoTR6Cc38ntQ4FBHB?=
 =?us-ascii?Q?ThQbOX/FDH3+9Rh+AbuDCws48MX5Z1gx/XNx06ZEzjiqzanUvM7ZXJ5SDNeM?=
 =?us-ascii?Q?yPqlOEM9Ezyi2Md31RNi383Zjpcf+UPPV16xXEfY6vVCPRpAClJKGUK5aO8Y?=
 =?us-ascii?Q?99BGI/z9OVygyGlSTs8v2uqn7eexpRlQQ5IfhEbI80yO9Yf5pYuoB+4yXLYi?=
 =?us-ascii?Q?VRdkncyemAy9Qe9B1k59DTmAbdUoj9+fZUrKtzCbIXe8eqDEzj10Z9x4SXTR?=
 =?us-ascii?Q?xlNdsLmYyyhcicTk47AR1u/rFwAcA95m23WV4d7KhWmtv1X93qDjGBSVEG4X?=
 =?us-ascii?Q?9RrJ7sq4BqYCrKoWOFKZLtMbvSbq4rXGTlBMSA6EpsXALrm2xiuqoq1wgClM?=
 =?us-ascii?Q?SjLmX2K7QalviE3uS/vHQur9F54xrOoqTDxB1YKunNHRKli72b5XX5YEEnxM?=
 =?us-ascii?Q?ch9gY+3Lp8hlY6yEPLhj6kDia06AtgTbM+ZuHBLEKRpIQLMLBsD7rGMe4O8T?=
 =?us-ascii?Q?yvfDTo6rKpW6hmwj7BAE2GSlBpIbi1N55sItI9juDEn0OXqyGftLf7CDDnH1?=
 =?us-ascii?Q?f3vQ2Kr6OvvxQcFpbaX/zF9X+hu8a28VU14FRvR4YsrJg7hTAZkW6WkMOWmG?=
 =?us-ascii?Q?T2tRtt17oUxw6YNcVMB9Jadwf0u106u4eKuL3u8Dl2KsUv7zlg5A0SDLLdZd?=
 =?us-ascii?Q?mW58zfOmrtqukTKIdKnbXDofXtTlB43RzZ354I0vetvW+HcM7iZoPjz5of6U?=
 =?us-ascii?Q?daVScBOFNmKQvPF4LpyQrlrXrybqx8q/IVUJele8JY/h7k7Z30Z5tPzKmWGC?=
 =?us-ascii?Q?nLjD7tpivl0fyw1zE/sxHI6vvSv87EhwmKbJA7X2KK4sfEQZz66WDkoR6pJG?=
 =?us-ascii?Q?rr72BTFGBbvRVVp4foBbvRnizA3n/qccG8yx7B4GTj+en6JKaYRbLSmnO2y5?=
 =?us-ascii?Q?FR2dNfUghiZ18vBGKYIWuniHs7ls+VzVVh/aJNE2+tQsAZmI3/iTcH95DQUb?=
 =?us-ascii?Q?duW82uptLioW4Elmz7/+sCyaqkW+arm40smD0BgTqkUUleMPR7t+EwKrwGNN?=
 =?us-ascii?Q?e7V2DofM4KMqU1ckxam8FPq9atTVWYqt/duA1qrHaMwGcqjnAwovpm/gdvUn?=
X-MS-Exchange-AntiSpam-MessageData-1:
	9in6zpPEKzqTu6YCBokmRZpJgYaPWvJLEoxo6NwjFSBJiBcUo1saZ/nj
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42219d0d-dea0-4a7f-5b57-08dec256fa00
X-MS-Exchange-CrossTenant-AuthSource: BN3PR01MB9212.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 16:33:15.2190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19YYLLMZ037JkukF4Stfi2xkQeQf/NSMUiGC6WLHzvZ7ldtqhms2qARdOcDPqeN4CR6FQX3qsJwRiYWqMT8diq0lcMY34vxF8htf1cAUf+VQn0yY244x8a+I/tVFPYrY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8530

THE ACPI spec states:

"[The Error status register] Contains the processor relative address,
represented in Generic Address Structure (GAS) format, of the Error status
register. This field is ignored by the OSPM on slave channels"

Which Refers to type 4 channels.

https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/14_Platform_Communications_Channel/Platform_Comm_Channel.html#hw-registers-based-communications-subspace-structure-type-5

Signed-off-by: Adam Young <admiyo@os.amperecomputing.com>
---
 drivers/mailbox/pcc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
index 636879ae1db7..0deaf7907ed6 100644
--- a/drivers/mailbox/pcc.c
+++ b/drivers/mailbox/pcc.c
@@ -270,6 +270,9 @@ static int pcc_mbox_error_check_and_clear(struct pcc_chan_info *pchan)
 	u64 val;
 	int ret;
 
+	if (pchan->type == ACPI_PCCT_TYPE_EXT_PCC_SLAVE_SUBSPACE)
+		return 0;
+
 	ret = pcc_chan_reg_read(&pchan->error, &val);
 	if (ret)
 		return ret;
-- 
2.43.0

