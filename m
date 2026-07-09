Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012047.outbound.protection.outlook.com [40.93.195.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCAF3EDACC;
	Thu,  9 Jul 2026 09:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587722; cv=fail; b=H3w0AxYCpDdBzct/YPCHRllrN8XG20y/N+og2yaqpvGNCrYwD0D4LxoOKgDUF89pY4OLlZJSsIN0Ai16s71tlIzJhBpHAYutrhsqJfLx/0AzUj10JnuUW6vdaxEfhhlKMZPo/hzWxUfUNUkClWhqlu4aYr721cNzkJ1o+EPV4jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587722; c=relaxed/simple;
	bh=dvUqRF/R2O9jjeupqzd+uCJPlOLvQJvD3zogXaSwj0k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cdtghp3/un1hr6728xSa92JMFR1iny8/gz/+tPu1iuB2OS5iMNME7VMVNiyRjb8g9tW0lVriVuJI9QPQHCi2b05XnZupYfhA00ePHk11YNHk7tR2j5Jg6FJrIoC6g5u9x5xIUX4ICmWtYfV3Cs5fpfS5TbR9nfDPHLpi5WM96kI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=BkvIOj0L; arc=fail smtp.client-ip=40.93.195.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="BkvIOj0L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGOROgLRYNt32TqGuWlv2cPBdfZuf+u4n81KPXdHHiVqYy1bdhsO/wlQ4GUYVWNuk+LJGH3ktoH7zrGmCG+BcPjN4lcGkP+nKaAqpvfglq3IYV/D9QsoZrHdUR5s/uFAWZ9wvJvPJbE+sfvnY0vL24AfbEonplHEW9cInMd/ti7gWPojaPfdqPg0nfZ3J8lGjD+PBDuyb2W/88gaUSfbPRedNdgH1aILhCM/L/0+ZKheqRdVIhFt7KyuJh+nRdXaXIO6nHwl1Xs7et91p8ZngiGZrXrsTxMhL/FLu9udC9oIFKaYwCkAO6TBnKmVUZFH8xouN8i4eQciTJ+6BuzO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWkZxl6+23bkxvv4Gu7JnWt08MSm1A7CCByheAe7tM8=;
 b=iZsBTAuCufxF4V9zZyMa06nQXYBlKrGStN8UL8o7dpdEh6eofe9RgCoBZmwuma0JooHQVL2bHI/Q+cxuJS6humwJh6PKv7Ha6oqzQe+tKj5kUegL0zolvRmDKBZYb90ZMZuphaGnWJTKgSFD4MB3MSiW6W1eZL54Svl2xvxDpf0qq4xRI79Plf3vGuyTAF8TxAC+bV5PImkMWoxnr/XhTAui53ltjjpYr9gjGxEl2pPL9ygpOM/aLe/K9mRMjEWwq/JpDiULOw3OC4qS45cIxVsPSPL2m0BzzCCJB0ILxDBcIrqYGPEEVw+r61zPn4zE56gERHyfA8z99HOEA01/Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWkZxl6+23bkxvv4Gu7JnWt08MSm1A7CCByheAe7tM8=;
 b=BkvIOj0LAdFwk4GAwwE3kbIaUqVrFrZ0vPsxhXyTtYCJNtLYFG+5bSqJplatTIjcsT36U3McuFZlccUzM95+NpDP7kWZh0wSul2KyavLWWXB5R6Thbcjj5k/ixF4TxWh9DHjK22daAjQtMr+qQNr5CAwIGHY1LDMIqOqzuJlr63kzqc+V1K/XD3/YqwZ2IW79Ajf25P/r4/5C4yeSt8/L6uxuyS/7IkSP0ZSWnYOHou6OS+Inw3NvcAu452LH7yymIdgR87ZsUHp0E1iMIOuz4asQ9tEgYMivEV5LVWoXxrnvBPNU9uMFOYf+aFZIxAGZUw5K/WmD9HYEssoiUi9kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 09:01:57 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 09:01:57 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 1/2] firmware: stratix10-svc: add async HWMON read commands and register socfpga-hwmon device
Date: Thu,  9 Jul 2026 02:01:52 -0700
Message-ID: <20260709090153.21675-2-tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260709090153.21675-1-tze.yee.ng@altera.com>
References: <20260709090153.21675-1-tze.yee.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8f23e0f7-3a3f-4199-8ee5-08dedd98baa9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|11063799006|6133799003|22082099003|18002099003|3023799007|55112099003;
X-Microsoft-Antispam-Message-Info:
	/oxmb/Uqt2omHEhULeybDK/rOWmkD7Q/YaS8ZxaJ/mgRKPOk0KNdjNQr7PDAYjxByx8s8Yo33LC+yEcpUBwW9dtbJ63S8b0VZFnLNBWCJ4ddHkVUhINl12S01vcghNmY15vrDoqkEcsj1R+9CX/0qKFo+iq7lGbc3VEIlaEqrwSOeBH+G4mKPjvgMqE0VODbsDK7iPOjXFPNudhv3JJLPnRD09qLunCyiCUyMU9o5dO7V8HIl//9O4fH08cvOoXaw6DYsQOhSSLac+VmQ0/Q1rvaMMBO9ApvqHU6s5YqoL3t3VvpA4h5urhsP4JrhnqMwtGmUCGgfu27DZg4vt0Sl8zoPTr0ICfSJcvgkA3VjnDzpldq87yAIHgbDgy6OFYg0MH9kaID4aMMDtdZKrFCJLcQTpIvVK12Hp2REsS7MXczRjRKX6EofIv5KaN9CftoEiUZ0JsBxDl6ySrE0mfkO1cRqfH7ILB6/3KefsKGm3AZwbKQEYNHK/fAx6mfEwzXicorN0Dn4KRmZ+WhaMFFjIV/PG4UkMM4bzMRuooBxFqfQvs4qSaIzSuFBneZ8oqFl4aY46Tqece+ATgTRb06NMG9qD/T+Hdmn1/OUE/8HzYOO2ZZKGZ4nzVlox0iSNxH9t4KqnuVs4Y4F8RW1GO+j177b15R+vBciUEOYoQRt8g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(3023799007)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8hQVJREyxUITY/FXD+WrUElh5/E21MgEGpO56+ghuHteG9+0X3XiWqmSXjcl?=
 =?us-ascii?Q?8UTrPSnmvnGkwvvRLrV84SSn8pfC4eWFQadgTHEie59DwEY9bLVBt5GWgVkn?=
 =?us-ascii?Q?TzMqgLI+8DT9qMPbXcqJhw0m1ycR0mRiZHKuhnluPAzLebdxxfCeoARx8wQy?=
 =?us-ascii?Q?n+iWqgDcYIAY34abp9X0wg0YFmlE7bfHgt5JYJ3jmLaFS93q52unHeQ0kJ6q?=
 =?us-ascii?Q?WAF25AS0a3SbjapjCd4BYvhhRtPSoHcxOh7n0jadpGWfineWJRD0h9STyHNk?=
 =?us-ascii?Q?+95tPk1JghG1PyezsN1GqMycIPPDgCWgXs4PwE5+1srhaYlnmmc/YZn5d3q3?=
 =?us-ascii?Q?+cbMksD6ql7t/tl1hvig3g00vDYoXbg49TFzw7Z/t711wCiEwh1cdd+gCTbF?=
 =?us-ascii?Q?nnNbEoRUfxMRb/CXp4EEjdqkMdTAbqu8AS/E3gICC9X/gSehYnr73i01/BBC?=
 =?us-ascii?Q?KQzSSkSjf9bOoHpgMhxIiFinURcTWU+azIxeyfdW7dvyrFLddAm29DcRYHPw?=
 =?us-ascii?Q?7eqPiMUz1pJAXIEgRVNRoinsJj/zv8On8eKenQtrtKq66RNr5syT6esmXmgk?=
 =?us-ascii?Q?6sns+3BkiYcOtZ+MmEzlhTkqrv52XuKw9lNSzU9grJ1Zq3VMOM+4P2Pk+WjP?=
 =?us-ascii?Q?bpL1gji0UJUG6r5ltBhw82b1swGwk9VkM2aaB+PPoRQyI1SzJ/3lsBIMwhMK?=
 =?us-ascii?Q?6wLOGb015tQTd27m2teoecT46nc/wOZDGOGowKlybrHqb5cBlRW3JmoK3FWx?=
 =?us-ascii?Q?KmpiYgo9ZFn/4c9KdWU6jrxnylggaP8cnuP8z298hRYqtHiXJThIIjM0cbR+?=
 =?us-ascii?Q?7OH37Q8bLjApGMwmO4y49yQqOWFCjMBDYxstDo+P61C8DYWN24+9puAvoxrV?=
 =?us-ascii?Q?HhMToGDFYXuHo0APMgnXZ2dvjuHWY68Jh57QaOCGMxnDuJAUS0JWNxZy7OPB?=
 =?us-ascii?Q?sXSP73wbOIhdELi9VdBWSzA8ackq+dXORpP42JhJAqEuSBgqSWMyHDG+bQ75?=
 =?us-ascii?Q?PyKBEVbwDx+RtaE2oQ0tqung5PIWfzJbuXVPfVvQb9xlbDhWH/6evETe2QTe?=
 =?us-ascii?Q?X1rnFNYEKgJgT9uhqrBIyrh/5O2A0RcdgPTIUbjCMVMpsi6XQar/vSTjiqDh?=
 =?us-ascii?Q?MFyR52Ea1INKWoPBgiuTJPuSQOXhqQXjNt96tGxiJE/zXcFDbeitmnl3mTcx?=
 =?us-ascii?Q?BoR54DAZkAfX+s4dYkwcY1iopyRxVjrZoUrtPTLyysMA87m0WCjnh/cJKt9a?=
 =?us-ascii?Q?AAI/TKUNg8vR4HNgYzPq6Zadn+MxIzAuJUIq96yvtsRstaNS+GhU8haXSNTI?=
 =?us-ascii?Q?3kDaKyfcaPXMJVIammzm/z+IQcp0fNyQFi5qpBx4MczhGjWB89sNnKdHZRYL?=
 =?us-ascii?Q?Sj4NOXbr5cqVQC1NEBfpdbGfTcUWPmD5l66Mteb5UW11eRLUcQjKYTe2ZyB8?=
 =?us-ascii?Q?yNJ/TKHzGPwSSTBuKZagAZuHW6HXiMNup78EXpRKyuFZMvAnkg47APD72DJw?=
 =?us-ascii?Q?sWZqBRpYoukMQne5/2mmJaK323p+n529fE61hR0KmI7H3hKmOTVm1ZXcBBW2?=
 =?us-ascii?Q?NpAr2SdrlmXutJouQTW3i7Lg5VUu/AZPHGZJaSDeU4gsIKXHAaISMWv6efic?=
 =?us-ascii?Q?Q8O9UpFZ7w5nTaIP0wCh6OZQc+jT2jmTn1oOmz6XSolvBIhS1esfigU3mawD?=
 =?us-ascii?Q?1oEBTunEZVMe7/Uk5qen8SowfMBQcrwhddmi0UlM7xKMAfnGF7A6F/snmBvk?=
 =?us-ascii?Q?pQNLwS98Ug=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f23e0f7-3a3f-4199-8ee5-08dedd98baa9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 09:01:57.2223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMIukCE517c4YggHiN4+an5VwPe12rN6Wfffc8C957CSdqAWHvvc0hAvORiNaADy6wL1pMXAop++/pr2qaIMmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6351

From: Tze Yee Ng <tze.yee.ng@altera.com>

Add asynchronous Stratix 10 service layer support for hardware monitor
temperature and voltage read commands in stratix10_svc_async_send() and
stratix10_svc_async_prepare_response().

Register a socfpga-hwmon platform device from the service layer driver
when hardware monitor support is enabled, similar to the RSU device.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v3:
- No functional changes from v2

Changes in v2:
- Extend patch scope beyond async SMC support: register socfpga-hwmon
  platform device from stratix10-svc when CONFIG_SENSORS_ALTERA_SOCFPGA_HWMON
  is enabled
- Follow RSU-style registration; RSU probe error handling is unchanged
- Add err_unregister_clients to unregister hwmon and RSU on populate failure
- Unregister hwmon platform device in stratix10-svc remove()
---
 drivers/firmware/stratix10-svc.c             | 46 ++++++++++++++++++--
 include/linux/firmware/intel/stratix10-smc.h | 38 ++++++++++++++++
 2 files changed, 81 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 00e134e663c8..a72b03c37ea8 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -45,6 +45,7 @@
 
 /* stratix10 service layer clients */
 #define STRATIX10_RSU				"stratix10-rsu"
+#define SOCFPGA_HWMON				"socfpga-hwmon"
 
 /* Maximum number of SDM client IDs. */
 #define MAX_SDM_CLIENT_IDS			16
@@ -104,9 +105,11 @@ struct stratix10_svc_chan;
 /**
  * struct stratix10_svc - svc private data
  * @stratix10_svc_rsu: pointer to stratix10 RSU device
+ * @stratix10_svc_hwmon: pointer to stratix10 HWMON device
  */
 struct stratix10_svc {
 	struct platform_device *stratix10_svc_rsu;
+	struct platform_device *stratix10_svc_hwmon;
 };
 
 /**
@@ -1323,6 +1326,14 @@ int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg,
 		args.a0 = INTEL_SIP_SMC_ASYNC_RSU_NOTIFY;
 		args.a2 = p_msg->arg[0];
 		break;
+	case COMMAND_HWMON_READTEMP:
+		args.a0 = INTEL_SIP_SMC_ASYNC_HWMON_READTEMP;
+		args.a2 = p_msg->arg[0];
+		break;
+	case COMMAND_HWMON_READVOLT:
+		args.a0 = INTEL_SIP_SMC_ASYNC_HWMON_READVOLT;
+		args.a2 = p_msg->arg[0];
+		break;
 	default:
 		dev_err(ctrl->dev, "Invalid command ,%d\n", p_msg->command);
 		ret = -EINVAL;
@@ -1416,6 +1427,10 @@ static int stratix10_svc_async_prepare_response(struct stratix10_svc_chan *chan,
 		 */
 		data->kaddr1 = (void *)&handle->res;
 		break;
+	case COMMAND_HWMON_READTEMP:
+	case COMMAND_HWMON_READVOLT:
+		data->kaddr1 = (void *)&handle->res.a2;
+		break;
 
 	default:
 		dev_alert(ctrl->dev, "Invalid command\n ,%d", p_msg->command);
@@ -2000,16 +2015,38 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_put_device;
 
+	if (IS_ENABLED(CONFIG_SENSORS_ALTERA_SOCFPGA_HWMON)) {
+		svc->stratix10_svc_hwmon =
+			platform_device_alloc(SOCFPGA_HWMON, 0);
+		if (!svc->stratix10_svc_hwmon) {
+			dev_err(dev, "failed to allocate %s device\n",
+				SOCFPGA_HWMON);
+		} else {
+			svc->stratix10_svc_hwmon->dev.parent = dev;
+
+			ret = platform_device_add(svc->stratix10_svc_hwmon);
+			if (ret) {
+				dev_err(dev, "failed to add %s device: %d\n",
+					SOCFPGA_HWMON, ret);
+				platform_device_put(svc->stratix10_svc_hwmon);
+				svc->stratix10_svc_hwmon = NULL;
+			}
+		}
+	}
+
 	ret = of_platform_default_populate(dev_of_node(dev), NULL, dev);
 	if (ret)
-		goto err_unregister_rsu_dev;
+		goto err_unregister_clients;
 
 	pr_info("Intel Service Layer Driver Initialized\n");
 
 	return 0;
 
-err_unregister_rsu_dev:
-	platform_device_unregister(svc->stratix10_svc_rsu);
+err_unregister_clients:
+	if (svc->stratix10_svc_hwmon)
+		platform_device_unregister(svc->stratix10_svc_hwmon);
+	if (svc->stratix10_svc_rsu)
+		platform_device_unregister(svc->stratix10_svc_rsu);
 	goto err_free_fifos;
 err_put_device:
 	platform_device_put(svc->stratix10_svc_rsu);
@@ -2037,6 +2074,9 @@ static void stratix10_svc_drv_remove(struct platform_device *pdev)
 
 	of_platform_depopulate(ctrl->dev);
 
+	if (svc->stratix10_svc_hwmon)
+		platform_device_unregister(svc->stratix10_svc_hwmon);
+
 	platform_device_unregister(svc->stratix10_svc_rsu);
 
 	for (i = 0; i < SVC_NUM_CHANNEL; i++) {
diff --git a/include/linux/firmware/intel/stratix10-smc.h b/include/linux/firmware/intel/stratix10-smc.h
index 9116512169dc..18ac6fe96d9d 100644
--- a/include/linux/firmware/intel/stratix10-smc.h
+++ b/include/linux/firmware/intel/stratix10-smc.h
@@ -695,6 +695,44 @@ INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_FPGA_CONFIG_COMPLETED_WRITE)
 #define INTEL_SIP_SMC_ASYNC_POLL \
 	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_POLL)
 
+/**
+ * Request INTEL_SIP_SMC_ASYNC_HWMON_READTEMP
+ * Async call to request temperature
+ *
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_ASYNC_HWMON_READTEMP
+ * a1 transaction job id
+ * a2 Temperature Channel
+ * a3-a17 not used
+ *
+ * Return status
+ * a0 INTEL_SIP_SMC_STATUS_OK, INTEL_SIP_SMC_STATUS_REJECTED
+ * or INTEL_SIP_SMC_STATUS_BUSY
+ * a1-a17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNC_ID_HWMON_READTEMP	0xE8
+#define INTEL_SIP_SMC_ASYNC_HWMON_READTEMP \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_HWMON_READTEMP)
+
+/**
+ * Request INTEL_SIP_SMC_ASYNC_HWMON_READVOLT
+ * Async call to request voltage
+ *
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_ASYNC_HWMON_READVOLT
+ * a1 transaction job id
+ * a2 Voltage Channel
+ * a3-a17 not used
+ *
+ * Return status
+ * a0 INTEL_SIP_SMC_STATUS_OK, INTEL_SIP_SMC_STATUS_REJECTED
+ * or INTEL_SIP_SMC_STATUS_BUSY
+ * a1-a17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNC_ID_HWMON_READVOLT	0xE9
+#define INTEL_SIP_SMC_ASYNC_HWMON_READVOLT \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_HWMON_READVOLT)
+
 /**
  * Request INTEL_SIP_SMC_ASYNC_RSU_GET_SPT
  * Async call to get RSU SPT from SDM.
-- 
2.43.7

