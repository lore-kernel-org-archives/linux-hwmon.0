Received: from FR5P281CU006.outbound.protection.outlook.com (mail-germanywestcentralazon11022111.outbound.protection.outlook.com [40.107.149.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4376613CF82;
	Thu, 10 Sep 2026 05:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.149.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789016696; cv=fail; b=X+CyY+kgsO/lQAseIL8lkVSjmFd6oB3SLRKMde9BbWBraG4aDF092dodvfRB0uiJfsfZZwHN1zsqkU99udHJb1cZcGKxBotzsns1q7xqdRAIZqrOREAtkSik0K4ODqRe/1LsYpsLoMn7JOYMAI+f+lTzHqr5+4lVwalULbTfqTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789016696; c=relaxed/simple;
	bh=9PTheY8nm5pqDQnZF60eWcGFt2c7L2deefSj8ibSu/s=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FNcUCIu9LsoV7HTdgV1hiIa3J/IDnjtH6L0QN6Ryj1+OJQBmUjORoyqZlT6ZR65V6yIzAyzuIZOHXohrRXQ/pR4KZcvS2G8vSEw63kNLqA1wLEQ4N/VQLh74T5i+y/ngEcKBWc/qNr++sLMt0wk9nj7bY3u9HidzeFOjZZj8DKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de; spf=pass smtp.mailfrom=arctic.de; dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b=NsAwOXnO; arc=fail smtp.client-ip=40.107.149.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arctic.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b="NsAwOXnO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWeOn6sf3lMF/b1jCJZiSBpHrM6NtROSbY61Nbg3pp9GadPWkN/izLtQcDtp51nc36BdzfS6xR6Zq/550ZwyroYsi19uSib2FkmsclOmX2/cTMw1XLHK4c482E9SMMS078MGTc9gMMVyz8Fa/fdA28BhO/gagbWeXHGreDqirDUY4U+YUFGT8yMyqnVTAXdmsoqc0lMyGguyQ3gHU7CfkCowRpwXLfpDl9z49xXNKXkCqoIxM1mT1Ng2Ck0bwiCgQ0KvsG5DTYHXxYbV38BzI6Rb/EtXZz+kMgjwM5q8LC6S4J+TIqxvuB0qNZJ/trB8u6BcLNm4Vgp98ywkEWxu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnjwErC3bH5lioFP52f7VCcUfimZO2XHduobTQ4T2q4=;
 b=ObKI2N56Av0Za1WYuG6AP5qm0kFiEghg8xkCzSdOgHI+FkkEwVLXZdBuXhcfQvD43kLlJUufpSEu+rTir6faOw60GTnXDrsGNAL/VWdVOJ2ezHZm8ZI+TejvfiQOf4AnXWO0xTvtQU0MSz9iHsaXJuNyxFMF2PGVq1Zh5tqezoDYUkqEdU1psNGmexKp+OrpV8hWzzPxWfdkUHB+rKjY5shcMNo651pKMcDLy2FzaM+g4VSdhJmVrqz/D0pAB7EDA7zV8BTk3ndKXn7UHVRSGI3xCFexEwy1xipiu9z0iFJI0FrUrHgRo4m6Q6xt57HEvc2qfn41sTw+Z8OdYAxotQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arctic.de; dmarc=pass action=none header.from=arctic.de;
 dkim=pass header.d=arctic.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Arctic.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnjwErC3bH5lioFP52f7VCcUfimZO2XHduobTQ4T2q4=;
 b=NsAwOXnOMXfXnv9w1igWdQCJnrRMiJh9gktH4y/HKG5VyYV6ZQ2jdK2eRk/DXCNHdmB5vqhxvEDzVl1PZ+cM99mcyj09f0ALQtCMm162HVzsMHJHNA8TX14LBR0aNewAMEA0eCUne53etUWOCYaeJlW0wyVor+sBVbrDIt6WkkTMZV1lTTAHO/vIzFMdrPlpFM2xMgnAt3IMsZ1r3pMRwO++69gi7+WAFE3h92cYjeiZOtoVgIcULrNfZr6pZQwDdwa7pzVnn6uTrGEXK80khLHZHenurBEFPXqmOgCPvBXWmv2cLuMmyogYnCk+J8RtuHhVTMjnN+OJ8nbpL6gcHA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arctic.de;
Received: from FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:51::8) by
 BE2P281MB4669.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:c2::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Thu, 10 Sep 2026 05:04:50 +0000
Received: from FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM
 ([fe80::bbc8:b2df:8c7f:739c]) by FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM
 ([fe80::bbc8:b2df:8c7f:739c%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 05:04:50 +0000
From: Aureo Serrano de Souza <aureo.serrano@arctic.de>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux@weissschuh.net,
	arctic.it.hk@arctic.de,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aureo Serrano de Souza <aureo.serrano@arctic.de>
Subject: [PATCH 0/3] hwmon: arctic_fan_controller: PWM default, dual license, maintainer contact
Date: Thu, 10 Sep 2026 13:03:58 +0800
Message-ID: <20260910050401.279868-1-aureo.serrano@arctic.de>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0054.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::6)
 To FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:51::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR0P281MB3401:EE_|BE2P281MB4669:EE_
X-MS-Office365-Filtering-Correlation-Id: 03b2193e-0820-49b1-83b9-08df0ef90a65
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|52116014|38350700014|10067099003|56012099006|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	e3/baS1BAZZ89koaAlaV0b62iPLUtKbJylcdBiNbVTSZRGRLuDm9RIvM7f3FHgW01kLFPpdcyXF43PXgYFCLoWcuVC8dKlyS51wV44U8lnkCAOGCi5U0CPzOUy8yw7UfLQQ2AAaB/b7Vi9bZ42jvq9z2p3uuSCJYySqaQ1Cnddydlk5+befzCbYB9ZbApNOUww097ekl2SjA+9no27rMueh2jod9R48apn2nkhTURyVkR8f++AVkdnLpqlEp5U/F3qp9mBNvCWwZR53Cg5dZyzWpjePBFbEWF7QBe2oMVw34WWACFZCatRr5zMsfS1E4pZu6CLT78nZF9IkHBp71LfNtYVvBwMU+pGw1dDq5WJIep6RKaDtaCQ/hPlgRNeFyjW/nW25JSjtFIERbZ1xjOslU4tEPCS/szLHsIJcTfPVKgTB9q/zfBCIDx9GIlTFVEyxmwZ+WuYrCI8UL7c8dbo/rslHuPmjBfToQCdYfYrA8RcJ3TDWhEOWbzWgSuVJwXhenHd1rG0yTzT81qdz9e8694ubRyZGjGv/mO4F/lq4oDO64eCp0Gim6xF1JFmuFy+LvS18cX3W88Da9aN+j5Qw9qoMMsLegEhX4gb5flUxf9XVy/aH+NX+9VK1ZWr/+AqQ6mOK6O0k27lFhkJmxIlnOI2Ou+YR/O2vQKQV5aeBO+68bA1NoBpe1/l47N+OFjEtZPzXahceAfia50rcICPTEQAoMmrG77m4srZeNm9c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(52116014)(38350700014)(10067099003)(56012099006)(55112099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8tJZtbZoDaQM6ziNeUwWJpmSh3j7g1sYUnXL9W20AGvc621M8sQM7g/ktvyu?=
 =?us-ascii?Q?ZHjSVmSzHSulVGQJRg3RszCo9i4y2Swx2nm5e0VNWrijssdE3m5KPaK++8bc?=
 =?us-ascii?Q?USM5zsr00/spoS+zMz1OuWC1dSaqLQeb8DGBp+vQWRx2pCsMq6tCx3T5a6ho?=
 =?us-ascii?Q?4kLLF16ZpNaQNY9gVZqN7Bem7+bUB3AWnQfYg6fNrQZ8padKx1JpcTu/Dn/8?=
 =?us-ascii?Q?M5kKjii5qfhRtdoOgHsr/KVxdNSaXuBtgHFD+eOfCruVXrnFl+NLxu6BBQvW?=
 =?us-ascii?Q?ex62inwrEW8UPQxIDJyEnzgedTt5pFwUJA9089WMVudTxzdMBGSs3fR2x85k?=
 =?us-ascii?Q?cj45mS8AKK5hHSZGf3MNoGovtoZtt0iS5YK3FnjOi5I6pcXc/fcru1nSmBeE?=
 =?us-ascii?Q?9EAolDDEkrkt+ZzM2GhTFcdcrrARkfDAtvSRqk4swXw3t4fIVhzsuNfh7HiO?=
 =?us-ascii?Q?/favhn/KPNKvHI7if2MBc4ErDJ+KxOvwmPTzjoke52Vgs8lYzY5T8EnMl9xV?=
 =?us-ascii?Q?yNji0BI0HF0irV30iDUos7Y+LaW/zJMSqxF3kvtPBF0NUon7/o5L66iDdzNn?=
 =?us-ascii?Q?aGMTmSJPE2NOtJCMEXK6OpHaJfoa+rNwio6anVYc2y51EBRsWsV5GgQ0eNfN?=
 =?us-ascii?Q?ARGkpZZi9OTETgCcXU8psn9Db5HSiQ4In5OtPuvWoJyob9Ddg8XwDcsPiX56?=
 =?us-ascii?Q?8i9vVt+gJvZNMDnkRnR9ACaCnGUUASEmgD0iB8zh0j1HjbG3fNfnxNVf4+rW?=
 =?us-ascii?Q?NrBIB8RRko1kqg7b38BAFN/+kczyhGuVbvZJ7d9Wese6zdMDeDz2gKDGOg5s?=
 =?us-ascii?Q?HoJyc5FSWEts/uI3T8I5yNA7iPRqY7qv4PwTHvFeHpKIYZICKl6wbC3g0486?=
 =?us-ascii?Q?BEouHr99aR2beTsJyEuA78U5G+jcFoi/ATRb4OMvKUdTmV0cTdAYqfAn/b9O?=
 =?us-ascii?Q?AbvnddgOVV+a1JmUPcT4m7TjKNdEOx9gwSbvL0VsH7I4/67xSWSBYh56gAxg?=
 =?us-ascii?Q?jK60C9H3WmRSDJcoiXj+q/p1+VyY+Zmb+QZ+k9eVAZoDyZbL6B91CDIIygQw?=
 =?us-ascii?Q?emg7yXbexwm+8JS68FU0AuOO/7uDvjIJt315Pft/auxmPmJzCvj8RMD5yCIo?=
 =?us-ascii?Q?DKiS7SGgr+q7rPhbCtxbPgugVQ5oTxzFYOzSxj50TxUf1wtrZN041F/svzBF?=
 =?us-ascii?Q?ndG8/7H02nqB1G/L9oNYLj4nTsqEER0od+0fli5xC1RK0v42oPfIyuRVfwe0?=
 =?us-ascii?Q?R25JQZK4z+STpuFczY2AOpmJjtxmG0vFzZTGpHlhdQDYiBsq6CX0jH4l8OsP?=
 =?us-ascii?Q?v8V9mzQM7JhlPDoHe4HmrnfWB2nNzU8zc11F7MR9UTBasykhnhd0Cjgt6P/J?=
 =?us-ascii?Q?czdRt+Cmy63Q3KhzIhLx2T0Cu2FDnHlAYHif/i9w2EQR1afDU8vnES3mvpVi?=
 =?us-ascii?Q?VXFwprBx638qONeHU/Idb63cLqZEPdlJMh0vwqMU1x6WOnIl5QpaWQqeSK5z?=
 =?us-ascii?Q?NE4qpzOFuLOe4t2ly0s8Ch7XSGyZ6IJDRe48Vx5C7Dwv7ZJp/gkS4KTvEd15?=
 =?us-ascii?Q?64WgGY8UgPg/W458sAhQCcvc8bKUxk24CzLxXHRQxg87khCX4XFHBpqwRk1s?=
 =?us-ascii?Q?aZDiEN8lgFPB0zS0BtwrIsry8kalbDw4/ZjXFleMnJ2S/xXfgme1SBf8nWib?=
 =?us-ascii?Q?Ms9moI3yVomqLsCqjcIODIZiO7pvrE/gFwcWcwyZPKiQnNgH/9AZtKpO0zo7?=
 =?us-ascii?Q?mcGl0Y/z2A=3D=3D?=
X-OriginatorOrg: Arctic.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b2193e-0820-49b1-83b9-08df0ef90a65
X-MS-Exchange-CrossTenant-AuthSource: FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 05:04:50.1189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 51cc2c5f-af21-4667-81ec-d88d36e264bb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dx8u9Ea7wJ4cdtcEGePhnJMrVgSnC+iGgsp/YHUL+9aHVIYxfXduMT+KSPJCWA/VJ46b+f92iENKKXDVRv3SDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE2P281MB4669

Follow-up to the ARCTIC Fan Controller driver merged for 7.2.

Patch 1 initializes the PWM cache to the MCU factory default of 40%
(sysfs 102) instead of 0, so a first single-channel write leaves the
other fans running at a safe speed. PWM is still not read from
periodic IN reports.

Patch 2 dual-licenses the driver and doc as GPL-2.0-or-later OR
BSD-2-Clause. Sole in-tree author; copyright ARCTIC.

Patch 3 points MAINTAINERS at arctic.it.hk@arctic.de.

This is a new series, not a v8 of the add-driver patches.


Aureo Serrano de Souza (3):
  hwmon: arctic_fan_controller: default PWM cache to MCU 40%
  hwmon: arctic_fan_controller: dual-license GPL-2.0-or-later OR
    BSD-2-Clause
  hwmon: arctic_fan_controller: use shared maintainer address

 Documentation/hwmon/arctic_fan_controller.rst | 28 +++++++++----------
 MAINTAINERS                                   |  2 +-
 drivers/hwmon/arctic_fan_controller.c         | 22 +++++++++------
 3 files changed, 27 insertions(+), 25 deletions(-)

-- 
2.43.0

