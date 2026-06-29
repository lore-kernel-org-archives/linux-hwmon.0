Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012037.outbound.protection.outlook.com [40.107.200.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFED03D47AF;
	Mon, 29 Jun 2026 07:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717904; cv=fail; b=ma8r205fAIAJtidYfCTQ6izTqrqr/QA9BI2HQW4nnr50MTt4hLBNqdLq4iXCjvQZKv7fOnLCIsFOZVufXSfQb3K5WCD8BywZ4zutXzj2YVmKIi3TFGSU+Euqc0BShp8yNPlcbRzWRzqLjWcwzrFkAHUkZ/BB2s3Idng35Wyij4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717904; c=relaxed/simple;
	bh=t8+58R5aJk95JglvqPVCbVp13gQOel9Cvlxa/WsQf7M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PkyurvcrPPjqnVp88advKNfCbHA1Rskn5ZCj6GalwG1KEedxKsf1tqE0FbjSYRjA/yFjtRUehPAfDFktjWkKi3iRwJjUpZYfw4//agNdh3XmeX2XYLf0T6R5YL15cN6YeGbvLk6Z5XiValRLzIcy8sjBCVbw+Shl/V1/goe6/00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=dSXLOAnm; arc=fail smtp.client-ip=40.107.200.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="dSXLOAnm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0S9Ox4yVnGm3cDvTFo1oFI7URTpAPGPxxfj/1tJGO7pUwcaYeYVbnVC3WhYD/DaScN7bF7kyvHV7CUkx8LpnHR6WG2nXnmiN7UwvZOe/7jm/7AWNA8qUuf7WT1CWHo49J7Pz0a1//+6lPT10P33oyNEwE8h5KWdyBKwCljQu8KYNmT+SIZ4xWiPmFTQ4MABxmUkafOi7msq82s7jV3IzAcuPkYQi3JQ+9nugobiYACQwuTAmRhQu7b7SUe0nOBTHxNPz+LhicMdq0tL5RKyySIHmebQ4HEUizWF+TbKvDNBQFPUtowwiG6XDfG73Z5iypwtKa4+HPx7thX8BSIn7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFzqrEY7uJ77vk17i+s2XijlFpRLuyzrmq4tNM2x4kU=;
 b=VG4ixvmhg9JIiyXEFjs+SfO60U6b4mZdBwJwLj8p0OQ5lnnE+ZLs39ka134jns9wCiylTB7a4Atax6BwgLrXiVAFiH/+YTqzclR/N8kBUW2kz+TAscxKcb4Da3pwTRTtevxpy+tqYIIkO0F/ci+wGsEtx9aVC2X667eD3obcOOts65f5Zt7A5wIjluBtREQE2zQpeFuebKrliD5qkKLZ2HRhxVm7fhunf6gdFCYb1dhgpRURHsGlvt4DeDfZw6pSm+o3G7hvk+mwezJ5ntz3+RsUOKwfVs0zKTsYd8rN7hbDSmKqwpeF3hT9lVLnCnkuJ3ECrZDI1E+rGrBQRNLCIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFzqrEY7uJ77vk17i+s2XijlFpRLuyzrmq4tNM2x4kU=;
 b=dSXLOAnmZQ4aDwmCqsrlNoC6flV/SwHTeUmX6ttY/aW5kMGi9pCXCQyHmHzf7gJoBPZNV5kJwEg3nFR+PNwMZpxrAeBP0X3vkVyeO6bSmN6g9sovVVqOPxJDhSVys81WRnUjIlgaCPyyBXLk2/BcJEy1Q1HRrXBvP7YxfdOTAwnmZ+snln75HuwcsVVXWKI2YFFEYbfDxGjcGl1WkDdwJqBZs4QsayG+xbq3ctRHfJkt7FhzTgCP2Pmqlt/9iKQlL6FR2dfjCvBwucR64S+oEkG7Eaf9mT3kqgYjWEUS6Q8CU79mLXBELvyUn+7Pyc5bXTSzF8mj7D/ZsUZ/lAQmNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DS4PR03MB8376.namprd03.prod.outlook.com (2603:10b6:8:328::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Mon, 29 Jun
 2026 07:24:59 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 07:24:59 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 1/2] firmware: stratix10-svc: add async HWMON read commands and register socfpga-hwmon device
Date: Mon, 29 Jun 2026 00:24:54 -0700
Message-ID: <d8a647b3873f8e1ee6b3efb22b5aa34c34146ea5.1782715159.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1782715159.git.tze.yee.ng@altera.com>
References: <cover.1782715159.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:a03:505::29) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|DS4PR03MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: b67d2c76-ca6b-4df4-d620-08ded5af86dd
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|6133799003|55112099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YVyQE5e2peiu2fRwQKg/xuNRGSinruktCWkxbtqJ4o73K3ZTxSimQ2dg63AuFhvSE8ml9sSg1uvS0FR62QVpHYaZ8Edii9DoaKuWiu8miw3EmrR9ohxAKdSfhbDOjpkweMZQWCuYITBw/owlX0Q/+NWhLj5Sw3zgYlvPVx5WVe13N1AvRcWyf+L8e5gj42UbsQqasZkw9i7FuWaBlGI7+kd/gRL5jCpO+yAjHooZ3TUKw19byIC3OAPAeiBprh6jzUtFuJlwR0ViUoMilpx2gPGmysSP0S/jdPnaBpNaYiSkBypE1TyMDHpQQH7DuGoC8s6JU1L+C3ifrf4NBGCC+Yc6bsvfG4TdWgdg8GmE73TZlx3QKuC2GZ5i/TJH4owCa5pz7zIA10+s7SiP7hWnYyL3lIJ14U8qDvmIIcq3yRRWEVUzyZ6UFyVBNfC8vhEegMbGD/QFJpsGSsM5o2YRjqR7YbAvnkt5XYYbz6XRdl8ZnbqEXrAhQFdGhL2Lvu3T2OgwibQL9czprefcZdfKUKWFlnecBHW+cXlQl521BoCdD3tsVyV4Nz9XBfGZhESbXT/4Ia17pLxx9u8/XxvyDyzgwk09DjAaK9tCafoYNxVwY5G+BHbsbcmm/vY1gT/V+cx2LbGk9DUxeoyDcwpY/0OYGepdCrCVRZ0nmvEfJnk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(6133799003)(55112099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WdM79OfkDE6SCvkvOzydKC8IW3nKmRBe3T+9HdDh/1jdUEgN19pww1TJ8hcd?=
 =?us-ascii?Q?hNXVeqlo6iT0LZbgLSZOXivtfCUcKanvHNPxm6+aBoEmlsw4wyEBn6855X9o?=
 =?us-ascii?Q?fCr2LIF9NBiT6AacnY5qXmYrazOWNzZpnck/JCSW8gIjfLRQgh9Xk1jI2/X6?=
 =?us-ascii?Q?jUbrVnWeFQktsN5d1zrDih8nwyz29rk3fuXDroP9j0k1x4roVbixd+a8b2XV?=
 =?us-ascii?Q?102CXKrkQ21pvfI6NYvWKni3EIZxTtQl1Rj4d0DxlZ2+MVFX5wZiK2DRdNNq?=
 =?us-ascii?Q?Cxt1A+2P3/jvl0gh8ULn3CBMVmzGvOXzjqsrYLxjavOplTYV1ZfVeDfcn9yX?=
 =?us-ascii?Q?y1oIl+AZJ+nMckeQIGAnZZkyT0J7evPtdo/m/X/6yllnYhZecy/cHe72M5AZ?=
 =?us-ascii?Q?WH/zujXSOumSkifqcngCCm+84WLcVxOtJj25jt8VxhmybCsIoGyJZs5MFt4u?=
 =?us-ascii?Q?CsIdJJa/ixMRHJYbdn2X8rQbyxyuGKEdyhXBlqGVfrKzs+cbAtr3JgKGiV5i?=
 =?us-ascii?Q?1fpUIZA7Vlb6Rq6PwOxsuXO8ikkRW5eF+/IUm8jZ0kBDO9jKu0E37msuhAy6?=
 =?us-ascii?Q?DMpkHU0rtHAz+79nIu/ll7oBlUctSiAjLWRQEJN5gJynkDTNZ8NlrP5aOvxU?=
 =?us-ascii?Q?lYXHhMQ/nwJP+1ib4rFeEuYnJ3qfeir9y1LWOuO3ULhbQ7svtHEBdxRL81Qx?=
 =?us-ascii?Q?zSW+prMGvD60LXOp+wybvM/IwSlpD6DBDt5uhxqtUN7x1/lLOWNeV+jDLW/b?=
 =?us-ascii?Q?mTr9gTtCui+Z2FIIz3MprfWQGL0CrXGdFhr4VLsn6OB3Seli46+x83YOzQUa?=
 =?us-ascii?Q?0rY+lFAm5KUIj6PX8S7MrOpWz6rRh97bNxPEVKu5K5yitxJXK+avGRslzyi0?=
 =?us-ascii?Q?TraU5uRMU9pkLBzUFuBCASBGcRYJuiHbnpkgpyKD7zMT0Z82AQzXqYdL1JtI?=
 =?us-ascii?Q?NZHGoX3/an0eiJ1QyEmmG52YitRQJwtxVQ2HDOqR6Dz9t6JXwLDA9eX+xZBQ?=
 =?us-ascii?Q?JtnjXdyd2mQhWeFr/jYZmjW2FgezgN395JiV3WA7fd9fUREY4ob6PXCkeAVj?=
 =?us-ascii?Q?TSDDbgBFDKkg/X0cK5bYQfCW2v3YnYmugO/uYIM+AoJF2iziBgKoWn54bAmf?=
 =?us-ascii?Q?uloV1F0Cvlu76N/HrznXZYG46/SjnLfSdt14lRo3iPs2Y+6g7lCmF7kQnM81?=
 =?us-ascii?Q?y5gN83alTu0ZtvK7AOC0qJYBmGXwqVtasfUG0LOuCE6z7M+INXy9Wj3mFr0e?=
 =?us-ascii?Q?Uh7USl5O2Ql49KxpjylJrpsp3Cowc+Zbl9QDPnlk2S1IuVSl/J5NYFTQgi/I?=
 =?us-ascii?Q?hz5Hb8KWWYmRXMeTE7b2fui6va+4Nox7FKLrn0v+wEMLbMgXRgipNCMvtreU?=
 =?us-ascii?Q?tDQWv4WgTqSF5jReGQiVysZhJX/BHbQ8Qfs1lf03uAmj0Dcr833HNHxDCw9S?=
 =?us-ascii?Q?dy5gnUPevE0YPk9vzAL+JyrU4SPINeiytQlYBvsi/ej23ILeGgIX8R8WRSk6?=
 =?us-ascii?Q?21k8bRwPSfRbf2jsO2vRDv8ZzM+uGf9iW4uU2j8CehR4WHoUWCa+wMUfc3b7?=
 =?us-ascii?Q?Jb7dxiQUNO5rVquEwahYgdH8Nskh99yNis1+k8repM1uotOQNwi7d9atl4t4?=
 =?us-ascii?Q?tFolyhIiD3MKn2ntwM/+ODEhnrNqQBPtcbeznfecr1ntkfL15JfIYQOk5HzQ?=
 =?us-ascii?Q?cCRpARJwntelhisxWrzfoM9uKr2ZEgtcEoONocK/7qB39fGVTViPJQh1I9ik?=
 =?us-ascii?Q?6zvO2ik9qQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b67d2c76-ca6b-4df4-d620-08ded5af86dd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:24:59.3305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xu9WIsES8A7b8l+WNodmIdE0s+sVdtUVPfJyNW6j6L/nmqpFGluv1J00h/V8H6jOpOlmBnDI/r44PfiRqzUjPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8376

From: Tze Yee Ng <tze.yee.ng@altera.com>

Add asynchronous Stratix 10 service layer support for hardware monitor
temperature and voltage read commands in stratix10_svc_async_send() and
stratix10_svc_async_prepare_response().

Register a socfpga-hwmon platform device from the service layer driver
when hardware monitor support is enabled, similar to the RSU device.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v2:
- - Extend patch scope beyond async SMC support: register socfpga-hwmon
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

