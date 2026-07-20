Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011065.outbound.protection.outlook.com [40.93.194.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99CE392C4B;
	Mon, 20 Jul 2026 03:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517943; cv=fail; b=MZnhUQdVyx39kpmb9UbHq4xq/pvylZleoKQx5HTeXUxoCA7YPRKSzO4wf02sdM93Yiv2SuRKGEGfAHZWzlTuvdWsNVpg7JjJ4F9CloY/7cOFd23NliYu9wFrf42jlR4YVBraxVPfuQbxEcH8gPvv8mmyCg6lN4W34TfPLPBcGmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517943; c=relaxed/simple;
	bh=5qD5/bJ1dt+lpcIwPLXjC3UNHQwpyB9+NLxlbsy6Wso=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EVhpD5X5GhuSlVieZMwGtA97kI4jtlrffS+hzRwKthWFTvhOoZzeatlDIiv/Rm0yjeOBfL/fjDT0K6ij23X3bcQZvl+1iu6tkK9ZQVlgCFL8sutOkayOpD2aMvWYPjEOzRcc0wSKe8vGbRTbl7hDxXG9D8r8v4B6OLMjeeWqMb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=HXJSeaOq; arc=fail smtp.client-ip=40.93.194.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="HXJSeaOq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZvEoaWG7CwFLom5gkqUktdJ4iBHhVogmh8ytgXXhbcINFjPFxabOCv8YDHpU8/HzyD5WJc0PiKUQiIhtHa7kLAGdOuUqOb4WStOW/wJ+cx/aCB64G20iuv4LyXh5cCLAzG1iErGrX4NWGnszAMP7xfcUyOyoY/Md6EvpqX7ZqOEvckuxFNACMD6Y5H50ZQQLFrbTwWZ9S8W8K0TqM+N7N3K90+CUiCAaClWswJCPxmA/vaJQsCEOWLohFxtU+bPtdTb1L+tI4Pgir8zbbB6Lxr6hHAdBgZzlZNyfi+ddozDEHDOMazFA7nmWdPTncIsjCw0fmLqHXiE2bChkMiT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V81kBwBmOq+nMhPUKYJFIkteEWa/ifLwaQEgxMfv3RU=;
 b=KC9grL3wAw0vZ7TBbYDm7sp/em4Iot5Y7cobdaITyl3xN5XpYBwlBmJFvZLnro13VkugogIwJdd885LAiLqX42WlLFFPyYumsMx5E9L+SLd1Or/7CVFOAhQUPkQJslz/HhbnQmjcUgqMehxr7TdlUT9qyZsHuEG8Te15qT4TVu1406/Jk96J4XEyHqWCN+LJwINrpkw/U78Txl5X6DgbDAI2pqpsxTo/ztmRZ/ZPByCTOEQ5ixejJ8IH35N+wp3R0S+9nQC/Qp9+oUfVvS7t5IDiAa0R75yHAG97C/JdoqzHlyh7bkwZpQoJk4F4Uk/2DFgSOR/rbKqcpgvdPyg4Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V81kBwBmOq+nMhPUKYJFIkteEWa/ifLwaQEgxMfv3RU=;
 b=HXJSeaOqX+g88qqnJpL7azp+cJKKSb5DMthvs+N0B7o6P+H4pN1AUB6BuMkO+m99GzVO+Ufza6GmEfPa5gC9fRILBQ0iBSz1a3Yl+BTjaMXDv9nmwsOknQyWMf66yGZVFVR/C97pUD43V9VGiURuWHS/OeH//t1t0XuWotoH1BvLtrLG26FRETpp4KiGCXJRLvVvJlMcu6s5zBfaRtJpoWBuleFXjOIK7QQiLSi7YQbD5yCxDkd6ty5UDgCe2/EgMdDv3v0YWFwdgnEluUaWnaNjv20P3RX6OHnA9oaWUsVFERT3fmOOlDlod0IdbvYJZNbyWWdpHxzFYhI6yKmJHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by SA3PR03MB7256.namprd03.prod.outlook.com (2603:10b6:806:300::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 03:25:38 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 03:25:38 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v6 0/2] hwmon: add Altera SoC FPGA hardware monitoring support
Date: Sun, 19 Jul 2026 20:25:32 -0700
Message-ID: <cover.1784516953.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::15) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|SA3PR03MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: 50219241-2a26-4058-2072-08dee60e9176
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|10067099003|11063799006|56012099006|18002099003|55112099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	vNDLBh4aejlt5Sqe21Rzs3Ppi/dGMBK1CttVFZb7ydWN6ufpqFaPw7c4wMxTQ/VheD45W54ON0CWd1hpLR2EjUvLwGYmct3AyEMLgM7u+/yUKUbouowRziHwVQISEUsA6SaHdFnjf2/jyMJ9IQu6GTWxd4znQcrnn2iqBqe+Lt/AiM087ETQVvT+uPXl8sFOTs1BnFcflV08wMQ6lBhOjENphkqyY+oKtwF38gZnSA3gOD6RMeFNS3fMgiFmk6ONtcC66zVVnyfCppfRZatKgBDddXmzDWl6qmUBloj16zHTddjEvSd1/6jWdN9Elf9bRCo51V4R80OZa6qmJTXS0XU38MeOWJ1yVUkK7fgQJ5FjQLiLBi5QwJ2zovRsJNk+57O3w9s7GZCRPx6l4DztScqjliCm04T8/CwUPtfL0EAUTrlicLsnosBtDacSp1WOrgMiYU78yNr9SV+JMPTfyYL0QTWnGujXx/eDF58ebyExcM72HHNgCT2992d4s1s6y7uxVcNFu3yUEjs/uD/9aC9UF9AWIwVAw79qpcnKoDUozc8BjPdO+4efj0iFtYp/om5k3/e7qaAnPUECui9vlUcWCnpdsrBVJhd0AVXWU6USfM5jw+BZkHQeSoBEuHZiH9RNlVbcfBnLZWnzdQ/9aENlTupimXtpVauRI3Buvus=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(55112099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzVYUmx1cmJRVFpTbTlWYUVOVCtOalhGMngwb2M5U0wvZEszRTU0T3ZNd1Ux?=
 =?utf-8?B?eFBVTVJqd1F6MkN6S3hRZ3luQnEvY3daM1FHK1FaL0JjcXh6Ni9qSWJxNnly?=
 =?utf-8?B?a0hXQXU1VjladnVuSGp4NmFTQWRyMXpXVFd6OUlyemhJNk43bFh3NVhIYmY3?=
 =?utf-8?B?TC9Yc3ZhNG4yTnBPU25wY1laMjhjbmdJblU3c2VGdU9OZThkQkVnSnZPTmVH?=
 =?utf-8?B?elB6cDZqNUpkT3ZNbGZZcGFBRVp0Z1FuZUFvTjJNNGJjT1RzdnMyakJIc0xp?=
 =?utf-8?B?dU0yektNL2VqcDB4aFhLcURaQkM4YkQ3Qk9CR3BHQ0tnS2oxUUVnbVpuSGtJ?=
 =?utf-8?B?UHBob2hTZ1BxcUsrT21lTmRaZ05tTzUrcGdRb0hBRjBWVmVvRjdtcHJYbDdx?=
 =?utf-8?B?TlRXZmM1c2diWU1vY0dWcTJ2MklHYWFJVUlGdnB1cUp1Yytpd1pDaWdUOGhT?=
 =?utf-8?B?anYvMlg2K3JCMDFQUHI0dUhIZ21veWZHWkZiY012R0xmRjBjYW9jUldjOFNW?=
 =?utf-8?B?anUvSms3K2N2Z1lQZllnK0t1SmU3b3E2N0ZYejdNTHpQVHI5WGpjanpYQ3lJ?=
 =?utf-8?B?Vm5zc0JtWmd5eW5rNVI3NVArWWhjYUdiem9RdGZqQzZiK0FFSlMza25YdzFE?=
 =?utf-8?B?WHpod0RoOTIzZlNLYW5mbVJ5Ky8xbTYzdVhFQkdrVDBXK3Uvc1lZMVZwQ3FJ?=
 =?utf-8?B?dXFlY1p5ekpXSGJxN2lVZThkbUx1SjlKNUJXK3NlWE9YZTNaRWFkcDk1end0?=
 =?utf-8?B?ZGV0b2tBSnNjbVFJcXgrbThXRjJDQlNBWHM3eXdVTjBVbXBjMDcwMWsySTRG?=
 =?utf-8?B?SkM2eWN6UVA0MlBUend0WG1Jd0VtNi9MQ2taZ3ZwV21BUVExYzJ1c25RZmor?=
 =?utf-8?B?V0FLNXljTWNTRExjK3laUDdNU1lJT1NENmVJci9SMkJLZ2JBYWJ2TjVNaFBC?=
 =?utf-8?B?UHhManM2SHhNNmdQYXpWOXMwZm1pNXNMTy9OdEt6WTM5VUdsMzRrUXlQRFlO?=
 =?utf-8?B?bkJEWjM3MndWYU9CdVpwQUNxYmJldGc0Q2M0UXhzV3ZQZlBwWC96dndZTC9L?=
 =?utf-8?B?VEJDbVM3NlVJMGdBQ0NHRGx4S09wbHFNd0gvYS9ZQnpOd2U4OE1pektkMTJU?=
 =?utf-8?B?aVdhU0JKeWRTTzBXWG5yWmEyMEdUT0h2MU4xQThhYXVwcEhMYnhGOHZWWVk5?=
 =?utf-8?B?cU1PMDNyQ1NZTmlpeGYwVUhUQklXVFJSamhvc3dxRzFkUlRxd3Qyam1rclVB?=
 =?utf-8?B?VUJmcVRHRHkzaHFHcGZjcXZVcTNpWjU1eXY2dFk1UXhCZys1NGIvMnNJT2Iy?=
 =?utf-8?B?dThBOXZhWVNMYU1FQ25tTSt0QnZlbWJRVlMvRlFDbVE2RitkNTl6TUdUODE3?=
 =?utf-8?B?cVIrODQzdVVsVlRrTndaMmpNbUt4Rmk3REt0aXlOZjREYUErcmpTazJ5elJ5?=
 =?utf-8?B?cjcxemdTeEdiYmRlQ2g0Z1RPTmk5YzJJU2ZJaURaTzVSVnlVV0hpdGVYaE0w?=
 =?utf-8?B?YzQ4NlhDbFVwWk04bDdvY1p4cUJDajhHd0VUNVBzT2QySFVRcW9IdjE3bUpF?=
 =?utf-8?B?VmJWM0UreWZMRU1tdXZ0cXUzTjFQK2N2K3diWDFwMmFYK0dFdnQvVE1VK0kw?=
 =?utf-8?B?em9xKzcxMjRGUU9lNDVmKzNxV1grRys4MTVQa01XWXlSeitES1NFUEZzTFRa?=
 =?utf-8?B?TWF0b1hHN3ZzWU5MUXRndUtnWWd6NGxsQ2NvK3htVUxPdExVTjZMc1RBUEli?=
 =?utf-8?B?YlRPQldtNlVETGhHQjRJcUx4MEhFcmt2aFRGM0ErTTl5d3hmdHRMZmlEbWJr?=
 =?utf-8?B?T1FncitqRjNET1gyYXVETEtWU2FOVGpmUWpEcytUTWU0MUlkUTNrRHNhM3c2?=
 =?utf-8?B?a1RCWERrUVptbzd1MWx2b0hPS1ZNSmlQUDN0NTJ0R043OEZpNVphaThpUzJG?=
 =?utf-8?B?NmdoWkJhUmFCYW8xd0t4ZVlVSXJCdU96TTJrZmxQakd6NUR6MGxwRExhMXRR?=
 =?utf-8?B?VjNWR0NvaHZKcXlFK2poRU1NNjFtaVJKRHMwZzRRZnpZY1huUnJoWGZMZUtO?=
 =?utf-8?B?enRmdmEzNHlzYmN1SWZyampjemxncnNnWFg1Q2hFNmVvaXpuRVZxRzJEb2No?=
 =?utf-8?B?S0ZEZ0JSeUJVRm9kOWJrK3QrOFZMeU9yeXhXdmovQTNOZC9Dc0FTM1RpR3JH?=
 =?utf-8?B?bms5L1VvOHJQbG50dVlGZWkxbmJLSVFTenpoRU5BVGgxSjlSTnl5WmprUUFE?=
 =?utf-8?B?UFo5Zkg1a213NE1LQW5GZDdodERtVXplaEV1a2puaU1NeWphV21XN0M4ODZP?=
 =?utf-8?B?VERXNEZoZEZyeVhVOEgzay9FS0ZwTm83dE1xd3dGUEZwRVFpMFQrZz09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50219241-2a26-4058-2072-08dee60e9176
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 03:25:38.0102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMvnoTukSkaWooBFUq1Pw5fJxdWPvOXejeBTONvIdRVGAO8kLhjZ3B4+gKje2j96M+d3RXkdI27YjiurwcdjjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7256

From: Tze Yee Ng <tze.yee.ng@altera.com>

This series adds hardware monitor support for Altera SoC FPGA devices.
Temperature and voltage sensors are accessed through the Stratix 10
service layer and Secure Device Manager (SDM).

Patch 1 adds async HWMON SMC support to stratix10-svc and registers the
socfpga-hwmon platform device.

Patch 2 adds the socfpga-hwmon driver, documentation, Kconfig, and
MAINTAINERS entry.

Changes in v6:
- Rebase on torvalds/master (given “Linux 7.2-rc4”)
- No functional changes in Patch 1 and Patch 2

Changes in v5:
- Rebase on dinguyen/socfpga_svc_fixes_for_v7.2
- Address Sashiko review feedback on socfpga-hwmon (Patch 2):
  - Poll async responses until HWMON_TIMEOUT instead of a fixed
    3-iteration retry loop (~3 ms), fixing premature timeouts on
    silicon
  - Add MODULE_ALIAS("platform:socfpga-hwmon")
- No functional changes in Patch 1

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
  https://lore.kernel.org/all/cover.1784096224.git.tze.yee.ng@altera.com/

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
 drivers/hwmon/socfpga-hwmon.c                | 579 +++++++++++++++++++
 include/linux/firmware/intel/stratix10-smc.h |  38 ++
 8 files changed, 714 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/hwmon/socfpga-hwmon.rst
 create mode 100644 drivers/hwmon/socfpga-hwmon.c

-- 
2.43.7

