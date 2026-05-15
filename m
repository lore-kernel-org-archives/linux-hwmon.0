Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11021089.outbound.protection.outlook.com [52.101.52.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B823BF672;
	Fri, 15 May 2026 22:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883478; cv=fail; b=oms709srIqEF7MjNJNO+V1p9CustE4T7j3WfG+WZQcntFfvU9mYhH8FntaqSPpvfrwro91Gal/OKTexPAPj7YxfYv5yuNu5zKR1GRYq0PsjGGyDFggtPyvEUO7XuS129B+wTxiTYP7nBafKkdzrRcJedJPZ02yZLNk1neWm9vWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883478; c=relaxed/simple;
	bh=lfROiAtu2jDiPwqkOAT0uo/U+d+4CGpYEEqrZi0EhM8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=StMOJBZcxh0FIoKryW0Zwb9fDLkOPAL4hpjuhcdxYMqTlGdNpwN1n9Yc1aGZ8GLLA2viD/Rcpvtba2+l08N2Z0DKFl7LINTamyIdGEybXN8ip+qyuODV4H2sYPGD5J0qTtiCMOzKdOpx387LfIpJMingN2zFTW59AxRCbshj6Q0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=nntzaLUj; arc=fail smtp.client-ip=52.101.52.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="nntzaLUj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLkSTntsnMsehbNYd5CLB/JoZ7jUMgQ97zYSimWUzc/Xg8HRM48GYuSCUGDTnkewAP856cSfrcCegMPse9QpasFAfGeh3VN35JoxSrN3mN8pvVLhUvvufEARm7ZTb8R0Th45eYdMnd/kTZPoAztCkOg2W3AgYOHc/fvraGmM5FOvEyZ/5bcr/dZlBomvjg1/s8ikh+CulSAhBziiNoPFoGIWNPGn43OaJqkF1e1J/yxY1i1bNc0sZDuTzg28owWTQutJxEXpEvRQeftaFUda6Ano0D1vysQulgZV8cAoEqqn/O5nRVhz+e3TD68O/Mc11MfTWDJo1FNONGNcDNwAGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dn+xAKk3taK7GbrClfPieYENd/G6CvpoaTajz24OZJs=;
 b=cvK6d2pe09t1Og+FtLB3P1PJZE/eCi2ofbHZCn3bbYoU/mU/2X40lhGcsr7Xfem0wa3JjTTZWLJzD12wkcmj3kdGRK1j4MgEHBClQLnFQnQckLvLdSy72tikgPEsXbvexVodqFczjhYN4TEmao862fRYI5Td0Up52AvSrB3I6fAL2nJwxHnpgC/CW7kWnyOVr71tTfPDJtan0BvY1IeYJGKLskTCErASce849dkFHj3Z4y59K8VSUVXztpMi0dU43c+wgjACBhStT5tMnFYjXbfK4B28iKKqIoceSuirqqCnzawHQsNgQNoT6DdIVfj4u9+hE+qyj5XRinTO7l7flA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dn+xAKk3taK7GbrClfPieYENd/G6CvpoaTajz24OZJs=;
 b=nntzaLUjiVsAGnVKaO6i7Nk7k5zTejGTbSHxY2DuwgJpjtJUrAuYBfbh5q4qK8JQBXAjChDtc68I21AE4lFK9012dloDCscv+LcYfnkn9ocNOFkV99MPgg6mWeXqR2JCgFcmkCHY7Gj5bSP9AEuMjCa2B7fJrPkVuvInE0BbEfw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN3PR01MB9212.prod.exchangelabs.com (2603:10b6:408:2cb::8) by
 MW4PR01MB6145.prod.exchangelabs.com (2603:10b6:303:70::6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.20; Fri, 15 May 2026 22:17:52 +0000
Received: from BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9]) by BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9%6]) with mapi id 15.21.0025.012; Fri, 15 May 2026
 22:17:52 +0000
From: Adam Young <admiyo@os.amperecomputing.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	Huisong Li <lihuisong@huawei.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Subject: [ v01] mailbox: pcc: report errors for PCC clients
Date: Fri, 15 May 2026 18:17:45 -0400
Message-ID: <20260515221745.714736-1-admiyo@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR13CA0077.namprd13.prod.outlook.com
 (2603:10b6:930:a::34) To BN3PR01MB9212.prod.exchangelabs.com
 (2603:10b6:408:2cb::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PR01MB9212:EE_|MW4PR01MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: 1086e726-2abe-4ea8-3328-08deb2cfcdef
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|55112099003|56012099003|11063799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wTuLJnA+OFEnsg+99UMx1w0Pljf9PUHToJeSXj/Pa5NJrbX8YRvDn9cw4AaMK2YcZ6ZiGsPXTB5XR1ZWBTO4Vwu+vcGRlDobJr6b8vaAmC/yJbUpCKRcFlQqqkG1J4oCpT72XDOV/YRdVe7tqB4qKeJixqORsIMWUjSCLPDBdungZSN+37Num3Az1wph5p6KVcvpS6iZ1vg3D+xRCMgHW8bjXYpldkMNrgctJNlXo8PW64MnJ30VyxoiTD3+5gJWvQFLW5sX7Jiv/C4P4pzSwDYhfVdr5ubCFlOH10mDfm632lpSje9MQVS1+t4pxU4t5qlCro4Q6CJYexxdjcYAhMQ/BCLgWb1V6PKYVs4zi84XM8fnPmGzxe5xxbphRaFJh7rIxMrwOkO0GEkurpHYphv5n7aAx8q1oxmZi6qawYl/4mBEyKB6u6KU5orAcWvXRKt7HBmaOWtIOf1CahiJOfeGLowNHL/5//WdU2znO7C0KIk62WrrzA2T2lay+NeZshtGuSsxaKjYIM5yIjMMp7nlncDpjMz/hDeI8hDuZ0kCHa8dsQ4xMY+6NuHjbHHvxvmOc0/nMFPc/qwLEWve6Us07ApBTdhy0J2MQnu8oBI0OqA0IMXREMk08TY0j5ePAg+mh3b6lbyaifdnZONe4eyZFQ3yCxw0LfxJ5XXDpo2oNjikilKT5Dz/Z50eOv3H
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR01MB9212.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(55112099003)(56012099003)(11063799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9a72oG10sHyB/Ftbi3vEptLczrcrI+Kch9iGb1JrIfD4saVltvyAJgYiaoy8?=
 =?us-ascii?Q?CdloPa+6rQtlO8ZLVvGVksm7XWorm2PaGSYjh3HV0rFpHHbifDIGSfnUrS4l?=
 =?us-ascii?Q?hiEXIqoiAuvjAiWhUlnxXFBxPVM2GrwrMjjefmB+ZUQ2p91qugIeV8MR+IjC?=
 =?us-ascii?Q?niAL7mdZ8ElkFRWe+jcRfnuld6Rf7Dok1bgkGXFYW5RSJf89aY4huxvzp1pt?=
 =?us-ascii?Q?QcjKo+CQRJFAK2mL21kV4TWkfEWkieikTTnijYqxGKVrg+d5DBN23RfUb6MA?=
 =?us-ascii?Q?yb9Ezi2EN8UiclUoQ9IBU/Y6rA842MGjhM3fomV0ibIC7/GL0H41GKsI+ipv?=
 =?us-ascii?Q?e2ZZTBBdP+oz99XYrXIhQkwlIR0zS+G93gHZ0P5cUlkQj/brq71HGZWQ/WVL?=
 =?us-ascii?Q?dI2bG2syQOmV+x/ENFqAHaJLkpK4qShApYSMZVn0T54NTNElWWG4VlnR5srN?=
 =?us-ascii?Q?qVi4xPm0dZswwnpJIQfoA2Qvps/fNseZIXx+W409Xhv0vnCVS+Gd1+8gIuQV?=
 =?us-ascii?Q?4drk5iLJz26/xZupbWJnYISx/wwxdktCX+//V9ofce5+gtQXGl9GF+nsKNyM?=
 =?us-ascii?Q?Ac7QpyT+ZaZdSBVIPFWfrK+jJeVaZi5wvuCNZUORzqdDoEK8U5ngHJ6PIHPg?=
 =?us-ascii?Q?nZ/Pa33lseYUW/t0ky0SCb+0o8bTeWisS4N2q7rAdzh99IfLVQB3am8SYnON?=
 =?us-ascii?Q?Tm9fsmKf1mH9/KDGj1qT/izsghhicD6bGlwDF3EhEZFrArQXfqwm2I+ToCP9?=
 =?us-ascii?Q?vekgNmahlpWax1zvZlv81TUxOAAEK0xrtU8vUWt0ZjWMPqmmkzFPL4zcI0v2?=
 =?us-ascii?Q?kcIJcAINfb+w8Ka1pvC2A99aDKblOAtwtCMx6ww3yEJ0d511se+YTdaChaRP?=
 =?us-ascii?Q?hoQWWNIhgPKbGvw5rLL1/v51O7powX4OYde5P0L7Z4ubaFGijt/PwIL6a8ef?=
 =?us-ascii?Q?3ec+ktKt0Nzm4XqwZnJfVIWb9Md0iMm753YoYdPenCXy97R1RATgrVEvzrRQ?=
 =?us-ascii?Q?BzBylBLQCg/8J5qAwTmkm0rH9fQxfpqt+s2euNctrJXq+v8lOzbxfyjGIHmW?=
 =?us-ascii?Q?cdsJD3lgIBW9p97QE6G2L+yp3zofp/nVYBkvbruWy9xQTSloNzWGVZB+XE++?=
 =?us-ascii?Q?+KphSsL6ky2IEW3aqzG44OUyx7GM4N2qyx9HCh0s6NVoJNSLaGybNPj1ZBXn?=
 =?us-ascii?Q?VFZWRnFXOZoxjMQg26W4/pps7MRhsS6la5xcw8Fvi9PsLVqWqli6fIdex4LZ?=
 =?us-ascii?Q?ntymNZWCs5VcHxjEJW9BZFR3B4axVi/U2MQF0ITeXdf6Q3OADvEVkcgiRiZl?=
 =?us-ascii?Q?9eesLAsVhCYXdDDg0Z+M54yXIj6DRhZdtVPijXs1odQSBVvB5y/MkHkcNQYz?=
 =?us-ascii?Q?yVqea+eeCvSqeS7lZqmzFhio8OH1PpFudQGc+29oKCSokwLWMiiCvRbQt7Im?=
 =?us-ascii?Q?fxk9D7Ulv87gkh2NOcrvXyrpbqHVpZjUMcQlQnFLLvZWfnazwM9jiolxQcte?=
 =?us-ascii?Q?0MIIXxsP2lTx3i6tLbr4xvjUi8MBmMxCZF2aoLQoLCDiR7JjYA8OQji6SrQy?=
 =?us-ascii?Q?EUWQRKjDpZaUpm8PWH1iIU7seb7L0V3G2WwBhS3hxd9bdwMn5MWeXluHMdX8?=
 =?us-ascii?Q?ub8BZSvg/owxJGBTt7yYLjrOXOUm4UsURqFUurTvwtRHoS8s3FtGkfhbHRQx?=
 =?us-ascii?Q?4onyEty6tu5IdLg6u+5EotzjKWCpua+zWOYu/HMqxNn5N+3LeBALaSWErW6r?=
 =?us-ascii?Q?X5VaVi0+doKM9xYZUPA3+vSV4fVWCxPzhX00cEJDVkkFXxFKizMC5VqwfJvl?=
X-MS-Exchange-AntiSpam-MessageData-1:
	Vl4I9h2n7J7+Z5yFNIB8LAlbDvosIlklq09KsfcwC2pi5p2cyORwvIiZ
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1086e726-2abe-4ea8-3328-08deb2cfcdef
X-MS-Exchange-CrossTenant-AuthSource: BN3PR01MB9212.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 22:17:52.2770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/pnt7gzrYLQp64VsXC/XO7ItPo8+tIeb0LdJn1VGxTRUipDj/kVTmm6Z74Hnnm+0oW8p9ShFLuywOi2FLN8HAo88g3piyfXPAGxWzCKuAk3OI/ZghqIOio7TgANIrnB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6145

The tx_done callback function has a return code (rc) parameter
that the tx_done callback can use to determine how to handle an error.
However the IRQ handler was not setting that value if there is an error.

The following clients are affected:

drivers/acpi/cppc_acpi.c
drivers/i2c/busses/i2c-xgene-slimpro.c
drivers/hwmon/xgene-hwmon.c
drivers/soc/hisilicon/kunpeng_hccs.c
drivers/devfreq/hisi_uncore_freq.c

All of these only use the error code to report, so they
are expecting an error code to come thorugh, but they
do not modify behavior based on this code.

Fixes: c45ded7e1135 ("mailbox: pcc: Add support for PCCT extended PCC subspaces(type 3/4)")
Signed-off-by: Adam Young <admiyo@os.amperecomputing.com>

---
---
 drivers/mailbox/pcc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
index 636879ae1db7..25650446cd2b 100644
--- a/drivers/mailbox/pcc.c
+++ b/drivers/mailbox/pcc.c
@@ -314,6 +314,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
 {
 	struct pcc_chan_info *pchan;
 	struct mbox_chan *chan = p;
+	int rc;
 
 	pchan = chan->con_priv;
 
@@ -327,8 +328,11 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
 	if (!pcc_mbox_cmd_complete_check(pchan))
 		return IRQ_NONE;
 
-	if (pcc_mbox_error_check_and_clear(pchan))
+	rc = pcc_mbox_error_check_and_clear(pchan);
+	if (rc) {
+		mbox_chan_txdone(chan, rc);
 		return IRQ_NONE;
+	}
 
 	/*
 	 * Clear this flag after updating interrupt ack register and just
-- 
2.43.0

