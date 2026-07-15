Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013042.outbound.protection.outlook.com [40.93.196.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350C6225413;
	Wed, 15 Jul 2026 06:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096922; cv=fail; b=nfjPx6bdqI8TaJJwKlJ1165ZJQ4Rc+y3L4FiS+tWBsoiEZIORhmBPvwo9x5G44tLppEim0VnSXU/AUHUMteX3WAZ4um4szRB6XH2QX2ZaDwmlMLv7UEbp4q4WXon2CPLP47dhzgGxD8IFuPesmTDkGHrHePxY7T8in3R43VU7RI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096922; c=relaxed/simple;
	bh=7nXH2o91zbDXpwOzG5CGiDtK4lLAaqlF1GDYNC4XkBc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n5N+CRn4X+eueuxjVafWuhgaLFzRlBCxp5X7rM15zmmZO/qlx4Ya0qlfLAawWSZHQTNKV0qgQy/sFuD8GIGPMv/inFd5n30TW02D7aZD+r5C0+YQMYMUpYsZg2DfNa15NJk4wy1TYQuLRDCQfdVYwOxBzic1ojDWZKscKydvgFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=o/G3GjX4; arc=fail smtp.client-ip=40.93.196.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="o/G3GjX4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0V9DlynbFdMbYIFEIPxxu8cKr0TCAoUCCV4k9u2ClTm6W21c6R25tj7i+Fa8VermMmCSpLc7Ja7cszlou2DnVk1cgpxaY8aqpMfeJKw2bmlIRouQpHYIxHonnaWIp9P9oLg5wZGRrBDRXGs3CXjWHDTDuEZThBH/Jx9j2bBwgEnZFTECZIjt57rYied9eF8TfVXw0WFdJSE7FwRA61+56b/o/9PsQZv41H7moNM6ZEJJnpHFlwfdU7Js0+RN5Ohnv3/5PYXL4nxnHLYuceVgJs+pzPxwPUM9SVLT0v/wIkudtatP11ItfMLYSGHzxfHSquJR88jPEJKQKeD2xEi9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPrDjP169imGiMH0ZPmB3TQHIT92AAChcM/23+lB/xk=;
 b=RY+xfeTG//irSQoZi3ipn6eSKTzIcJoQae0EDihKsURiLwqb3fc5qRdl3VUWJaUjRLFNasELWap1l2H2RWVVn5APFzin5ELjevu0dVIibmVbWN6ZD+FgKbvYtfPWQ8wNBNrACS7cbgD+3WvIAjC6NGQH9XXAOV9Hn0eTRhYjqIzijDgPgyu22pQG2rNdK5Qk5Kms2zenvuM/ioRzvHUUIoPxqFHAccOy8mfDvnj5BVAK2ANuN+AnRDPJdwEr7eK2jCVVh1W8T9yU7w39rgOblZ20gIDNx4Sc1FpnHg6GPmARMfpGhVRNA4DKYe2FgWDgbHtbnUFAcbmq6/VxEgd12A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPrDjP169imGiMH0ZPmB3TQHIT92AAChcM/23+lB/xk=;
 b=o/G3GjX40i8+nQ1q9fe4vLQfFnW59+QEzk/wqSstmC3+jizHvcqP6eI37Jm6fZ60KOdpVG3kHzlzAVpTNRxN2amxyRgz++I/B30P2g24LtPT0XBVFlnyTYG3ovWCrWI6QmZVmU1t895z8X+4MbHK4Zi0p4yvQAjEsHwAnIJPZ7vE1bOZBMu5AdxhYZ43zYZvBUGVa0PgmonUezydIQir7USYCdKqziqwNvC0/knfvh9uW20dnSzEBAr2uQKxENSwX+sZF4xAAwSoW4cXdg33tSH4CBr/yKaKR3U2hTpt0tGtAqZDxQzoEecU3d1KmkEkNw33oRFqj66RRhuNkFqCoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from CO1PR03MB5937.namprd03.prod.outlook.com (2603:10b6:303:6e::18)
 by SA5PR03MB989111.namprd03.prod.outlook.com (2603:10b6:806:4d6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 06:28:39 +0000
Received: from CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3]) by CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3%6]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 06:28:36 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v5 1/2] firmware: stratix10-svc: add async HWMON read commands and register socfpga-hwmon device
Date: Tue, 14 Jul 2026 23:28:01 -0700
Message-ID: <66493aed36c36718ab90d4792d04948d3926d377.1784096224.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1784096224.git.tze.yee.ng@altera.com>
References: <cover.1784096224.git.tze.yee.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 684347aa-119e-4409-17fd-08dee23a45a9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|3023799007|6133799003|56012099006|22082099003|18002099003|55112099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	MYg572dNuSxtz+RSNgm9nDPQWazdxB6CzofPgLTqFUVbSNaOIiKsp52VCykGXy57MjQ3ey06a4cGJ67xu72f6AzI8aFZ+Gen0HPIle/o+ILPeNxvaa3rh677mXJQ+YV3EQhltjbSF1/ffFE18FbfQ0VqccM7cFJyhXteeJXuU7icLAPvhZoqG8I9OUH2bveHdAmaSOiVD3txCNdI/C8JoE54JbXyBFpQTNyTX8Gould1InyCNg2GK35Qzm70lqveH/Jru4n1cx3XrpWneNml6TZWlHuQbTYC4llonhlc7n0bko+XWaxBp35LFzus4LZytx1so+D2Z787TovXAiUaK3XCi6DPzUv0ozpWPTTL+Mt15CzMFy82jTnBWLxu3szqZa+OSQLELYt4mhaX++hG9ONo1zFgO6vRLHfTHes4qkslcj8silxquPRE/LzSYGYXeRAvaoxe1Q4WHXwLDeRtb8MftTU2OI/DtZI2s4AtQjWW9wmSrEUTWuIFhWeSzt0Xdiy5kdSxMnYMlX+jpnDTA7rRyXNYnNXYYwf9mSwjpboSZiwmucsfgi02tSB8ixAQ+AolHr9arYEe+uTAi6/HZM95LEotzThkcZy0tZfuz2FEh8T/1LwsaFlQTRo9HKnbb/d73megHBwXI4qSfg1m+NisOzmTbcC9Mu2g9d6cHOQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5937.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(3023799007)(6133799003)(56012099006)(22082099003)(18002099003)(55112099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3TltxbuW1df7G1xtl79ChTZMij96/YVpetGlQ6KBWkijgErj2GRgd2WdVnsZ?=
 =?us-ascii?Q?kX2ZzW9l6sebmUrnSQsZ6F2PzCNt/pIF5+gaCZrmU8imggtM3WagmVtGcHeE?=
 =?us-ascii?Q?QXkE+Vs+wB1PSA6o3RW+Ayfh4yIeG2L2+IvPtMGpyZdXbmNH+Vf1Ic9U9DKn?=
 =?us-ascii?Q?1+8cOwkthYzDpsw5Zekk6LHylO+VmP0i5+ig+KkvaJs692s9B1ForL18BBWX?=
 =?us-ascii?Q?HiO26RbzMdNc82mm6GolXBayMIl1kcVnYhWzAGem29XD65BAdqMAtVQYYC+w?=
 =?us-ascii?Q?nxIYYKKBQm/pgFU/uaufMvI5dTNfP2oxTDzx6rv+p+AC9gov6xYry4tlFWcp?=
 =?us-ascii?Q?E8HxnJMd3R+ZX5Bm8d3x2cdFIHhEVBnbHtJP8b13S3q4m6Jk2sY2QQryMx1X?=
 =?us-ascii?Q?ghwB6s91g5uAhDSHRQPistcLoZY4M3kj4/2Br5u234pOBu/eXXkaoVfnTshY?=
 =?us-ascii?Q?uZXyb+p9JK6ieDRPfohqccmutRwUrytHuXkJzSeDzYJPLbkq9h1iQCVhnRQu?=
 =?us-ascii?Q?MUrbciXvGYSd/bmmz+SmyJjcojtO7RN8Ire9p7OX66vIqjyjKSETWOqrfhG4?=
 =?us-ascii?Q?qSAuw0GP+vhZZrz2ceaa/d4l3RNkNxzlnlfCTqADdi2UsYIbD8XBdeZMvEMU?=
 =?us-ascii?Q?5hXq5GOmBDNg6d8F8hPPOlwQ0+KKCMBkoaTh0EbPRpJnUPvNnVs6VE6jvwDX?=
 =?us-ascii?Q?cZOG7xZ6pWurY1tAGCzm/Y5yg80JAHRVdzNFAH9l+P/vqFyXycLKUvpS90sB?=
 =?us-ascii?Q?4keDDciZVToA5frC6bCwzsX9Frf0eT0h1xL+E3rChdUuHWbUlRbaYfUwAu8w?=
 =?us-ascii?Q?PmhLtnX2T1hoIph3c7z614cpsUXjmsorld6UAPR/ybY8d4LILhKLxgxHUKTn?=
 =?us-ascii?Q?fC4e+caPy4IipyN60z0G/5Dqx1VufYQHB6NsftDxRIBXxYn8ueiPBLqLeM5N?=
 =?us-ascii?Q?KQ60Eom18YMj0IBd51Gwg/diYCJrd4WPESwIiA1+go/H/Dgngg8gHijXge4Y?=
 =?us-ascii?Q?6DcSHGt42GXNuEQIf2iBdCSnOZpteonab6TPa37SgcNnQRSjXJufvI+xP2nF?=
 =?us-ascii?Q?EyNtmBEsqrXpctlBK67Epv8/waUIH5pZq0fFCFPuo1OaVSDpQTB2E7E05kPw?=
 =?us-ascii?Q?yarpc3D41fhn2Egz4JGQ+H8k2zEHxBldi86rIUt+4MlvnWxMuSWKo88WVYPo?=
 =?us-ascii?Q?D6czmxHPSNO/TJst+t5F1oBKrp1QFiDidr8u0UxZ25maLuR8DBM3U0JJOxEs?=
 =?us-ascii?Q?uRB8cIUSyKcfmVkgyLokV9AUAgxJjgCd6s+RAeYT+B/HlO3PK3l5yCPOjzZL?=
 =?us-ascii?Q?c9lNqT+C4idUO3dqJGClmwWnHx0ZlWewU/0uWQiIot5g5dSLhe0JlwYxnGKT?=
 =?us-ascii?Q?SRfSIvWjHDY+z0PdJi4WmeOVqUaUkWE//hGzi4UVx9zdSM6R3vGM+22lFjgB?=
 =?us-ascii?Q?N7ETqGMioMdTG943l+cc+A3qVHi5leennX8AUEnrh8zvf/ZKWx8/mCcRO3B2?=
 =?us-ascii?Q?0KqArHMQ4nH1B84Uxzco6ht+uc4cKBadKKQVS7fcgYuMdZd9cr8u8hYaeA/x?=
 =?us-ascii?Q?x/HMBRgnu+9g6tnzVctCfIxjZdc9vW9v5fRqddvDS4w76QENNjL3fpzPzEKh?=
 =?us-ascii?Q?an8smjoOHInoQr4u7S0iFFrPxHRe+Z9hTUlqyrnRxkapN6cgI+JuW1HNpr+D?=
 =?us-ascii?Q?b4mGQAdTtO9qLvSJgKF5HYXGA8waKwdAbdN6BpwFERUGdGnBh3+h/D/i1S/V?=
 =?us-ascii?Q?iH2T1tFqYA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 684347aa-119e-4409-17fd-08dee23a45a9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5937.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 06:28:36.5313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LkoqzzbZipP0syRITi83EVQhMlXnkkReu/Nb0WBvjtKH7CEAfYptbSWroZ5dqsvU7KxfFIL2sEjZ8Bo7PTsIfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB989111

From: Tze Yee Ng <tze.yee.ng@altera.com>

Add asynchronous Stratix 10 service layer support for hardware monitor
temperature and voltage read commands in stratix10_svc_async_send() and
stratix10_svc_async_prepare_response().

Register a socfpga-hwmon platform device from the service layer driver
when hardware monitor support is enabled, similar to the RSU device.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v5:
- No functional changes from v4

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
index 5e20057ee344..bb6c02cd1f81 100644
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
@@ -1329,6 +1332,14 @@ int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg,
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
@@ -1422,6 +1433,10 @@ static int stratix10_svc_async_prepare_response(struct stratix10_svc_chan *chan,
 		 */
 		data->kaddr1 = (void *)&handle->res;
 		break;
+	case COMMAND_HWMON_READTEMP:
+	case COMMAND_HWMON_READVOLT:
+		data->kaddr1 = (void *)&handle->res.a2;
+		break;
 
 	default:
 		dev_alert(ctrl->dev, "Invalid command\n ,%d", p_msg->command);
@@ -2016,16 +2031,38 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
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
@@ -2049,6 +2086,9 @@ static void stratix10_svc_drv_remove(struct platform_device *pdev)
 	struct stratix10_svc_controller *ctrl = platform_get_drvdata(pdev);
 	struct stratix10_svc *svc = ctrl->svc;
 
+	if (svc->stratix10_svc_hwmon)
+		platform_device_unregister(svc->stratix10_svc_hwmon);
+
 	platform_device_unregister(svc->stratix10_svc_rsu);
 
 	stratix10_svc_async_exit(ctrl);
diff --git a/include/linux/firmware/intel/stratix10-smc.h b/include/linux/firmware/intel/stratix10-smc.h
index 9224974fffc4..706176cc5c6a 100644
--- a/include/linux/firmware/intel/stratix10-smc.h
+++ b/include/linux/firmware/intel/stratix10-smc.h
@@ -701,6 +701,44 @@ INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_FPGA_CONFIG_COMPLETED_WRITE)
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

