Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012009.outbound.protection.outlook.com [40.107.75.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EC8235045;
	Mon, 20 Jul 2026 06:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529482; cv=fail; b=MN3gXCKMnlHkAa186SswL4l9qjLuOMr/9lDakxfzrm0Wbo7rvBa3YbpswDA0GcJ/rL8h9x4+T1F40OWTpFchLHYWpR4SvJsMP8lGJ96aTOD63jWV049tvx6cBnZYbA8VUqYjk2E2rNVvPhSEztSFaQP35U1MPeZQJEqkODiaW0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529482; c=relaxed/simple;
	bh=JUq9NOU6llRzQ7Vw9+KBX5rZd05zTYYwcnfYUdoEsNk=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ou2PGiJtva3xTiY1llnOz3jNqBM9e6/XXhnV1Vh5wo9Y4HHW+HMYlOgF0ENoN7wJr/e+9Wf2jk6glxFK8YE4O4JiQv68ODc9NNuAKuERHST4P1UD9YnWbU8fmK2cxUonMqCNTYyLqRGBvOnIJuK1zFC/5YW8V1AUBFTwL0OG7Jk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=DN+xowyQ; arc=fail smtp.client-ip=40.107.75.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="DN+xowyQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJM8PBLOM6afokjWwKgtYRxkzohii+VrX0tBEpt7TdtjcG/UxdV/V8n3aeJuFfqS4x4SuOha76OOFfD3+rRAkn29X9VW1Y86aOOpjWJNx7QrvUJaVRFinh318AkxwB1YVFCPxwVyjhhaf3zNy2vPwoKqJ2yna4xoJ+I7+xj55/+b5R6wdBXawHwnl8BUQCGuYpur+YIXMwRiWUg0N9Fm20H/Efc6Ke4J1LVwEgfBtTO2dE6skHe+XgBh9mnp4jaddbPGzcKa9q58odTcugGJkQSBskSCt/u/Z0NmMp8tvuQedTBGVE3siX8JkQKBIlnM9vWAAXftDsarAJVMPvUJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vMpNo5JD18bTFWcrGka5R9G/KyfhmHzDeB/mgjYYJw=;
 b=ybrOygyxRn3mF3bvcYSgjyoGnG6/tRdurUpcrbk0PShv62/wfJ4p5B/hFAPYgQHD4NSQIUeSmsmYgiZ5UuqBJmdTdZPWenM2QuX+9ukGXeRR3cM07Gd8gdxFbCP/w6qhpPs5FztitMatTQQHql6RzxweydvzZHVljQ2x/9vhVaf7gD1InV+2u2aRsw3akVklluhuu4gl97JWcmlatYcszE7MZfyXReF8GKXEYThVSmCe188S16spK/bQfvJ1khVxA1XEnvYXIncwmmur1Y5aFyvQy/MjTgdoq5ZQVa4t/dCANWQZJQMmI9GVLfiKr5tPoi9/OjQCOSjvsIkcn/Bl+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vMpNo5JD18bTFWcrGka5R9G/KyfhmHzDeB/mgjYYJw=;
 b=DN+xowyQm7Ckn4qr134MBvkJ3FA8kF6rG1UjbC7U/2rVbXEarsO9C3l3Yf5Nm+yHx37XzXNWZJTP9V8E//drBFjXeTYgjgSHGwTwO4kxjcafaoP6FMrVE+CBqEnmp8735Gl2N7VIgWOgXSuOrV+4dt0mYANqjPHR6MQ5l0V63IRpsDnVFWK+107MrbXbbI5iYQZ7LqwlNFphspACfqfaS2awFDva95BCqvbFPUWtx9dsFQpdkg//JaH33t31xwsR5wPDoTtTt7VSXS5foZCxTvp8tgtHlkwhctOC6TmcHTd1EL/75hUWT20hQwaRk1XA/W7tcPK4G+sg4bgA8K0+mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SI3PR06MB8491.apcprd06.prod.outlook.com (2603:1096:4:2a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 06:37:56 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 06:37:55 +0000
From: Pan Chuang <panchuang@vivo.com>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Support Opensource <support.opensource@diasemi.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sanman Pradhan <psanman@juniper.net>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Pan Chuang <panchuang@vivo.com>,
	linux-hwmon@vger.kernel.org (open list:AXI-FAN-CONTROL HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list),
	openbmc@lists.ozlabs.org (moderated list:ARM/NUVOTON NPCM ARCHITECTURE)
Subject: [PATCH v2 0/7] hwmon: Remove redundant error messages on IRQ request failure
Date: Mon, 20 Jul 2026 14:37:34 +0800
Message-Id: <20260720063745.309331-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0107.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::7) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SI3PR06MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc7eee0-697c-49b0-8535-08dee6296e57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|7416014|18002099003|10067099003|56012099006|11063799006|921020|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info:
	tss/JlNmrDUfrwDsZg9aOolgExswv8WnvHFRNAh+AXzl+GjXteaRDhojeHW3bKlcwrZ9KYNvyqAqH0KDnFZ2I9gpPADmF32VtsDxwUE/u42eHj8oHhtCEOBGXDkqfCOe1rnK7P4cTnnWb59k94hCoRwRWdzJcxBXpRbOTiP5raWXWGGQjutM1odSkmWl7nqPvZkmrmodEh/pa6poHj9XV1ANu9oqNakGzI4UyWKwGNopO2wfhG2vOpa8jDy1cNnZGIYa82/7RkCjGu+/JBQslvdmCWlGGsX5KuyInC2H5ldDSEupS8vps9cVbCURjEjS3h2BecdV8zKPvTDcyyfKDX2YTh7ZdTbfuDto/tX3KnBGmQxt3tLqcVY3IpW2w2yFm6qxbKX//Z02fkAonNugZbyWpPgnYuTDRV65SXbvV7NOfMH65vvGul1Y8k5oVSK2UCdsgwddXMLGEUvnAFampQ+ZS2/jB3TTEX17o7HQiJRzeiqjnO/h5Qb5Z/2K+MSrhzs4Lc/vKt7/ku1YLbcONOIsz0C6LxPWJLKkbMGtOckLpRfX7CE1bZXZncryBrWXG7eDqGtTfW+U1WUBbUW/NWXnZyyeNxuxp1mJ67OK9OKO4gYdmwkiYe24C0y7rJDBdSHBqKaPc8Ex+2yrbMqAyxk998n/cqIwkHdfHdBtOP8Q2HLAIWR/vWEc+x96C1B8py165WaRfluNBKPuxPeRp46hLV9hHZ5HfqMNN2/pOddsOWnHjPP0FaNW3GkZuyo9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(7416014)(18002099003)(10067099003)(56012099006)(11063799006)(921020)(38350700014)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7nP3G7wCiWk8I3cqDBLEHI9xhrSM1oC/Vzzvvc4iW1+9QVVR9vOc6JU9fBiN?=
 =?us-ascii?Q?TNuM8GOtAUjphl9ctyuINxIuwMKGPRBEg2kb5imQ9lqdfjLuZaq60OCZh2VQ?=
 =?us-ascii?Q?T8UFXqJrqRcl7K62RxVcTNna0nhA2Zh2/cqZQOwW/ENjw4ShqELFajrxPGoH?=
 =?us-ascii?Q?W+E1zCr6wCceRMb59JHaR/sc+XOFjxCWSXVHMNpACEWqQvOzeTSaKNryv4Xu?=
 =?us-ascii?Q?EvNYap/3oBRDcgzvLbuF0NfAXD0gxsa2uAgH9bDo2MEXn7oAoQ/lDtF9RRv/?=
 =?us-ascii?Q?01+T7+N/JMcogV75UDoXR2gR7UfWDLUEhO47q+67Q+usjlg8fwML5XBLyD11?=
 =?us-ascii?Q?w/ExQrGDPKJT9Uf0Nf1xZ3938UFl5VJvxLqod2eXI4kTOLzAJEV7mXebujtR?=
 =?us-ascii?Q?vjel2lnGh44eR59hZfP+VAOkSme8ORBX37GG6qIXzmDEOYR3GlaXIu3hiOi8?=
 =?us-ascii?Q?6GuYsR1tl2iQkqjAUJwqQBvVDPl9wItPAZmnfJCqqk/guIFUGpxW9ZRHNRgz?=
 =?us-ascii?Q?Wal+zx2hOC1z/6p5FXd5Jv0HTCrjs3NFnYBzPtrQHy2mOBiyuV3FAXe5gPAJ?=
 =?us-ascii?Q?JXCJcpWL0He+LrLh3Qu7RPXzTwRaxO53DI59vNwu6Z473fVjj7Dt+aQfa33f?=
 =?us-ascii?Q?0nnxykIkLKPCWUKSbRNqHqhFvuOPMkDjp0gAZf6MgKO4y2vEfg9xRXa1i0ki?=
 =?us-ascii?Q?dGOukxpzFZz5dibFPQ9EHtpk+1ar58t8601MetNbG/NUMA+2Y8nFsNTdv/VG?=
 =?us-ascii?Q?V0fEFLLDZzIkm5xZD6qiWHFJOM5Ep4YlmGxtnDSf0pxzJ9/itA6Br/yUuH2f?=
 =?us-ascii?Q?cAfndhUjeZwpSV9/j218nHHgUcRJ2rjN5Q1sMEarUZhB3497Cde2ZybsJuW/?=
 =?us-ascii?Q?kUXztqdXLs7mQEgRtzbTtmfxYZUgnu2hrRLr6C6QqLEe6qsRAKhs2P3JxSat?=
 =?us-ascii?Q?bbCuiUmBRzbsZr/L0XJ5NHnXI0MlFMgB58qgZf/a1sRVgyloTdsHYxR3Ri3J?=
 =?us-ascii?Q?C6KJjWsaLIb6kMlGQVnfzLi7GuSTTbHyKXs8tN0SoW4r+RUcarOo4eUf85Ty?=
 =?us-ascii?Q?eZbgGqAmsEz7QGmPQJgApwzqgm1mzuz3sx5wd7Sd7jk8UucpiOzUx0MFvw0W?=
 =?us-ascii?Q?DfdovCGV3IEDBZhe3Iw7vcCCfyjdREySNOgOdRNPJCeLbSozQqCyYK1rxJHb?=
 =?us-ascii?Q?V8k83uv4hVMBh9f9xc5I5e/n43ViPaDuSxpoHJblCQtH6SkJesT1/j48Qu+p?=
 =?us-ascii?Q?hUyB0kI5ho9C656IbXx9nKF+M78C4gCbeRoxeXwg1PE53vpoaL7fRVmSlguB?=
 =?us-ascii?Q?5OYwvzLHbiQRCRmH66OIyNG7/ZgIxCsyvdqkqvNfNXmnCNpFbk11CvzP5yIC?=
 =?us-ascii?Q?gNlUgo+1lqT8Bml7YZloDvj0SarKEiSUnB5zqrUb9qVgS4jTjnr15GUUTBRp?=
 =?us-ascii?Q?q7XQM/DAQWX+M9CY7vzAyy+xz+0QvvyqoGiLipqU1iHtVDTwyN8zHJHDx13E?=
 =?us-ascii?Q?tR5mfxk1tJPXhx0m2GsM9GREts2jItpGymqcYhK3+O9VY04Rdy9TQZEvAAUI?=
 =?us-ascii?Q?BF4Z6z2AW4WcXARfSDwfgubjLYeN1j9eul7lGytbOxnEFTJXh3zsels9x6XN?=
 =?us-ascii?Q?boeHcgJWUYAwQSUs2KiagQ/xPsIsSlwcLFltNP7OcmeFws9ydHaqDyP8qcXh?=
 =?us-ascii?Q?PcR3GY6EtXIvC3bQHEHvJKIzfpuh72CkGvvASfOg6Kfg2V6hXdlftTV/uGF0?=
 =?us-ascii?Q?JpUtyawzJg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc7eee0-697c-49b0-8535-08dee6296e57
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 06:37:55.6098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZjRq/0wD73GHvRrrKPDiKoYChnuRnc8q6YJTXxZYaXdac1HKyKzZYo+BcbfgR5A5OGfeZ1/b1OUCsKaksaTtZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR06MB8491

Commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()") added automatic error logging to
devm_request_threaded_irq() and devm_request_any_context_irq()
via the new devm_request_result() helper, which prints device
name, IRQ number, handler functions, and error code on failure.

Since devm_request_irq() is a static inline wrapper around
devm_request_threaded_irq(), it also benefits from this
automatic logging.

Remove the now-redundant dev_err() and dev_err_probe() calls
in hwmon drivers that follow these devm_request_*_irq()
functions, as the core now provides more detailed diagnostic
information on failure.

Pan Chuang (7):
  hwmon: (axi-fan-control) Remove redundant dev_err_probe()
  hwmon: (da9055) Remove redundant dev_err()
  hwmon: (lm90) Remove redundant dev_err()
  hwmon: (npcm750-pwm-fan) Remove redundant dev_err()
  hwmon: (pwm-fan) Remove redundant dev_err()
  hwmon: (sht15) Remove redundant dev_err()
  hwmon: (pmbus) Remove redundant dev_err()

 drivers/hwmon/axi-fan-control.c  | 3 +--
 drivers/hwmon/da9055-hwmon.c     | 5 +----
 drivers/hwmon/lm90.c             | 4 +---
 drivers/hwmon/npcm750-pwm-fan.c  | 4 +---
 drivers/hwmon/pmbus/pmbus_core.c | 4 +---
 drivers/hwmon/pwm-fan.c          | 6 +-----
 drivers/hwmon/sht15.c            | 4 +---
 7 files changed, 7 insertions(+), 23 deletions(-)

-- 
2.34.1

