Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010053.outbound.protection.outlook.com [52.101.201.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DE2337BA4;
	Tue, 21 Jul 2026 02:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600291; cv=fail; b=mHrRMLFe+HrGbQZjUlDGr8W3//aZq7KNAn0D3cgDSk0rrMj+F1o4HnySojlgGuqyh/RkHC4KXZQRYDVIRR3josSJTxaUmrIBgrMDrg3boqud2h+zFVYknV8HAsnR+HA8DOE2W1HWGiUE+EHeUGUFfaJL/N8+FUV1eGvMv5pp05U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600291; c=relaxed/simple;
	bh=noTUx5aMnxkJ2I3QmW1fJsgWY396T4LawZ+vriPSwcQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r/1XiXSyQ6XcbdzOKqrX0jBwJITzOyMsn7Lk2AQZ8U0kYRO/L38hq5yUYdzLrSETJW0+swkvSXiOdOhe9qI8lVqZ9y5uymfKy6xg4m8D2DRDIV1bdOIzuXrtW0u278KHwW+NHlLHj9YShhWPMhyWAI0qZkGGacF47l5S2dQwEec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=IunR8n8Q; arc=fail smtp.client-ip=52.101.201.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="IunR8n8Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YP4NpS+7uHinqDnSA8lLMrMkuXGQf2jZzHfCPHfYRm8ka4hFOrFHBRlepIL8rhZNAUkkeJwTDAFlx59q4VreQlAapRvkN3fbG/C0iLeO37ovlEoJxY6Rw/LkSLpK/ODRJQRtoOGSM/jdJ2WtJ54mGSPQfn7H+BgN8OzBapdt9didJ8gdoHbnDtZPF0js0ewpaDxSZSg1HxwcWbJaN8kb6PhHt045JQ9wnOz8rH4qbAxMKjkreEXFTSdq/dSYgH1BOl08+QxS3FmY/TiBt/kOD91lOGKVlqQuH6XnWpPurRJCLWAfg8yf4VhtypVcIkwkKEBQMH7MuTOlHpqwVkOLpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWYeJNpynT3ZwbxO6I9XWjwSSVbcfAL7yImfG6jnXsQ=;
 b=qHC5fGZC/gc2coiDNcJ71n8dx3xLumUgdS7uTy3sNSeLEcpc4xl/YWLP4sy02uY6kGFj3RjK/qzL6qA8OcMM7d14zSxyFDvxSBRy//B+txqs+mo7oEUGSzeYHysAVwXQj/NGX/T9Ruw9zdB0zlgYCQTEU4qZEnbU9mNRbkcSEz8pNwZPkmoLZqSUTs+jSTit+f0oy0xRghEBrUJfZUskUnm4pCuheUJDQ2sBWM0mcitt1MIRkvb3tt1L0MWYcDcix7KRExWbF8+UzBnwMPDrlLsBOfpr0HIVp3VOQVLj+TRb8HsViE5r2zmdgOjbAQvjBHlQ7KnHqkw2dtax5CNw4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWYeJNpynT3ZwbxO6I9XWjwSSVbcfAL7yImfG6jnXsQ=;
 b=IunR8n8Q0Z4VHZTRHmNOaSWOHvcRCdZr1xgoo36zr/t4kSZYGNLrhP6wZEwu/lLAlOgALA7k7tCC1EI4uoSRSVrZk6UvSqW2uCv7Yjd+jkXxJoSUHz9GL7wg1yzVtLHaukqiaNQ1OP6yZQtRr5YfQPNqYoTcbXgMqBQmoNbpSiCPWRmcZOBVHKr4R/bzUdMpaU1VFx/X+Kp65aawZm714ieijneDZmVEyWi/U821Y8u3sOgSGfV1hDu7c3LgV7QUDdV5EXc9Wbr2sjAA2gf1AbR2n+rp/J1HNpL8QxW2htcxnvITw4P14kWlw+J6SaRVbcCS1Tqcp4dGcfs3aWDZ2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by PH8PR03MB989113.namprd03.prod.outlook.com (2603:10b6:510:3a9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 02:18:06 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 02:18:06 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v7 2/2] hwmon: add Altera SoC FPGA hardware monitoring driver
Date: Mon, 20 Jul 2026 19:18:01 -0700
Message-ID: <c8f4fbc1d8c3b1d161c94f66feb2ebbc038dab6d.1784599864.git.tze.yee.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: ee96053c-085e-4bee-461b-08dee6ce4c72
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|55112099003|6133799003|11063799006|5023799004|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	0dmARvdMklG4o5MxX33dRf32cyEZXaPoCMItJ7pO4Egwm9QOSkEffarHMpmZHkxFfecv44+Gg1JjCvZ/aAx3fRpX2TxaGGG4PvGN+2+pR6y80bfsd7W7k6JcRrBpqb+omjCWqCPxHKDSkjYWkyq7PCFv0m1d7WmxRzQIop6iJqkQCjZmghAbl1QddNujp/NeE4hGiILJHd4rsUqqUoDi3m7pSomGSoqAI6EYYpiyzArE3MK1yWUZcYn6mbytzkCBUGsdu7CwlgVmIjBoNZV4guDX5mmJ5mzlOE5E2VcbttOhYZpURPJyJO3FRfCkrRZYtxsw0VeJ2r7DfAdAXiWeB7PaBnAH9/0rhAY5nuxMNTVN11MmFeiFJxX7ajdjhgPbxMvCCTWstRts09OMyyyv0WANweWNlpNm1TZQ797RfFu7jJHbxYuIdQgcmOMCPWNGXp78++RHPUR5iQmvsQ4Bv/xWPL0CfvxFqTo+kUSwnxFTnwbd9bcQHbV8tWWQreeSNPnT7tmGOpK/GVY58fhgRWimal8cGEM4jO/PiVYPJ+GZ5X/q4G/ZxKmIetsyLAvIqVZ3DHwWFTQGenm6I9HNryhJUuMDHXGKwtFcDY8GN7w7G+PzZv9XulhwuuDExGXP6hBzny7ubKz+29uDt1icUuOD6L0iulxQRuqdzoe0POE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(55112099003)(6133799003)(11063799006)(5023799004)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WlrC7x4TxyW8/sm0cjGiTqQ/r2dGXBrSqlPWRzD4hT+9pYwm2vkiP+VW5Q/r?=
 =?us-ascii?Q?iJWoE1W6IdZQ94F8yXkzZoSaS6dsA1TBdX91UNxgZYOmyIFvmCFMzSHxwjyz?=
 =?us-ascii?Q?NfRFVdlDvpdY5ODFNw6FocCY0bFI08Ree/QMIgP6kB/iROO8R/6/UK97ISmg?=
 =?us-ascii?Q?t0t23MKshDfFBcufuaniaZSWcH7Cnr4ms+nhgLP2oMbnTXeqDGGuXQLUD2d8?=
 =?us-ascii?Q?gG2G+886O+WRIz6OLWPXeW86tKQYu7HvSlLoYMiW4DAySwW+/8an5yB0lohQ?=
 =?us-ascii?Q?AN2nzx3lOlfyeyKeYoQ8W+dz+at8J0FDM1n949hmqLIEhfd5+UCqFiE5NDIU?=
 =?us-ascii?Q?QkqZbW8EeyRjvtLG9fJu9zT0hEHRkaX0dNcw/iS/Cv/SFGAxFcKFj2u/AWI7?=
 =?us-ascii?Q?ll0HQUCF8KeMdfqB5VdPKEQpzz8RGiioihGNcwUi38CnTDYoth7tlUsRi2sR?=
 =?us-ascii?Q?TYR9+CS3r2R6AylOgeeB1ZYRDt7OwaselEbuhOmC4jc5fTj+yOsFa8HTddDL?=
 =?us-ascii?Q?XV/tTNgRQTxvhRS+SoN4ZPKsxypNIFyDu0oYRwyw7vcBUp1r2RBHohSAzvu4?=
 =?us-ascii?Q?1citIMq+AGKPcIz+xQvX1p2g19AQlSO6n4B1uabW7VIDLsNzTP0FbuFrioeJ?=
 =?us-ascii?Q?HgD57dfRJTFVNhSDgkm98r7tu1kwORU6I0xcqsL0RPqEkMBv3lPxpH/54Vk9?=
 =?us-ascii?Q?CBhB/MKx4zRn0uQOa1PkKUk9FFMxUrihGukhqYx4F3eYS1+MCjIjGpF6ULCD?=
 =?us-ascii?Q?8fgoAsnrgTQ/lAgmC2nXi1w1GToXQaGXXpCSR7rthhE69fuNbSlH4HoAA9WO?=
 =?us-ascii?Q?zsnaKgwpN9IF6BO1dvvoo9hn0/QNfFlUa+izRiF2Kv3tiSRRI3CgBCOMowt6?=
 =?us-ascii?Q?7GRWtYGdtJb2dPX2GvzVrNZleo4mH2zZYAlFuqKZUVthlinO45Qp3kqP43DZ?=
 =?us-ascii?Q?HUwtL05BCR6uGNCiq+CoARXj1XzJaFcAqYp4YaSFdCVWyy89k8L35WeyJmGC?=
 =?us-ascii?Q?5l1E217tDoZHmmAxLC8V8GQ4ooQFu8TrcaUJRBUC/EW5N2m4kmi2XLBGkm0K?=
 =?us-ascii?Q?tFBiIdWJHlgBYH0Qr9Y8DodwgrlPLr+RRH/O8t5FmOpXrbKcdwfisgU2Lkrb?=
 =?us-ascii?Q?XJAepf8TdGOSLZjQd3URQov6Anxmb6D5xq13Q6h6w9RtsT/d9MXoTOHafRAM?=
 =?us-ascii?Q?aepxYNaa1gGWH9dEkZbybFXNczSNlEQRB6d9T1k48/sxStSjAorqDbZylcYT?=
 =?us-ascii?Q?rtG7gWN9iDmvN3BNtulOUOMDwzdcsRChBeQbUlXPGHZuqpJtSvLCr2fG2wi6?=
 =?us-ascii?Q?CR6TUnj51zxvskm6Nqyr/eZ+Mz9q2e6DwJikbJjVuSc9rkR91Wfo0cPFq+OJ?=
 =?us-ascii?Q?55z3xqHqQZDYhEtQisuXCSsJIEMLE8rEVXZ9BBhIWgbcAIeh3J/Jc/hCfcRw?=
 =?us-ascii?Q?YjXApBqoPuIsm/1TgodxR7Pfdv3JqRDtbl2Rr6r0dDqYM+SE7kTOLtHOo8qy?=
 =?us-ascii?Q?hkDpJPBB00wcUSMgUxLXGZ/C48WAM93/96f+mG0TF/FGkvJM1SwcpxKjVE1O?=
 =?us-ascii?Q?QxgO/SZkwWefqr4VdbRuVO1mu20lFAgjTq2e8LhHVhWzQaGBogzUeaDGpaQm?=
 =?us-ascii?Q?LqX8BB75F+pjwi3yB+8Oc7B+Vm7fBNusLkrh449MqZyYAgc/TIs+BdNuFWqL?=
 =?us-ascii?Q?yjFNTTLJ6enHLBv4A2eQN+RDSVtihURbvpvmPif+BvhlGDPpK6Ew8PcCy+9n?=
 =?us-ascii?Q?T5/c4hePjg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee96053c-085e-4bee-461b-08dee6ce4c72
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 02:18:05.9378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbKbv8yeEEbZgqHBhYRJDlDhQNrM/utVucpZTHPds7lt2pMneoSU0Rh8yR/g9rLRqeV9cvkRTx7HQ6iecqpaOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB989113

From: Tze Yee Ng <tze.yee.ng@altera.com>

Add a hardware monitor driver for Altera SoC FPGA devices using the
Stratix 10 service layer. Sensor channels are selected based on the
service layer compatible string.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v7:
- Break out of the async poll loop on hard errors; return the real poll
  status instead of -ETIMEDOUT
- Drop redundant async poll alert and -EAGAIN debug messages
- Replace msleep(1) with usleep_range() for short retries
- On sync-mode timeout, wait for the outstanding SVC callback before
  stratix10_svc_done() to avoid leftover svc_fifo entries desynchronizing
  later reads; still report -ETIMEDOUT to userspace

Changes in v6:
- No functional changes from v5

Changes in v5:
- Poll async responses until HWMON_TIMEOUT (2 s) instead of a fixed
  3-iteration retry loop (~3 ms), fixing premature timeouts observed
  on silicon
- Add MODULE_ALIAS("platform:socfpga-hwmon")

Changes in v4:
- Register devm_add_action_or_reset() before
  devm_hwmon_device_register_with_info(); drop manual channel cleanup
  on hwmon registration failure
- Remove unreferenced async completion and pre-poll
  wait_for_completion_io_timeout(); poll directly after async_send()
  with the existing retry loop

Changes in v3:
- Fix 16-bit signed Q8.8 temperature conversion (cast through s16)
- Remove unused async callback; pass NULL to stratix10_svc_async_send()
- Keep wait_for_completion_io_timeout() before polling with comment
  explaining the service layer never invokes the callback but firmware
  needs time to complete the transaction (RSU pattern)
- Align async poll loop with RSU (retry on failure instead of aborting)
- Use wait_for_completion_timeout() for synchronous reads
- Handle -EINVAL and -EOPNOTSUPP when async client registration fails
- Defer SVC channel/async cleanup via devm_add_action_or_reset();
  drop .remove()

Changes in v2:
- Drop altr,stratix10-hwmon OF compatible and DT channel parsing
- Select channels from hardcoded tables using parent SVC compatible
  (intel,stratix10-svc or intel,agilex-svc)
- Rename driver from stratix10-hwmon to socfpga-hwmon
- Rename Kconfig symbol to CONFIG_SENSORS_ALTERA_SOCFPGA_HWMON
- Add Agilex voltage and temperature channel tables
- Convert SDM Q8.8 degrees Celsius to hwmon millidegrees
- Convert SDM Q16 volts to hwmon millivolts
- Use socfpga_hwmon as hwmon sysfs device name
- Add last_err for synchronous SVC read error propagation
- Update Documentation/hwmon and MAINTAINERS accordingly
---
 Documentation/hwmon/index.rst         |   1 +
 Documentation/hwmon/socfpga-hwmon.rst |  34 ++
 MAINTAINERS                           |   8 +
 drivers/hwmon/Kconfig                 |  10 +
 drivers/hwmon/Makefile                |   1 +
 drivers/hwmon/socfpga-hwmon.c         | 586 ++++++++++++++++++++++++++
 6 files changed, 640 insertions(+)
 create mode 100644 Documentation/hwmon/socfpga-hwmon.rst
 create mode 100644 drivers/hwmon/socfpga-hwmon.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 29130df44d12..3299417a24b8 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -254,6 +254,7 @@ Hardware Monitoring Kernel Drivers
    sparx5-temp
    spd5118
    stpddc60
+   socfpga-hwmon
    surface_fan
    sy7636a-hwmon
    tc654
diff --git a/Documentation/hwmon/socfpga-hwmon.rst b/Documentation/hwmon/socfpga-hwmon.rst
new file mode 100644
index 000000000000..e5da42556a62
--- /dev/null
+++ b/Documentation/hwmon/socfpga-hwmon.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver socfpga-hwmon
+=============================
+
+Supported chips:
+
+ * Altera Stratix 10 SoC FPGA
+ * Altera Agilex SoC FPGA
+
+Authors:
+      - Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
+      - Tze Yee Ng <tze.yee.ng@altera.com>
+
+Description
+-----------
+
+This driver supports hardware monitoring for Altera SoC
+FPGA devices through the Secure Device Manager and Stratix 10 service layer.
+
+The following sensor types are supported:
+
+  * temperature
+  * voltage
+
+Usage Notes
+-----------
+
+The stratix10-svc driver registers a socfpga-hwmon platform device when
+hardware monitor support is enabled. Sensor channels are selected in the
+driver based on the service layer compatible string:
+
+  * intel,stratix10-svc
+  * intel,agilex-svc
diff --git a/MAINTAINERS b/MAINTAINERS
index a674e36529f7..ab6cb215a02f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -965,6 +965,14 @@ L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/gpio/gpio-altera.c
 
+ALTERA SoC FPGA HWMON DRIVER
+M:	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
+M:	Tze Yee Ng <tze.yee.ng@altera.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/socfpga-hwmon.rst
+F:	drivers/hwmon/socfpga-hwmon.c
+
 ALTERA TRIPLE SPEED ETHERNET DRIVER
 M:	Boon Khai Ng <boon.khai.ng@altera.com>
 L:	netdev@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 2bfbcc033d59..8e768661fec2 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2160,6 +2160,16 @@ config SENSORS_SMSC47M192
 	  This driver can also be built as a module. If so, the module
 	  will be called smsc47m192.
 
+config SENSORS_ALTERA_SOCFPGA_HWMON
+	tristate "Altera SoC FPGA hardware monitoring features"
+	depends on INTEL_STRATIX10_SERVICE
+	help
+	  If you say yes here you get support for the temperature and
+	  voltage sensors of Altera SoC FPGA devices.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called socfpga-hwmon.
+
 config SENSORS_SMSC47B397
 	tristate "SMSC LPC47B397-NC"
 	depends on HAS_IOPORT
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 63effc0ab8d1..aeedee80e1f0 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -221,6 +221,7 @@ obj-$(CONFIG_SENSORS_SMPRO)	+= smpro-hwmon.o
 obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
 obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
 obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
+obj-$(CONFIG_SENSORS_ALTERA_SOCFPGA_HWMON)	+= socfpga-hwmon.o
 obj-$(CONFIG_SENSORS_SPARX5)	+= sparx5-temp.o
 obj-$(CONFIG_SENSORS_SPD5118)	+= spd5118.o
 obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
diff --git a/drivers/hwmon/socfpga-hwmon.c b/drivers/hwmon/socfpga-hwmon.c
new file mode 100644
index 000000000000..111435f9da95
--- /dev/null
+++ b/drivers/hwmon/socfpga-hwmon.c
@@ -0,0 +1,586 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Altera SoC FPGA hardware monitoring driver
+ *
+ * Copyright (c) 2026 Altera Corporation
+ *
+ * Authors:
+ *	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
+ *	Tze Yee Ng <tze.yee.ng@altera.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/firmware/intel/stratix10-svc-client.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#define HWMON_TIMEOUT			msecs_to_jiffies(SVC_HWMON_REQUEST_TIMEOUT_MS)
+#define HWMON_RETRY_SLEEP_US		1000U
+#define HWMON_ASYNC_MSG_RETRY		3U
+#define SOCFPGA_HWMON_MAXSENSORS	16
+#define SOCFPGA_HWMON_CHANNEL_MASK	GENMASK(15, 0)
+#define SOCFPGA_HWMON_PAGE_SHIFT	16
+#define SOCFPGA_HWMON_CHAN(page, channel) \
+	(((page) << SOCFPGA_HWMON_PAGE_SHIFT) | \
+	 ((channel) & SOCFPGA_HWMON_CHANNEL_MASK))
+#define SOCFPGA_HWMON_ATTR_VISIBLE	0444
+/* Temperature from SDM is signed Q8.8 degrees Celsius (8 fractional bits). */
+#define SOCFPGA_HWMON_TEMP_FRAC_BITS	8
+#define SOCFPGA_HWMON_TEMP_FRAC_DIV	BIT(SOCFPGA_HWMON_TEMP_FRAC_BITS)
+#define SOCFPGA_HWMON_TEMP_MDEG_SCALE	1000
+/* Voltage from SDM is unsigned Q16 volts (16 fractional bits). */
+#define SOCFPGA_HWMON_VOLT_FRAC_BITS	16
+#define SOCFPGA_HWMON_VOLT_FRAC_DIV	BIT(SOCFPGA_HWMON_VOLT_FRAC_BITS)
+#define SOCFPGA_HWMON_VOLT_MV_SCALE	1000
+
+#define ETEMP_INACTIVE			0x80000000U
+#define ETEMP_TOO_OLD			0x80000001U
+#define ETEMP_NOT_PRESENT		0x80000002U
+#define ETEMP_TIMEOUT			0x80000003U
+#define ETEMP_CORRUPT			0x80000004U
+#define ETEMP_BUSY			0x80000005U
+#define ETEMP_NOT_INITIALIZED		0x800000FFU
+
+struct socfpga_hwmon_channel {
+	u32 reg;
+	const char *label;
+};
+
+struct socfpga_hwmon_board_data {
+	const struct socfpga_hwmon_channel *temp;
+	unsigned int num_temp;
+	const struct socfpga_hwmon_channel *volt;
+	unsigned int num_volt;
+};
+
+struct socfpga_hwmon_priv {
+	struct stratix10_svc_chan *chan;
+	struct stratix10_svc_client client;
+	struct completion completion;
+	struct mutex lock;	/* protect SVC calls */
+	bool async;
+	int last_err;		/* sync-mode SVC result; 0 on success */
+	u32 temperature;
+	u32 voltage;
+	int temperature_channels;
+	int voltage_channels;
+	const char *temp_chan_names[SOCFPGA_HWMON_MAXSENSORS];
+	const char *volt_chan_names[SOCFPGA_HWMON_MAXSENSORS];
+	u32 temp_chan[SOCFPGA_HWMON_MAXSENSORS];
+	u32 volt_chan[SOCFPGA_HWMON_MAXSENSORS];
+};
+
+static umode_t socfpga_hwmon_is_visible(const void *dev,
+					enum hwmon_sensor_types type,
+					u32 attr, int chan)
+{
+	const struct socfpga_hwmon_priv *priv = dev;
+
+	switch (type) {
+	case hwmon_temp:
+		if (chan < priv->temperature_channels)
+			return SOCFPGA_HWMON_ATTR_VISIBLE;
+		return 0;
+	case hwmon_in:
+		if (chan < priv->voltage_channels)
+			return SOCFPGA_HWMON_ATTR_VISIBLE;
+		return 0;
+	default:
+		return 0;
+	}
+}
+
+static void socfpga_hwmon_readtemp_cb(struct stratix10_svc_client *client,
+				      struct stratix10_svc_cb_data *data)
+{
+	struct socfpga_hwmon_priv *priv = client->priv;
+
+	priv->last_err = -EIO;
+	if (data->status == BIT(SVC_STATUS_OK)) {
+		priv->last_err = 0;
+		priv->temperature = (u32)*(unsigned long *)data->kaddr1;
+	} else if (data->kaddr1) {
+		dev_err(client->dev, "%s failed with status 0x%x, value 0x%lx\n",
+			__func__, data->status,
+			*(unsigned long *)data->kaddr1);
+	} else {
+		dev_err(client->dev, "%s failed with status 0x%x\n",
+			__func__, data->status);
+	}
+
+	complete(&priv->completion);
+}
+
+static void socfpga_hwmon_readvolt_cb(struct stratix10_svc_client *client,
+				      struct stratix10_svc_cb_data *data)
+{
+	struct socfpga_hwmon_priv *priv = client->priv;
+
+	priv->last_err = -EIO;
+	if (data->status == BIT(SVC_STATUS_OK)) {
+		priv->last_err = 0;
+		priv->voltage = (u32)*(unsigned long *)data->kaddr1;
+	} else if (data->kaddr1) {
+		dev_err(client->dev, "%s failed with status 0x%x, value 0x%lx\n",
+			__func__, data->status,
+			*(unsigned long *)data->kaddr1);
+	} else {
+		dev_err(client->dev, "%s failed with status 0x%x\n",
+			__func__, data->status);
+	}
+
+	complete(&priv->completion);
+}
+
+static int socfpga_hwmon_parse_temp(long *val, u32 temperature)
+{
+	switch (temperature) {
+	case ETEMP_INACTIVE:
+	case ETEMP_NOT_PRESENT:
+	case ETEMP_CORRUPT:
+	case ETEMP_NOT_INITIALIZED:
+		return -EOPNOTSUPP;
+	case ETEMP_TIMEOUT:
+	case ETEMP_BUSY:
+	case ETEMP_TOO_OLD:
+		return -EAGAIN;
+	default:
+		/* SDM returns a 16-bit signed Q8.8 value in the low 16 bits. */
+		*val = (long)(s16)(temperature & SOCFPGA_HWMON_CHANNEL_MASK) *
+			SOCFPGA_HWMON_TEMP_MDEG_SCALE / SOCFPGA_HWMON_TEMP_FRAC_DIV;
+		return 0;
+	}
+}
+
+static int socfpga_hwmon_encode_temp_arg(u32 reg, u64 *arg)
+{
+	u32 page = (reg >> SOCFPGA_HWMON_PAGE_SHIFT) & SOCFPGA_HWMON_CHANNEL_MASK;
+	u32 channel = reg & SOCFPGA_HWMON_CHANNEL_MASK;
+
+	if (channel >= SOCFPGA_HWMON_MAXSENSORS)
+		return -EINVAL;
+
+	*arg = (1ULL << channel) | ((u64)page << SOCFPGA_HWMON_PAGE_SHIFT);
+	return 0;
+}
+
+static int socfpga_hwmon_encode_volt_arg(u32 reg, u64 *arg)
+{
+	u32 channel = reg & SOCFPGA_HWMON_CHANNEL_MASK;
+
+	if (channel >= SOCFPGA_HWMON_MAXSENSORS)
+		return -EINVAL;
+
+	*arg = 1ULL << channel;
+	return 0;
+}
+
+static int socfpga_hwmon_async_read(struct device *dev,
+				    enum hwmon_sensor_types type,
+				    struct stratix10_svc_client_msg *msg)
+{
+	struct socfpga_hwmon_priv *priv = dev_get_drvdata(dev);
+	struct stratix10_svc_cb_data data = {};
+	unsigned long deadline = jiffies + HWMON_TIMEOUT;
+	void *handle = NULL;
+	int status, index, ret;
+
+	for (index = 0; index < HWMON_ASYNC_MSG_RETRY; index++) {
+		status = stratix10_svc_async_send(priv->chan, msg, &handle,
+						  NULL, NULL);
+		if (status == 0)
+			break;
+		dev_warn(dev, "Failed to send async message: %d\n", status);
+		usleep_range(HWMON_RETRY_SLEEP_US, HWMON_RETRY_SLEEP_US * 2);
+	}
+
+	if (status && !handle) {
+		dev_err(dev, "Failed to send async message after %u retries: %d\n",
+			HWMON_ASYNC_MSG_RETRY, status);
+		return status;
+	}
+
+	ret = -ETIMEDOUT;
+	while (!time_after(jiffies, deadline)) {
+		status = stratix10_svc_async_poll(priv->chan, handle, &data);
+		if (status == -EAGAIN) {
+			/* still in progress */
+		} else if (status < 0) {
+			ret = status;
+			break;
+		} else if (status == 0) {
+			ret = 0;
+			break;
+		}
+		usleep_range(HWMON_RETRY_SLEEP_US, HWMON_RETRY_SLEEP_US * 2);
+	}
+
+	if (ret) {
+		dev_err(dev, "Failed to get async response\n");
+		goto done;
+	}
+
+	if (data.status) {
+		dev_err(dev, "%s returned 0x%x from SDM\n", __func__,
+			data.status);
+		ret = -EFAULT;
+		goto done;
+	}
+
+	if (type == hwmon_temp)
+		priv->temperature = (u32)*(unsigned long *)data.kaddr1;
+	else
+		priv->voltage = (u32)*(unsigned long *)data.kaddr1;
+
+	ret = 0;
+
+done:
+	stratix10_svc_async_done(priv->chan, handle);
+	return ret;
+}
+
+static int socfpga_hwmon_sync_read(struct device *dev,
+				   enum hwmon_sensor_types type,
+				   struct stratix10_svc_client_msg *msg)
+{
+	struct socfpga_hwmon_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	reinit_completion(&priv->completion);
+
+	if (type == hwmon_temp)
+		priv->client.receive_cb = socfpga_hwmon_readtemp_cb;
+	else
+		priv->client.receive_cb = socfpga_hwmon_readvolt_cb;
+
+	ret = stratix10_svc_send(priv->chan, msg);
+	if (ret < 0)
+		goto status_done;
+
+	ret = wait_for_completion_timeout(&priv->completion, HWMON_TIMEOUT);
+	if (!ret) {
+		dev_err(priv->client.dev, "timeout waiting for SMC call\n");
+		/*
+		 * stratix10_svc_done() stops the worker but does not flush
+		 * svc_fifo. Wait for the outstanding callback before stopping
+		 * so a leftover request cannot complete a later sensor read.
+		 * Discard the late result and still report -ETIMEDOUT.
+		 */
+		wait_for_completion(&priv->completion);
+		ret = -ETIMEDOUT;
+		goto status_done;
+	}
+
+	ret = priv->last_err;
+
+status_done:
+	stratix10_svc_done(priv->chan);
+	return ret;
+}
+
+static int socfpga_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int chan, long *val)
+{
+	struct socfpga_hwmon_priv *priv = dev_get_drvdata(dev);
+	struct stratix10_svc_client_msg msg = {0};
+	int ret;
+
+	if (chan >= SOCFPGA_HWMON_MAXSENSORS)
+		return -EOPNOTSUPP;
+
+	switch (type) {
+	case hwmon_temp:
+		ret = socfpga_hwmon_encode_temp_arg(priv->temp_chan[chan],
+						    &msg.arg[0]);
+		if (ret)
+			return ret;
+		msg.command = COMMAND_HWMON_READTEMP;
+		break;
+	case hwmon_in:
+		ret = socfpga_hwmon_encode_volt_arg(priv->volt_chan[chan],
+						    &msg.arg[0]);
+		if (ret)
+			return ret;
+		msg.command = COMMAND_HWMON_READVOLT;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	guard(mutex)(&priv->lock);
+	if (priv->async)
+		ret = socfpga_hwmon_async_read(dev, type, &msg);
+	else
+		ret = socfpga_hwmon_sync_read(dev, type, &msg);
+	if (ret)
+		return ret;
+
+	if (type == hwmon_temp)
+		ret = socfpga_hwmon_parse_temp(val, priv->temperature);
+	else
+		/* SDM returns Q16 volts; convert to hwmon millivolts. */
+		*val = (long)priv->voltage * SOCFPGA_HWMON_VOLT_MV_SCALE /
+			SOCFPGA_HWMON_VOLT_FRAC_DIV;
+	return ret;
+}
+
+static int socfpga_hwmon_read_string(struct device *dev,
+				     enum hwmon_sensor_types type, u32 attr,
+				     int chan, const char **str)
+{
+	struct socfpga_hwmon_priv *priv = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_in:
+		*str = priv->volt_chan_names[chan];
+		return 0;
+	case hwmon_temp:
+		*str = priv->temp_chan_names[chan];
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_ops socfpga_hwmon_ops = {
+	.is_visible = socfpga_hwmon_is_visible,
+	.read = socfpga_hwmon_read,
+	.read_string = socfpga_hwmon_read_string,
+};
+
+static const struct hwmon_channel_info *socfpga_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info socfpga_hwmon_chip_info = {
+	.ops = &socfpga_hwmon_ops,
+	.info = socfpga_hwmon_info,
+};
+
+static const struct socfpga_hwmon_channel s10_hwmon_volt_channels[] = {
+	{ SOCFPGA_HWMON_CHAN(0, 2), "0.8V VCC" },
+	{ SOCFPGA_HWMON_CHAN(0, 3), "1.8V VCCIO_SDM" },
+	{ SOCFPGA_HWMON_CHAN(0, 6), "0.9V VCCERAM" },
+};
+
+static const struct socfpga_hwmon_channel s10_hwmon_temp_channels[] = {
+	{ SOCFPGA_HWMON_CHAN(0, 0), "Main Die SDM" },
+};
+
+static const struct socfpga_hwmon_board_data s10_hwmon_board = {
+	.temp = s10_hwmon_temp_channels,
+	.num_temp = ARRAY_SIZE(s10_hwmon_temp_channels),
+	.volt = s10_hwmon_volt_channels,
+	.num_volt = ARRAY_SIZE(s10_hwmon_volt_channels),
+};
+
+static const struct socfpga_hwmon_channel agilex_hwmon_volt_channels[] = {
+	{ SOCFPGA_HWMON_CHAN(0, 2), "0.8V VCC" },
+	{ SOCFPGA_HWMON_CHAN(0, 3), "1.8V VCCIO_SDM" },
+	{ SOCFPGA_HWMON_CHAN(0, 4), "1.8V VCCPT" },
+	{ SOCFPGA_HWMON_CHAN(0, 5), "1.2V VCCCRCORE" },
+	{ SOCFPGA_HWMON_CHAN(0, 6), "0.9V VCCH" },
+	{ SOCFPGA_HWMON_CHAN(0, 7), "0.8V VCCL" },
+};
+
+static const struct socfpga_hwmon_channel agilex_hwmon_temp_channels[] = {
+	{ SOCFPGA_HWMON_CHAN(0, 0), "Main Die SDM" },
+	{ SOCFPGA_HWMON_CHAN(1, 0), "Main Die corner bottom left max" },
+	{ SOCFPGA_HWMON_CHAN(2, 0), "Main Die corner top left max" },
+	{ SOCFPGA_HWMON_CHAN(3, 0), "Main Die corner bottom right max" },
+	{ SOCFPGA_HWMON_CHAN(4, 0), "Main Die corner top right max" },
+};
+
+static const struct socfpga_hwmon_board_data agilex_hwmon_board = {
+	.temp = agilex_hwmon_temp_channels,
+	.num_temp = ARRAY_SIZE(agilex_hwmon_temp_channels),
+	.volt = agilex_hwmon_volt_channels,
+	.num_volt = ARRAY_SIZE(agilex_hwmon_volt_channels),
+};
+
+static const struct socfpga_hwmon_board_data *
+socfpga_hwmon_get_board(struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+
+	if (!np)
+		return NULL;
+
+	if (of_device_is_compatible(np, "intel,stratix10-svc"))
+		return &s10_hwmon_board;
+	if (of_device_is_compatible(np, "intel,agilex-svc"))
+		return &agilex_hwmon_board;
+
+	return NULL;
+}
+
+static int socfpga_hwmon_init_channels(struct device *dev,
+				       const struct socfpga_hwmon_board_data *board,
+				       struct socfpga_hwmon_priv *priv)
+{
+	unsigned int i;
+
+	if (board->num_temp > SOCFPGA_HWMON_MAXSENSORS ||
+	    board->num_volt > SOCFPGA_HWMON_MAXSENSORS)
+		return -EINVAL;
+
+	for (i = 0; i < board->num_temp; i++) {
+		priv->temp_chan_names[i] = board->temp[i].label;
+		priv->temp_chan[i] = board->temp[i].reg;
+	}
+	priv->temperature_channels = board->num_temp;
+
+	for (i = 0; i < board->num_volt; i++) {
+		priv->volt_chan_names[i] = board->volt[i].label;
+		priv->volt_chan[i] = board->volt[i].reg;
+	}
+	priv->voltage_channels = board->num_volt;
+
+	return 0;
+}
+
+static void socfpga_hwmon_release_svc(void *data)
+{
+	struct socfpga_hwmon_priv *priv = data;
+
+	if (priv->async)
+		stratix10_svc_remove_async_client(priv->chan);
+	stratix10_svc_free_channel(priv->chan);
+}
+
+static int socfpga_hwmon_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device *parent = dev->parent;
+	const struct socfpga_hwmon_board_data *board;
+	struct socfpga_hwmon_priv *priv;
+	struct device *hwmon_dev;
+	int ret;
+
+	if (!parent || !parent->of_node) {
+		dev_err(dev, "missing parent device node\n");
+		return -ENODEV;
+	}
+
+	board = socfpga_hwmon_get_board(parent);
+	if (!board) {
+		dev_err(dev, "unsupported service layer compatible\n");
+		return -ENODEV;
+	}
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client.dev = dev;
+	priv->client.priv = priv;
+	init_completion(&priv->completion);
+	mutex_init(&priv->lock);
+
+	ret = socfpga_hwmon_init_channels(dev, board, priv);
+	if (ret)
+		return ret;
+
+	priv->chan = stratix10_svc_request_channel_byname(&priv->client,
+							  SVC_CLIENT_HWMON);
+	if (IS_ERR(priv->chan)) {
+		ret = PTR_ERR(priv->chan);
+		if (ret == -EPROBE_DEFER)
+			dev_dbg(dev, "service channel %s not ready, deferring probe\n",
+				SVC_CLIENT_HWMON);
+		else
+			dev_err(dev, "couldn't get service channel %s: %d\n",
+				SVC_CLIENT_HWMON, ret);
+		return ret;
+	}
+
+	ret = stratix10_svc_add_async_client(priv->chan, false);
+	switch (ret) {
+	case 0:
+		priv->async = true;
+		break;
+	case -EINVAL:
+	case -EOPNOTSUPP:
+		/*
+		 * stratix10_svc_add_async_client() returns -EINVAL when the
+		 * async controller is not initialized; fall back to sync mode.
+		 */
+		dev_dbg(dev, "async operations not supported, using sync mode\n");
+		priv->async = false;
+		break;
+	default:
+		dev_err(dev, "failed to add async client: %d\n", ret);
+		stratix10_svc_free_channel(priv->chan);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, socfpga_hwmon_release_svc, priv);
+	if (ret)
+		return ret;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "socfpga_hwmon",
+							 priv,
+							 &socfpga_hwmon_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	platform_set_drvdata(pdev, priv);
+	return 0;
+}
+
+static struct platform_driver socfpga_hwmon_driver = {
+	.probe = socfpga_hwmon_probe,
+	.driver = {
+		.name = "socfpga-hwmon",
+	},
+};
+module_platform_driver(socfpga_hwmon_driver);
+
+MODULE_AUTHOR("Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>");
+MODULE_AUTHOR("Tze Yee Ng <tze.yee.ng@altera.com>");
+MODULE_DESCRIPTION("Altera SoC FPGA hardware monitoring driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:socfpga-hwmon");
-- 
2.43.7

