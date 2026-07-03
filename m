Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012047.outbound.protection.outlook.com [52.101.53.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A7A371860;
	Fri,  3 Jul 2026 08:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066151; cv=fail; b=CTmWuon2RYIbr3BY6kxZ/B09OZqsH1PHLgEzJF61Yrgv/k+qnzvn4lCVoAauByF6QGQ7lH7qtpUwI9QrL/l6UMZ0wsIo2BHp4Ra1IavR1hfLbnnXCDQgb3hKQeb0j+9g1S+lkkORckbw3Q4azfjZ1VilydhEnO5F6FAWtIobm6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066151; c=relaxed/simple;
	bh=dvUqRF/R2O9jjeupqzd+uCJPlOLvQJvD3zogXaSwj0k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UHT9NXcQMv2SdeXSg9b+GamzJKqDu/ZvU2z6MhpfW248mUSHro73gj5+lPKdB7s0Qw8Vxel2uUdRbBkmpFPc5eDxgDZVciVhtt4vmI8ggvxWSUAigsLQ19lCuYbp57PLkI926L3Xged6IBBFTVxYXAXvTidUp2tq96nSEwg5Jo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=ktn/J/eK; arc=fail smtp.client-ip=52.101.53.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="ktn/J/eK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICJIX48LoenAK1IqNimAo0N/TfYxcpgnZ4Y47p4pChDjtZhuV176uFZIP5GPRWlfMViXLFT5t4Kjd/czMPpxloIa2rCvOBYlJzKhT++Aok2sYCA33AB36CejFn+h7M/WqVCDL7Qdt3pJM4S56IDsJmj79etEzM7p0C3Tv0USYJMj59+Pu+5Jt8S+o6SYeDVfPqQyIqqM92+F6UMzvF76FNtCj3zdI8GlN62waBqos6GphXsHlc9aw5Q+1NaJqpqMXimUvQYu5Xn4F0XYe7pB7P3OhMqsg9A7iGGN275OO9xO8+sPL6xABJ+4tdf9ilNMVXlOg79W8T0qwhqlDojjfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWkZxl6+23bkxvv4Gu7JnWt08MSm1A7CCByheAe7tM8=;
 b=AOdTHmn4a7Iu+ty7qTqu3vG9v6TFV+6pSdJUWOx/idtnXT8ifPd+nYTxDhxkHCUmNA0SfGwWThon7zHwYECkhPryz77Y83F0dBYUpT3Zh0atoLgXB0ITnuM6PwcAF6ag3hKqE2ZTCwRAGD51WIZCJPK51KRBiYH4ODX2VRsVaBMZFTqV8N1w1XuJsMt0M0TJ962VUf7+c+/tAH2bQlt4IrstCdM9iuZw9836nPDrvwd5oQ2046IhJQXE4OYdIR7eHSTfUd8TiKo6+srOSsFrn+0HhP9k44/AWCgIvsb7zsSwUgpBtbAfwTPRtRj8c+yjuzrVBiboS2PZaPUWWwuJqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWkZxl6+23bkxvv4Gu7JnWt08MSm1A7CCByheAe7tM8=;
 b=ktn/J/eKpel4z0mvf3LQSM7jMzCe8ppwrK7nakyIhVWN7jFtgbw8iyEY5UJnWQ2Hx6upJ47ogbGP2ye+O24gu04hn7A0+vMzvBuLHH/JU8gNUl0VY+XmTp/ncw8/6Tf2vtZU1xwozfAce6CkQQZQwmKvvn62x/4/BLuq49rcbT5A1/wutAeDKmAkUnN0eeIs/LtpXxOvQtmb5+G8Mqzk7fjHKjspriByY7NIRlSOOfUDVIC1wWG6U/+lil8EAhMCkK9N9/+qrTGm0D4t3j9J4T0mOYIKJLp5aZzD0izKSdqI9SEBfjOirkmsDxRx+6vSTpaUWzBRyuHKeNp33guDQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by LV3PR03MB7383.namprd03.prod.outlook.com (2603:10b6:408:1a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 08:09:03 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 08:09:02 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 1/2] firmware: stratix10-svc: add async HWMON read commands and register socfpga-hwmon device
Date: Fri,  3 Jul 2026 01:08:52 -0700
Message-ID: <af1e81827ba72ea901686619bd66dd810f3c8b02.1783062999.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1783062999.git.tze.yee.ng@altera.com>
References: <cover.1783062999.git.tze.yee.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 524e195c-ef64-44a8-b48e-08ded8da5473
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|3023799007|56012099006|11063799006|22082099003|18002099003|55112099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	EvL0hYGEG9fPLSX7VZ/lzX0UFB3n9OtYpjJhgSUzK7ZaEHLdEASzA3hbxVm3yvvhTtZ1zrPD5Q0OJu1scHaeR3aeqxQ30OcaB1yX0aXsSEolQ9YaKPy2JJnsa0DgJcBcP/ctmWlphj8bULWLVgL6834fooub3Xb4CAxpYJmQnXlzvmjJ1Rj9jwcflae3UVAE9Him2ITjsJWZWK4WwLSuy3yNI+chEO5aL17MEcE81GWdKmEiLZvhPPhzFQdXgkUwB0XzqZV5aCuT/g2/ePxgHsovlX6i/NNdXBLXQyuvidr73TF12h5QQ/FFigByCJM21GbwSm2WL+4oZVuA6BDTVY+E0yb8OZfgbYKsUEDNKZVpz0pm/taBn0K1oGChUImuaab7iTN2SVwPidJyoTAQ1NebgeLZc3yOIb0QdKFT+MdiLgfzW2n1jUzBp8S4A3Amy2OlA5ILe5U+gxcXR4vfSA8n1SyzkOv+qLUvvtGCtw0Hh+9Ff0jHQYHZYhHzVJnQxm92KQjhXzGwnYs+XnlW3Pshg/pMMoOhtdERWJG+5Yn//lG77s5niRsrR+ogm2DQnIhJ6sByQ/EM884H2gX1UN6pKaivHOwLikKtIp7Z2yOxcjxJ9r6UMb5uj0G/1SLgFTs5yig03bZZnA+ssirrwsLa1OpCep9UsVgwUVWh5oo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(3023799007)(56012099006)(11063799006)(22082099003)(18002099003)(55112099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G/Vu7Uur+6tws5ochC2Lz3r2rhj4+w/pFlJFFUQARyJChJmxrUdYH/cPX6vt?=
 =?us-ascii?Q?t8FD91ySEVcdQQxjXFKw4dvqoeh0pWXY9gd8a1Nig/CIA8cd6jLIIQqsMbTC?=
 =?us-ascii?Q?ohnnxrq6imLap/70T9rbM2YkEW2TxXZdEUV2jxYbFKg2PFGNvYs+J0skThcM?=
 =?us-ascii?Q?XvyeKptvRewZqMLoshJ+nXEBeZn0mfd8rf26q2wJydtPF0gmGVhjShG5oLHp?=
 =?us-ascii?Q?zP2bhsdOdfRy/M1aafVaR4HbWyDXk6Ewv2QC+sF2N+ciYCtjb0bcdiwEPTdQ?=
 =?us-ascii?Q?cxxfWfMbyrcqsD3Xd88Zq+ZbDWeL0j9Ej5eUA2Xb6HOl4IfHhkg8IWqwuBTm?=
 =?us-ascii?Q?l11N9DvntlkgETrVFeqcJBswilEwD4iAterf62faLOIFctsRcz0qMx6Lp6d4?=
 =?us-ascii?Q?zN9gYTwKgXUM0Vg90nJ6ST/dXGzckWUkkTisPMlcyXdNSEn8VDwLBPPfOQNM?=
 =?us-ascii?Q?HJYxNt4XJrMTyaOgt6bKtRJbJI2KAp1zA/Q3qApGkp6NgpxStfbhmTlZzV0w?=
 =?us-ascii?Q?OKLv44jcLTmWnKs8tPLLWZTsREpDNXRlVOs0YrAHb12tpY7T1xbpoOBnEcao?=
 =?us-ascii?Q?R+opAKEoEdMl1UdRqhznuwg6vOrLZ5fLiaZ50za5PsFPTuDrfT0ec3zNdhMX?=
 =?us-ascii?Q?SWiGmyzQfR/gQbkd6VJAvAWCqwvVBxs4q6kM2o9sZfcq3fWMkuIh2WhCV3we?=
 =?us-ascii?Q?E/J6gsaVcaH19tKbBW8A0FQYcc8P0QXFmXQ42r7jiIGyz4YuqCBkHhfeuKJL?=
 =?us-ascii?Q?bNq+P+b7Y4OKRBpNLVtjlsrUhiVF+XxEwOUmX77hK9UoY9h2PSwMLL7ucA18?=
 =?us-ascii?Q?LhtGGS6bHd/pukE4kYv2ewfrIREE+KO+UhWT0b6EN0Q9RPiaOD05/5ERn1JQ?=
 =?us-ascii?Q?P/IjahIsZjjuvvx851UXBEjmWcvIi0EDsbvuVRNToowsbOP7w7nRHVaReB7j?=
 =?us-ascii?Q?f7+igmO1rmBjv/5wqZynIovJyYW7ndTPLN2MLevHPyd94EshDA1CrY8/L+Uw?=
 =?us-ascii?Q?KhKbG0kzcCW9qFEcs9WDjD/n7A8lxhMfJx2b9ARECGU3wkxAi1XEpCk/UgpO?=
 =?us-ascii?Q?YfclH10oc2WTdWI64oHHHhhbXwXVN+KI+7HcZ+Y2D7H5LE/QjDZ+b3M0kP5i?=
 =?us-ascii?Q?sr49etRbF8irNx5G/JYuLChs9PUFtCB09j5KbnTBIUaAMvEj0FCM5nLrJCGf?=
 =?us-ascii?Q?BxUOVlYZPD23IMC4viEzH+ZcVD6FAg/DAAAKRHGbrS1EoSlL12fXh2NGw+L1?=
 =?us-ascii?Q?cZYI0oKGwv6ODslGZqw5p3yfVuI0vJF7PzD8jAuR7ZeFT4VO9YbBiwDsPkyP?=
 =?us-ascii?Q?FWRgMjPxmNVWevqYEQlsMoVYn/v/yyg8YmyR2uQ9KZ2/RUndBgesoqHaEYLh?=
 =?us-ascii?Q?CCTC64cQKXGCxddXRFb2Bwm7CLm++S3nSOuaiMFXnkHjttYJDT8mNTP9UNpg?=
 =?us-ascii?Q?bFHWskurY3G5Jnkey/z+ZGC9hUTYSQTjvwxnQIA5PeRmlKwaI7MAYio8BORT?=
 =?us-ascii?Q?yQZ8xOHYxq6ry8cj+wgdmHO4rsA1NasEmXgceuqd3nWwM9nko9fMYUtkoADE?=
 =?us-ascii?Q?Mjewf+7cjWbVGGa4l3hfgAw2jRQn8CrVM2/KIhEoDzdkO2pAyMfOUfAxyAoJ?=
 =?us-ascii?Q?y0jNplppZUjIA1z0XnAdPRNUwmz1WysuLnDTvWfS2XYy+GZuX+C0NznOVQbI?=
 =?us-ascii?Q?M04YAW2kAp4qOESkQPpKBu5+DNBbxrhsJiUyzPdre4XURfnBqw0l3rqa834o?=
 =?us-ascii?Q?yDzKo+73oA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 524e195c-ef64-44a8-b48e-08ded8da5473
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 08:08:56.6126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjwF4HinSSbRYCMj45ZlFIYSbaJpcj8JsIZFq7nQYK1wA3r4iYEZQVSK/wLu8t8J2U09fByquHwuf02P5Cmvvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7383

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

