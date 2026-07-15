Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010071.outbound.protection.outlook.com [52.101.193.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDCD30100D;
	Wed, 15 Jul 2026 06:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096910; cv=fail; b=TEIe6Kqwr+Dj7pSfbUnkPv+S/z7+ubP2k21DoJE9bnwzDZP5kPLyR6z5he/bl9qmPj8gDBI3sG4eCepjMgea2gNCPdeefwYikJ9EiNxgsdLGk5r57WpIxD9qKHy0z5opHIbGjQm3U8TRgvBcrdpLVT3roFL/kD7alXeBUVtqdqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096910; c=relaxed/simple;
	bh=Wjoil7NonaxNpGRoE7dTg6XhuYDO/8OYei8MpgTJyx0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZYEkvJU5lkKSTz9QcKTUn1o6LkJCGvrpZSCH0RpnlO4TXGWeLEwKLUJSpQT9fNY7Go0+Q2jAvBhH/qNuF/B1XaiSdlYl9Yzx3LZmqMJxpMd+wd/356TJBAwmMUf3P4IYW0+dNsWhnpx+vN6X0fpIG5+92lRlp3D7IKy58rvKdKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Ajx4qbxN; arc=fail smtp.client-ip=52.101.193.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Ajx4qbxN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9Z0Gy+1EE5bYK2Q05LQVKGIyAmdM54X66xbRCCM/rJe5VUXVde6oUJp+3U2H9Z9arAAKnPNf0lgjEr/uglH4whONcGrfqTafR67g1IRdKIeRuLzZBdJZgCV/phor7LcZuz4I10y0RYnY6LWUNM9Z6jneKWxbAnBEOR9nh5uAM1juraDJWOHJM+fxd8OH4zQLiTnUWViFAumUH1wSrnhTlCVaY3KhA2431+CRVwKVLvPiSY1f9PF6qpEqEbJCgpuKREd3yee8iRIKiZTVE1VzC6j9GY8X2xXq6uaY6i2uyhCwxdemIT6C4vTAqeneuOPizoBR7oaoKJl7SFDrbDiWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSa/d/iz7vEEp2N0WxJHZQVAgyUXpPDlEgvxT7peWTs=;
 b=IxYJfxoueiDcZ+KWtOnHwTEGa2tNfoVXnMQ2d0mhob9VyE25XrsyeA1LtnUbDiHa5c8Ilr1fN/88oIi7tv6iEwU5WQKnmScBlRiB6AQMTRWTm2C7CW+7rWzbPo31YD87TDuKbDw8vrkXHIhtvOIzZ6v2wXgv+KLflbBzVxU8YItTpSOKF6OM6MB8DZowhpqZUH1Czf++bKsgEanOAzKdZwN5ZEQ4CXuqVQuhHWIL0I65OVR3xvpajMNiHphY5uITQwTlZa+g6fSy8EpB76ENhThBlkksidQF8Jap9Khem8Z/3yn2zwR7L61kAHQOBGW6mP2rHioxjA5alxhu34goZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSa/d/iz7vEEp2N0WxJHZQVAgyUXpPDlEgvxT7peWTs=;
 b=Ajx4qbxNLZoEG9mlnXmftyK5UR7xks56o1iBz3YZH7/0HUIvVpE51uEx+FsA6JbmUCw+8AsYx4b15fiOkP6HfdzSEIRYMzkX7rCcXjI4LlcyaHiUUEuILJglvXGJCvXV2PgVtOMx7LrjpKMT3q0CNiwpze3DCN4ipz5va43BE/pCoZ5dlq4ro9jYRes6htMkCBtAK5JsMzlpLlG0MEUzXd4DgxdDdjkKg9FgALNurJe1o59D/Gu9SEaOhcQchBc3yA71SSVAT+1MsmG7pJKVA2NyVrmk4BphvuS03hEtVOBjeQlTfttjG/MXy/OFX+tEFeO6vXsRefQU9uHYxWuAHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from CO1PR03MB5937.namprd03.prod.outlook.com (2603:10b6:303:6e::18)
 by SA5PR03MB989111.namprd03.prod.outlook.com (2603:10b6:806:4d6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 06:28:26 +0000
Received: from CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3]) by CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3%6]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 06:28:23 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v5 0/2] hwmon: add Altera SoC FPGA hardware monitoring support
Date: Tue, 14 Jul 2026 23:28:00 -0700
Message-ID: <cover.1784096224.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To CO1PR03MB5937.namprd03.prod.outlook.com
 (2603:10b6:303:6e::18)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB5937:EE_|SA5PR03MB989111:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b28b0b7-a195-425f-1875-08dee23a3ac7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|3023799007|6133799003|56012099006|18002099003|55112099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	9ylZZSa3SfL7dE3NdhqJnh4XFR7xihUJISrJqxmB1IghxeviG96MsooobQ35yJfiuICBzCGx790NBs2ZCSsBqPKp+XGvztMuGg6Rv3+nBs/ZVv5946ZJ3EibYPgSq06RbB/U4FHxzT1zR+XrfbtEO4QKYFyFiGEBuy4KuptCzWlEt9TxarsO2N+62rFYRvETIHpUKTvHQxLghiTbzFP95SZ2pdleyT2Ooz54kBe1aee+WFqvUcEQjecFoeJBpqIUGWQtBRy4esZXwy3wZd1q9/wZeabxj7jVAbMKimL9ov4zfOtD1bETroySmvelyPXjGVh0EiFDbIr7qNoX1gHPRV/JpWUTD65HSA10Okd8SJI9rPSoQhlc0koW0yUpvPAjW0QDjXG5V5FDELERjDtBuizM7zy2rxPfkiKVxyd6dbMxyLsiDfLo97ChLO4AXNWkDI+ByVoV54Tp6IQHrCG3m55hjuzd5pcckyoAGxCTZRhANuw1kZKNU7VYDtVWJ2QIU1U+42W2Zvxv8g8aaZTLUaCrw4qAI/7McqVIQ+cDueyHM31KaNjavXGVu5W8atB7/Tjk1PUbel3l4X5kBxIeZlcRNWzQ9RU/0Zp1bdw1JiSWdg58ZJmTratroZgfwnbNHeKpgvZBFpPOKFlfGOOXM/wazZF1oGtu6E4UGEzkDzY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5937.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(3023799007)(6133799003)(56012099006)(18002099003)(55112099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qDPxpUqGUwm6qEj5Gj7VAT5U4AVAv2FqAdEKf86T2Jsni74oQcgDZ288OPau?=
 =?us-ascii?Q?csQsW2lxSzwTEeqKWgQK8QRycga3FtaZnIAKuQc3bhlOVLzvzElUMsv26+kq?=
 =?us-ascii?Q?KeCIwmw1au3bLJ5fj/hjl7i6F28W8Ka9GsJNNxgz21ra1WkKXm5EzXYq+azb?=
 =?us-ascii?Q?L3FpgRpXhqxcfUmZ85UBT6/sKcdp83av0wVRWB2iItDV5oiNchTK8au9RjOE?=
 =?us-ascii?Q?U3usADqoS+dVm8qKykQbTaQ4siZqZgECPgty+qtY8VimbtJpRe7F6aCRk9sE?=
 =?us-ascii?Q?4NXfMXiP+x2PgwNQJ5Dq+e0jNpLV8S5RJ/YnyJMA2zD9G17NgHouVNMT0+kH?=
 =?us-ascii?Q?JBzUJe0ROjzW7sNSM13R9ix79RkcuOXCKoY+GZ9bEO0D0eOYq+FsvTxc4IO1?=
 =?us-ascii?Q?8GOk8BQBI6/NZ/3UfMKO/nDhp3/l2GbHFWqEAKOJq6iQLhh7T/ajjkW1GOaC?=
 =?us-ascii?Q?A0gcYINBAU8F56ldwZNE+odC/8URelV5mv3Yz8AWYqszq5tFXiD0OyAeQYDK?=
 =?us-ascii?Q?jhx8BGuau8ZWLbEzK7gkyKPtu74SUk1Fy7b+2xOgfTHAsAAktRJXPdVdPNbH?=
 =?us-ascii?Q?9UzrIumGOeNfgmLx7/hauxw7QoQEflgOyjmrt7uqqcxEN3rVlQ6wDIb+6bcl?=
 =?us-ascii?Q?haMkh0lwbW7WTibd7+HS5s82H2lfHZyv8bN5e87sA5x6+V29xdRdk2eLQmVB?=
 =?us-ascii?Q?HQE4x+bcC5h2xZBhPLnbkpiSY9+ggWM+zd/p2do1I9dHLAhOjAAvr55BSCxM?=
 =?us-ascii?Q?znicybqj0GO7KJHj1ehMo7XmvHp1j6n+onK6u6/bY4DRpIiM80orMvsNk4/I?=
 =?us-ascii?Q?Mg+ZGovnqJWXmyDoL3/J79ou96/lcwQIfZgvYpGYhVDH4a+GvOIJvYMCzUo4?=
 =?us-ascii?Q?GCMpNWq0XYZgf6xgdDbLaAs2y64t+2Ejg/BQjtmPlX2IGNTY34ewS+3aw9T/?=
 =?us-ascii?Q?CCvSxtjEyZugTvn9uNBM31IRgZKMRurE1m8s4gN9uHVKa9DuCTQYarnPIP1+?=
 =?us-ascii?Q?JBL9tIjKDoDj32aY4zgKdsqjPMGKDczMqRl3ow5fiYWHK/wq97rLHD0jd2Ii?=
 =?us-ascii?Q?UCKTc1eEAeBTjps0TPpLrXYYKUu+MQebqbpC51Rp7xN5ZtTGJVl8TuqwXpeJ?=
 =?us-ascii?Q?376f9gdzu4d5TT1Sv87ps6UFBmJKLrWkkbI06Xb330LY/XeuTOh4pW/pm2Rl?=
 =?us-ascii?Q?nwjoVyJWrJcyV3Ow/N6SUywyqT3LeNjP4n/EurFEqUM58vVgdnj1FPTpJ5WL?=
 =?us-ascii?Q?FBv6nnMLTcIYQDt6bp5fLBTJmgXhYccau8pDOG31tVAaC8XyNO49j3yGcTji?=
 =?us-ascii?Q?mIzKGpD2AEabEFNaTKccwElOhg7rXPXeaco5PmREgXoU3yZrJs5nm/GYmq/i?=
 =?us-ascii?Q?EG8Xv75X0yzVOjwYAeaqWArJ70peOzvG61xCfVaZn48YJbYEBamMK2o4ur1A?=
 =?us-ascii?Q?RMgVz93kDG1+LRM0i3cScLZY/n4bJpSg4cItQyWktzvSR1B9vz31aSmVtvoP?=
 =?us-ascii?Q?OeKajTEsN/cqseF/ulushErIU1OOTF1sf/YzhDn7Jp3vlLQQxivuCNJKONkm?=
 =?us-ascii?Q?nb9cTnY7eEmcXIumXZ04ia1uv0TcFbHert/7JCcStHYe/Y4Pjjmst+HcYq0S?=
 =?us-ascii?Q?mBHQzYk7ALoOUVjaqSCFV18WXmOu7mZ2S84QTg/1FtBueMeNWg8wbIOaqLZe?=
 =?us-ascii?Q?RfTirpE9Z6cVRvM+LrAfeZ01fxlv4w+vaJnEgy+r/RA5BdmtTGANvaoxV7/u?=
 =?us-ascii?Q?DrC9CVHNyw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b28b0b7-a195-425f-1875-08dee23a3ac7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5937.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 06:28:23.1309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJ+ETo/z2M9oM4iRBm3VJIyfaz6vBvF9yyUJIJjR2AOhh89hUdeyp65AndC7UR75jj4Rj/mFBX6PUTG3DSRKeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB989111

From: Tze Yee Ng <tze.yee.ng@altera.com>

This series adds hardware monitor support for Altera SoC FPGA devices.
Temperature and voltage sensors are accessed through the Stratix 10
service layer and Secure Device Manager (SDM).

Patch 1 adds async HWMON SMC support to stratix10-svc and registers the
socfpga-hwmon platform device.

Patch 2 adds the socfpga-hwmon driver, documentation, Kconfig, and
MAINTAINERS entry.

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
  https://lore.kernel.org/all/20260709090153.21675-1-tze.yee.ng@altera.com/


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

