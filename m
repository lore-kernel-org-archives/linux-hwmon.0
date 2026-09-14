Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013071.outbound.protection.outlook.com [40.93.196.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122533E5A03;
	Mon, 14 Sep 2026 09:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377227; cv=fail; b=mX3lrlieoW8klcoer6+Y3CtFayyZAklpvRFmQl5cksuNmtSTKG6S3V6VuRg3tL8GUZReSMwNs5XWQGE2LQRnWJBIa4N4iuoLY0E1B1OIrC9+Htm22zTDLgTA4UqEnKcr/ySaM/A4oOD06uuK4JNR8dDkdnDDxBn9UUxr6vUvek8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377227; c=relaxed/simple;
	bh=tdmIi/CJ4YmwAtx3tZNC9BTq5NA6nhtv5/7oiLNFSE0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=d6aMF/VUb+HrZv9WKYn0L7YjsWo9hVDSo9vQXOZng/am4n8b+tpAuIVNzLbLNRL9FQrt92QtNXUVPEFlel0G92OFA6BIgxUDyrYrZs8M859IpoDrs1WhyhsOn9ZmkotfVFW9Q4nKifVwM/raM8iiYO2aBbvowtDf3O2LR4Oz1Ok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=IF7MtYXE; arc=fail smtp.client-ip=40.93.196.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="IF7MtYXE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsEokVH+3Nn67gZrYRH+Q/fK4NmmY1dv2L+Pkt2Yj8CEJghMbAspdPpCVL1MSkQLBCQS5yS8wW8L7aCcC+HOH2GTrx+Z/93XobJuKC9x4F+NJ6PWo1oiUdK4vLW5WfV8GKikfxVMcl6wb1RcV4OhKYSwMjnr2ybVLtfc3QSEx11z7Q53g7qiKqkgU1OrvH6b9DtCnN2J0kkRILiCtBaeoePb9pFhwAQ3ecEYh2ubESgABis3emGuNI8yg+8ZvAGkriaWDgnSGA77KI5TfPFHlLat6wf807LEJMXESSX4ORiTm9mitSoQGPvMWFt0CoZnsBK9Wda+cpdcvwrtd4C4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skpHTK1vuKh/x6yI5TNI/3AtL3E42bWHDLtcmLnA9QI=;
 b=a4w/RNXoQ0ZafyiKVs8m4EtbSvyr5XYP7Y5QVbFmYSg6bn9dHh8Dn3ERKga4nRdaOCnUZpD6m9RY9tSCIetNF8SQ91gMVSfIEnheBVi+bR2bSylcVTqoIfQxSUkqfIvo8EjhC0Sl3gWqveAVnzxYvJe43nzBEk61oEhRX04HsvKcKoM2ChL/n8cBtS+EwMEumcNswaWq/PpQLwziGz68Uog0HkNS0SfTwOyFSaR2LS2hvvEC+451TqxzcFUfUAfMrKbDt6yX15oM31AxH819lpnGgrE33cgLmNgAYsaatxzfgMQovfghMUf5seMCHSiJEDhWWlfRUDAAtERX83tSGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skpHTK1vuKh/x6yI5TNI/3AtL3E42bWHDLtcmLnA9QI=;
 b=IF7MtYXEPd9ALP6sKp2TEPAiey3tOywRnazaATezezmnkYF6fXn7xdqjtK2fsFwcx+UPsN0zvvKdZP1BhADQMVD3tQX0CQR0IopqbUoU68aKncDcV5cHvRX9hwq4wqfdsuUYnBWkidtFoCqMjFcSaO/Dj9kFSnmFO9GC15xbEfoO3GFlosu8WzgJU0m+RM0+18LqZEE/sJr8R4YQ3Vl21L3ih+WB2U9fRwGp9hZsv5uavljItyeDsn4D8lefisHVOIbvoVNEh/RiVi6nNXSQET/iKPe1TYQ6aFR7SUvmOygRY4jjWYOUBQjDKDmc7MLThqymMCVARO6HGTYOR7w1qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by IA5PR03MB989679.namprd03.prod.outlook.com (2603:10b6:208:607::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Mon, 14 Sep
 2026 09:13:41 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 09:13:41 +0000
From: tze.yee.ng@altera.com
To: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
	Tze Yee Ng <tze.yee.ng@altera.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (socfpga) add Agilex 5 channel mapping
Date: Mon, 14 Sep 2026 17:13:35 +0800
Message-ID: <41bb317cbfb6f4e2711581f2ccb22071db17b19e.1789373027.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:a03:334::18) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|IA5PR03MB989679:EE_
X-MS-Office365-Filtering-Correlation-Id: dc23d273-f9f8-4763-6e39-08df12407802
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|55112099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ViFdz7FY2cgdN7UzHJdlE0rC+VplLkksfDQUR42JRgLSGQU+GK6Shbxw9IXi8+djXMfnozCAwR/N/jwsNLJADdI3Uq2QTODWXumXoa0glwoGDiLHh6ewQEA94XOtAnJmB14uB+7BtwwHurV0M4+/P8dSxjpW9a2bTc7gu5mpqEHQw5r6x3zA+P4kOGKooD1/DptYv7hafPSZKjDZ1a4QHPbeAokFm+QDGZJWAoetQIjdS1JxBHmovnBqN1GSZ9Dh1C4/gg3T5OVPP2Es6pMHoXXGGf6Lnqr5/qkVo4lDp2yT474Kr47UTZwbElPe9+zg/s/zGFHe0iTc+vDodxC8SyEbNp3jQktirE0DpN3I+fjLLJ6mgzXXD70r+RdxjmlE3WgsTvpwlcJLY3T/ugk0VYUBxJqHiiWh6eAU9+ZKkgtNc5p+YUtp4BhJd3/UwFALPqKmR8kFoW9t2FhX1LJoTajlDsnbKXkEb5keSrvoDZznit8Q3KS8z96yi+F9gMnbpDIz4RLC8xrSGU/ycDxRfvNkOGspcMvnIYZa38IQI0L0E6ri4Gzkw+lsYtOnv0Xhvyg/+GWN4w51mx2gtCbt0rUwC/Lb+kgy0Xo/ghu0ZKhmEl1IFpsc77D6+YZsWnjH13nHU7d6PiMxGJVz7bnjAIpBIZVKT6E0J1kKQJdmG3Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(55112099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?67dIyjzYDruyNDFPpw/R5bzFQLvJdQATZKOn/oe8lDiMbDKY4++JkWxsC4vp?=
 =?us-ascii?Q?NHmkWA53hgFIWDPmXbJChJysTPvSzF/n14jMUm6tW3D9YCtAmcEwmoUFuKMr?=
 =?us-ascii?Q?NxL2ZkXxDGMORCv7j9EyHu+0xEs2GOcfL1dRAPpbyJKebS1ZR1Dm9JwS2RVN?=
 =?us-ascii?Q?IGi6sBn6sccuxgup8oYc3l+iBYmxhlFxQcn6UuiSlQT8uE6TBuVMRjawsMpM?=
 =?us-ascii?Q?dCc7NUC9Lg9qcvIvLXASILBOyaLNlOPE/ZI8dI0GiM9X66/ZJWc+Q715nfOF?=
 =?us-ascii?Q?Hn1hjCcuumYCSNqPJvvi1NMQ3xEYPUadcWRM0u6DVOT7SrwPIuZWZUem2KMN?=
 =?us-ascii?Q?UX+rfs6hRY1OI8E3SxIvyOF3DDKHNA72S1IXxDE/VtKDXuKOn/oQW+TOghKl?=
 =?us-ascii?Q?fFMNhanvGGjHz6n1JZhPWTn5pH46sC5KJprUGUQHvuOgQv81BDH9vM7Wvav7?=
 =?us-ascii?Q?MCLbeZJUOAXASpC6TLAZZL3G9l1gbE7bVYWDSWD5iWrN5Dh8SZRK47Dd+6t1?=
 =?us-ascii?Q?74T80F8RRGfPMH7o9dG1Hb3SAxcdJGSBRZIBqEy9bUJLaOIZh5sf4eD5Kd/f?=
 =?us-ascii?Q?+uvLRUgluhaGgOLREOrlHU9lhcBotnAa/7KeYfCOJL/fE8tBYRiBh5Nozqiu?=
 =?us-ascii?Q?sxS8D/LvCxthYqv1Wn+DZMarm6iUOBQiN+aQH7at0w5bz53vc+Di2Wg/Zp+J?=
 =?us-ascii?Q?ZkQuBw+BzyckdGxacwNHMyq3HU3AhXg1Y7XlxYo7ysVlAQXL9MIb9lUL6ri5?=
 =?us-ascii?Q?Nc8IKrusdztl+B/z6sJ7Nxe2Tee8LTt1O3eoiOEkBFJgREakn0SXLonLC09o?=
 =?us-ascii?Q?zwmRVIGUKTnQ3cRM7B2Lb3XfvqC5t0m2Eu/xiraqnLXWdozJ+u45SAVe37EF?=
 =?us-ascii?Q?uYyL1IJ+tlpidSBPEv2gXlzNcrgDxJ25KwNJGzqpi+IlpfohFSDVAgyPsq+b?=
 =?us-ascii?Q?rDfFxkZSMDrzUcfQUX+lVwf588g9sNxdZn9Sso70IjuANad60NG6dmWDLw3S?=
 =?us-ascii?Q?AA6JeJwBQJ6ees9+NjuU/jsP/8S7RkkFetmq96nqEuYavtqOCSIOeIeujh8b?=
 =?us-ascii?Q?A83c6TJq6WNhUHEkaEBJh9zUxKX2qbmDdMf68Ek7cRvF4t2t8mF5GWh7r7am?=
 =?us-ascii?Q?/bEyi5EnZ8PhBX+O0TzOatRwLmy/Gv1ehv1mVGWUF7iDmuv+8y5XoHVsAW3X?=
 =?us-ascii?Q?Vdy8PInL8v5TiDW0KZGgoFudo5JVcODvHNNy5qi6XYthMkX3CxcMxD0ux0/k?=
 =?us-ascii?Q?ikb5QUz8o9r+zFVOYj/DCB2jlr+KFw95WMUyvO7CSWuSzs6WU1GeVj3aarRI?=
 =?us-ascii?Q?KUx4A0PKfON4c9td/46aOs73f6QnMM1hAMmlPMlwGvQ4BK8LwBRnSN0F/Itk?=
 =?us-ascii?Q?YO+B0dYIEvP00+wgJyU5zsz6iJidug1xj2+XFOqul1tgyz+9dwj6MdLTRIF6?=
 =?us-ascii?Q?TLaDD0Hko6hsuDpNcM7MrAdtbwT1D69PeoJJrDRn2LVXVZCBVr8L47MeYXpO?=
 =?us-ascii?Q?s3MdXWo0sPxXmkjDqN0QaSdHOjOT4esMzSBFSSQLSpnoUcrO/o2Z6qn3nJlN?=
 =?us-ascii?Q?+BXVn2VYV2o0A3ywXvXCuhIAHpd+PD7c/eh9bSQkSwd5tvGig0OxO4DJspTf?=
 =?us-ascii?Q?WzVkIXcoAfczMcebj2Nx5zXCCfY4uw8qhnxPXPGXyinWIOArx4/JEhljuH0Q?=
 =?us-ascii?Q?oetYNnumujXEu14rkh80thVqgK+b5RHhkKOuHTB/n5lcfExc5iPYWJOI8bSI?=
 =?us-ascii?Q?vL2wrTTkqg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc23d273-f9f8-4763-6e39-08df12407802
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 09:13:41.4119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZTQuAct4FydRrO9cDDsH3Za30sTTp6dB3n+HuBDFiF1+cJtH7STJ/Htai279v7NFOYK40JXBJ+CBGaGV2DLNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR03MB989679

From: Tze Yee Ng <tze.yee.ng@altera.com>

Add temperature channel mapping for Agilex 5 and bind it to the
"intel,agilex5-svc" compatible string. Reuse the Agilex voltage channels.
Agilex 5 omits temperature channel 2 (top-left corner) because that
sensor is not present; remaining sensors keep Agilex channel numbers.

The "intel,agilex5-svc" compatible is added to the stratix10-svc match
table by a separate patch [1]. Without that change the service layer does
not bind on Agilex 5, so the socfpga-hwmon device is never created; this
patch depends on it.

Update the socfpga-hwmon documentation to list Agilex 5, the matching
compatible string, and the SDM temperature/voltage channel tables.

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
Link: https://lore.kernel.org/all/20260907082203.2639395-4-adrian.ho.yin.ng@altera.com/ [1]
---
v2:
 - Drop the dual-compatible rationale from the commit message and code
   comments (Guenter Roeck).
 - Note the dependency on the intel,agilex5-svc SVC patch.
---
 Documentation/hwmon/socfpga-hwmon.rst | 52 +++++++++++++++++++++++++++
 drivers/hwmon/socfpga-hwmon.c         | 22 ++++++++++++
 2 files changed, 74 insertions(+)

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
index 5b43274d0aa2..5fe5ccab1e4f 100644
--- a/drivers/hwmon/socfpga-hwmon.c
+++ b/drivers/hwmon/socfpga-hwmon.c
@@ -433,6 +433,26 @@ static const struct socfpga_hwmon_board_data agilex_hwmon_board = {
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
+/* Agilex 5 reuses the Agilex voltage SDM page/channel encoding and labels. */
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
@@ -443,6 +463,8 @@ socfpga_hwmon_get_board(struct device *dev)
 
 	if (of_device_is_compatible(np, "intel,stratix10-svc"))
 		return &s10_hwmon_board;
+	if (of_device_is_compatible(np, "intel,agilex5-svc"))
+		return &agilex5_hwmon_board;
 	if (of_device_is_compatible(np, "intel,agilex-svc"))
 		return &agilex_hwmon_board;
 
-- 
2.43.7

