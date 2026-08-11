Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010009.outbound.protection.outlook.com [52.101.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6293F38D686;
	Tue, 11 Aug 2026 06:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428750; cv=fail; b=XRfcF5NbR8jI8opFpjcwUWdoVloyTHOfxfU/9sp4griggR1HBz5ez7KT3i4aDkf7t+K1VW9XisA8pR2rQ+BjYwqlCue8kdHP/iGbP5TyJPiYbcicgXNiYDQhOTXKr5uqJuUfKLPIR09YJVYyjlCAYJ+X+kMqizmUOqIMY49BGgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428750; c=relaxed/simple;
	bh=tF9L4tFmfaIsnAEM2WyWbDGv5X3Cqvrc+cbrPasbzhQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dkgto38v3hI7lYcvQENuCKknB0d/t0i6/POCNxBOfECH+M5QhtfJsXRBE7OrvzcpI/hG1gu7dzizIgYQEM/ohPy9hFV0PIJ1ZK2rKZCMkjdRF2vObtSknJldbNBpZhs84mHROTayX765VbsRE59Kn6gO1lWQhdhSLreNQexZxdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=WB5wfQy1; arc=fail smtp.client-ip=52.101.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="WB5wfQy1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzzW8iI1cp1d716O0ZXv8iSo6IbHFKOxSbE182Lc5MqxyKdWdJ7mlsMy1EdQTC4O67iNtFf9XoTrIkFofV3/wbRT3TIudWwnJKeNDjl8Q530ypXQkG0iz8CkDJls9xWt9hgJItkliBnrc+NUMsk9ctk8MLeq/pd86ZCL/+dgtLqC6nzF32vVL8kGdJDd+kiF1QzubwLwctA4kXlKsmfeQX/JPObp9kXCU1qsDUw40ao72VOZaA4ITjLFfiqw3qkVn+c/mhKzgCCNOtaqAIoavcaYJ0Jf9R8RAGGGuvPJ70XI/T2Drfqh9EKlFj7U5lwoOJxwR+mM1tNDpQ2rlB0zug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUzn06r7F+IIFGt3u0xjk9iqrs2wcXhjKbUfY3i1kXg=;
 b=jAMAoPz7Zq/DzcZjhn5HPWQ1W3awwQ/T+vpzMchxgIeZE8okXud1dOzv29I5K0h18UZHDJtcAALyjMRpJX26LMeBzbULl+4jAshDMcWsVkdAOj3HhTvPI/AFr26HRYJ3UC3uvZ8NjV+BzQHQXoNeYZ4P01p81pjfALEAN9Aak8fCAbDRUdNfId364S7oLUCiRsuElVOpGEbooTQ0OMWJLlesC2uM0DHoPzTioC8H8EAVH3Q63s8yetUAd4gDM9mNpD+otPN2uHYPJZ3AQ862+DPofv8jhEWBsLfWfcwOpE7G+gO+Idx4gjvNVStz8cLYC/DRa79eD9dxAneuVig32Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUzn06r7F+IIFGt3u0xjk9iqrs2wcXhjKbUfY3i1kXg=;
 b=WB5wfQy1WTj30ISuxv8OfmCDPsgt6L+J9f3IzmkIU9zHa5HliGvpO0+l0YPDUuVBBNmyF0VgchspQJP7XppR7TPscjELG/H5NiQ8RmhpOBnbWmMvFftZER5ZgxRbWrEb6OwqKICwRWZS++3ijj33Iblhv8Bkah1XvP7wjESmojL44QBK9jU27vnUgCil+YKkxFbuUDYIPH6CPT12Fuxfk7TbdUPv1H1PNe5CvTDHbWXKp2EbJ4sAH1cBcmy8PPQAMNGerZb5YiQkrtEEdvRNiNMZEzj533Z7UYZ7BtkiU//8kMid+wVLFWASocteQxVXaQFU1DuV40vi48L4FUWKrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from CO1PR03MB5937.namprd03.prod.outlook.com (2603:10b6:303:6e::18)
 by DS0PR03MB8014.namprd03.prod.outlook.com (2603:10b6:8:1fa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 06:12:21 +0000
Received: from CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3]) by CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3%6]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 06:12:21 +0000
From: tze.yee.ng@altera.com
To: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
	Tze Yee Ng <tze.yee.ng@altera.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (socfpga) add Agilex 5 channel mapping
Date: Mon, 10 Aug 2026 23:11:47 -0700
Message-ID: <0701aacab270fb8ca7bb35e8e72b7dd629e2cdcb.1786428156.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::34) To CO1PR03MB5937.namprd03.prod.outlook.com
 (2603:10b6:303:6e::18)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB5937:EE_|DS0PR03MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: ce7a2a34-c0cb-4f59-5992-08def76f809b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|55112099003|18002099003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	xfXk6v68S5ILj/snoNAZzBkPVkVVA6wUl/8Kv8DHyIxtEyK3MKLfgr/ZvDjpo/Ck0/lQv43xholmchjSkWnUkD5E7atErRHbVpD3N4q/HobhY2tN7fab/+Urz6YK7Isr0SHVocmoEm/RupDKipd5QyA3MERyk3VgJO/QpYOgi1jWw5tzMWoMlLlv04N0hJZXt3+W/EjCr1Y+VsovUT9tv8rt1c7IR+3p+wdVBKpcSbCESQ9nhPtHC6AaA5LJ7v1p++nxrk0Jv6azu0eNizDvYqWrFiZXUiogSdj0UyP4SQmo8vo9jcUfwYoWtEFRXX/DXigDxGF4cK+FfEokt6zpH/ipGp/XwLVZs90yWPGUx+cY5MXODEcJQNXNVodmKow/G7z/YVWZT0ecmnZt5lvL9swHadE8HhnMuR/t7BgM5odufcoHcWFsud5ccbyuojMXexmmej9TnG8Q2gYzrvRxaYy9cu1NxZ/CbUzZiJskg7eqdlwmtATIs+ZWFN6lZmv5vUVZi9d/mdU6uHWrINeMd9pOZVaW6sGAVKsVBYnJICW9peGRmQ+xXT7Qmohb6kJ2oCpyNzUcb9byEF+B39/lMEKAD3B6vr9yyhvzD8RDwgdy9Wqb/93/aKl7xI75ALjoqtqh12fE9HJOP6KLj3kDiEswdmonIhNJmzpiJjnaAWo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5937.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(55112099003)(18002099003)(11063799006)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nTlfOZQQTkEx7qCjdTpiMecLMP41uUuaJyk0PGYj3Nzvkjrl541YeA/CG60m?=
 =?us-ascii?Q?lRpVO8IlNM43PHSoxdpEh1bnLD+c0SNNNZFZ2rjwoOGoIEzlww+FLJ4MeDLS?=
 =?us-ascii?Q?8pbwYLczct0OJ6SCFq7/XM15+An9aUR4JbGm4qfTUVIgR66U1ZlyhgkzwkEk?=
 =?us-ascii?Q?dTyCNJXUNPKXeu2g0scSK4MHSKmNZPcuB3+xKO48kw9DzcZ/8EyqZWbGFab7?=
 =?us-ascii?Q?uVugX3PbZ5mTCEmz6xzLj+laZN/0OSHZP4iwImdvRz9DTKMbiaKMY2+oswVG?=
 =?us-ascii?Q?1diOVzN0sL54QAaJQZ2Uja5lt4LBoOk8+QN0WBBcSZtxB9xMpC2vwj4ImYG1?=
 =?us-ascii?Q?/YBwJghsCdcl0qRIs/7IrA1zMCMYK38t5Ed+BJ1CwmuBoZl5tfV+NhNXizMw?=
 =?us-ascii?Q?laS8mPPRaKVXMpXLykxF2XSANeMz5EhU6xmKnvwTUioQGerBw8a3OJEb5uO7?=
 =?us-ascii?Q?L2C5LHa+InaQ3e6zqpPnteh7hE3bykd9o4i/kDjMJYQ88ritlBR6XiAEubg2?=
 =?us-ascii?Q?J/rmH5v8bTROutTUjnR/7rmvLkcVU8jcX2Qg/oW7f/O9+RQ/gnFHEbhDNGO4?=
 =?us-ascii?Q?yBSVg90TA6ij+LLbjop5L0RMrFP5k6nw61imRdAFRPwDSz0oVYrE6iIaEzkE?=
 =?us-ascii?Q?n35zuiFJfkP3cSBtZVKESj9dhpgmtWk8AICy3A/iWOM2nihdLPvKUeE6rB9n?=
 =?us-ascii?Q?RSQV64CO55x4G2IoREJr0nbmr2sbH56GeeZvtLCYm/H2IVr5NyThB5rLG6MH?=
 =?us-ascii?Q?bbbRBQt/YCOOfaW7R3e+mjSHcNAlBQIXWGWjz1NO7UcFoILcjBT8QJ6gE9Se?=
 =?us-ascii?Q?wh7pXk2RXIPwtU23J3yIIZF/hbwBgAvYhZ7OlNoIYBQXkZFj66K9ef1vpt8S?=
 =?us-ascii?Q?arUVaLWUFzX8iA5AEZJdKU4vRKIKwidzDD3TRHfm+/lFpfwKTvoy+Nqhsfs/?=
 =?us-ascii?Q?F0ZR3teMocHREfoPGL05bAr2HFk//HHQsJ7JQsnioQPrpVF8PbHwwkJOCGER?=
 =?us-ascii?Q?b6h3HtsrQiGQXrBIl1mcUqzB0c63wlUETYaNb6peQZDIrhfRgkS7v4n/Hg71?=
 =?us-ascii?Q?7TWBIJWqiR1D1qv/YnMJ/Kmao5KYf0pYRCTds2sx40nyap/z49RsiiooxIum?=
 =?us-ascii?Q?gDgiAGxiHCH73FGWJjryqilm6JshdHvFx1oxmTEjzhpMOU0c7dZjILvhsVfI?=
 =?us-ascii?Q?AN8yyDDHZzS0BV2JzpUFO2GtE26AvG7RtyaeRlAtkFrW7+kObsWIh5xvQpEN?=
 =?us-ascii?Q?RwR4VSmcfjhNUs3ZuMLTvfGqlp2FXUaSHTpl+lE24me+u5JevMLUCaLbRkUe?=
 =?us-ascii?Q?9Y+YEJzmKjB3oTS382dJHUM92d2IvL/xH8M0m4xud1c5rHbfqaRS0RgnVNcE?=
 =?us-ascii?Q?iM34OgiEk1arGkdSyu99Aj0YodEPCo8LFS57/QmlJDEtKSD0rsWdeA9TnOV+?=
 =?us-ascii?Q?VNb1xHrZHmDlYpPDliD6/k/9DaNaZK4+BR9TINd5mJSjW13WpcApm6OzNsk2?=
 =?us-ascii?Q?2ebt6/UZymo32KDVs+/imhLk59vVAJxS0dNssN0BvlR4AiOKa1+A7EAvsdZJ?=
 =?us-ascii?Q?Wks/sBgiFGKRsMtZDsvYu8EcoEiGo6M4EIrXZEgQ6WiKuyeLnfRnCARNyOVK?=
 =?us-ascii?Q?fyFqzzh6WLlyiB+IVDhVrFhiBMK05qorEYCPn87k+9GAZGeNuvrhCBaeZyMT?=
 =?us-ascii?Q?czcU67hVUBfrAZj4OXBF4bV/a5tbk+fr88uec9lYng9mI2eaUPK243vMHK5m?=
 =?us-ascii?Q?nk6H7lSvEw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7a2a34-c0cb-4f59-5992-08def76f809b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5937.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 06:12:21.3086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNkr8ZZcXB51cVpACZ61YNhGdc5YcYZjPon/cyleX+79MWZTCzKeXv+UmoigtLE+6AddACeLH9hYmQEkwEDTpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8014

From: Tze Yee Ng <tze.yee.ng@altera.com>

Add temperature channel mapping for Agilex 5 and bind it to the
"intel,agilex5-svc" compatible string. Reuse the Agilex voltage channels.
Agilex 5 omits temperature channel 2 (top-left corner) because that
sensor is not present; remaining sensors keep Agilex channel numbers.

Match intel,agilex5-svc before intel,agilex-svc so dual-compatible DT
nodes select the Agilex 5 board data.

Update the socfpga-hwmon documentation to list Agilex 5, the matching
compatible string, and the SDM temperature/voltage channel tables.

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 Documentation/hwmon/socfpga-hwmon.rst | 52 +++++++++++++++++++++++++++
 drivers/hwmon/socfpga-hwmon.c         | 27 ++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/Documentation/hwmon/socfpga-hwmon.rst b/Documentation/hwmon/socfpga-hwmon.rst
index e5da42556a62..664103a38195 100644
--- a/Documentation/hwmon/socfpga-hwmon.rst
+++ b/Documentation/hwmon/socfpga-hwmon.rst
@@ -7,6 +7,7 @@ Supported chips:
 
  * Altera Stratix 10 SoC FPGA
  * Altera Agilex SoC FPGA
+ * Altera Agilex 5 SoC FPGA
 
 Authors:
       - Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
@@ -32,3 +33,54 @@ driver based on the service layer compatible string:
 
   * intel,stratix10-svc
   * intel,agilex-svc
+  * intel,agilex5-svc
+
+Channel mappings are fixed in the driver (not described in DT). The tables
+below list the SDM page/channel encodings used for each family.
+
+Temperature channels
+~~~~~~~~~~~~~~~~~~~~
+
+==========  ====  =======  =================================
+Family      Page  Channel  Label
+==========  ====  =======  =================================
+Stratix 10  0     0        Main Die SDM
+Agilex      0     0        Main Die SDM
+Agilex      1     0        Main Die corner bottom left max
+Agilex      2     0        Main Die corner top left max
+Agilex      3     0        Main Die corner bottom right max
+Agilex      4     0        Main Die corner top right max
+Agilex 5    0     0        Main Die SDM
+Agilex 5    1     0        Main Die corner bottom left max
+Agilex 5    3     0        Main Die corner bottom right max
+Agilex 5    4     0        Main Die corner top right max
+==========  ====  =======  =================================
+
+Agilex 5 omits SDM temperature channel 2 (top-left corner on Agilex)
+because that sensor is not present in hardware. The remaining sensors keep
+the same channel numbers as Agilex.
+
+Voltage channels
+~~~~~~~~~~~~~~~~
+
+==========  ====  =======  =================
+Family      Page  Channel  Label
+==========  ====  =======  =================
+Stratix 10  0     2        0.8V VCC
+Stratix 10  0     3        1.8V VCCIO_SDM
+Stratix 10  0     6        0.9V VCCERAM
+Agilex      0     2        0.8V VCC
+Agilex      0     3        1.8V VCCIO_SDM
+Agilex      0     4        1.8V VCCPT
+Agilex      0     5        1.2V VCCCRCORE
+Agilex      0     6        0.9V VCCH
+Agilex      0     7        0.8V VCCL
+Agilex 5    0     2        0.8V VCC
+Agilex 5    0     3        1.8V VCCIO_SDM
+Agilex 5    0     4        1.8V VCCPT
+Agilex 5    0     5        1.2V VCCCRCORE
+Agilex 5    0     6        0.9V VCCH
+Agilex 5    0     7        0.8V VCCL
+==========  ====  =======  =================
+
+Agilex 5 reuses the Agilex voltage SDM page/channel layout and labels.
diff --git a/drivers/hwmon/socfpga-hwmon.c b/drivers/hwmon/socfpga-hwmon.c
index 5b43274d0aa2..92bffc02e309 100644
--- a/drivers/hwmon/socfpga-hwmon.c
+++ b/drivers/hwmon/socfpga-hwmon.c
@@ -433,6 +433,30 @@ static const struct socfpga_hwmon_board_data agilex_hwmon_board = {
 	.num_volt = ARRAY_SIZE(agilex_hwmon_volt_channels),
 };
 
+/*
+ * Agilex 5 exposes the SDM and three corner temperature sensors. Channel 2
+ * (top-left corner on Agilex) is not present in hardware, so the SDM channel
+ * numbering keeps the gap (0, 1, 3, 4) rather than renumbering.
+ */
+static const struct socfpga_hwmon_channel agilex5_hwmon_temp_channels[] = {
+	{ SOCFPGA_HWMON_CHAN(0, 0), "Main Die SDM" },
+	{ SOCFPGA_HWMON_CHAN(1, 0), "Main Die corner bottom left max" },
+	{ SOCFPGA_HWMON_CHAN(3, 0), "Main Die corner bottom right max" },
+	{ SOCFPGA_HWMON_CHAN(4, 0), "Main Die corner top right max" },
+};
+
+/*
+ * Agilex 5 reuses the Agilex voltage SDM page/channel encoding and labels.
+ * Check more specific "intel,agilex5-svc" before "intel,agilex-svc" below so a
+ * node that lists both compatibles selects this board data.
+ */
+static const struct socfpga_hwmon_board_data agilex5_hwmon_board = {
+	.temp = agilex5_hwmon_temp_channels,
+	.num_temp = ARRAY_SIZE(agilex5_hwmon_temp_channels),
+	.volt = agilex_hwmon_volt_channels,
+	.num_volt = ARRAY_SIZE(agilex_hwmon_volt_channels),
+};
+
 static const struct socfpga_hwmon_board_data *
 socfpga_hwmon_get_board(struct device *dev)
 {
@@ -443,6 +467,9 @@ socfpga_hwmon_get_board(struct device *dev)
 
 	if (of_device_is_compatible(np, "intel,stratix10-svc"))
 		return &s10_hwmon_board;
+	/* Prefer the more specific Agilex 5 compatible over generic Agilex. */
+	if (of_device_is_compatible(np, "intel,agilex5-svc"))
+		return &agilex5_hwmon_board;
 	if (of_device_is_compatible(np, "intel,agilex-svc"))
 		return &agilex_hwmon_board;
 
-- 
2.43.7

