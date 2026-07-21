Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010053.outbound.protection.outlook.com [52.101.201.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE17C3C2BB9;
	Tue, 21 Jul 2026 02:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600293; cv=fail; b=BjoUJTFkZYw/9INc/DcIrrQE/quTkppo2xGC9eJgAeiOVyhN892VqKIYY3bG/afJIXnudrIecESme75296coVAmHlUoEy9PIq/2F6EBX1WP9yKZHmt8WS9tQo52D5s+bF64iBqrvOE27Jv+eyPuNAO/HkB8jq1/Ek33CDS3wHjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600293; c=relaxed/simple;
	bh=1Xn4LnZk0EKVDIXuwrPvSRooxANBcs2IqDDtVv52UT0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RuN8CGJKtIUJQHfH/arHv2mBuEhPt9lgkukgCkjORHWPB60HU1HPvfQIAmH6VK/p8n9tN8BPaW3asf3tHpK/xhY53wAf/M2Q1/0+eI5vvHglEMfhguz2Axfpn+cHSgoumM6Dm6oSMk10x1tHx6KwGwDjnwUVoZk1HcsYOt6aLqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=lj79HCBg; arc=fail smtp.client-ip=52.101.201.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="lj79HCBg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFp+8ZKuf1P73aGa3+vAG5Tt2XDcNbVQZ3+vSGx4zT7z4aViWH94BhHbhi1kJ4vM2+4MYMy347Wl8IyUSFJ1/zA+sM772WmkSZnvQ4oAA2i4bgAl0Dp/GN791fVyGGxAZIH4hDIfzxOggPLULxVM5bC0FgXebd1V7zmUc5+dW9iUnsRJ/jr1SuChaq97U4I/hhDP4oVdGPcGyGch31dhbP4tr/Iwd/M01PcnBTo92A3aXMNXfmhoDfFfQCxySCJak5AWrZpoHsu3OlQ0inKwGpdyp4oI949HtIc9iqPkzA+QIsariJvbAUTdbtrQh3cynlMh0A6jKWqG0PK0gN9FYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZ/L18l+O4KopMFWOcVrhuwM1EKBJDS/GQR4FYuyAnE=;
 b=B0h0Dp7woRj+vUOIk1mOk6jKrKf2jExWqLbQcfLq8ZQj1q7Jwo80OXiHoOceEAy0OvSeU8jecJcIXBDUrPFi4ubeySrPr1bHrNEPVTHG7+GX4DW8gsZEdmKG5/FSe6jwycmz7QBKymmFDU5396QkGu9Cpr/AcbM5k3tDDUy0jAFhqAv3SlfSAmgxDmzwI+uHMowpQE/Wnf6H3MyCuZaTz3L+l6KxnnXDN0COtzMTDVI3qlYV9JZBsyHXaDfnQZdCaewxzqcPO5A0U7XaKHXP6nZGPWUcWonyDkFfJu6k5cjE33ikLVi3zu0EgdXFH8BHLjxXpa6T8fQZ1e42KdXr2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZ/L18l+O4KopMFWOcVrhuwM1EKBJDS/GQR4FYuyAnE=;
 b=lj79HCBgd352Zv6S4ifMRA9i01IwjlPGl6B10CzDr9z5usTM23QbypuliAeZG/y9167c3pM4B7d76oqeJ9cFHwG1HG39v9JZmlp/MumuaQf0ACjgdzYmIhAsJXnzSwGAX4nUlxPsjGJK8TCng+f9X9Xuc5cYg8OrahpNd7K2Cntdyw6bC/PkOGPrxQ06rA5wkpk17h+cNsaiEzRmCDjU+1IFx4WICJ7GCdlmzu/fkRrbcL0x25CuF0LaYD/qZV5SiM4Hc36Ulss+giNZIjrKVm6m9zGXC2900Tnzj2Xx03E7MBnB9bE7A0NJtUOaP0KnNyjbTMqUGK8BE0c7jufTFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by PH8PR03MB989113.namprd03.prod.outlook.com (2603:10b6:510:3a9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 02:18:05 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 02:18:05 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v7 1/2] firmware: stratix10-svc: add async HWMON read commands and register socfpga-hwmon device
Date: Mon, 20 Jul 2026 19:18:00 -0700
Message-ID: <a79aee37be7067691fd02a3a9cfd134c995e5a95.1784599864.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1784599864.git.tze.yee.ng@altera.com>
References: <cover.1784599864.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-MS-Office365-Filtering-Correlation-Id: e992185d-9cf5-46a2-5e89-08dee6ce4c1a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|55112099003|3023799007|6133799003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	3FUXEcvvc5VaKa62i1Z7XcSjPY4Bp6h+Rq0iCWp69D53a59syhD0eyrQS9bm5LI2+6G/fl07h0uicHiF83sJWqfFrtA+FQOKRj8Igg2tUD7/LlxygSM3maNYSNbf1hdKkNQB4x/tHbtsPdzM7J5Z2d3UP8po7E16EDMCrZk1KSM+dy/VosOGL2qvWBzNLLI+BN1wYJi60DugFKPp6ireUqRpA/vkA0MK+s0sc2upfUOPPuhLbIpxC+dNa8JrWsbrsE16H3YRmmONPGZ+KcJo3vzVpaGLk3F08VMnMCZFCyokrZNov/aNgeYjIotyUzZrYGOOS8vF3uTtifPUZyNJbHo9NIX5490VxDZBDcrQ+FXXesCwn0tn29Zx7xMxO792CxEU5PrBSb0YWJkG2CP+fDSmY9jnymXknTWK1fzY92dvqEZ2aldrIgQaVVist9+lkn9aBVqI9cw7b0SV5fXer24OHWYD0xU2JkN+Cl91tMOM5Se7p1hoUsdzZzeS49fucC6K1idhFBr04VRVsg1caLbCEXBHSiaU8z6TaEGchZScNRzAn4xh8Thzhfm2tldn0dTFZXMm/IpkrF8PdlJGYwpBfbTSl9sjLxum1qPjrlOAJsk3mogxUEizG0RIZLGs7Pa/Ft853gmvUDQk1EY+S4IOrxMVXion29NV2nTHeZs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(55112099003)(3023799007)(6133799003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3WAzwdpJrOiZtuaWxb712JjmoS/DEavY87QtInIaif76ziqBmtnQw1/B5d8K?=
 =?us-ascii?Q?7F2KwJj26pPWTn4lf77mfcGHFHHyOO18ALoFxQERFCL73BG3UnlYHMsAGbOq?=
 =?us-ascii?Q?gecvJ71hPfMqT1tKAwx1F9oS6DOZAp5qLWelGhXHQUBAJ80pPvJYKAXkKafO?=
 =?us-ascii?Q?SDoQ49L9juCp8P8pV4mssZHuNmvF1/RkyJB3JPGSnZ4HjxqhIb7PdSXygG5Q?=
 =?us-ascii?Q?wYk5oe97JGhF/rz/uxR/zwEzJbo5ZVW/PSbvvX3S/lQqBGTHlC6HBSt72iII?=
 =?us-ascii?Q?jdICVle3Ti+dSf5mHDC43bd2QTw7ooY08Pr6mZaompOJGN3JSlSmmyYudlO/?=
 =?us-ascii?Q?LF4qor0Usd1DIz5No6p4sqC6lr+RpZMCZgurw05IqH6AA/dXQV+hkCCWMv+F?=
 =?us-ascii?Q?cAR2qf8bHTEfG5Qng6Xyl9UExlDpENPcB2knb/kOO8NWNxZnKkOjQaWY89zp?=
 =?us-ascii?Q?HgToouoOj8RR5x4xPiG6L2Kc9pmrb/8tXwWT1i53n25H6NMXyEMpiyMjeJhn?=
 =?us-ascii?Q?FGma7hfDMxhvKC4SQe7NMC9wBGm9Dj7YzZ8ERDW/rksxCAoQVpTfaP1s0D97?=
 =?us-ascii?Q?bHVEWPy3qxftGVaZvKru62qfhwDJQ595FTL6+nBGnCqKQSOQhSe53pt204fI?=
 =?us-ascii?Q?2Q/sytYTQtopxzPFOqiyF+7bY1mGH2wzS/sb+OAqJlWDW+jVvVVjrsTJehga?=
 =?us-ascii?Q?VITstEoclyMiL8cSY9yCGQW/tj1/uvx6uUh+xAw3jsyr0ajfLc5QynVLjmUK?=
 =?us-ascii?Q?RjDg91pOEOGgNL9LZtA6Eobjzcqwu7UgD2sowKAYLYR7wD8VODuGanC7xLC8?=
 =?us-ascii?Q?LPk0iVfk/Ig5vJIPoJwN7a4EWxncIKRiNibNLvM/f4nulCeTjKcAy+istCTA?=
 =?us-ascii?Q?EySnkKzsfuqHOcSj5sZCIDwW7mFGZQ9za2yb3f7MTtRGDGUHN6vm6amorlh4?=
 =?us-ascii?Q?E1BM2Ci7RVexPqGPSBD7kon7UIRzKqyJv7K6rDX32t4PGzcwM/zY8ssh7pE0?=
 =?us-ascii?Q?S1wjbxBw62M+cLiS/FkUN5mLTIY+V/kQ5JLt6I8AxbtcYLTGQHgeULlX0JeI?=
 =?us-ascii?Q?y3EUkY/RQxge6uncF53r47oJ1At0KlD5laS3Nvo+3VY6WHghK2Y2OZwhHnJz?=
 =?us-ascii?Q?D5oa/yFyBD29zCssE/i4b4EZuh7TE6h0ICJWN5E+qtdZwt/BYJkastRaTXPE?=
 =?us-ascii?Q?YcZF/ftUwxQTD95VasVYzJnkAwupiAgp2yULKA50cnFJ+Mr+hh+gIGxltOAO?=
 =?us-ascii?Q?FziqSMCwwn+psYn0Zhm+u/g4cVnFcJ7s9p3GaFC+svTssIRikkXDr22VLEnj?=
 =?us-ascii?Q?AsLPPNeJr/yhZ8YmkzIbfw2W7fgxL6XE8utxDcg14sL0nMQadEK37KgGV9F3?=
 =?us-ascii?Q?hNMlTXwZ31iL2IjNJXHWq4684U6+1REP4DGEXkPp6cTlGtPqM5XGGTrc9p/Y?=
 =?us-ascii?Q?pRHjVLDroz8YbVc3Ljw7sRKJ0TwjTshPgO6O8fPJh7KU0laglWI+fbhs+Cb3?=
 =?us-ascii?Q?v8B6Pey3sElKA96pKezQi82W9y28A8HRKKGbZxw1VuYgkPYZphDRrPc4Tk9w?=
 =?us-ascii?Q?MOMXCtY4mRSIqO413AgIt5N6Sii3eErmTadBRasiMpBPGMfrqQYlChGmUKc9?=
 =?us-ascii?Q?0hZSllbxlYhlr3qrux75mQU/sLMGVUZAdUCqtug9H/5/dkc0hvU/QZE6Yq1P?=
 =?us-ascii?Q?8FzmcLiQaepcfwqlpLtzQ2EBI5LAcsmNGIFprH0GKNPiiPTuD2uJnUPRRig3?=
 =?us-ascii?Q?KI6iYCrnQw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e992185d-9cf5-46a2-5e89-08dee6ce4c1a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 02:18:05.0730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2WCrm2rH+0s8y1v4xr+tbz+bsRFXlRuENsJoLXcogJPBI2QD8Cvn+qoNC+GarAUVA4hrqDvxYDpK8gJVNIIzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB989113

From: Tze Yee Ng <tze.yee.ng@altera.com>

Add asynchronous Stratix 10 service layer support for hardware monitor
temperature and voltage read commands in stratix10_svc_async_send() and
stratix10_svc_async_prepare_response().

Register a socfpga-hwmon platform device from the service layer driver
when hardware monitor support is enabled, similar to the RSU device.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v7:
- No functional changes from v6

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

