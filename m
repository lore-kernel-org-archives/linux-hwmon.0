Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011066.outbound.protection.outlook.com [40.107.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A9F20C463;
	Thu, 19 Feb 2026 13:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771506099; cv=fail; b=s7kVHbEICvxMr0p7CK0J4WpQ5VADa4ArE7SxhLuq8xRU569EJsNJoiC+A6Dri958vWjNNKX3tIzw8WQ4QbIybt1vM7fNbVTSoLPVlJZ8d3tRvGM2neRijWXWA15LaeIMM1H9sHf3ut4yldyQhwFAyk0/c9FcnsHPog6Y8TcuPeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771506099; c=relaxed/simple;
	bh=dXmdAqKsZDhDiJIIC7aj2McdlQUR7STpxFZlh+M15zU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MhK+7JE00hHDsOf13peMlh83Y8+Cef2MWVw8iqY5/A1UsHte/aBman3oGuCvQALpcAtrfuuax8dU77tU9wPMgxVNjlg88cgA9RIzBGwoB9pOP/2ZDcxTj8Edilrt/R82gc7l3syfyFoA/pm50TyYuXyVp9tO9wOhujXB8Ydf8eU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=obuVWuMN; arc=fail smtp.client-ip=40.107.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="obuVWuMN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mz1Zo0YBp6rlvTZe6UdU+BW9JrIGwwahAaWIZvq68pP0e6dcaOPKuDdqplrYm6Z63mQRHQYQ/vSG+FeCDsOrTbTO+HeJNwlgmC7F5QAE/LJG2HKXbo4uu3f4QVXFbYwy5nPvsIlgkAwzWUsyBThCY867ypHQiB5KKt1fzGc86Nnp7ygkzk0JOp29kFw7L9YehfCtT283ZbBGwkqsyLrcrgn+XtJrm/7b8gYeibdtzksV9nsv0DNKANZGIJ7NpKFekDXEnMV5UfN2QeTP/lh08ShtM6I/vZqLFpksbmdTb4rJfTjCJrREaV1GyuKOdHmFVdwei0pOTv5wp1XH2m3zvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXFjkdZydXP3TdQVz7aHK0YK3YquAvnAG1S9XMijw+E=;
 b=GN3R47wGSwXvh4P6ESXWj1hN2fvvNkRzc4Kx+3KymXmDXR6k9qOOOvEygtxSfAk6drz9nZJxlHb8dg0lahH4BycSngSCZumTQmgvxzJLNbe/FGAth4ZZaM8rvwoo8zTptMr2gsQ1li+7+V3IVnS5oWQvXZxSMqY6mnooT8QNxyIiwYsOA7kOTXSWJEx0WZ6x14i8Z0rlV+ks8KDgxUIhk0XNTuKehA4bsI8eC8ll+jvXYpbBTzYWaYnNkoGdSsNHdzIj6hnxi/0HbXVMIaCICQZ4EcaN12t4/i4hjnI0SXdsdojF2e/sug+9hP0EPbzcLpNskrT+Et2saONcCRoYPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXFjkdZydXP3TdQVz7aHK0YK3YquAvnAG1S9XMijw+E=;
 b=obuVWuMNbT/zPSIqqf28UaPS2rMlEjaB3YU9PPgZ7cIkLwyzCjHRjaq4uVVa3TRTLYDaFPUaVoK9vJDNj8eWS85kQeES9S7qz1mT6PCt8IvPy0wCx0rocBOc9axADylRVKMavlJtgY9wI9E+5pUSoiYpWLo9eXDS9TOhu405/Xrz3mg0RgiMQOSW/3tj9r+UErbAT1ktWgftkBKnXsU+i1sUR7kz+MYM3n8oka/VxMVu4Qc201Wx6HppfRgi678JwNt51t9Szj9nkxCWEKG05tkQ8TZ+43vOlFSCmwg5oOpKcSLdN24rkLWlsRPMeCIWvsJ7OPc8sAP5SczIDZxiaw==
Received: from SJ0PR13CA0129.namprd13.prod.outlook.com (2603:10b6:a03:2c6::14)
 by CH8PR22MB6082.namprd22.prod.outlook.com (2603:10b6:610:2c2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 13:01:36 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::9a) by SJ0PR13CA0129.outlook.office365.com
 (2603:10b6:a03:2c6::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Thu,
 19 Feb 2026 13:01:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 13:01:35 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 6A7C5FFDA3;
	Thu, 19 Feb 2026 15:01:31 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	=?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
	=?UTF-8?q?Toma=C5=BE=20Zaman?= <tomaz@mono.si>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH V2 2/3] hwmon: (ina2xx) Make it easier to add more devices
Date: Thu, 19 Feb 2026 15:01:23 +0200
Message-ID: <20260219130127.87901-3-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260219130127.87901-1-ian.ray@gehealthcare.com>
References: <20260219130127.87901-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|CH8PR22MB6082:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c3030d49-c214-4f3b-8579-08de6fb7034a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5bdwyEMI/gNr+50Vr4+6ltxotuhVxhQ+eb7O3zxgs+xrVnPUcZ1Mwni3mHE2?=
 =?us-ascii?Q?HNouSfyfC4SxKEYjgTlNv25Q5BsXYzbU6of/+opI7gw637UN57wiksgHZKxO?=
 =?us-ascii?Q?mXsQnq8kuUIFBnyvr2lByHZrs/E4NxELrCmSxrtVctExgpeT9bgFX+u60XEU?=
 =?us-ascii?Q?+RnP/uYYEP91clTAyGhwp4eyYrLBbiMY8tTrRxC6XJkcZyks0zCQ8cWTwEdL?=
 =?us-ascii?Q?9yP5g4Z4BGbq7kvYIfNG+msChcte4EHEhySHNbM0mjnB5lU3jw6ejDhuCn+1?=
 =?us-ascii?Q?U31lkW1QVx4RV6BO3+35eeHYrOn/mqsBCSBXaNTWHXp3Pw/8Hyyskccsipjb?=
 =?us-ascii?Q?ZAh/QRomMJsgQVUpX/85YrqLgV2LaX7s4ihD7LAVACS7DLPVvsfdwgeyf+1f?=
 =?us-ascii?Q?GpT033SSAOk0CzHIQjcvBUAAp8QVZPi6pEaGJmtDlOlH1P/rk2MxTN7zjrdI?=
 =?us-ascii?Q?5eJWTDm94y4Vcyc+CZ8mF8A9MJdB/0zYul1hdY98Ff3l5vhsS//wVYXVl4WT?=
 =?us-ascii?Q?dIntHCe3TDcLvr+3zbHFW5l/tfDGBF9p1Ch1jVNszKsDD/ce2sig8iXRL+LA?=
 =?us-ascii?Q?RBHIFARYbrBdKYI/TruSqVhLhDbHUSWRjRtrYwsH6X+5Mrzqd39kOYhvqnQn?=
 =?us-ascii?Q?+z06CCWHHl12IUaCWMXX7I9WrXxkMGns5I6BhKog/7GBOALwM56SB6qa8wXA?=
 =?us-ascii?Q?TYU6sCrZOZC4wHCtMH+NleQIehhBXCqxAsC/1R+JqZ5ezQx1l98CeJ8X2eNw?=
 =?us-ascii?Q?zCwmhLngEkQYTk3QzQM1YISsPuMAwfBUXBcuMr41gBeJTDGvJeNg8fJFJybF?=
 =?us-ascii?Q?vvs9imv/9trRqBlIynpIqNXxV+i4YNoWAEKN9oX1LyfGvZKEk3yFs4/uO6aN?=
 =?us-ascii?Q?UJSkblumH/8Vob1BtRP6SY9Amfg/MXspVxkSkJfPvtI0tYiCxghgEhghDGU6?=
 =?us-ascii?Q?vzm0wlGQ1EKHydThMUw5p8wjWbwl3MXnr/OzkJJoz8ozOh9PwKQihrnMqtPP?=
 =?us-ascii?Q?lOoE0bb34T5JitaviIBw5eZBx2+snjDH3RTA+ppn/p3CbOmjKUQCcjgQTNEe?=
 =?us-ascii?Q?5T4d3ObeRdVfo2ooLYUh3jiYooh3X5+gWgliUggnzlEkPI3LfyuPpoVdUw20?=
 =?us-ascii?Q?Pni+VxLVz2Jb8bY5FF28/IvgH3nMkr5Nby5pplkXKS9VaTrDz/+HGJBhh/VC?=
 =?us-ascii?Q?8JvGXMIDXyNkpQlGkKeNJ8wHi+LtTgwotnUp37UC274dsv97sRNZ+To561xV?=
 =?us-ascii?Q?PBKoqO4mPH+aDbjwmwWC5556BXmiTF+HjLrQcm9VKKBdG3hEv79EhfacDDex?=
 =?us-ascii?Q?WsJIXIdWGGoyBBBfbphMFNAM850slFXGL7/AGt7DN2BMYQpJ8UZG7VFVFrw2?=
 =?us-ascii?Q?RF0eyK6aZhLS4Z8YocIDXGC7fjY212huwhcvVEjJ9+PzwvTQ9wQ0tdZX9Abt?=
 =?us-ascii?Q?YyaJHFpVpBDvNKn0O7zEWkvMIbJLeU9FdlyBsmgCj/9mbpgURlZjFCE6c+CM?=
 =?us-ascii?Q?e4lLgvj1N22pP2IljV+X/7VzRurCr7A20PIQx5kLzYVRs/EnyT7ZQx3PEjDP?=
 =?us-ascii?Q?qeq0WxrXO3aN3smtwx/WcyGJsJnpQ/LyCXHiLiCw0Uigo4Fn6Oo7WlCg0wSt?=
 =?us-ascii?Q?YxqieGX+eVC+UXkVPS5qM1sulNGOzKVePrfW59sLQzUJVX1AFvu6uOkmjUnK?=
 =?us-ascii?Q?VhmN0g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XG+3K7qkKlU17KsFap5TmH35Bkc1WxkBGo07vXsnfSiYTCKbCjq4NtrCkIMkSRZgEXNwy1C6SvEuKFWge3Df9wRQiAotxJi4LqfCv8rrTxMS4V35L0yhELP3kyj0UxgrJVmrcKdGBYTMIyXq2tQEwerR37MKC8obp9YJJmZoSxPvX0h9FBTuLwaw0JUlsKeLVlHjYHNCQSZaa84jyio5znj/SMcZFnSf2D2voj5t2iKR5jXdK0EWzF7QssyZoFVILoSKjRzMBrwpkNVHp3cXDstvLlZ/PG2EM4s7ITjZY2Mkzu/NUpAH/5M+uHEyP0Ht9VbysG+igp6x0sBJRrrbA5zXJiiWvLRRs9OytJ56BsoEx0bGuvoSXS5ed0hRULImbPUPdfuOb3u0ozzNB7jbkuIEzkviNGiCMLlIallzqlzzsAsysIQX15xp7pPfgDKI
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 13:01:35.0798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3030d49-c214-4f3b-8579-08de6fb7034a
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR22MB6082

* Make sysfs entries documentation easier to maintain.
* Use multi-line enum.
* Correct "has_power_average" comment.

Create a new "has_update_interval" member for chips which support
averaging.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 Documentation/hwmon/ina2xx.rst | 12 ++++++++++--
 drivers/hwmon/ina2xx.c         | 21 +++++++++++++++++----
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/Documentation/hwmon/ina2xx.rst b/Documentation/hwmon/ina2xx.rst
index a3860aae444c..a4ddf4bd2b08 100644
--- a/Documentation/hwmon/ina2xx.rst
+++ b/Documentation/hwmon/ina2xx.rst
@@ -124,8 +124,16 @@ power1_input		Power(uW) measurement channel
 shunt_resistor		Shunt resistance(uOhm) channel (not for ina260)
 ======================= ===============================================
 
-Additional sysfs entries for ina226, ina230, ina231, ina260, and sy24655
-------------------------------------------------------------------------
+Additional sysfs entries
+------------------------
+
+Additional entries are available for the following chips:
+
+  * ina226
+  * ina230
+  * ina231
+  * ina260
+  * sy24655
 
 ======================= ====================================================
 curr1_lcrit		Critical low current
diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 69ac0468dee4..4bf609e25f8a 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -46,9 +46,11 @@
 #define INA2XX_CURRENT			0x04 /* readonly */
 #define INA2XX_CALIBRATION		0x05
 
-/* INA226 register definitions */
+/* INA2xx register definitions */
 #define INA226_MASK_ENABLE		0x06
 #define INA226_ALERT_LIMIT		0x07
+
+/* INA226 register definitions */
 #define INA226_DIE_ID			0xFF
 
 /* SY24655 register definitions */
@@ -135,13 +137,19 @@ static const struct regmap_config ina2xx_regmap_config = {
 	.writeable_reg = ina2xx_writeable_reg,
 };
 
-enum ina2xx_ids { ina219, ina226, ina260, sy24655 };
+enum ina2xx_ids {
+	ina219,
+	ina226,
+	ina260,
+	sy24655
+};
 
 struct ina2xx_config {
 	u16 config_default;
 	bool has_alerts;	/* chip supports alerts and limits */
 	bool has_ishunt;	/* chip has internal shunt resistor */
-	bool has_power_average;	/* chip has internal shunt resistor */
+	bool has_power_average;	/* chip supports average power */
+	bool has_update_interval;
 	int calibration_value;
 	int shunt_div;
 	int bus_voltage_shift;
@@ -171,6 +179,7 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.has_alerts = false,
 		.has_ishunt = false,
 		.has_power_average = false,
+		.has_update_interval = false,
 	},
 	[ina226] = {
 		.config_default = INA226_CONFIG_DEFAULT,
@@ -182,6 +191,7 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.has_alerts = true,
 		.has_ishunt = false,
 		.has_power_average = false,
+		.has_update_interval = true,
 	},
 	[ina260] = {
 		.config_default = INA260_CONFIG_DEFAULT,
@@ -192,6 +202,7 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.has_alerts = true,
 		.has_ishunt = true,
 		.has_power_average = false,
+		.has_update_interval = true,
 	},
 	[sy24655] = {
 		.config_default = SY24655_CONFIG_DEFAULT,
@@ -203,6 +214,7 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.has_alerts = true,
 		.has_ishunt = false,
 		.has_power_average = true,
+		.has_update_interval = false,
 	},
 };
 
@@ -706,6 +718,7 @@ static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type
 	const struct ina2xx_data *data = _data;
 	bool has_alerts = data->config->has_alerts;
 	bool has_power_average = data->config->has_power_average;
+	bool has_update_interval = data->config->has_update_interval;
 	enum ina2xx_ids chip = data->chip;
 
 	switch (type) {
@@ -768,7 +781,7 @@ static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type
 	case hwmon_chip:
 		switch (attr) {
 		case hwmon_chip_update_interval:
-			if (chip == ina226 || chip == ina260)
+			if (has_update_interval)
 				return 0644;
 			break;
 		default:
-- 
2.49.0

