Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010002.outbound.protection.outlook.com [52.101.193.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274643C65E0;
	Thu, 23 Jul 2026 06:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784786539; cv=fail; b=X2SpAuWzL8226NobZwXu5H0zUZLEY9Rv2PV68m9UsSOv5tRifU1+FmKmcUqgcsUQrFUl+2I6XNKIyZHbgq1p/Z0PolchDBNkIOXgVupUGdmFj9pZcPRN6chnxx8nM+oVyhUZezkLjJqLMEab/XGoKRYxjkUv/hm6LsYNh9QIspc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784786539; c=relaxed/simple;
	bh=JUykfl3oj7KNHVCAkUI7o142G66r7YcqwoZ71LrWGyY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iRGdrhCbk3xgcZsvNoyjxHp2XKsm5InIoerS6vrUqoxZ2eJmLRtCtFCobPHec9B/S4fEceEVd8xWEimGFoGLPdooBgPgkv6XH6U51Ya0tGadqCYN2WARGaSyeLA6TiZwXs8XBs+9U+jRsm7yWPl1l7ULpFm5VZct/jGEApZV1+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Eg5WtZl4; arc=fail smtp.client-ip=52.101.193.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Eg5WtZl4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujR8CzMoNZR4TKi5vTrsPv7Hd8Ke2XC/4uEfIFe56zTRVZHDbsK1wtRz2hZRK1aFdZKql5EmY8glF6BXuvn1nmWxxRyJiRBwFm4IJ05obf9/sVuLzUN67SOQ5PadunY7+uAkuByYvw5B847Ml1ZwOjLAiTOOCpXUD5bH3BDsKfr/TVRY+BEXgYAQk3RBvgP2dVEA40tYoMCgLWbGUtQQffg16g3ADmCx53lqPIJkGIeWn7vNDjL1dzU4cYxGjxgZpO4Y1/VWhU8WQKhVlgjdqyZ567n4p2VcBxysCuSS7/mSa4X0WqOhDOkRQwj+M4gXqbG9oZO+5aKyRS7BKIR2/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CJURcxewmfS7HOeNSjA2UcRZZnKq5nluXZET37gGiM=;
 b=VP/5/FdntcL/J66ghK+65joQaDySo6ErjTafucaDWyzEPDXdpwciovHbg9Iy3rgoWPXHDMASNgU+3osjyV9KDW07hQBqx3fiKumEayFg3C5DhgQO62C5m8w1vFRb0drq90+o9wOohWkO3tLac8aiIN/ayFZhyyoDwz+WWA9cmcNJZkzh9OCrX0wJCTkHerHipRexejehjS1kxIUKng4eFpHaQ7n3TVIhrXgs+u+vaWCAUn6d6xtgShZCR9YczDGJEGjaywlrduPuYNZD+/JjVRLAEgdI54Cf6aEbLN9WKlZ9SUhHwKTKyDvHsixMiGPuN9n6T6c7r2VKvo9V+MeeXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CJURcxewmfS7HOeNSjA2UcRZZnKq5nluXZET37gGiM=;
 b=Eg5WtZl4/M0clNSWo6CQNfe5/OhuNp0Ili79/8YEPpVxJ7GJ24WO9xTNlH/Kph54kjFJ1eT6VHGoMketSKzOdME/v8TYZ+jAxasZy/Nao/Z6cKJaqwGVknLzzGf5SsthbwCZ8PI316o0jgrisczl/KiuXH9JrZE1m8QtjlTOb1Vq2PrCPbd/XeQqWyNCgkWvbZr9Ey64dx32Nkvle51jWGW1mNKJdzQ+OVASvQjFAiY0xavaHGEUPoFRnz3ABhXCIiMGutPufHPXAVE0/mJDAzdpQIadWg182lpVrf5jn6R48D5A1pAVBPZ75cYjQQXMMxRkUKtTtN+NtgCT7G12KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by SA1PR03MB6452.namprd03.prod.outlook.com (2603:10b6:806:1c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 06:02:12 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:02:12 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v8 1/2] firmware: stratix10-svc: add async HWMON read commands and register socfpga-hwmon device
Date: Wed, 22 Jul 2026 23:02:06 -0700
Message-ID: <a79aee37be7067691fd02a3a9cfd134c995e5a95.1784785709.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1784785709.git.tze.yee.ng@altera.com>
References: <cover.1784785709.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::18) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|SA1PR03MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3d57bb-b6e8-4822-ebaf-08dee87ff00c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|3023799007|10067099003|56012099006|22082099003|55112099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	byDt8PRUH+KOKMUfkR+hWYvRPmJ/gnlTJ6AkTu7KvD5kGoIaoWzvs7AWYtiP7jELBw/7+Cqm/Gc0erlUzBRV5QPj0ZVMjvrDoa8tA4WFK938Tn6GuIfuZUYgx2VXW7Y8f5DwX0vl8URE83OVPkbX13pOXgjcsTch6L0wqdji3NmfIhyotZJwnocQleiDTfk2sDY/OqTBK6b+ixQQKPw3yJM05IUpMSTPbZnjC5s4TflBcWdtiNihw3dnapL+w5PKIz/wWVWlbMO8SjD7XE3SS8HQtmX4pbVZ6yPzXpgNvxklquU7zK4B2QdDSPDkdFEFIeyfTING0glqEVY5lzcpibnm2cKLUxRtikN19R1hmrZYJDJFUP+ZazQxg1Q1lIqwJnQCEl/lKCo6iEf+9o2HK7cpMy5X61/05AKrAGx3iDsFfWMtVK9GliZFism1GCmuYbfjCTh/HHbsRbU4G4ejN5a1EXA+e4H0QUIzWPwoi0sb8WuPccCWKCfsD4ut616D5UNMTAFlkrCVxq3Ou3pgkMleqaxtBbaPV+7r8GrLhWJaBHXf6RhHlqHoh1nKi4hPxZy07UpIJFETc4X5duzfWt0Z6S6AW6YOac0uKARF/LlqqhARAk6VKZ7vJx+TybstotpwKR9oFufyuSPm/b/Z4DmYzOi3KCNjSYrqqUqSYHM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(3023799007)(10067099003)(56012099006)(22082099003)(55112099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wioxmFYO6s6anmHbiKFwvb6I+0ABxH5YBzqNgM1sjT8XwR+qu2wYPe6wLQLN?=
 =?us-ascii?Q?PKhJvoc+My0i2ri777/2CL74g0X6oTwTWZetzNtv3ADwMpBrbWndeCUoBBmW?=
 =?us-ascii?Q?oFzpXmROwAr3xPy9Gh9Ie5eGDdswb/D8AAVS4Oi41DbDO7notwsHVOQ6yXr1?=
 =?us-ascii?Q?rmnq+pwgVwgcO0nxTKpcCLn34t4isTEESVvVVzX7uJKo0mLBbwJe2IqXI06N?=
 =?us-ascii?Q?A0klJ0FkmS5WXq2ISVB95/3YMwitwElS9uZOANS/QWp3fODqL3J6aCfZQdn1?=
 =?us-ascii?Q?zqZcMUxykEKbeTlJg0NqOxNIe2GRDr/R4jKfzTCqbOZ+FoRW2fEpm1SV54D2?=
 =?us-ascii?Q?Wd4Lyo+0zQ3XDWVZjp/0BXkajW0hJ6enpHq14cDGokDeSa25q+GTBCji+UAE?=
 =?us-ascii?Q?OySO2Kr8VawyVDKlIotVQrkz4Z88JxHg3epc3KoLVXr96wQ4UKVdA+qGN/7z?=
 =?us-ascii?Q?whToG/8Np2PU1VZWEBt4VrV23TReQVd8wXESEPftCYYexfhanSlnDXEFv7wg?=
 =?us-ascii?Q?dBb/PHd30+ulZ9eZdTJeegiap1RWfRsoyG8WgY7Hs1zIQgyB/1z6x31ciqwA?=
 =?us-ascii?Q?ZPbvanQnPPUewBfaCKZHKxOTux0wFkDCGSmbojYCKUfM7ubvfVdtcS1NmWmQ?=
 =?us-ascii?Q?IkkCPhGQFSOr8Aq8hKgwU3/UWFfuGK4VkR3dJkfN5rCoBtRMXma/SWUZP3XR?=
 =?us-ascii?Q?5n6GpaiCkzStVtrEtiighUMhuVaRxaVra6/TSFYebQHE/bQzJSQMQO+WaQFo?=
 =?us-ascii?Q?PKIhKcpi445ceKpdElRTkkH3BipYH30Hf8Ww7695w4jRzrtLp8vQRo/wR0HU?=
 =?us-ascii?Q?pUURISgu6lN7dXBZmmuvv7fsh6aUKvDm27usUYtEaMczytGmWGWWDU2noH1F?=
 =?us-ascii?Q?z34dcTZ7AekXr3ik3CRmADf059jsnOS+ipubql1PbyCrMO3wl0W/eZADlQGC?=
 =?us-ascii?Q?/5JChUDPMJs/04RuZWqpvcluRpK/PprOxMSxyNhtcNnWvpBCa1S274imo94P?=
 =?us-ascii?Q?i6t8zH82PR6oS34zv8C1VaN5mPuFVbymVeR8NzP6H1w6fkfSDUpbS+/kvKIW?=
 =?us-ascii?Q?ulPcNvPtD2eRKs+KRPecjFZr2MYqj8aXJnQm8HjzwGNSYsUhcuDdWS4suiL/?=
 =?us-ascii?Q?McBzUvxt4Vh8k061i7MH6ve2iv9LXigpvMvThbW4zA3Pxc8VGfV2XvkAnUgJ?=
 =?us-ascii?Q?sBvjOR8ZBWsqXhNUJ4Td/j92DHon8SybLRwbOqb0qdO7g+xfwlGr20Xx2cHz?=
 =?us-ascii?Q?tWpjSbfUFWZZ/ANQRiyIQI74Gi/v3pboHYTeKHFskJYgoTIBltGrHEM1o9B5?=
 =?us-ascii?Q?m6f8JQI1Ye+BNoEhR1iYHbIGw2OY1QJaRxYWLWl2qWP5xreF3r3F3q+DkPJE?=
 =?us-ascii?Q?wm/sMTJ36OvjCq1rYttxPqnlAUNINm2hj3VckgKNAPee+fgqOsryoljcDPE3?=
 =?us-ascii?Q?W7XM3Y4yVfU3DOrw9zR18OGVLbrRJ3xPAkQD6VLMNIycuxfMMbskqkIhSCWh?=
 =?us-ascii?Q?qQeyUJsIBJYkXPhRmiO0M7Sf7wzepXvLnTn71kkwoO5FFRjcZxvrIKrdFThK?=
 =?us-ascii?Q?w9Vt8bPU232L7T5Qe+Qyf46zgvKnpmTeLGfKDBNZK/V+ZWlzOxC9bCXIMuEC?=
 =?us-ascii?Q?TjM/gbCQUBACzQ6Vi78kc9DA7LbeVXILgf+oO3wJzLM8Nx+vEBoVauJa8cQs?=
 =?us-ascii?Q?wIIy/8DInAkcsQrYwYkEUuaHYEGlfo3dHE8tjnWA4xeNg8jfqqDdqdU4K1Us?=
 =?us-ascii?Q?JfZrHkglMA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3d57bb-b6e8-4822-ebaf-08dee87ff00c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:02:12.2156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 318cGffxHqDyj6pM4SsdXrWg9WfMBQOe8Bfe2fkNu5ZWdtZcNvq7NLL/nC+ZQlf7HcVX4Iq50OPedDLoySuoRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6452

From: Tze Yee Ng <tze.yee.ng@altera.com>

Add asynchronous Stratix 10 service layer support for hardware monitor
temperature and voltage read commands in stratix10_svc_async_send() and
stratix10_svc_async_prepare_response().

Register a socfpga-hwmon platform device from the service layer driver
when hardware monitor support is enabled, similar to the RSU device.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v8:
- No functional changes from v7

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

