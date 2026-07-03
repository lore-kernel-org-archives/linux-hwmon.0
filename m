Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012047.outbound.protection.outlook.com [52.101.53.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF622FE0F;
	Fri,  3 Jul 2026 08:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066147; cv=fail; b=J24QjzndNbQGtu4m+Vbp3CEIwpvOHbTjSuNK/n1jnVzkPF2rFIcfPfRGokvmlcgtZYW4l9LvB7Fh4XbqKJ2kvPhpcXkkG557Zz7DzV+1msTXLN1pqvKkhbipdiRYFDO6Y4+ORCoM1Z0jrLtt/zlDDwQn34s56m6AYqAbbwL3+wM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066147; c=relaxed/simple;
	bh=6Wsx3AxyCiJAsOfrU+B3wYgpEPQQfwIK5eQNRbR/yUs=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dWinCGElwJ2r3irtDFGpevUK/9ZuTxnWrwk8rEYiq6D7q3XPpTossatMM44MA9ofScV5liVrlrAlfHper18OdIjQXlRi+BwrFWiKnfvJzI7WDpURZ3N0Yn3SKTCeZh+Hnygo8am1m7hSaaBkPEC5dsEndokJRx40bYRZIkwWNjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=STdk5KSX; arc=fail smtp.client-ip=52.101.53.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="STdk5KSX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+lpzbqktAk/H4rhKCjBHgqQY3JEOowcIBM7evqs7tzzdAYiTur23CtJbWG5G3ZkKKmGA0uV9kv9/rFB/+CuDKFMDpQYPUw+MatljRP7V6li+CRb5HcMGdD32zpf4+GEgSogfOdrRJX7fvEDyyEJ0DXHjUxy0WrOl9wt8Ccx9+2IGnZyOPjPn1KsTBDeUnYE7s9F2oSB3lAE4YPspESzQgwpp0BfpJ/Dx7OInayAhTCIDtE9XzgrBvicP2BWOcgwzD8KyFaZnO5uRYC+/ampTLIEu59GhxaAoa6v6wXbsArVx1G7SCYyeMV334bUtIt3R1uXNu7K9haGvBHva9Y9cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByQTfjDfRH3IU03i4iFSiEPLcw/+QmvKjc7MtAT3sAc=;
 b=k7WmCW+N2/AeWocXo06AyBVaMWa+RP069Kfljz3+bJS87208gnR2XqLbaTDVyY6azRoE8s1VV/i5RXYI0Zk2G9Beipo3A4bz6QeWqiL2pdNpOiCDnr1hv36Xkz38WAJdUfbdOnW6ylE3dVXa0V47yn7SA4EcfkoyJTerCvyM3eWLSlYNrrb46DRu8IJ5NwyMmMhWP08rki0HcZtqdWgikn9KWLTThEkHj/MiucU9EVPDFXr5CNzD9gcPxf3uVJe8Da88w8yz1vMImn4HB59G9+8FRxLigID1gblbPZqesBB46fgi4Mldp2fsNER7PsHgraMgcIXw/kklnBTsNjLHjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByQTfjDfRH3IU03i4iFSiEPLcw/+QmvKjc7MtAT3sAc=;
 b=STdk5KSXQLD7OKRAwo1OwsVOEwa25isXnZQlT37PYAdpt422tgfape3zb+bD2YLfzR3YfYFrEvI7lRbS/bUwhNRxOJeDXgegzxaHrfp/2E1CQSR8GF6RkY9MsmZJwHjxVDRBoQ+6rKMmY4fUetEpO8rWndu93lOpGyfT2keSdDB6XT7vFXLEHumxy0xRyGcMBusLr0AhFdNkR6UtlYU4OcwYudjwT1HajWY0q95wQ7AVwVucOQE9BGVByzXSMBZ6ch3lidq/B/wCKkoeo5tRHcZ59XkQGBqpc6cbpmaFzJ+k11f0dRe+U+0ooeGDxIkshUysqS/79Qhx42fsDtZFBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by LV3PR03MB7383.namprd03.prod.outlook.com (2603:10b6:408:1a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 08:09:02 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 08:08:56 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 0/2] hwmon: add Altera SoC FPGA hardware monitoring support
Date: Fri,  3 Jul 2026 01:08:51 -0700
Message-ID: <cover.1783062999.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::31) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|LV3PR03MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: d06c27be-55fe-46ab-e490-08ded8da5423
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|3023799007|56012099006|11063799006|18002099003|55112099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	EWqtNd7klh/gwlP5ZMqDCE+oF8wfb0DmqQTe+h0AflTb/8fntMwsJXdAk9MGZbcSDp6HQ1CAsb4Sa6y90rVWFnAxt8n93P7D7rAKTTS1iPWLgub8mlN4uhIGTzQ23yDyUTW0yPex1hveXpelTsJyZP0PVNqK7wXKQc5kso+Fwh7A4ufkCc5sy4nZ0XFqa32cjMkCmpsQboEYGughN1DSj+1iiWuJyaUH5F4YzV8wIK+V5YoEeZR3pY7O+9wNpn7gKd+HENbJv9v27NYyApmgJs8S+XwuqVosvoJzvWZznFONygsQp5YlOPSNSk5Q/BgKh3PKgsW0yuwec/GSK79i03DC3gVq3oTPejL6Kq3i/oGnnCRjUp/BtfPq/DeVYo/wpyJstu4jXFKuqj+JjkMiQEFBDZtax1J0+y4Zg7P98xb+QqUD0FWkWasFsNJ/7r5mLqnQOsVPIhVXsPLuGpdyVUJ/uN5II9BPUQe1HAWZjqo3WBUs5/bd6WH/C9x7bSgxuU1Vfp+2XZexVO9q6VgenF1FNVR5E8MD0vtUcPq2f397XW/AxF7MD7zmkf9qLib03DyblF8FDVzJ4oLu3ogHkPhfcEH34UkKiaSkZ2EAYxHCS5ve6YmLHH4dwxnTI4t6LflZ3Sy0i3tLdmqp6BL5htunqJ5uac+QcMcHjsBBQaM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(3023799007)(56012099006)(11063799006)(18002099003)(55112099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?03J/GFEi7bcepm5rRCFPovOEZXrWdDtLjwHP/vMTh2ZkkXe/78A7fj+m1QPm?=
 =?us-ascii?Q?YVxHsruIygYenItZAWRq2/iuZMVIasMRt/XOXdxY0KBL/RmcJwN2k9UCoivj?=
 =?us-ascii?Q?SSO2qLYkjbB3joWznnFzFbSTYoOqhN+GXRRYG8Ntkf9efq5wrO4pNhQMgOev?=
 =?us-ascii?Q?Za2ne3rvDvO2zLYbO8mtyaUJIJNw0pYh+9j+m5VP4PAiZDtB8wVSSMrYaORK?=
 =?us-ascii?Q?GRBWM/S+zeyxMLiACewtGpulo0Ba+/oN14CAj75WIvSXh/bYY89Q+BM4YJGx?=
 =?us-ascii?Q?KVicnoablC4VhH45Trl/8bFN/pfPizijo6/Yx2EMs/A71iUwLwic9wRqGgIm?=
 =?us-ascii?Q?EO47uXVnklXOLZTw7N5rE9SRFnINHzneyCN3vKLxNVJh0XUa/vGY3krlq7hN?=
 =?us-ascii?Q?zr0tAg6JxChJLnGSGsRMjtranSlJT0UBvFT17+EUyN/Ac3NM7G23yOdwUly9?=
 =?us-ascii?Q?VV57xq5aopGk9R90vT6I+CW3Vtbv8+97kWX9ISYdbLAR2gbyVj+bQ3jIsQG9?=
 =?us-ascii?Q?KXHmxGcTtjDQQmoru7RuxrUiMVSvldjRobo5a/S/Aqwqu7fEk7aSZyisWvUp?=
 =?us-ascii?Q?iEB6RzjBqRyZmJDhUnV9whLkt0U3Z7XVoXJTdNRJ4e3AOyZyUCCiYSfxY6bU?=
 =?us-ascii?Q?qNv47vGQWkiGwQMpe51DIVLSXNAc85JtphYzU5K/Eer3zaxs3Y4Zq1hfh/GC?=
 =?us-ascii?Q?PEIZdF7QdjLH1iACyCFGZksmPjQVslF+OlLkPMlPs5OhMsEBAc6mlbr8sgtC?=
 =?us-ascii?Q?LyYaOLfSbSebMkNKPQZ6fxVbPNQFEwp9oi2Pea/IXMC5f1L0ATF/mNBaBNiP?=
 =?us-ascii?Q?JfENqN/HgyHAJaz/OR/nAVxob9vviMA4Nm4ystLCxx9Rj/7iiC0ZcPacviOm?=
 =?us-ascii?Q?CjwgRimlQxw9sSlkgjUZisv+KI4kwjl+9v8M5CpeHFpWDTG3JXNVaMs2qGsT?=
 =?us-ascii?Q?mvP3PBOFLYGTorrfAil45K6DJLUCu0CHgSufH5lkU0sdfxIHoPHf87K/I6dx?=
 =?us-ascii?Q?Czzsx+mH0Y7tBS/tk2wXvwRmQnfm0eHMolrxqEdz6qcIi0fKqgByxpyr8yxy?=
 =?us-ascii?Q?MdmyGakot3WP5UQmnSlP8Y5Qr3ikgY3cYFPXC926HUzXbQbplbyvd2t9NcFG?=
 =?us-ascii?Q?lpEunhW630fwZDGorsttuTwmqgx5ploc4v5CCUeRyhgPmIEIN69MpLlcCItH?=
 =?us-ascii?Q?kxHOe4ZrQ1tH6BvfI+Qtj6onVWhsWu2smtfu7CTr9vntRiitgecmtfPY/Qsl?=
 =?us-ascii?Q?ZQiNDK4KpjSLP3uEDUwkjWSlWgHDR2kAZfHv5fhxcxSwnkJMiO3spjL2QhAC?=
 =?us-ascii?Q?dErSnxyCHXlmZB4SiOwXcfT0AXzgv274vZVYu5Mm8WVLpeEkzjNIoIhXHLAn?=
 =?us-ascii?Q?E0ntQ3wFInxulFMNMsfwdy3advSBrFEZhuAcF1y1Mf4P0M82cmb2IY9V/KuY?=
 =?us-ascii?Q?VFZa938yfngqkPqU5rDccYQMnfpLZJUqMpqlWSbYIpMbekO5CWbIuLwauohS?=
 =?us-ascii?Q?REhxsZKRDn7zJP4zAhPGqhyv8yufK6jF7gISqUQHvPq9GseSaE315Dbzmzdh?=
 =?us-ascii?Q?PXJ3xoEpf6BIWUXxVALyzCPZbSNPrNGZFdlX19i0fKH0ya1OsINl7nO72J1r?=
 =?us-ascii?Q?d0qn9oQRMG3rzM3Z2neW9SYMdsEPCRecC7H3Z2DJmGidaW2Lrz967jvF5k5i?=
 =?us-ascii?Q?GQkZVINOZ6UC7U37amome9+EE5vviQzz9mHiVsjkX/gCMEx1kDbK2/hxkCfw?=
 =?us-ascii?Q?sjDDNu9+cg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d06c27be-55fe-46ab-e490-08ded8da5423
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 08:08:56.1788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFT9h8m7kwG9rgH6dBZLue5bfUNTRGwkdtkiV1rnf2C3xtZfG3LCqKeROJntu5Bk5DVn8y0JdEZoiPt/wEmcWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7383

From: Tze Yee Ng <tze.yee.ng@altera.com>

This series adds hardware monitor support for Altera SoC FPGA devices.
Temperature and voltage sensors are accessed through the Stratix 10
service layer and Secure Device Manager (SDM).

Patch 1 adds async HWMON SMC support to stratix10-svc and registers the
socfpga-hwmon platform device.

Patch 2 adds the socfpga-hwmon driver, documentation, Kconfig, and
MAINTAINERS entry.

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
  https://lore.kernel.org/all/cover.1782715159.git.tze.yee.ng@altera.com/

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

