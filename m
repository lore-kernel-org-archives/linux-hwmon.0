Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F86B3655F1;
	Fri, 19 Jun 2026 09:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781861951; cv=fail; b=N4JHddf562suA4V6lEgc3lTjVUCr7FDKJZjKxL8v9JizAQUow5JRgkKL83Kap1mhpjwmUeudGiTTmWZO9OYcdECkA72t3uP6bLG09YR0gfL17URf0xeqfYIDrjqw6tduJh2HJS4uE4+R9cKNQwlasvX73Hoe8reGPE/95u47W7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781861951; c=relaxed/simple;
	bh=DO50fO19z6irgEZE2+2qvM3hf8xJ2EhwP1/lvmReoKA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jT6zLHyq5CPJj82UyqcOe3bxdyDhNuxfAKl8xxY0PjZ/qIPeZMrHSzLQjpltD0x2B93cZ5BVxNBu9AL74kbIptZ0a/19r4BWmCBE4NoDUSE2YMo1IPMFoHI5RTGH1aynSA3X12gzIyLXvQfglhsWD5Mmqe2OWZiHnQ6Qz7qVaq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=PdQecuxS; arc=fail smtp.client-ip=52.101.52.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="PdQecuxS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTNwLxarHIgwEbAZrePuXahjCttz9urvzA3Xs/l4jeNaObWA8rG6pRQWRdpJQagOPdxwHTeQ7PWzmoqklN6YHmKLwBxhu8ptEOEGAwwQxZWUS+08OMvli6pN/93ukZNuiCq6U8P7xzZ39MBD5K99Jzc0oi3UGiHfb79hMQJHQYN/NmPDnzv3OyLb+LKJ1tjDbN2sE3D1WpF2ZiNxJwK107JKbeqsnPxynIXvTMwRl+rIS30WyaKaIzFurHFtiY81WAFeVVM1fgbntjrvYstIrqJoDu5rlO1YMNdIKvxW3IL23ZUF8KhzOsN1aKxtGCOlYpVisdf++eA9RyfNDcqhyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hs4QKxjuT4wFG1ANaKEyVDjcpfRjStXFe6pbKSokUZs=;
 b=ECgBwsyOnWNcPxNAW42dchjKSfN+dSDtpGLckiUXlh+rBb4CpQ0X7AggfOAnlgsal8bwFxS4vwGWVdLnUUqhZQw0mpx3zZu4VpFgojNIvhl9Cnp2dHLJX8Y40XvWml4Plhv8VWJDdIY9tUY5u3BJ67cFqK1l1juEKZrxU9wgjPtWnuYmBG4hcBeqtpf44x+8ZVisoqKGks+UhlCT0W1UfsGJuPmABdQbycNJRyZ34oYa+B38tQGs8OOyTbvChzOJ7HwcL/ljuxrQZYbfdOdU/YkQfZNU9+/extuFQWBFBpM8iM8EEYRnExXZldzSEQ6lifiOkB/mxnyaA1Fk5W+vFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hs4QKxjuT4wFG1ANaKEyVDjcpfRjStXFe6pbKSokUZs=;
 b=PdQecuxSdfeFYvlC++c0XT+4D+hkLheGVctSYD9KkEvjamDdyN86Id7krhInMxLfwIrFun5d36tUKuSRJlCZjjf4Qyj1L06ngivLPQEhUlAj9M4KywUxpKYvBxYtpS5dbZHHKoSfyOYdwkHfBNyIlAO0gdR7xjvlsnCuXqJEjWHKllSYqVQ1hNDtGbQxaRhTrhYpgkXWmBwYVksNraS2a5lsyQrz7vDq8ZHVEjmlz/YfQzaxLRVbgFlyMzdpYshaypvPihzJORqQQpw+srk3t+ao6CTtYlvv8oEsOVFHDF3OY/f6wYjTF94OcX8ayPWPpmzdJhTwpOJ3LZxnrWacJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by LV3PR03MB7562.namprd03.prod.outlook.com (2603:10b6:408:28f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 19 Jun
 2026 09:39:01 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%4]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 09:39:01 +0000
From: tze.yee.ng@altera.com
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	Mahesh Rao <mahesh.rao@altera.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH 3/5] firmware: stratix10-svc: add async HWMON read commands
Date: Fri, 19 Jun 2026 02:38:54 -0700
Message-ID: <69a0f1b93e1dc5b5b8993f8649704c6be60dc1a3.1781861409.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1781861409.git.tze.yee.ng@altera.com>
References: <cover.1781861409.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::14) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|LV3PR03MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f58e207-0ecc-41d8-2e85-08decde69800
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|7416014|56012099006|55112099003|3023799007|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	93ub6NRfENFUjerjGsSNZte26Vk2/uxqTWyKXVtXDXUboF4tvTcBL1AyoWF1RJAgFVhoTWCLQrzY2E6uvMqBBp0xJnRE+jBgMEhkU7ISxsTK6yMSDCS+ialuMHKAYsxwWJToj4+4gfUe3WlrFctrAulB41jcMvrOWGoxQh6wq9EUiJbCTL35OZriXT+yIT3K4ONtp6M0IAF696SqaAmOq17lTrl5k5M3k4oo09ZR93ATJhASqMCjAUvMKuF6fCawLm2bELZMI+Pi017xCEP+ytrWjvbM/gvZ6mf72beJflIY1Wz62ym2GXTRedW13B5NAF7QKOJYuSm1B6x4SnWpx2mxIDZKgbmKL/oyHm8BH4QGp36XKxpgcYDQW96hHMBBN3zKMP2PSf+sF1G9ycmFrSy13ISxMB+dt8A8kVwuHMgr9yCZSvxwnZjh0btkktNm5QP9EN3Nk4ynitXz4/Lwr9FjRgzd9dQm0q6kFWTLTQJ11PXmN+wnQOBVsDxx/ryBJbuNrl64We+656jbRrPFj6rkwrAdSVl4fE2C5akcpLCphXcUGv4g1jdok475M513O73iozVxgfTiDqfaOC06jT7qj11Wddv8jTlr3q8CZ0shFZz6bgMedSlk2elvcWwbZp5833jCWZvIHSBCu5CytL8cFT4aHVSi9NOverrkVKbQqOdfn9ZgJscz5xg+glWHuP9F8uUpH40h3unn/LDFBA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(7416014)(56012099006)(55112099003)(3023799007)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f0Xv2WKF1y1bl7iJzhyWdImGJ6xhW69jW8mS+YRZcgNRFbwAJPOkgseLwcT5?=
 =?us-ascii?Q?Dd4+D6uj/4W8kpDG5NlOEy9qzwzSpY4U3ADdBBivATr5HZPcTWBofb/SaKov?=
 =?us-ascii?Q?J/cJrcrom2hUfXNQwUUHkLPqi1rkc5ndSQXmbsmIVncifk5/qtP9CE+Q5Xts?=
 =?us-ascii?Q?pbeSJE8sNJPz/KM2etljsqoDEHXptKj22RAMusPoFoVI4nVAJksfW+6yM00C?=
 =?us-ascii?Q?DZ3eoR4whCcl1tbXoPJHipHGKkynN+j8RgJ9zmaBrSod0NE3bYb4Ld8CV406?=
 =?us-ascii?Q?Eyeg355dGiFNLbd5uuzn+TvFTX7fWxbeahTg7GQY7cRaak5uA6zqL0nd5fKz?=
 =?us-ascii?Q?6G27qUAluEDtVftl4Rt2qFHwW/b/El0AEb2iKTU1liceuQwE3q1nOXHhF45F?=
 =?us-ascii?Q?YICsSiQaZa7N36lDL3jWNemZTAyQWD10OHFmmZpTSt07TdV5EzOFSid8untq?=
 =?us-ascii?Q?qWLBNcTP3jOT/nRmKjeZvKfQfr7pQgDOQXxwmQwu3bXd2hUSnFA+hcklF62w?=
 =?us-ascii?Q?kVVWOKpuvw0Ao54kihW/lbZR7+00lsiXWkVB5yrlCsQv2FZ2LZ6qTTOUu1HC?=
 =?us-ascii?Q?AsVCazAWuITeGG/enTVCmo1wpMpKcC0bb2s0l5Y9SGZvrUrzY5lHN/mX5JRX?=
 =?us-ascii?Q?0gXxzbfRefQiBFNwYJu3rS1jaqys+WY5pXG/+9ftGWExDZU8MRI1ePIbTEQ3?=
 =?us-ascii?Q?Qn7UtNUmjBG4v7GFiK3Sr+gIV8bq2T/LtP3hF6So3k7BtZMbbCVRKz16zB2A?=
 =?us-ascii?Q?7wHXUTzZo8CPSiTJ2CKM/Y86kj205jdWx3v9qapF5dYDDGitk9dH5tTaS51i?=
 =?us-ascii?Q?uuIv1XVWFWzYdONXO5rjkNy7YAZ2y88qiHjzLic1aZ6VJvAsiri3jeIegGY3?=
 =?us-ascii?Q?8hVWFEUJJLnVyHsaUebpkIEEKc2w/7HTASFRcsXTRFjXKnWMkaFNwWb7pKS3?=
 =?us-ascii?Q?cohO33SQDmuvpYYWkWU40WQ1CInpJThbyEjIFqkfcLUNgHJsKwZdgjIbAJUV?=
 =?us-ascii?Q?U5sT5QRFNuEC/ecZ0YfLGDs+TwxFVpHq7RLwaQg+TsUtbfV1NyozA8uUh9p5?=
 =?us-ascii?Q?vkJUpJGVNSZChgYIwHreLOH+EmyM/stffthHZcExnDOeRvYa/MbQL6FF+6F5?=
 =?us-ascii?Q?3Sruzi9t8n/9llmyvDs4evI62m5w6Giq8UDAKstQJqUp9nCdzGmnQvEeLy48?=
 =?us-ascii?Q?fDXL+dgRBStAxhHAr7qoyvYEVE13T4fXt2QAAZe9ezjrW5G22DEYnEZOq4E2?=
 =?us-ascii?Q?ezEo9yaBzRF2RD5TVlzE6XHKNu3P3zj+3UbCMGK192/DSnBE4hW1misbgS8B?=
 =?us-ascii?Q?kJS0cUpJPoCfi2996HuQK2uZjQiiI8/adNm0uj8QkF0UJRCeSuvdipWfvOmo?=
 =?us-ascii?Q?AzQJQTIrRTorgCDW0IYd9O2YelxHXSH3i1AxcFvATY9LTTabu1w8uA2b/T5G?=
 =?us-ascii?Q?3hW7UIYMmfuIMCz7q7Loc0aHnAfc4DABe4uwOxznNPn0wyZLmm2vI8svEM7s?=
 =?us-ascii?Q?CfGGf/TnBI3ikFzDRfssD543+w8ilqLXVyrtwY1vCJxYvpliEdsBNSP8iO2r?=
 =?us-ascii?Q?N8ESNZKQcJoDjXb5eQJdjwCgV5lRJV4PoSFFWZIS300aPp5RuwWlL1ka7uMS?=
 =?us-ascii?Q?M2WFNH8GMP9o69H0vg96xFe1BLw2k/XN72kKahF6C244t0NNvJ50hVNL9Puq?=
 =?us-ascii?Q?JF7dTSIRE1WXlWXrQgqm3pKsrGupR5NjurlP6pgHa06Gg3gDZRB3s0SXkkt3?=
 =?us-ascii?Q?Ym50GmPOow=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f58e207-0ecc-41d8-2e85-08decde69800
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 09:39:01.1111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DBvDKXQ2SzGlXQuUU6CBEI6+ZiL9Ah//79e+9svuSjL8ApCOTdsS2VnhQ+GiqDGu3YKT6XNgXbavuMl5QcAPUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7562

From: Tze Yee Ng <tze.yee.ng@altera.com>

Add asynchronous Stratix 10 service layer support for hardware monitor
temperature and voltage read commands in stratix10_svc_async_send() and
stratix10_svc_async_prepare_response().

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 drivers/firmware/stratix10-svc.c             | 12 +++++++
 include/linux/firmware/intel/stratix10-smc.h | 38 ++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index e9e35d67ef96..2cfdac31402c 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -1311,6 +1311,14 @@ int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg,
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
@@ -1404,6 +1412,10 @@ static int stratix10_svc_async_prepare_response(struct stratix10_svc_chan *chan,
 		 */
 		data->kaddr1 = (void *)&handle->res;
 		break;
+	case COMMAND_HWMON_READTEMP:
+	case COMMAND_HWMON_READVOLT:
+		data->kaddr1 = (void *)&handle->res.a2;
+		break;
 
 	default:
 		dev_alert(ctrl->dev, "Invalid command\n ,%d", p_msg->command);
diff --git a/include/linux/firmware/intel/stratix10-smc.h b/include/linux/firmware/intel/stratix10-smc.h
index 935dba3633b5..4eb3a6e9659d 100644
--- a/include/linux/firmware/intel/stratix10-smc.h
+++ b/include/linux/firmware/intel/stratix10-smc.h
@@ -680,6 +680,44 @@ INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_FPGA_CONFIG_COMPLETED_WRITE)
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

