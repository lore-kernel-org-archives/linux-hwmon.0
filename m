Received: from FR5P281CU006.outbound.protection.outlook.com (mail-germanywestcentralazon11022137.outbound.protection.outlook.com [40.107.149.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16DD34DCE4;
	Thu, 10 Sep 2026 05:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.149.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789016707; cv=fail; b=dMuemBqs7TblOeze8EH4yfXR2GA/tgYsToLHWOAgL4u+HSYtHLfoU6SXwGYjRaiJvpssnIb3wm+xta5SyyBD61i6MOu256jscWzehnq6thXok7bZARkANxjVkyCrCINJjicdyMbscIRejNosIh52JM0wIi3DLbhdqDACm5AVLVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789016707; c=relaxed/simple;
	bh=6ttPLViWYCqxVJ+Asqkviv+g/9IFSGfeGpez+XRnyco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BpOr1ZFNOs3DLWa6ZJmFHpd9JbGj4G3kHC7KeK4TKqL2CDRuuH/B9d1enYrzRx7EN4S+I0OkH5yc/EdOZjjIPiAb1Sfs9DmSFvDUEvGnGJd8PcXY5JkeHY6zk1bt2tShkxbjbWbI/aIP1XgZouK0WWtQ9fTUOLn/kPSEwM/fPhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de; spf=pass smtp.mailfrom=arctic.de; dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b=QFPd4h5D; arc=fail smtp.client-ip=40.107.149.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arctic.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b="QFPd4h5D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yto/qdsRSfhKTkYUI12Mo8hGrdNcOnxER+samFDec5vuUasm8ZbIcOJbUFsG1eRUMN119TzFlLpOJjCHoqIj48lIKIRRUlr9PAI6mK4jKSDp6zPPYFoK6qPXQxVSng/iiemJ7foWfO4COG1vVHBL+Q+drFoyzChbEXHWdM0fBAoXTb9opkeWa46yQw5rFGM0xSpuafzL3jK8NWK15/MVx4Y+83GpexD3q+S36wG1m2tjjA9AwP1BJbpJ4UjNCwc2lPWFoWMc42I3sOJ5VijWGKSVcxMTbRnT7xhbRMAlp3BocEApPrqprD6539cViIoDoL2OOiwrQ0K7TIP11r4+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PO70+v3mb0K2Exrl/uNHF4PvJ+n9q9GKkI9Uf5RcCLM=;
 b=qtpOYc+qngp0kenA3V7XVBvuVRVeOvQs4qdJvTnSr/99EPbRagUe0owR7AWVPJS1g2xy4Ms1vKL8WIu2i0YBh4f8NnCo8O4dLjv/URRPToxUoXHusT/1osZFqHN/9Opxbb/WSY8smnr9P6cH2DNW+Xe4ekzK3mR9BiNrSzOVcnFf+F7TInPsN4nv35kOz3kE2OvX/xT+7wzmOQ1HTYHpLObPCFiI8nzJ7VG9wPkolAK7Tw9QWo4KCnJjcMF/3qavfEh9Espnamy+PsULTnLNddHQ4gnJpjZD2l94mhVQztbbbwfZ6mFqgNwhnfQlrlA/QcNTfyUKJgH7QOZBBANXtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arctic.de; dmarc=pass action=none header.from=arctic.de;
 dkim=pass header.d=arctic.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Arctic.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PO70+v3mb0K2Exrl/uNHF4PvJ+n9q9GKkI9Uf5RcCLM=;
 b=QFPd4h5DYAj4Hp+x8NB5qv3A5KyWMRTlDMobWROtFBXv80oMi/+jLJ+aWN90v83kI47wJmNixj++34w2rCDcQrH9tnkULlQtOUThQeqjE5FFD0y9mbQegZeLw/CFvAoeuGw4AMX1lE+taKQ+fksbl/Xp2lCFhDVWlFR+94ldtM9eV/2BzTMIftaQeSVLj8xz8KD2ZP/g/SPXoKwpW7OGhVcvXFVURMwt6Kvm3hrrUOXLiyPp5ly54akikWMFzRbBGn97A6srzlWPhGqYMRUXkpkmpgq7923Qc6LpdSt9CW+Vqx7I7ekdH4LkHU6luu0mk7O6S40fIXLl9xNJAa6XnQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arctic.de;
Received: from FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:51::8) by
 FR2PPF80BEA9E4C.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d18:2::57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Thu, 10 Sep 2026 05:05:01 +0000
Received: from FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM
 ([fe80::bbc8:b2df:8c7f:739c]) by FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM
 ([fe80::bbc8:b2df:8c7f:739c%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 05:05:01 +0000
From: Aureo Serrano de Souza <aureo.serrano@arctic.de>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux@weissschuh.net,
	arctic.it.hk@arctic.de,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aureo Serrano de Souza <aureo.serrano@arctic.de>
Subject: [PATCH 1/3] hwmon: arctic_fan_controller: default PWM cache to MCU 40%
Date: Thu, 10 Sep 2026 13:03:59 +0800
Message-ID: <20260910050401.279868-2-aureo.serrano@arctic.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910050401.279868-1-aureo.serrano@arctic.de>
References: <20260910050401.279868-1-aureo.serrano@arctic.de>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0054.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::6)
 To FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:51::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR0P281MB3401:EE_|FR2PPF80BEA9E4C:EE_
X-MS-Office365-Filtering-Correlation-Id: 3772775a-b80c-40c2-87c3-08df0ef91167
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|56012099006|55112099003|18002099003|22082099003|10067099003|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info:
	GTjFCu9VR/oZzYxwAH+K5IQA0BwNyFcXh3j3MfwmLjD1+KRlC2npIe9uy/alpOXTFLIG3ZMCEWRWKhva3oqIXsubysamPRBv/d5bCTOv01ExZhAqRHlOWkDfSMAo4w2sQcvR5rJH5rE53yXK+QOvV2l+3YH9qRoQF0Wa5QdEBYsLa0gpHnxevVme2/7KcjOwSYAvY3rLJGbl8v20VnaYG94kRLzdTqd8soSaXNtkNIqlQbnnKPW++Y0LSYEs8zp2GWR9MfSlSZr89NBT3q6qgBDvxeHvUgG3Z1Xvd0YpS7oNerg6Ajhm/JcYHLhae+vFl2YHQVuzaSkYNARLw357UGkqYoZ2B30Gaup9oGQk8k8nGQc3D1dE/CquLldM2SOV4ThpjjSUWQmbnj6XixfCkxiTqp4tzaCmMnWon2wJe8Iek5rwPawTUyINZSjs8hTTv2BG20623FR7De+tP7VLCFq1oE4PEphrGq20lYVvJeWxkrQiUbf8DqD+SetN1fMX+Nicbd0BZx1pISofART4JLV8y0hfgnupu+cUysec3sOzVWkEc9DTfbn5Cm5Av+ZHqWjD1LAAKEBADuJHH26yX7wrkeG4fOJBBoGz2naxyXBD0khJEb4fBlOM0DA5a/0nS6cB14CLdoQMnNZbb/PR+4PdB+ilcdl8QPLO4QoUpdvz7QavMHyrSPqOy+eEyXUmZnVq+wjPujw2XDEWJ2zfeH9cXTsjae2OwlKv+ReER64=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(56012099006)(55112099003)(18002099003)(22082099003)(10067099003)(38350700014)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x2jNSrM/xD8hnh9ma6b/PNg1YNgm98iqVs6sdpEd6I1MjVwOJLEfnjGc9eTR?=
 =?us-ascii?Q?IGXg2mXI9DoGiY+is/A+Jzkvg7VWtfGWELtelKWMif97dkiqKaiwAMeBhxs2?=
 =?us-ascii?Q?sTez5NNkgFf/OvtFbY2S9Q5aG8etD1H5r0LBLykQuyilF6oxXavGu3HkIIx0?=
 =?us-ascii?Q?2GGqQhAMLm3twFAL8nFMMrQE48/TbzbM8TBpvzOfX2xBOM5WZSjzgyM3jdwx?=
 =?us-ascii?Q?t9N+UnvRxPBO1TC2AlOjq9y16QxJbmpR2OD4Ag/rSd0hOiakISxfmR2S80DW?=
 =?us-ascii?Q?QnouZmAMG4MQZbpjhzbOntFSeCjCK/+pNySOF5GYM8CnpOSAkERIPLqvjJ9r?=
 =?us-ascii?Q?ShnrsYiYqLQzNknBWzVU7wYXHTwd59Vu5CzzS3U7vJLCp3uf1X69/xqI8+/G?=
 =?us-ascii?Q?21BkaiyqALmvHEYim/NUkwLISoNm53FrcQlshT0JUX+YiaD6XIcTJITjjhwK?=
 =?us-ascii?Q?4kvnWm/KIW9Us2XnK8UD3FBgMdFt3R2lXevyfFfF7jpbbNFbGBJhmUlrn2xt?=
 =?us-ascii?Q?OabJC63Mj1iHlToDJsQLPop0btPD9goiPCg6k5pCabH87sLQ7rpgG+fNuC9L?=
 =?us-ascii?Q?Wh4e3kdclF5mgfmrDxZny189MPio/SQQIQwfM58Vw/vM78s3PWvanuxcOHud?=
 =?us-ascii?Q?J64KKGqQTsEuA0qogeHRd1eRdAXviuxwvOdCphLmrK5nHS3gOClLWk6Bz2T6?=
 =?us-ascii?Q?KIRpqz5+QJjWV79OL/F1+TtofSLo/PhkKYQs+M1TixJeOZ8CDY+9pNzXrfZu?=
 =?us-ascii?Q?xNQQGLHZqHeIBMhYkR/cJaJUiVRbJMN0IvQWV3+wyK5BrNzdlUxbKNR9Yukr?=
 =?us-ascii?Q?/mo2oKtcdZAW3jKA6hXVwVuMv4ZfszJ989R2Vww7nOoB4gN4292E6epFmStC?=
 =?us-ascii?Q?x/yQg1zJifeorVTo9ecatYAb9emlEbCj4UmzaMVxyemuRL++t0KrF4+NpX7o?=
 =?us-ascii?Q?sIbSzMxebkRNzQL+BlErC9O0GDn1/+HREv59TAf3QvpTgsjNLfj9KBH4kgSc?=
 =?us-ascii?Q?ZDUtLWeKthdqKlx70PWZeLR8rYXuCgqTA9iuzi+nrPYCorUyhLNit0h2+m6R?=
 =?us-ascii?Q?8FLZ9dN+KiC6otVLpwxTP47K0ELeTzWHmrm1yLysETMZ6GuOeTMachXq/5vW?=
 =?us-ascii?Q?QEqcbewpW1ZHd6Suk5MYjYXsTBex2Wmrxoud6lWcnDzCuvKf4SGV5/r536To?=
 =?us-ascii?Q?fGGsOJAmOE0abyCyv3pg6FG9CDlwrWfWa1sM2x71X/jJTOTark29PrRijEVO?=
 =?us-ascii?Q?dLtyWQ2cjk+ArDbnAqvtuKGPX2zQjh5n3XD5J1f7+cL/kS7UJ4gcsnBMykqM?=
 =?us-ascii?Q?bA1yEUEcE90R3ijSVm5MnA2P84iCa9IWyfDKm0+uHeQbtPX0FkKP4wJEcpvw?=
 =?us-ascii?Q?OUnIisLmqXeWzFJ+c7URfvGdV7gKb3crZl2TfWIiqkTrl30t6hvFviSSorzB?=
 =?us-ascii?Q?0UEve8nEtZZfEsA/BDWGJHd8WddMGkNWEi7ySWrAWKJ4AXRcd1u/G0a2GjA3?=
 =?us-ascii?Q?1mF9Arb0V7b9Z63SCmw9q00cUHd2sOCd6dIm53GU6Z4jvuV770bspIaqtKRh?=
 =?us-ascii?Q?q10lv4nhyLah1Up3SFv6HQC63y0pcIbvsHV3/XgRRlmNyw43yUjnIaGM1gkJ?=
 =?us-ascii?Q?polaIii5GS7LBT2duT3tNE3wM6RUQGrTTZ0Wb7NdzPibpwZw4EmMYmftJLfN?=
 =?us-ascii?Q?RGWAKuU6O8qFTVtXrWGJBlCaFVPe7hPJpaJ7tVBPOYOoz18F7qElJE8l+fl4?=
 =?us-ascii?Q?tlP+dks2dA=3D=3D?=
X-OriginatorOrg: Arctic.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3772775a-b80c-40c2-87c3-08df0ef91167
X-MS-Exchange-CrossTenant-AuthSource: FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 05:05:01.5030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 51cc2c5f-af21-4667-81ec-d88d36e264bb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKAFTbl+R7OUcv2f0X46lvuzjF+aqjJmuFyUyr4FLFXbsUeTh/5TN5zwwBCfsFw/lO+hiA6oiGkWPor+s2by9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2PPF80BEA9E4C

The device has no GET_REPORT and every OUT report carries all 10
channels, so the cache has to start at some value. Starting at 0
means the first sysfs write to a single channel also sends 0% on
the other nine.

The MCU factory default is 40%. Initialize pwm_duty[] to 102 (40%
on the 0-255 sysfs scale) at probe and on reset-resume. Any initial
cache can be stale if the module is reloaded without a device
reset. 40% matches the hardware after power-on or power-loss
resume, and a first single-channel write leaves the fans running
at a safe speed.

PWM is still not taken from periodic IN reports: the device is
manual-only and the host cache stays authoritative after the first
successful write.

Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>
---
 Documentation/hwmon/arctic_fan_controller.rst | 26 +++++++++----------
 drivers/hwmon/arctic_fan_controller.c         | 18 ++++++++-----
 2 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/Documentation/hwmon/arctic_fan_controller.rst b/Documentation/hwmon/arctic_fan_controller.rst
index b5be88ae464..200e51932a1 100644
--- a/Documentation/hwmon/arctic_fan_controller.rst
+++ b/Documentation/hwmon/arctic_fan_controller.rst
@@ -29,18 +29,16 @@ Usage notes
 Since it is a USB device, hotplug is supported. The device is autodetected.
 
 The device does not support GET_REPORT, so the driver cannot read back the
-current hardware PWM state at probe time. The cached PWM values (readable
-via pwm[1-10]) start at 0 and reflect only values that have been
-successfully written. Because each OUT report carries all 10 channel values,
-writing a single channel also sends the cached values for all other channels.
-Users should set all channels to the desired values before relying on the
-cached state.
-
-On system suspend, the device may lose power and reset its PWM channels to
-hardware defaults. The driver clears its cached duty values on resume so
-that reads reflect the unknown hardware state rather than stale pre-suspend
-values. Userspace is responsible for re-applying the desired duty cycles
-after resume.
+current hardware PWM state at probe time. Each OUT report carries all 10
+channels, so pwm[1-10] is a host cache. It starts at the MCU factory
+default of 40% (sysfs 102). After a successful write, the cache reflects
+that value. Users should set all channels to the desired values before
+relying on the cached state.
+
+On system suspend, the device may lose power and reset PWM to the factory
+default. The driver restores the cache to 40% on resume. If the device
+kept power across suspend, userspace should re-apply the desired duty
+cycles.
 
 Sysfs entries
 -------------
@@ -51,6 +49,6 @@ pwm[1-10]        PWM duty cycle (0-255). Write: sends an OUT report setting the
                  duty cycle (scaled from 0-255 to 0-100% for the device);
                  the cached value is updated only after the device ACKs the
                  command with a success status. Read: returns the last
-                 successfully written value; initialized to 0 at driver load
-                 and after resume (hardware state unknown).
+                 successfully written value; initialized to 102 (40%) at
+                 driver load and after resume (MCU factory default).
 ================ ==============================================================
diff --git a/drivers/hwmon/arctic_fan_controller.c b/drivers/hwmon/arctic_fan_controller.c
index dbe84cd93c0..9a609257273 100644
--- a/drivers/hwmon/arctic_fan_controller.c
+++ b/drivers/hwmon/arctic_fan_controller.c
@@ -35,6 +35,8 @@
  * Measured over 500 iterations: max ~563 ms. Keep 1 s as margin.
  */
 #define ARCTIC_ACK_TIMEOUT_MS		1000
+/* MCU factory default; 40% of 0-255 is 102. */
+#define ARCTIC_PWM_DEFAULT		102
 
 struct arctic_fan_data {
 	struct hid_device *hdev;
@@ -164,7 +166,7 @@ static int arctic_fan_write(struct device *dev, enum hwmon_sensor_types type,
 
 	/*
 	 * Build the buffer and arm write_pending under in_report_lock so that
-	 * reset_resume() cannot clear pwm_duty[] between the pwm_duty[] read
+	 * reset_resume() cannot replace pwm_duty[] between the pwm_duty[] read
 	 * and the buffer write, and raw_event() cannot deliver a stale ACK
 	 * from a previous write into this write's completion.
 	 *
@@ -256,14 +258,14 @@ static int arctic_fan_reset_resume(struct hid_device *hdev)
 	unsigned long flags;
 
 	/*
-	 * The device resets its PWM channels to hardware defaults on power
-	 * loss during suspend. Clear the cached duty values so they reflect
-	 * the unknown hardware state, consistent with probe-time behaviour
-	 * (the device has no GET_REPORT support). Hold in_report_lock so
-	 * this does not race with a concurrent pwm read or write callback.
+	 * The device resets its PWM channels to the MCU factory default
+	 * (40%) on power loss during suspend. Restore the cache to that
+	 * same default, consistent with probe-time behaviour (the device
+	 * has no GET_REPORT support). Hold in_report_lock so this does
+	 * not race with a concurrent pwm read or write callback.
 	 */
 	spin_lock_irqsave(&priv->in_report_lock, flags);
-	memset(priv->pwm_duty, 0, sizeof(priv->pwm_duty));
+	memset(priv->pwm_duty, ARCTIC_PWM_DEFAULT, sizeof(priv->pwm_duty));
 	spin_unlock_irqrestore(&priv->in_report_lock, flags);
 	return 0;
 }
@@ -288,6 +290,8 @@ static int arctic_fan_probe(struct hid_device *hdev,
 	priv->hdev = hdev;
 	spin_lock_init(&priv->in_report_lock);
 	init_completion(&priv->in_report_received);
+	/* Same MCU factory default as reset_resume(); see ARCTIC_PWM_DEFAULT above. */
+	memset(priv->pwm_duty, ARCTIC_PWM_DEFAULT, sizeof(priv->pwm_duty));
 	hid_set_drvdata(hdev, priv);
 
 	ret = hid_hw_start(hdev, HID_CONNECT_DRIVER);
-- 
2.43.0

