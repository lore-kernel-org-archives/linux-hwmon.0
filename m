Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012017.outbound.protection.outlook.com [52.101.53.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7381394497;
	Mon, 20 Jul 2026 03:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517946; cv=fail; b=myHwPKdK3/cKobNsX00U+L0jOXXWYnGaP7J+rx1bzREgpAxowCEklwdJZ/G9lkWPD4k42bVr3W1OuAqbxZdsPvJbIQRr/hyaLvnirXhEEtlxyegtpQZghqLeUfqmBpSbb3+W7wfZfpv6OrRu4h4hR/oyFsHsifuYQygS6TYsCf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517946; c=relaxed/simple;
	bh=AQNsLKTZ+4kTckmp15rsLP59sxOyB0NtNldHVOWwIMs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vmvd7Ww3im0Jxatp/ZlMxfZ7wCRK9jH/4ECSpVntsBfuNeJG4Hf3o6/Szi/mOmV6otzuWCAsAc9MZ3z2ex0FHNXY3osMwyUTAzfo+gMMDd68/pYWrqLLHJPxjQ369cObrokR9pCoMJScRcrRVQZXXvfKTR+JsIK+8Utal20v4/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=HkGHRHO0; arc=fail smtp.client-ip=52.101.53.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="HkGHRHO0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3Te+NsilEObPo5NU5zT00Lw8NBXcwMM7g6KFSaWTBuUSYczGYwG58avqK0ur/i4SNjbfT2xYYMFzTDktddiuJq3zwygFmbERQJDSlnjuhEjxZbwZ9fh2gNHygNhRJuD6BDNA3i8UCsT/Mu35QzDfLA+2jbOvswO9E/XRTstsBbUgrAiSChGL/nMDYKlW3xU55nQR6OspXQQzVcb8kjXdRHfgoC0+ny5IgyW6XI3lydG2sudWIa/VYUEbSdH0WYsZZLF6PaU+M3J2xLotxmWmb4E4AiVm8lx6OK4E9z3/azxPmSzqHNiIgLdjr9DQi2WZ93abn4SZGXdbufx7815Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QY8x3mL0Ffyn1mLqj3DaCAva8QXPVhQQp4TK3TgkrLM=;
 b=qosFUSf149QzxPk9/4y6XgH8SmMvoB/dq+CkhD9eFFSA7IJ1A6DhhP1z/+Dh/ZVwSZEkbr7b4k2QLcMf0EhaJbeshvOf1DkR1DD7Q4wV8gB07aX8eobmRzFAEyyLIvCIuM51lhoVxFyRPhe1pT57FW/5cZcQjbprfE4bJQPt2BrJV9EdzkGTGFu1iv1XYWwY/eKuq2Hj/QStFP1GptViMvfSVNM5zYMiGXd4N5bhPVaKuOjRkoXr0wphLZkofPhsjZusXUdWFL11hYDNYeDMlRELFvA5yCYjR1iYqm7tqZuOt7zXQQVFIP4zt6PJ0p1hsj2+qPs9VbOAM9mC+DiVxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QY8x3mL0Ffyn1mLqj3DaCAva8QXPVhQQp4TK3TgkrLM=;
 b=HkGHRHO0JmaZu4A7dedBwlFIRQVi4eBuexxY9O1BO9pYxx1sDvVu0eN6LM/ImS2HLOzdfGIH51jrO71Zct9OjiRanflxY82AM3fuQRIvCIGzFI5oOwYl6B4IKqW0NBnxPOLH6XFZKrQZb/0JvoSWfp15Ll13AhxAY2APjStnqA3wXJunZSjnRoD3xsrnQBU1e/w3aF/nD2GpkXuGeHMBY1CufglP9y8sCsnjb0nnxxPgur42CPam5xHWlHMRtDLbKGFz3upQX+v29/YzQjt/P4Zw4S1/UIrhSbe7uI4/xx+6Y87LzZ9kwcSSkrbEH1D4Yl1ZMuEAo+XDdTxwN2PN6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by SA3PR03MB7256.namprd03.prod.outlook.com (2603:10b6:806:300::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 03:25:42 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 03:25:42 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v6 1/2] firmware: stratix10-svc: add async HWMON read commands and register socfpga-hwmon device
Date: Sun, 19 Jul 2026 20:25:33 -0700
Message-ID: <a79aee37be7067691fd02a3a9cfd134c995e5a95.1784516953.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1784516953.git.tze.yee.ng@altera.com>
References: <cover.1784516953.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-MS-Office365-Filtering-Correlation-Id: 7e78c97a-0ba2-41c6-123b-08dee60e9290
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003|55112099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	3bMOZ1JbFrDACztH1/SJFWvBQSXrVJ1gid0arzvrVCqZcTUVIecO0kzC1f9Jc73r6uKDjnOXfhpeaVlgJS4psBmeW5dz0495GFPqqMrclXL8gpkhMZUPmPWDwZx61TBcwHPGTR8Di9kNw12P5gGEhviULDURp6mvo+naLMEFFLo85jaR6WTbjt5Hc38fhtTxeEdW2mh9V5tNnwMGjBoeEMmVlnwz8h2xMJtQBQoAl2+IZMIE40yW8wCCVa7qJAaKms7YJV0drH8IO4cqZDQ5M7grGQkmrrDon7fl5COzwZTFmBNEdAI2n6RY8kmGF5a24GrnXeN0WCBwjn3lDT5c/WxIjUb11WmjsiLawahquq8cVHyss/winWLwicoisRGk4p5C54wz5c/iy4DbyI48DNsUj64y1bnPDF9RogFPKUuyZzA5BD0Kv1dOMZtWzVSMJs7nfrL+Rj34/+HRFBpHVuNP/KzTQbxVOJMy2KjRHz9CSSMntTd4PrvR095jZ2ApyGBmwsFsHc9aOJY3PxVgs55ElUbF8aAF4+nh+oU9szuSIOsnlHwRhLp6DhNZ0ONJaOubFWLVCtABVeC+TaCwA0NY+0wc9N4EstqXn/7wj04/T4DOAN5oPeDPMZL5Wexfun6IhrFqiDV0LfBdLBjwsVfbov+yxFXIonZ20nWrNwU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(55112099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1RQ4eP2BI7O18H61fQiRjdOjO2YF72eLWCafn7xxq0TF9aleBWCWSqsf0sQ5?=
 =?us-ascii?Q?PNa/YJy42eXH6cNLSPMLRuzJPoma1+PeT76WBP7RI/JrnUvsDAsUZcsHCPix?=
 =?us-ascii?Q?yk/gMQJL1FBrEiqGLQDehVUjdELlH176s+lXsaUA49eV/Ig3bRgb/+WO1VZC?=
 =?us-ascii?Q?P4rlwuGt++A7L7hNUx5r/2g0+fKUZD0sXXHdZAcE15bbx3CWztMzD71cXMDR?=
 =?us-ascii?Q?wAjemQMlxHZ1rFJ3JPxvrA1Rq2F7ohWD9W6Tn2aILwlCSu/06wTDuNV88BcT?=
 =?us-ascii?Q?goqRB5ISG+Ju/4FB7cF6vJmvCj3izrr7KYKTZJHIKEU+pGm7Utl6sDn3d/TI?=
 =?us-ascii?Q?s4sSvkgNn6c06eI1F3vljLvYzqU9C2jgtJK+7pzg16MpOYhcmnNyo5Rw5hvW?=
 =?us-ascii?Q?sKqoBR5IrKkdrQDjmjDIDrYKbOe+g8GzY5ZW3Sb6Phuye8DPUsLDEbhLUYxE?=
 =?us-ascii?Q?AK0GBj2pp6Zy0dEWUMmMnspOqa3qK6m1AP/yrzBOqp9kMzOaTVLGG/6cncSR?=
 =?us-ascii?Q?WedXP3uy5y4cQKyBR/1QtcV9tL2jfHyFeXnDcGd0viT0MmL+Cuww3Cv6C+nE?=
 =?us-ascii?Q?j6zJOyT6peOWQeV2DnXfDXshU4kWcjA55ZDxXyMqwVa/4Jufj7LsqfmvA6P/?=
 =?us-ascii?Q?MzbdzO4kBGU17V1p3Gzu2QId1Bw/ns8HqYVRjmXeiv/9WFyyQx5JKBHGJPu9?=
 =?us-ascii?Q?a3fMhb+uUaYZVbxR+KlPF+icMKgXhDbdNxE25xE09sdLLccAw+GnJ4UPUjrR?=
 =?us-ascii?Q?2YsqH7N+eotlYQgW2+LCxUWwq35J739obP+Igi48iNlodIhq0jpWpg9GAjQB?=
 =?us-ascii?Q?sX8PQ2z8+2t0JX1zsECtbA7LyMyQg9vUHAgwBtDKdqpwAV+BUkxLiPM0zFTU?=
 =?us-ascii?Q?Il4NUCZXg9Dahm25dAOUVGXpuAufX3GezkUGTU5O/SWYMif3JuYlzYUCGu11?=
 =?us-ascii?Q?b/8S3d49/5TmShbjYNh8JYJBOEXnmIb60oYg0L3S1Ekdx+QaQpqkrf2XGzqt?=
 =?us-ascii?Q?QpWLHAe6gPXxdq5ZIMq+CiQRARYJXAvddrmSwKFrBW+UxH7emzxEYEOZXB7r?=
 =?us-ascii?Q?cG63MUoGrgl171kmO9KutC3RJKkRSrQZA2s1x5trmkzB7pTZk2unVjEOgN88?=
 =?us-ascii?Q?Z0BEKgDoDSoRzOGyrVWo2qowm1YqrQFhZZ+vZetkto/RUrdjNZr/Az+uIqIM?=
 =?us-ascii?Q?jMM0LffvL7BuRMVj7a2uzvkGNKMPMNDgAcUZmJ1eGw0yYWlOSBCtEbuDLnaY?=
 =?us-ascii?Q?OZskOgf1jt7kq2z+nVIk5LOkz8+ywTqtJ71x3WXz8kuh/2xMqimh569jBerw?=
 =?us-ascii?Q?esNTCmH3Xdk7ZvkOWd3zxZInQ2zHCnvcTtcPlAyV8qOyGamWfLxi/0hLaZ2W?=
 =?us-ascii?Q?V+zWDAnsxEeRJTUm5GGZDvvvIri21H0qpfjdD2osfjLnH/4DUKPc82U9Nh4r?=
 =?us-ascii?Q?ArjvSe+wgN62vD2v8b+gTHM/peZinRtFlibKfoZnRghdMH6fBeVEpW0rT+9G?=
 =?us-ascii?Q?Xw7WjVgNxgDJKY6b8SjSx6IGCCG3zU1jUX5cn2TsgxsKSerb2f4jyuMzrLfg?=
 =?us-ascii?Q?Z/++CqxGDq3mSJS9pJqweEhIZ5xDeJGgtiV5JpJ3/fYlVi3smROoaXasN0Bh?=
 =?us-ascii?Q?EZq1xW1o3wtAdqvChJDt7VbMnKAZ2BUJIHozBmcD79cBwT5TuCpKtHyQtEVT?=
 =?us-ascii?Q?J5HRHQxhI+ztgSe7/wbnWN7rb82c/nWVZlqYPvR3FghWufE7n60Q9+dD1XYo?=
 =?us-ascii?Q?LEOMFcdlsA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e78c97a-0ba2-41c6-123b-08dee60e9290
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 03:25:42.2555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pEyXhtQOxxSNtHY2Aj+6/o2HMomb0uVAR0/Nr6bXLCNciwJ0CDUAaPlojHfozfSXlbkYmGsxMWFqnn5fcPTzpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7256

From: Tze Yee Ng <tze.yee.ng@altera.com>

Add asynchronous Stratix 10 service layer support for hardware monitor
temperature and voltage read commands in stratix10_svc_async_send() and
stratix10_svc_async_prepare_response().

Register a socfpga-hwmon platform device from the service layer driver
when hardware monitor support is enabled, similar to the RSU device.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v6:
- No functional changes from v5

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
index c24ca5823078..fc38afed5b7f 100644
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
@@ -2013,16 +2028,38 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
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
@@ -2046,6 +2083,9 @@ static void stratix10_svc_drv_remove(struct platform_device *pdev)
 	struct stratix10_svc_controller *ctrl = platform_get_drvdata(pdev);
 	struct stratix10_svc *svc = ctrl->svc;
 
+	if (svc->stratix10_svc_hwmon)
+		platform_device_unregister(svc->stratix10_svc_hwmon);
+
 	stratix10_svc_async_exit(ctrl);
 
 	of_platform_depopulate(ctrl->dev);
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

