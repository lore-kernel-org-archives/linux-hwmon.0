Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010002.outbound.protection.outlook.com [52.101.193.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2030E38E5EF;
	Thu, 23 Jul 2026 06:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784786536; cv=fail; b=sY2muv/ty/68LWCr3kEqrwMKIaxiAh52BNybInMhPy6DxHJ3JC3g3l3ec7mAqThNS0S97VdE+zXzYzKN/AAhSFOH4TV9oaPQ+SQChXsnRePVnGeHVVv80diSdwSj5/byJQnEPQqhVZaBZPR9SbC/leDSgHGLVwaLAc3COcRHFeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784786536; c=relaxed/simple;
	bh=EPMtAWrBeMGNy6LhlmkEfR76f+6Gz1EndZOEyQEGkBM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YEDSsHfwQbhv+wD6Ii6j6RkyqnuOXZD7lFmu4l94cGsli0vB/ywYB+6lnpkGlN6PW5X0keJ5g21qLBTGuKt2YQhOXcKHs8T98muJIvf7HDaQYQvgeGSVho+QsdsXuDC+z5EZalrYdtO4OXUPtts1HYZDKV/22ey41wRonl8R3i0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=I3frmBIR; arc=fail smtp.client-ip=52.101.193.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="I3frmBIR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEg9d7Zhlz4hmB/XYY/iJQBluqcbmwy5q81BQi+aLOJq+nuZ4xMtxeKa96HJ7fu4oghfwlzx7yTzfxjJ6hSdVbmjf4gdiBALRFif5/1mkrRhl3Fk+uhv1dFfkBhM/PoQTYYmD/gzJKehc43OAIiVX6M2QHwKNgNPd/fZOZ4Ejql1BwLeZU21xRu7sKuaIeTk0i/FPMW/HSDRGLEk54JuSNcL3VvcgmswCl4DMd4/M5u1VccQ2sRx0QuYtYVaAFKz/SKV2l8bzZKc9UCPWihIKVzHWZL74WbE00Ehn41Kan3LXW5qb3FniDmpDzytWl4rj+VMgWfbOswCYF1keGCGtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsrxgbyDtzbQxfoTCfUEzMjJ2pAN9X5rbYViR3D7MMo=;
 b=eEovShErhsZ5IP+HOIe8DpmQXrtC2U1GuoDGsPVi4fhNXXBMLN3EFCY27m3bk9LwF2aH2s73hEV10us18RLHOg1WmmbiI42VxeS3r1JCh1RZ+ggSFHm7j3++9MnQgjUm87vPXRy0bBakctZHVuvtSpqgB6OGhvrZpkN038JCrAaFNfgP3ViEVOgkM0LeMloGQOLI155Pg7seBMdlOYi2EI/khTkQiE+xJl4Ez/yTqHQUy1kiGplKkyDhg+hM20UqSYiDW0iUYh0nDgerYoKfqgBRfj2xbKGiNT9vjPVM6kWF/ueWHIwuufGyV4+b7y1v5tSpKM2wgjPe70ye1mHwIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsrxgbyDtzbQxfoTCfUEzMjJ2pAN9X5rbYViR3D7MMo=;
 b=I3frmBIRK1dZ3HMSY08Gcin8+/2d9B1tbhu/+htJCwWmYBWzkDkUZriE4kEeGet0F2RZSwRXvUbRulE7xUAxA4mFcmxZ941GhSw9jCDnGIzidzx++nbf8lkzboDaiM/5q5zICvcVLzIsCGWKHlIVfjbz8sWmdSt/gkR2Imnb92paBeaFdFLbPa+S4bP0k2HDlNXtTTsAqqS2Y68fzg7TZBxspPsctXZtEp22bSgdg9ZH8oobHFfwvGW7qRGqTDnYYY/HHa5cU1GmGyJ8/25wC3sWSdj35sqi10yVMf19mtGFpjKkoIoQCkz4DmYjulx2PiuDjYq4nma11BKGdDjLZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by SA1PR03MB6452.namprd03.prod.outlook.com (2603:10b6:806:1c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 06:02:11 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:02:11 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v8 0/2] hwmon: add Altera SoC FPGA hardware monitoring support
Date: Wed, 22 Jul 2026 23:02:05 -0700
Message-ID: <cover.1784785709.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::18) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|SA1PR03MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a4f61ef-3ca0-47f5-267f-08dee87fef1a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|5023799004|11063799006|3023799007|10067099003|56012099006|55112099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	+E4+djOS91keI4IUuYRp5jYd6827CCCqTdgPjHHGNJ/KWoSv5WlxF5y9NAkUeZz4KdaSwVXmzeoctPAxlID17ykS2SmZ2K1ow3gTgYBe7xLL8wd6B+5yqtBQt7sxcW1lKj35blI7S9+Kv66jbWlIQETJqNi40Ow2a2oSRkDnFFUMqNVrIfMfXOCIfxlhA8pvQkjXztRr6AN2p3CQ2chG/eCHlLVH6nCyQ/n9nadlNy6y4ROtQ3jnIIduuhgwQTLYKaNKqCr5UyY06JMZ0XHC0Rl8jS/g/KEYORbBe1NPLv78+HF5N9DGuwTg9afxTl3pwws/SwYguELhBBK3VnqOyDKHy9yzXP3qdoGTyCCDAcrUBPfgsbZ3CmaDYxUuO8edadmA989IAz0uaOp/dnBbOKwoQDKMR9ay9we19w6tWlk/bL9TwXFejgWtRZRYL1+sSuqWcWU4cMjoRh8V9ccryALkJzZsBdHPQoBwVPYD1A6OR5BvefWpWXN+WSbafZPVRonSqXgOG+vrOzf45qFPejFEZMHhRq66an7Uo57dmEVYNoO1jBi6UWY+XLE/YWEQEUiH/JvluKocfkLznpl9reQSeAbxe9QaFuhcrreg8Ur+y+yCkutNI7OSfx/fxiZ+brJujKUWJNbUfQK3N43KdlMcOCOYFPihSAI0bU0CLo4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(5023799004)(11063799006)(3023799007)(10067099003)(56012099006)(55112099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHhZMUJIcmgxQUdYcUJlYUovQk9TNEJOQWxvWFc2L1pZcDQ2OWxyTThWUk1W?=
 =?utf-8?B?aW9YZmM0OGdqQkZENHJ4cDkvaU9FUlN4UWVqOU51QzdmcUNxQ3VWV1B0clNE?=
 =?utf-8?B?bzFBWUpaVk1KeDUwMkpYRTVudVp5K1JJNHEvUjZ1Nk5jeGRKSzlSaFBYY2Jt?=
 =?utf-8?B?eXJxVTA2UGlLMVZiSzZCOENNZG5qWEZlZjlvQkUwUUZyaXhFTzh3NVpkbmhY?=
 =?utf-8?B?R1V4Tk9LNE9kTEN3V1dZam5pQTB0YmpoWit1bk1lRHUwZVY0NHFyaytPeVF2?=
 =?utf-8?B?NmRzUzRUdmNaS0VBNjVqdWl0Z0NlYW53ejZCUFJuS1ZwOWwwYUpqalhSMlhj?=
 =?utf-8?B?TXVRMUtiS2xYMEpPdU91RzMrZGFyUFFZQjRxWkVxRHl1Q2kwdDdaRGJPYzZX?=
 =?utf-8?B?ZGhrUWNuUlZycGZtbzFZbnhiUkd6MjU3Uk1CTExWQ1oyMngxQXNkd0l4aFFr?=
 =?utf-8?B?K3BDc1owMVRQS2dFN0VOdVQrUDFBcWZxTnhMaXQwd25jdy9KYUJnM24vRGFl?=
 =?utf-8?B?a2VVd0hnTXhiSUszZ2JsbVNhak5URVdLNmlzRkFXbFFwUGNCZ05JY3ArU3NI?=
 =?utf-8?B?QjR0cGY1bTJBV1pkNUpaZjNwZGh2SUR4OWlKVGhDLzJhd3E3OG9nTkxhWm85?=
 =?utf-8?B?dngvZDg0dkhobmFyYXRNL2dlVUo2M2tYT2ZJL2hXMWl5MytsZENWSlFuOXp2?=
 =?utf-8?B?UlptR1lsa0ROMEYvYXdnN0QyYS9CVENuNWJtZXBOaEUwbk1PT0E4UTA1VURa?=
 =?utf-8?B?QmJSQWF6KzN0WUdKS0UvV2xEVVk1RmJOa3JMSllhNWpQYW5rUGtjOFk3MjBs?=
 =?utf-8?B?bWZOaHgvdWRhbGZPbkFPZEluVXpjQlFLNGxyU3lNNmJ5a3dnczczQzNxYTRW?=
 =?utf-8?B?SG9kNlNUNEQ2aWt4QjdDRDZhZWpnbXhmWGc5eEUrT2NTWmpIc29sTDQvQlFk?=
 =?utf-8?B?eHhTQjgxU2czcWo1VCs3MEhwZWNhRE5FK3pmTWd3ZjlsOXlMdlhsVHBBRWRC?=
 =?utf-8?B?Ti9OUmtqOGNiVDFtM3IvQ0lkRUVQcGZaQ0NsUjRTdVJ2YjNENTNhdDBPanRU?=
 =?utf-8?B?WHBrM1E5akZyYVh2Ny9OWFZYYmh5MWFYTXp0Z3hhZi9JT2hRRFJJbVZDOEdy?=
 =?utf-8?B?RTFicDRXK0JVKzdXcS9VZmFvelJ0c2VWYWVvZ1lYTkhvNVRGVTY0ZTdVRzdE?=
 =?utf-8?B?emdVdDZ6cnRTTjRiYndjbHdlR3BjK1ZMUHpPZDFWSEJ5Mk0wWk9oVlJhY0pn?=
 =?utf-8?B?UXhxenh4ZC8yLytOc25JUkZTNjBkdHo1VkYxbXdQVllYNUlsMkpyYi91WTZQ?=
 =?utf-8?B?enJKbXNmb2tCb3ZObVNETXRFRGVoNUdzNkRyeVpNT3cwYjJUV1c3WGl2cFZC?=
 =?utf-8?B?bE41K1d0bTdxTVpsR0dWMUk2cERpZWMwWlQwSzdyY0pyUzRwZFljSmJNV3Vt?=
 =?utf-8?B?alRFd1dyQzcwN0dQamh5SGkzdnR0OURWUWJ6TWNNL1BSOUJTOXIvbG5wY0VC?=
 =?utf-8?B?ZlNiWk9WNHpXenlETWROdTJxMjZQSCtBQzlsTFUzV2RoYlpKZnNJQnNTQTdF?=
 =?utf-8?B?ZUNIVG0wWFIxZUZZWm54TmJxVXZXVHlHVDlVTmdaUDJKNGJIQkM1a0pIUlF3?=
 =?utf-8?B?SjZJU3RxODM2Wk9aZnpQQi9uQmU1R0pwUWhxU2Z6Umc4YzNpcmZKSW5KM0VG?=
 =?utf-8?B?d1dWaThsaWxJL1Z2d0VpNm1KbmdEN3hoTjhEdFJUSXpsQmY3UHI1bytyY01P?=
 =?utf-8?B?THdaMktwWDIyNmhLeHd1UWJ0UXFZZ0xyNzhkZC9BbUU3R0NBdDVCWU54Q2tp?=
 =?utf-8?B?RDJsWHV2TXlISmhuN1FnZDVjUXpudTNxNXVKc3lKeVVCNC9TRzhaci9udExG?=
 =?utf-8?B?VXdURXdVSC90MExHeE41cGJ6VFhoOUd6NlVQUWZweXdTaHFWNnFESnJlT29h?=
 =?utf-8?B?R3kyRjlKQmlhQ3lvc0N3blMrcmdyektwaEVaL25lZ2tQdkJpNm5GZ2dYcTcr?=
 =?utf-8?B?ZkxyRm90UzVFWGhoNlJYbkJsTUtYN1ZWcjdHZzNxTUZSckxwcGNsRHZuNjd2?=
 =?utf-8?B?eFhJUHlVUHdRb1dpZXQrdVNIWFZNZEdxNVl1UnJDeENJM0k0Q3l0Z296OC9q?=
 =?utf-8?B?M3B5LzFEMWRpN01ONGRQWTA4MngyMVlJUUlEVFNIc2tBSGVDWDVpVEljbVZQ?=
 =?utf-8?B?eXVrenlKMTczQ0x2TVJNUVl6bFBzQlkza0l2cFM4VzlWdVNUSGxPdWowU2pU?=
 =?utf-8?B?eE9kTEorNnlRMnNyVDA0eGUrblZDVis4bkozUEVaVkduV24yWC9Md0h0Q3Jy?=
 =?utf-8?B?b1ZicER5aWgxdEIwUjBmSGsreS9MK1pYbVNLcmo2Z3AvWDFldTFkUT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4f61ef-3ca0-47f5-267f-08dee87fef1a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:02:11.2446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61Vf0vCJydZSWWWFZIYtHl5vq8W/sXNLqRXIW2ySe0MC6qY0g2QJesG/Xsug2FeyaRxOGCSgLmoy6/5+1UzUfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6452

From: Tze Yee Ng <tze.yee.ng@altera.com>

This series adds hardware monitor support for Altera SoC FPGA devices.
Temperature and voltage sensors are accessed through the Stratix 10
service layer and Secure Device Manager (SDM).

Patch 1 adds async HWMON SMC support to stratix10-svc and registers the
socfpga-hwmon platform device.

Patch 2 adds the socfpga-hwmon driver, documentation, Kconfig, and
MAINTAINERS entry.

Changes in v8:
- In Patch 2, address maintainer and Sashiko review feedback on 
  socfpga-hwmon driver:
  - Drop the extra wait_for_completion() after sync-mode timeout; on
    timeout report -ETIMEDOUT and call stratix10_svc_done().
    The previous wait could hang forever if receive_cb is never invoked
    (e.g. BUSY/REJECTED for HWMON). Any leftover svc_fifo race will be
    handled in a separate stratix10-svc series.
  - Place socfpga-hwmon alphabetically in Documentation/hwmon/index.rst
- No functional changes in Patch 1

Changes in v7:
- In Patch 2, address maintainer and Sashiko review feedback on 
  socfpga-hwmon:
  - Break out of the async poll loop on hard errors and return the real
    poll status instead of rewriting it to -ETIMEDOUT
  - Drop redundant async poll alert/debug messages (SVC already logs)
  - Replace msleep(1) with usleep_range() for short retries
  - On sync-mode timeout, wait for the outstanding SVC callback before
    calling stratix10_svc_done() so a leftover svc_fifo request cannot
    desynchronize later sensor reads; still report -ETIMEDOUT
- No functional changes in Patch 1

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
  https://lore.kernel.org/all/cover.1784599864.git.tze.yee.ng@altera.com/

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

