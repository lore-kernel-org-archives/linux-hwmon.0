Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012037.outbound.protection.outlook.com [40.107.200.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB303D667D;
	Mon, 29 Jun 2026 07:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717908; cv=fail; b=JGNOIHtv38PqF+TBb7ITH4qmCBAb2VsMc2jEihNvysw4zZZo8t1Qt/AAtvvkh2x8hWgY0Ru+iSITqGSG/+1EDVBtiwDnD10oIduA3Zb8IGt0rG7qK0nM7HyrvvT3tgTNk4a/rGmLgSOEHGkYy7TGMAokHrrMLApyWbZGKouPThA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717908; c=relaxed/simple;
	bh=j9D8OVgdaDBBimG/0dryGFTBssBAh7Wj5SW1k/uxh3g=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Abg1FH1Fz2wtWd+VJ72qFz8NBmSHqjK+R4UXKYxRPIy29KvErKDF1K81NGCh5PTX/WBWKxw9XEphMQ3L/7B235P8lEORCtvsqLdrd56JsA6GDqSlZG5qiFJiZBAkDymC7l/B3WB6+pI5LXpHmj4xj0UKgqLc8qxGfHAZk/LHm78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=c9TraO2I; arc=fail smtp.client-ip=40.107.200.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="c9TraO2I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFz2McqJRHV9OWrVoVIJ/P5+Z5AtkIDWdtTsU+8iOJQv/CprcIDb77dXZIbTwn53yMahkDUiwb0lsA6nzYA4D0zkCCZq1oLYkThwygns0ax8s7ycRkLkgvU6ZDGy4Lx92YxcfewTqqd4PC+DYyHN0lAGPk50D/2I5t7cPwt6y2HZWkFoNJdrWGeMzvgtQVFznmT+fB3kmGZrc27fPcIFQKGcMXwBtKR/UVnJV1auwf8MRGxbirOlKGTB3Bi2BPAGbBgtbo7KIkGsMdX5eKCrNMzZ/X62LSDWlXb1PSxrA45hTvCkLLk890YGgsz45485wbxGEpsp5NFvPqe4pozAvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASXgruLa3aEX/NAa7b3YW6mZx1bA6EOYBkBFuxRlTMg=;
 b=aYBHI9q1EboNaOAy4MnPoTJL+K003yGnuo7rnHA48dWUDSzksJ0sMlq/bhwMx4ad4FosIinled7BKEhL0NacrIsNEbpbEx/pBYHtuQCDPrKPBXm3LontTAaXLKWVtYdjJmaM6KBpvcSn4vpwXZLusHdq03I37mu3RCRak9Np3I9wqsvow7bdCVnTTwbzs+kYNuoBIkfVlTtdarFcuNFQY6O0s6ko0oU98/WDSAUowG6gEdfEu01r0xB6Gm24rc5nnbe+htLPSH2bN9ip9TxHO+Ye5FGjV4V/teqXdC3iQFn6tOA3DJSftv2XeCrRBxhVRaqhMgzy6mxdC7bMPH6A3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASXgruLa3aEX/NAa7b3YW6mZx1bA6EOYBkBFuxRlTMg=;
 b=c9TraO2IlTT9qZD9AYPsTOfpf3dbUEuMcWcGHzmjuV6wBsznH9X7mFuD8yAFlw8NrrUo9DrWsZg90Svke0D48lsbKKgU030mjJv5b1OOnAfErDx3w5ZStDll1nBMIxiLLWATxqdfoNIwPYmIVzV6asdlJRVkk4DJfqeB/2tfbJ/xqtONMmkTcWBDYfkE2VPtcM9hmJpbC4PtO5WnFv3KAR2g9k0Ejuns3sBoh1MmbbXf0nIMdcyVDzN2JWSeF2H3pimLqJHbDLUhtptyAm/OV3EPsAW5GGklsXooABNvGzoX3/lWYb6O21j4+Qka3jzUst+kkN0gqanym2Gg9Cohlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DS4PR03MB8376.namprd03.prod.outlook.com (2603:10b6:8:328::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Mon, 29 Jun
 2026 07:24:59 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 07:24:59 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 0/2] hwmon: add Altera SoC FPGA hardware monitoring support
Date: Mon, 29 Jun 2026 00:24:53 -0700
Message-ID: <cover.1782715159.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:a03:505::29) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|DS4PR03MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c897fe5-3fb2-4f5a-c981-08ded5af86a4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|6133799003|55112099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	oIC0borvJjHHfSEUmz9XorGpJX3ecsxd8BacXPB3wc8ODJAzzFX7+z8bTpPFim7wfduVcsdlzWETpctBseiTSQIj+zEcKqmiNERkWQZNMQQIE67YEWlAOjLdhkGwP8c9FbrLk6cXwERC8TUAWAy1lbIxfFthT4NNvf4IdlDmLfQd8Kas1xBnZ1BHqKMJ2Uarjt6KKTVMWN2CbRC6PVa5lv2H+P6FK+XcklKTnw9SLBtl5ZrqPzyJFEHCgVrTHTvKDNMu/STYF3qraOmM7l9E5v6MBZZbfyUCJoqdiqm+/mJj2AfiUtYf22+HKczMWKBrPFybu0j7X3rfs/9LKmxtYHH+tVMA5O/6oe5gvempxbtBog7xGv8LnBnYdCOIqLsVWRa3pxGEQKCeB5W9btYcSRm4vhKKqn7xJDYFlv2wI/vHiP+AJ561LaGBIQfZkLOiq/4AMTKJuZytFD/qAvdymkpl+4dJJk0tfk9OTngvSNAW370EixQPIE6CMpUf9L5nQG/TDGsEbhIk89ot0Awkk61QiVr018OrqGahV/v+Jwi/0Uubu8Dq51tTDNQiTOMi18uuHZ+ZvAXOdjzxljNo1C+Oa8vTTD78NKKA2flGLbMQYCy+w3V/a31Mpghjz7FcHgGoEI/muCELcb1w4LNRE2KwOB588rIFK5KFfriGuDc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(6133799003)(55112099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dmNcHWNcLI5juSG9Y6zzCtAbFK8vZHbUd3ZcB942PdiK/Q8F3yIYqfiGnrUm?=
 =?us-ascii?Q?O2HSc8aPy/c6Xc6/fPra3QrtUpqDudDicc/8slDmH0tvUrJVzc37c+NnPJJh?=
 =?us-ascii?Q?hoEhr0EaFItfhzjO1dyzHjqolVkecF4QxrJcAxKBrp/Qx9QdwTFRDY3qdogc?=
 =?us-ascii?Q?lCpSmfWX4powOxK6wsLQOrM0mPgBK/bGj3lv7RwVByvrwmvliAogoab07orx?=
 =?us-ascii?Q?jRzmd6FyTXOlAUV1v7BLKB7RfHUWoZPu8GsRqmvf7EPKOz9KoRqaaHIf+N1+?=
 =?us-ascii?Q?nV137A+G0wbxM2Nd/BmaZtEZIFgj1O/xUmDQAA904uZeggsiWiZyOlSNAdas?=
 =?us-ascii?Q?0DtmDV1Sx+Vz0OHX/3sOwBv680v/uzPTFjoySsfzsXNrjCIvHpIdQ4ajSqc5?=
 =?us-ascii?Q?O0nnX3Xy4nNyHk5dMeAkw6vNDO/mL5opPR5FPpxfe0G8fPBaZoFPd8CgcVSP?=
 =?us-ascii?Q?dyZaGosnXIyHyi9KSyoH+GVud6judEI6ns1fdEIXIPaZA2JuvjK42ZOu9X+D?=
 =?us-ascii?Q?ytJAr8M+JVyyOKjRpyGwYeXPiEzXy/6Gw4YzA7L5mOKZYKpA8VaN52xcz8eI?=
 =?us-ascii?Q?0tPT8O1+977h/dQ0DN01Y5aoFJIcwTc62cxSo8EFTQE5Enzof6E8RjmwZhDZ?=
 =?us-ascii?Q?K00KTFP1PlkoLVMpXdo3EsVs8rnChTyxA5mT97JZTDfoFXlMsDO8AeXk+CdG?=
 =?us-ascii?Q?4rqV8TBIB9ZV4fHkkl3Q2Wf/XEe/4kg4HALxSmbclk3fJj0YVTmHgfU0PFNo?=
 =?us-ascii?Q?dPTi0HgpJZp/aaI+2E27mR1O81EzswDDFA5OQRiFpYl8ZfOLJxYNdmx2SwYw?=
 =?us-ascii?Q?aGfMslzOWKOAg+hnd2zNGdUgWNQsW2Al9GsbfpcfQPDFBIHQyzkmV7QflXLo?=
 =?us-ascii?Q?aIKgiBf04ByRvc93IH6fnNIJ7eSzsSpN+pX88LdltVIMUpcRYHoeowzcLDbG?=
 =?us-ascii?Q?hNUvqXQWXqEcOtQlbBumHMnH3CZHeRByEilgB0jcXX815iwOf23ufUl3TBjs?=
 =?us-ascii?Q?yLMsqlUtm6m8qbI0kVSdh82LlF4lnmYi5b6BMRObd2hgOBkFvzsSihgAZhu4?=
 =?us-ascii?Q?4Duvt7mXTbZ8CvgHcLF5f5S310FkK8suvhk9V0sFoU3uUzx0UI5rDI22YI7b?=
 =?us-ascii?Q?Gzmj4AbjjSJvDr9Ab+0zcFKruq67Edr9MSbPdUC3we8Q3vfYe1vDutOyWLP3?=
 =?us-ascii?Q?tWwBXqOSJSJtn2fNWQTts9Hvatwowiyr5iX60JY180VWvFaqd6MARGGrtdw1?=
 =?us-ascii?Q?XwzJ38iQWnRIZIDOT6Rv47JiKDnKN4+0sESA/DFjkqBefd+Kv4oWDlrO+0zA?=
 =?us-ascii?Q?neWF4XZ/R6HipJb0yLr6e4McJm/GnqrBCNVqQuFt4Nqvvg8XV0nsBI9nPVNt?=
 =?us-ascii?Q?CU8/ID4wTIB0A6iRgyFBuWDVJOxXk43MDUAyB4Do6X2BEp8opdlUlZe05Ibu?=
 =?us-ascii?Q?3ozpHEWuLliRp7MXBfW29cFvrUvdAGxi3a3eLNehQNLWCu2w63jKnzmzGSZN?=
 =?us-ascii?Q?b7mGQO5BcS+YX9MXIVfRuC8/BLkzL4IPLyoLx2IlR9Va7E8+TlJuZNWjjVTQ?=
 =?us-ascii?Q?CL1NUv0gZd36pnp12zV4n+MOMaG9HgfjYT3eQ3Quvo8IG2RCy2KKQ1onRRhF?=
 =?us-ascii?Q?Y8ZR2y/Fy5pUKP3+Rkph8c29+XtHqVqkWhiZrNz9h3PDQYTU02W3yrlewtZg?=
 =?us-ascii?Q?JOfsL/adaLIcIBT2wemZ+xoq3nFnq53dlnfd7HmtCFtxqf6U0+neienvdt7d?=
 =?us-ascii?Q?ZQpb959Jug=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c897fe5-3fb2-4f5a-c981-08ded5af86a4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:24:58.9585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKFpvO8H5I9OWmDk2CQCc5EZPR9CEyXwr3c41XHMV6P+BOFbuqKfpPrkHiTevRjOA/1Olyxp6hz8iCmwxffFsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8376

From: Tze Yee Ng <tze.yee.ng@altera.com>

This series adds hardware monitor support for Altera SoC FPGA devices.
Temperature and voltage sensors are accessed through the Stratix 10
service layer and Secure Device Manager (SDM).

In v1, sensor channels were described in device tree under an
altr,stratix10-hwmon child node of the service layer. Review feedback
noted that this is not a discrete hardware block with its own resources,
and that a dedicated hwmon DT binding was not appropriate.

v2 removes all hwmon-related device tree bindings and DTS changes.
Instead, stratix10-svc registers a socfpga-hwmon platform device when
CONFIG_SENSORS_ALTERA_SOCFPGA_HWMON is enabled, similar to stratix10-rsu.
The hwmon driver binds by platform device name only and selects sensor
channels from hardcoded tables based on the parent service layer
compatible string (intel,stratix10-svc or intel,agilex-svc).

Patch 1 adds async HWMON SMC support to stratix10-svc and registers the
socfpga-hwmon platform device.

Patch 2 adds the socfpga-hwmon driver, documentation, Kconfig, and
MAINTAINERS entry.

Changes in v2:
- Drop altr,stratix10-hwmon DT binding and intel,stratix10-svc hwmon
  child property
- Drop Stratix 10 SoCDK DTS hwmon node
- Register socfpga-hwmon from stratix10-svc (RSU-style)
- Replace DT channel parsing with hardcoded Stratix 10 and Agilex tables
- Rename driver/module to socfpga-hwmon 
  (CONFIG_SENSORS_ALTERA_SOCFPGA_HWMON)
- Add Agilex channel support
- Fix SDM value conversion (Q8.8 degrees Celsius and Q16 volts to hwmon
  millidegrees/millivolts)
- Improve sync-mode error handling via last_err

Previous version:
  https://lore.kernel.org/all/cover.1781861409.git.tze.yee.ng@altera.com/

Tze Yee Ng (2):
  firmware: stratix10-svc: add async HWMON read commands and register
    socfpga-hwmon device
  hwmon: add Altera SoC FPGA hardware monitoring driver

 Documentation/hwmon/index.rst                |   1 +
 Documentation/hwmon/socfpga-hwmon.rst        |  34 ++
 MAINTAINERS                                  |   8 +
 drivers/firmware/stratix10-svc.c             |  46 +-
 drivers/hwmon/Kconfig                        |  10 +
 drivers/hwmon/Makefile                       |   1 +
 drivers/hwmon/socfpga-hwmon.c                | 596 +++++++++++++++++++
 include/linux/firmware/intel/stratix10-smc.h |  38 ++
 8 files changed, 731 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/hwmon/socfpga-hwmon.rst
 create mode 100644 drivers/hwmon/socfpga-hwmon.c

-- 
2.43.7

