Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012047.outbound.protection.outlook.com [40.93.195.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A07F3F39EB;
	Thu,  9 Jul 2026 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587721; cv=fail; b=KPcZF+QlV9akGXs97n6BevjtPuEx25R6L0Ja9uJN5lHo01OVSp//RIsoaaOVDyKGVulN/7Ati8Da2i+lfey5Pr1HnPEbHvtqX4LOwLBrCDrKwEl0+2CtHixl+8Iw+M3j38E/Z9F7Xqv6kkVmNxCeXtLZQGrfygvZwbR+ZHWSCbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587721; c=relaxed/simple;
	bh=zDGDJy1tyRVHWSYKDBV+zvpwfgwYnjTXHoHne9gofXs=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Wqx05YPZK8VE6a/FTd69L1gyoQOk+hFf7FP0bsfMRYmG7UWkqtNBvziH0pn8kpzhsz5HsVzNGba35eVYb001Of8/UajfMsiHYgzCtpS3kYogJpRvKJfiYpzbP5aDECyOkA5QcK2LkF+vtTNnX6b1XT99r+qXma7BgOkkd+hQ93Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=ehKFEcsR; arc=fail smtp.client-ip=40.93.195.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="ehKFEcsR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJom2l5F+mXGbNGQVOq0Soq5AfPwDZ7v77olsaAWQMOqW+njFoMKvAsX128aoVS36zWUJ116zfyJtJGxmzXXrz0ngz7D+81uwZLkSL5+tvQQvbXHuecvlkbbA7rS1QUIb66PWepvcFbnDxdeBgKxPZRngN4eeLfMwZn2ftEM3fRqva7SxWqXA2CGXG7aqafx001HbxVXBPXauSznh77IehJdox5Z2/PiKnlH7XLyzNaWK81iFlEUNHjHd7IOeuruOrb1rsk9tqy95iZfyf1ZTzs1z7hQUa9O5sZFotR6ILWlAqe72qSommYqr/vCRyTBLALHF7p6BP3gRuEKuURq6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3pU1n1X1q8fWMFXiSLsCszqUm1WrLL61bwNg+jZeL4=;
 b=L2pjzR2QKB0Jkl6Q6kULfWPgK0mLgZHqtLeX97D+WtLBHjVRoHTkYrhn2kKrz5zzp/RAFyTvpFGDRMpJkfacBXdOjPQ+bEXaQmmF3FuoN7uSkm4FhFBaF4kLbzrLirtpyJnqs9AyhbkEkJeQ45GX4f4dBpbi/iFiyraihJgMZs4Aiki2cd+gw+eIIryJDLF37NY2Wtos0lyjI+/SA+L2xEvL1wF0xHkOwkd0TxkkTot4/8YAn/A/P6e8c7sM2ZoTyKKMh4fbZpMKSP0lFj7JkjW9dKyN6YzELqm6Xz81/+9FDOpKFkWefXdGTTUxi7u911rbVgH4NTzla16RbIi88Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3pU1n1X1q8fWMFXiSLsCszqUm1WrLL61bwNg+jZeL4=;
 b=ehKFEcsR6f7HCk+/b2c9e2FivKrC7KiVkjnMATA105oclp8UzAOGcpzfpoHnuwqO6yJJOpete7qsdVq40LXWKXITOhQRFpGUUAVwHc1zuIX7JpCdXzvaKNCUe96PaGyz3JvgtW/YASOmPhlHyLVgsMDoTVSVFH0xSfv2xlwIfOeD7Y/l5B1PfFTctA3DPRWSGHPdIuUEpY0uzZrmbDMS7eHz6El2lhIVdmDY25jE1voeFleL78n8uVMHZucH8ld65+egaXsXNT15+BMgqx44grQstlGnc5Twb0qZZlpArieHT7dk61NQJ0HbL7Sx5PjC9cu5Q6AyElHNr9y1xHh3pA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 09:01:56 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 09:01:56 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 0/2] hwmon: add Altera SoC FPGA hardware monitoring support
Date: Thu,  9 Jul 2026 02:01:51 -0700
Message-ID: <20260709090153.21675-1-tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0232.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::27) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|PH0PR03MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc7410a-e53b-4746-500e-08dedd98ba6f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|11063799006|6133799003|18002099003|3023799007|55112099003;
X-Microsoft-Antispam-Message-Info:
	c5cx+vmxc61t1zXBlcnJvndneUoOZ9MYWQC5ZScm4nAAfAPJqLrwQfSMoP9nE4uhm59JpXv+xgKuTmyVAi5yWHQ8ubDku208F2KfNuLGX6gPqR6atuZ9jrY1BXFuVh0wJk8upapAvq4rPWwawGtddR0JnMfAdpzX/+EvxWCmkNLJKz4Nd8A/v3C/nMK8xKfq8GY2DYWx5YVnShKQ+RMQMHtg5sP4VVCi7J3I2mDQ/VywCBDlK8tt5aIiJpnlJ9d4z5NtYR94OL79bdpGmCuVapaYo60j3nLaTwptdjcImyAEDxjpYoY6CeBX9qkqyhzZZHQbv9GbVSQThRWjybT2fMc6bRWV9ENSQbYRCutNLYhD5GhnBQaNkFhXucgr8aZetRCf7gjqz7Qgu5Q9HdAYfr2EBab5f2ZBW7yuSiE8fXecHo/5R7YgZvR45Wlgg9we1QQaNj7DX+IGxwpR/6PDI5+7R6vaKdiJ+M0sG8/U6ADqSliwUQ3+CN4wSe6rsCK9BQroXGrw1umjNIP/kYGgtPOxO0071UPpPTK4fvEGXMvZy1yWwaVn+4Gxebw5V0Bk61VfFxFIgN9k88Kd/2WkRtA0tw9SMWFwzG5yVIsSJxDOJOZiUoaSco+pvgI6UMishOpeU2gEZBJH7zUUAtpyZDWc3X7QeaULBjfiIlHVMlQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(11063799006)(6133799003)(18002099003)(3023799007)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9UBp9fhiXWSYaF8U8WoLVmQCLnNRRbIVj9gzJRvxknYv/Fw/HVa3T0Cv6EI2?=
 =?us-ascii?Q?dYY6seaLM8MiLMD+lfquP5XhQ5z/NQCYSLlr3G2+JFXPgiUMdT1g7kqnJCVN?=
 =?us-ascii?Q?oEiqDFrO3D115zX0AxhLom5KfTDB7kybW3SDo0IOBFWJFSX41HwkRd0Z/V0G?=
 =?us-ascii?Q?m7yJjKpcQGS7VFLAYgb40sh4/jherFxweZN3+fLlwAzh49W4dtoefi7qL4X4?=
 =?us-ascii?Q?T4Y21PZFESs4aqpPZN2cZ52JSTdWvVV0khbgYyFNSgHkW/ldemDmuSzku69n?=
 =?us-ascii?Q?AkNTKRQmEu0/29UvaDYUxfz05kTBzMJKUPm0Yi1Da3te6YTinsweiG/tC9nK?=
 =?us-ascii?Q?/l5iajJFa9ZKmwsT5WZpGZOg1rNf/BWzwPw+rHDe97ItEtGX7BWP7w1Ax6gf?=
 =?us-ascii?Q?nAckq4HZFqn2/PelbqNTKnrlw/ugcP10PZuT4SNskTU7FubabBdAN+RDzNv+?=
 =?us-ascii?Q?4zEu2PqCtTc7V6/wR4KWkhBfofdI6vUbxGzzfwTBhld3mIAGejuxPiw47i28?=
 =?us-ascii?Q?4ZdIDeiVb0lz92XVkG5luLIoM0u9x10WTYo+2vTrQoWdBQR7QHenCAvEcj3H?=
 =?us-ascii?Q?myKMGnnL8W2MOGM/sYy7P4pW3GLGw3gKuG9nLm+8OST+tzADMyxFPGM1wMtC?=
 =?us-ascii?Q?z7nJiXZWQ38LFLjNyBGtxpKsFa2T/u1WbAbNycg4zM0cTWBahWJhhCcJRl9l?=
 =?us-ascii?Q?oTf71WNuraKYX3CxLwIZmgPykBPsArKyxYEcUMKL5TvI7NBYpAGXFvEGhSCz?=
 =?us-ascii?Q?D/Wt1GcYOfKVxeIMqw6au3nTe+HkZeO7kvl61y3j3qGrJPITDly3fbQO8p3A?=
 =?us-ascii?Q?QObqkBaEFlgOWwoY1Tr9gep1Awai+bayE8nGysaCrMp4i3hhHLPDh9F2Kty/?=
 =?us-ascii?Q?9UDBCjqDNPVSMJLAPxTkXB2fO0nVE+SiBeybdgRhFMxyjdoauTX8Q0RvkCGB?=
 =?us-ascii?Q?/2KU7Sq0bXpjXdb6wrsUx/Aqlp11L5ydHbI1pJf0CJ4NMpjRJ0Ux3nmws0Yy?=
 =?us-ascii?Q?S6eSt+UUdLOfQk6uf6dgE/37uArNCO4AdRimmfkBMielIKwkOIrMyEo+adUN?=
 =?us-ascii?Q?gBhABNOsW7KPp8H6QfeJuKMjIUFojphDZ6y0W7ZrN4xpTvR1vTVCqK2nXpou?=
 =?us-ascii?Q?p4KHsxdNUUH4UU8aKeV2a92gougVCaXtsl+qIRNJj2iPVilinK0Wdx/Lpjg3?=
 =?us-ascii?Q?u0NZ81behUVY6Q+4o9w5tnf2aWNZR2MM7bveMeal5tFpx9AiTp9ZZQLvLsOG?=
 =?us-ascii?Q?1FXX+smHI4ae50jyH9zmqr0BLPEnBU37Wk3QNPJsLVbCkxSYi1V4Y4n12XcG?=
 =?us-ascii?Q?NR8/fDxWbAzgwrCxRgDPNFfWkdsJfZ4plQ0o0w6xtYU8OtFrqRv2Zol0+V3U?=
 =?us-ascii?Q?775MJbUk/yKy5MrncjF/yECFam3gPb8i2fGxbsEcfj476UpUG4b07L+0hlvb?=
 =?us-ascii?Q?ae3ZnfMOfT0HZsFpY3dA4B3t/zM7uKUhQ0OLo5trxTESkGuv265rbVtGd1PY?=
 =?us-ascii?Q?+94zgtifc1cKrB0nn/H4tAm43MxWDrNuMnHOAMq0wvLaTRQsEreKR33e04PB?=
 =?us-ascii?Q?ZqsKvya8sZxbrgo5PrYGgHZYZLWPGaGniHZ2Aknmj/OTMED0Z77l5tTH929P?=
 =?us-ascii?Q?Wf7DX5BYTNjC/ybC/hGV5x0gv5j3k+36dCrKKQUh2RzdtOJZoTtO+S5/QGUu?=
 =?us-ascii?Q?06ynAK65BHDsIM/bGs4KFGXZC4RM1+a73/EQHTe8HFcHc1hiTi6DYfl9R19i?=
 =?us-ascii?Q?5jJyNgP0/Q=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc7410a-e53b-4746-500e-08dedd98ba6f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 09:01:56.7159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3TX89SElSBx3Vjsv1jRjwiSGDkQWcyJ0mZ/eTZa/VJ1Zcc5rPFaw5jF2H/miAts6rSsanKQLgyA6rfKgbN2eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6351

From: Tze Yee Ng <tze.yee.ng@altera.com>

This series adds hardware monitor support for Altera SoC FPGA devices.
Temperature and voltage sensors are accessed through the Stratix 10
service layer and Secure Device Manager (SDM).

Patch 1 adds async HWMON SMC support to stratix10-svc and registers the
socfpga-hwmon platform device.

Patch 2 adds the socfpga-hwmon driver, documentation, Kconfig, and
MAINTAINERS entry.

Changes in v4:
- Address maintainer and review feedback on socfpga-hwmon (Patch 2):
  - Register devm_add_action_or_reset() before
    devm_hwmon_device_register_with_info() to fix devres teardown order
  - Remove unreferenced completion and pre-poll
    wait_for_completion_io_timeout() from async reads; poll directly
    with a retry loop after async_send()
- No functional changes in Patch 1

Changes in v3:
- Address review feedback on socfpga-hwmon (Patch 2):
  - Fix 16-bit Q8.8 temperature sign extension
  - Drop unused async callback; pass NULL to stratix10_svc_async_send()
  - Document and retain pre-poll wait (RSU pattern; firmware needs time
    before async_poll())
  - Align async poll retry behaviour with RSU
  - Use uninterruptible wait_for_completion_timeout() for sync reads
  - Handle -EINVAL and -EOPNOTSUPP when falling back to sync mode
  - Defer SVC channel cleanup via devm_add_action_or_reset()
- No functional changes in Patch 1

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
  https://lore.kernel.org/all/cover.1783062999.git.tze.yee.ng@altera.com/

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
 drivers/hwmon/socfpga-hwmon.c                | 577 +++++++++++++++++++
 include/linux/firmware/intel/stratix10-smc.h |  38 ++
 8 files changed, 712 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/hwmon/socfpga-hwmon.rst
 create mode 100644 drivers/hwmon/socfpga-hwmon.c

-- 
2.43.7

