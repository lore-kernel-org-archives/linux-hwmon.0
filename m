Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010053.outbound.protection.outlook.com [52.101.201.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CAE16A956;
	Tue, 21 Jul 2026 02:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600289; cv=fail; b=pcMbXFIqTLsGFdOgOIAJ2+Uq2xIsXinsJPDTjjUikGLVHabd01qJkm/XxbhIRMaGP/dylh9nvEo+1ezxLCv0JyKMJ8sWaTykbe9zx/bR79b1myrFOh6T1zwoL65Bm+qhZ12V6UC2qKbMQ2pFIBcPXh9HGESiYhcx3cs0WUOsxtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600289; c=relaxed/simple;
	bh=i7DfCdlr/s4u3oP2fjBuHfyYEX+WZnmIEoc07wkROmU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EYLs0n757xQgcUvoI6d+bRZTNPkXXLhCvNmoIIuSjuISSdkHwwalPWgvNr2zAwr9CLMk7/uvB5T7wDB7Ad+ly/njV94bEQX6hr55FmVUUssrRMTkWB8rlGSTAL1Z/I1tNcE/i8JzNlYPPH8xxC6ovIRi2OIuAX9oqQirP9fjXRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Wy34AGeF; arc=fail smtp.client-ip=52.101.201.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Wy34AGeF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hg6tvOoH4Flb7D99PKsNRddvhdxnRVkQ4jDN5vWksgQ56k2sEPOuzaPv09oTnVmDRt/blntQa5hDL7N2JUpHWj8Fhuewa1NuI2FdB41zxd/7SIGBLGHf3lA7l1q+HRmZ9IrSocNvYT2X7JdjTKU/S02+hQnCvUgTV40QyKgHi/SXjK/ZlAbPexyBJkx8uz6C/v7iTdzfx3+wFz1QjKiIomHfbxmLUAcb8KRD8HP3cLsa5nCewDaRUKKdvHTNFXzoD62k61bpu4MdVoC3LOr9aJxPjkhn+rOriYrH1rFuBTqIPZAfWjNS1UdnbucxPZKGSEar0QrxhzJE9oTfgWuAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FK1t6ZOctOwxGkKpdgaFFUry/cZPZXE9bewdgPRzsDw=;
 b=pxrS+mQUO64t2K4y/BYTZO8yNZ8lvTgDNTx1ytHq3L0nkdDbbiHhSF+zWNdkGrJL+MjwzWUNVl92Q5vJc8lfBSMiaVrNUplQMXZ6QKqXRG3C9F3z2PUzAYPD/q/zQj0x2QgpwMw5X3ZgGUiqPtq0f7oWnbIozU0PArZ1nI38Z8JgpwJID62LMSxc6/y/v1d2JHNv7ljQCf/hdHBDd/Kab/yMqEpkacPdUSk61UdSE8ybXZqq2zeDanieHZxEqIctEOVwZkCuD54vWc8nvVr9DxmGmQWa7E86lxk91/iyBSP1ZsEf36QaQmaeR2v5gJdWJ78d4aEpjDmhsQJAloeOUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FK1t6ZOctOwxGkKpdgaFFUry/cZPZXE9bewdgPRzsDw=;
 b=Wy34AGeFBv8EHfrWlVdXiX3HvtSbXZcguc3fYb+pngP9GtE7Djg7NzGnrrbsUBsoZ8SZhIo6QSj3HFVrU/PT79pTFRQfclSuOxd2QPJ3dlgPJoHNJtrtSAaokc/mNbTTNK84ZJh3T0qSlLzoyOaMeg7KZ/TBXLZn+3r96LxUfgfg9F3LNT1PMEe4kxNOZF0psdBBtV8P5/ZNfA+hEZxu1wdKYGuGPdMgDHyct2fi8jAiPHbJJRg6MZtVwzVPbl4SJrbZDImeu0g2kfU6XoMppdAc9ZxC3wrhu9v68BGFUcbCtkxn2/WfYODFSnX1D2hpXtPItW2FnumGwYyUevQ9Yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by PH8PR03MB989113.namprd03.prod.outlook.com (2603:10b6:510:3a9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 02:18:04 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 02:18:04 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v7 0/2] hwmon: add Altera SoC FPGA hardware monitoring support
Date: Mon, 20 Jul 2026 19:17:59 -0700
Message-ID: <cover.1784599864.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::8) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|PH8PR03MB989113:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a26068-1ae7-496b-87b0-08dee6ce4bbe
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|55112099003|3023799007|6133799003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	tItPDpk9WvGJurqrVp5fL4PV4hKTJd4dfFHKZW9sdD7lgP93g/ClokNPayycPsrrI7G4Stp/iVTLggcP+Utz7spYTokhoKQ60fbbxFyreiXsMFpa+MsDfkxw/Y7ZxnbhtnZjFIUDPOd8JpZQm2SvNFzs2ZKBrB0hdAggijMAzPgUnACeSIRNexoNfhSftJFNwL5HSnSjKvr/PBwPqO2UqnET4AobonhzPD/GKxviEzVh2eS+EZou7MK6g8vgFdBvGhK9UhlLTLutx0cSd0Il+9T4mljLCKXRTuqrhwEkSuvaKhvIPuBCoFTNhR5n00E1ox7lsQnBgJS9n+HDJWKb9lATYGS0jKkrTZP0FdZvq0bFSFCZJ98YsuYVHmhq0uaK5oaY1SkQJ3y0osvcZgxZOx2CEabBICaTf/KphjCNobPweBKX/HUZdClIF9e/ecz2m9yQVm6ZxYk2u4GeFGbPuvt//iz49yR0gCNWsg9i9ndAc8KIdP3jfN0cA9KYc5tOHw1jHNo3QtwB2lYIkCWzkGn3ElhRD2NjHASbDBrjxLV5LCasTVCP7rkQkproKwBgrpSq+IjiWbFwlgJLpm4fEicWkwLGIVhklUQQTJwhOoabyNVeXDdJv6wDGxiV7D2lNkElELUXnRxHb2U1No1DzsgYZawd4vQmOHD9X5zQRqs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(55112099003)(3023799007)(6133799003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3NMS0dSbUVUYllJa2hMZ0kxOExCQmpuem0zNlJKL1V1TjVrd3JIbXFQMUZk?=
 =?utf-8?B?ekFMVm81WUpNYzNOaU5NTFZMZ0prZnd4dHY1L1RPL21tajlIY216NnJjTTlp?=
 =?utf-8?B?SGloZVh6RzhlZEUybTBJTmFBaDdGMU9tZmNidGJZMlJvblQ5b21EbDIrMjU5?=
 =?utf-8?B?MHBvZzBqSmVGendMcDE4MXJuK1lEVEJXSEhDVTFDWFVVeERPNml4QmdZTkJH?=
 =?utf-8?B?K00ycDVrYnpFZFRxb2VTbHdieU8zUWVHWTRRT29nRUtLVjZtWitGR2FoNWNj?=
 =?utf-8?B?Z2cvWlFDdmZNeklWck1ILzZ4NjlUNHFSWThMNEcwVWxXbDZNODFTbWUzZktJ?=
 =?utf-8?B?Nzh6TUF2TjlvNlNUUU5lUzJ2MTE5b3NRZUJUeitYbDdhZW43WEJjbytwWVls?=
 =?utf-8?B?QXBibHM0ZXdwRkR5SzZxZDZCT3daWm1BeVUzZ2RFZTVsb3lzNW5rcGVydE55?=
 =?utf-8?B?cE1MZEFES1ZiQUtHU3FpVWRacHNWTWcwOEZ0TmxKWlZydlV6VmZiNjhRaFF0?=
 =?utf-8?B?cFloVjlUYlZrQnRRSWpKOTg4cUdqQjlScmh3emdGZjBjQU95SkRuQytBZU9h?=
 =?utf-8?B?bWVWYUxZRFZ6VW1NMUgza0I1QzNrWVJoSW9WQmtieUJHaVJpM1pQWE1zeEhJ?=
 =?utf-8?B?YXdWTU0yLy9PcUh3TGlIeGwwZ3hSOWNUK1pZU0FkNWMzT0pvbDFsZ1RMRWgx?=
 =?utf-8?B?Zi84K0FOVm8vdHk0R0ZYM0VDOC8ySkc0dldTaG9YaHg3c0xyRUI3Z2dxNFZh?=
 =?utf-8?B?WCtkQW8zRDhQVnErVnBGdFVJTngvRXc0KzA2ck44RWJhQldDWHJqa2NlUDNS?=
 =?utf-8?B?eTYzQVV0Rkd4U1RnSjM0UHNsWG4rVlQyMi9SSmtNVWVRbkloUXY5aldrQS9i?=
 =?utf-8?B?bkRZVllxeERIbWtRWUl0aWVCMnh6MXUvLzhHY04zNnlWTUtRY1c4WW9LdVlD?=
 =?utf-8?B?L3pxZ3lGek9vMWs0NVhKczcvU2s1TjBrK3N1VTZsWUVkbTlVR0FYQ3R1LzV2?=
 =?utf-8?B?UmMxOU0vUWVKY2V1M3pzVkdjY1pVY1VkYTBONE04S0ozdTZvVHk1bWI4WlNQ?=
 =?utf-8?B?TkttaHFxUUc0RzM4d1JnUGN0MWpiYVJKN2lWTTlqNW4razBmMlFGQmJhZFY3?=
 =?utf-8?B?RGhnZDRkc0RtTWh3bitxbVF1QXNiM0lZM3MvRjdTeEVOVFRWblhxaEpwV3Qw?=
 =?utf-8?B?SEdyaENuWkhmZ2xYNkZnakhSVzR0RFdrcU9lRkxDMGlENUc4b05WMTMrMnhv?=
 =?utf-8?B?MGlSUHIxOWwxTEZjc2N1WHc4am9PSHdtdVp5K00rV1ZBd3hwc215R3c2MkdF?=
 =?utf-8?B?UGFoRVhKVXVhOXVJS3ppY0pXaGVQdUZsTkpTR1pmYjJkb1IwUjh2UHJSRDFu?=
 =?utf-8?B?bGlHS0daWXZDTUtiU2ZFTTRNMytpN1FmRGVQRTZKZUF3TGpkbSsrc2R4Qk5I?=
 =?utf-8?B?ZmttN3ZVWXVMS25BbG95TzRsZFg1VTNSYlJEK1JhMWNIYlpqQnZYS3BkaU91?=
 =?utf-8?B?WHM3MS9RQ3h0cHl6ZDkxSlhMMWlkN0pJaG1URFRyeDlkNXh4allwaU5VQ25t?=
 =?utf-8?B?aFM2MU1TMUR6dGk5ZXhSSUFPRUNwclNhTERxS21wYjBkZ2crSllLL0NIc3N0?=
 =?utf-8?B?eVpMUVFVVnJadk4wbnlHeCtWSGZ6V2ZNM1pIRzAwTlgweC8ySjdzTnRaSWN0?=
 =?utf-8?B?TUVoTlBVRUhmay9FOWQzeUdseWF1RnpxeE1TWFRRZXovRVFQYmhWZXpJL21a?=
 =?utf-8?B?UmRzWkNoakR6d3k3eXM1MHpGTDh0NmN2QzRFeUMzK3o3MzNPaVRWT3dMZzJv?=
 =?utf-8?B?T1JOOVhvUFdXTlVzU05EVzRKZG1OZEtxSmtnZWxBeVpJemFieEZYb3FIUFBm?=
 =?utf-8?B?MXJpVzEwVFU4UVZpQkNSZk1Sc1p0a1g5a0x0QzQzemRxTjZ6UmRheURVNlI0?=
 =?utf-8?B?eWFEeGFKYnJ5dmdXaVVMM2xQR0FKSHlmVTc1RTJyY0ZxZGNNRXpjREpDVkgr?=
 =?utf-8?B?OU5GWktFdTFPdzRkQmVFNmE0eGF4c3djekxtZE03S2svcCtJRlkrcy82ZUo4?=
 =?utf-8?B?YUY2N3BkNVBtU3k0aDQvUGRndVQycWRFNDc1Zy9PejdBaWx1a0pLT2N4dlZV?=
 =?utf-8?B?ZWs3bnZoa0NaMmUyNy82ai9HaEJlbCtWcVNVSU5iWnZ3bXU4WjNwS3ZrbFFV?=
 =?utf-8?B?cCtUL3NyRnk1UjM1blZqbkk1RUVlSTVyc1dRTDVSMTlUaHF2a2l0S01zRThm?=
 =?utf-8?B?djhuT3pWQkVTQ3dMdnkydlJ0OXU0SUphc3ZaZktLM0ZsYzR2ek1DR0lMMFRK?=
 =?utf-8?B?V3VlSmNJSlo1K29GL0hna0dQZ09qaWdVbDEwRUNQQWF0YTI3YWlLUT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a26068-1ae7-496b-87b0-08dee6ce4bbe
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 02:18:04.5348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqCKP/e8HZTbv4aRIavX1UhLYF0NEDvmY9f8l/6Ft6VIRIkxWUGRSMEgEtLMSi1qn8AAsZg/+/v1O/cqeFIiOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB989113

From: Tze Yee Ng <tze.yee.ng@altera.com>

This series adds hardware monitor support for Altera SoC FPGA devices.
Temperature and voltage sensors are accessed through the Stratix 10
service layer and Secure Device Manager (SDM).

Patch 1 adds async HWMON SMC support to stratix10-svc and registers the
socfpga-hwmon platform device.

Patch 2 adds the socfpga-hwmon driver, documentation, Kconfig, and
MAINTAINERS entry.


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
  https://lore.kernel.org/all/cover.1784516953.git.tze.yee.ng@altera.com/

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
 drivers/hwmon/socfpga-hwmon.c                | 586 +++++++++++++++++++
 include/linux/firmware/intel/stratix10-smc.h |  38 ++
 8 files changed, 721 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/hwmon/socfpga-hwmon.rst
 create mode 100644 drivers/hwmon/socfpga-hwmon.c

-- 
2.43.7

