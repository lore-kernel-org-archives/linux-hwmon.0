Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11023140.outbound.protection.outlook.com [40.107.201.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E9F47A877;
	Wed, 23 Sep 2026 09:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157529; cv=fail; b=CDprW9zN2ea/aZLI1drptz0OmGzGE/x3DfkMkjGW6ubqoHrkm5ydNkMIMNhdPWcPW1k3ja2fktJSezNNUbR+VLZhpluA5Tbd6MBRHgcXUvMyd9suhQBGwvIQAibe25dKMDfl0WWwdyE3U52fTUlk3J2ju/6QmJi5QN9qBTonGBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157529; c=relaxed/simple;
	bh=9PKY4U6RektIZixwKli5B7FP355D0+N8qlleDRIOjNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JqSj3Plsx3YNrex4Bd12hSStpY+rAQfd8CSz2eaQClXafBrLL5soTp2AWVNJMljHIM6l9X582QRYL0czjEUVnL51XMmkfetk86473Mjsz/dK4NchBt3JmLwSQoR0tk2t98zDSn3ZsyrKJ5kgIJAdXDZ/YIt4hQ79h+VQDQ8pHz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=s+REhhba; arc=fail smtp.client-ip=40.107.201.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="s+REhhba"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=huz9xKQNjN90pzddZpBzBjoB5U9NdIkPN4lpWTCpCdx3eSyz0tLqvox8lqimirDhjvJk1q6tZixWTKxabMS23ULBJkc29uIkPI6RLHJdPu9sjc67vJrh/Av6GGguBQvKUnUfir3asdoAEC/FkL3cdAGCU272pOqCAV9dsGsDVTAYLfiz0wxCIbhrqrk8EEGaD4ELvLW4hXhFuIAhZHKZ2lSLh0yR7Lei4mqJ2Jf1VZLhK1UxqzrbJcFi8EHrte71L5Lg2NhDCtcZvR7NbzsWR62prvdewu11t+yfN4Tw1FKXCZ0Gi4N/6hp3n5q/wle2VsJRbIj57g5w7URRk50k6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpnETAfsqYc10XmoLEwk2BT3IzV0tPKMTifcL6XfZVE=;
 b=a+uXVW4amaZnkfBF1SjHqf1tPBBsfxGUQiiNxXtgwoRZ27+QonBSeH5iOK0152qwSN3TNEbhM+Syid9jqxVDfTqm/OnXiTXv2qX4WE8i2mPa6zlu6Eop8k38fjPCQkjex5/RjbFKLHFsuMtLYINqMKzRSrDXU91ID7MMCYXeRCeMZxkM8rexMmZq+of4IukG06RzrtLULqXJTCa0mP3Nb6Zk11/s28hA4KexdLSrMktQ7NA14KoFeePPVwJ07ztpCP6A55+fJpoClMa12g9PfCeVdCawUUBpZLNkbaWQ6UzH3vJN8bDwSCE/V72NBEgA+iemvBxT2HEjv/7aHbpj1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpnETAfsqYc10XmoLEwk2BT3IzV0tPKMTifcL6XfZVE=;
 b=s+REhhbaaGJKYell4BWccrUpkwMvjebp4493veAbt+TACLavzQKNIRlHT51qpxgbif9NkS8mOnCnHWBb60xOcKyM1jFSx0coD3izaQ1cFBUhMNR1U8HheKVMx3IAbYLk6L3lH/iMZSBRyIq4GXVtiTkd0TC+koieTcGmFqjxZNhovQXuU/YbJBMuWP3MNzncp19saCzinh8Gx3hAS6fXVXIyWB0fQvnewgdY+uLqGHCR1/sh7J1voMPWjLaaDallcciCjSe/eedSRYTFfZFfhLRCYgAS4sO5uD8QfGuAvgE8s+uTNCuh+uUAHEHYpY0fFA1jrZPsl40fI9+WvQtWcw==
Received: from SJ0PR03CA0081.namprd03.prod.outlook.com (2603:10b6:a03:331::26)
 by DM4PR18MB5074.namprd18.prod.outlook.com (2603:10b6:8:46::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Wed, 23 Sep
 2026 09:58:43 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:331:cafe::3a) by SJ0PR03CA0081.outlook.office365.com
 (2603:10b6:a03:331::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 09:58:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.5
 via Frontend Transport; Wed, 23 Sep 2026 09:58:42 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 31B234186B51;
	Wed, 23 Sep 2026 02:58:42 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Wed, 23 Sep 2026 02:58:41 -0700
Subject: [PATCH] hwmon: axiado-pwm-fan: Add missing documentation and
 MAINTAINERS entries
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-axiado-pwm-fan-doc-fix-new-v1-1-8c8c2ce58a21@axiado.com>
X-B4-Tracking: v=1; b=H4sIANCis2oC/yXMQQqDMBBA0avIrDsQowjtVYqLzGS0U2giia2Ce
 HejXT4+/A2yJJUMj2qDJD/NGkNBfauAXy6MguqLwRrbmbtt0K3qfMRp+eDgAvrIOOiKQRb0Rlp
 LRIaJoQymJCVd82f/d/7SW3g+j7DvB24L3fN+AAAA
X-Change-ID: 20260923-axiado-pwm-fan-doc-fix-new-d0e42bbb0cbc
To: Akhila Kavi <akavi@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, 
 Petar Stepanovic <pstepanovic@axiado.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790157522; l=3056;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=9PKY4U6RektIZixwKli5B7FP355D0+N8qlleDRIOjNo=;
 b=Bg4H9yjEMWDwjfHURIArdzNkqceOY3OLqDeevOcgpbNbTqHbtrN1PA8Q41cYMK4J8VUSg5RZx
 je+sjYIYy7XCnnw15b3qqZYE13NzEUY+aMy2mP2V3iwTwrTRhsT3XCl
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|DM4PR18MB5074:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6bac21-1d8c-48bb-2d70-08df19594006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	/t/DUlyzCRRv45UqCbUZxAlwdo8znhM9C1PGMCbLt7xQ2LmNDiIUvZyNV7vUuBJCPqfYGMCzxtBJKlI06CILBuEGAMhMlq4GmWRrmAZ6pOLdAuHb8nudth0ev5wq2d5Npuh5zp+PfpaXwHp6x/1zoSsLfQnp6Q7CwV5wRJFyqN+lKuVwKhJV0kOb6Csqoy7iOM3zsr9ALnZO3VYakAyznovC70siMMPQYVApl9DiuMw21Uh53/N4CsDogatM7CG0vfgPttTTF3WfqfmsUeJpNJ9ESennSwTKb7KnlYnwJ49XoPdslo3T7i3Od1oLnzdOSufEPiC5zmTE6iWYZa7bIgt00XSUmF22nrq6ycMKjA02UiBlxvMgP7WhASLZvGlvwIAOQ2AVzKWMmRxFXxh5RGzERiK69Y1J5k+xLZvNV2ApfvSvq9cC9DEVkai3FeD0kZ4DTXhnTr1H7VQXvsBnj21pN31MztacDN5UXi1chTLRsi1hTMB2NkncEWAhPfrAba+XBWB7ggAa5eWp8ARQ+5jkwElT0oqcTZePwvQ7Ka0rn5IGpsgCpIzBM32J3XkbpZestC1faHUXtny6VDhObKihtbYBYvljJBrTZyxXjqYjtQHrOmblSFkATAOQmM+jBHqje/Pr/aHX47ib8XGxyUYY8yDeyNEyCF3nMyIe49NddfqEyZU9KEom31Kchhh/awr6jIqv74W1EXCcqmpXIw==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e7+BMIOLadGOu/FHpTLzYr4mNCZ6+4EeGFU9Lsp3CP6MRmTw+e58MSc5So1tQEM/8/7sQGNZ4wtQK1AY+T4RvGuFr/WhiRDJxF4bIMy29CZ0UhY71nWPLydXYofYF/PWCX9ibZJ67OWrpkqgalI4nrXUG04Cdq/KCtDWd3nePIEeslFt3OuBD6mlQgQFgx9LiECXVplpEhqx6851es/zH0KZDsYME9/s9bddZNKyvZMuYMnHsZNTHkx/hHCu7pdoYhAUHn3Ag8qNklNB+p40MfXoPy85CLColR2zrtQIL0y6rA/tTvILk3i16RPHTjc51yzi89SpEURJ8mnurmCJG59k1jaNbs58lZcjf1UgbhBzlZPKwJMa2bMh13FnsZ+6iCqeF0JcxgEqYgyn0zma1zrVvloW0AC5oIAiKLn7f9AZpFYGjvcfPje4RV1t11jO
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:58:42.6386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6bac21-1d8c-48bb-2d70-08df19594006
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR18MB5074

The axiado-pwm-fan entry was added to the hwmon documentation index, but
the corresponding Documentation/hwmon/axiado-pwm-fan.rst file is missing.

The MAINTAINERS entry also only lists the devicetree binding and is missing
entries for the hwmon documentation and driver.

Add the missing documentation file and MAINTAINERS entries.

Fixes: 2d52742f408f ("hwmon: add Axiado AX3000 and AX3005 PWM fan controller driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609230904.aIWyLsSt-lkp@intel.com/
Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
This patch adds the missing Axiado PWM fan documentation file and updates
the MAINTAINERS entry to include the documentation and driver source
files.
---
 Documentation/hwmon/axiado-pwm-fan.rst | 38 ++++++++++++++++++++++++++++++++++
 MAINTAINERS                            |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/Documentation/hwmon/axiado-pwm-fan.rst b/Documentation/hwmon/axiado-pwm-fan.rst
new file mode 100644
index 000000000000..d110e170b0df
--- /dev/null
+++ b/Documentation/hwmon/axiado-pwm-fan.rst
@@ -0,0 +1,38 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver axiado-pwm-fan
+============================
+
+Supported chips:
+
+  * Axiado AX3000
+  * Axiado AX3005
+
+    Datasheet: Not publicly available
+
+Author:
+
+  * Petar Stepanovic <pstepanovic@axiado.com>
+
+Description
+-----------
+
+The Axiado AX3000 and AX3005 PWM fan controllers measure the rotational
+speed of one fan using a hardware tachometer block. Fan speed is controlled
+through a PWM signal supplied by an external PWM controller.
+
+The number of tachometer pulses generated per fan revolution is configured
+through the ``pulses-per-revolution`` devicetree property. If the property
+is not specified, the driver uses two pulses per revolution.
+
+Sysfs attributes
+----------------
+
+The driver provides the following standard hwmon attributes:
+
+=============== ====== =====================================================
+fan1_input      RO     Fan speed in revolutions per minute (RPM).
+
+pwm1            RW     Relative PWM control value from 0 to 255. A value of
+                       255 selects the maximum PWM duty cycle.
+=============== ====== =====================================================
diff --git a/MAINTAINERS b/MAINTAINERS
index eb3cc6c81bcf..5ad12c57ca5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4504,6 +4504,8 @@ M:	Prasad Bolisetty <pbolisetty@axiado.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/hwmon/axiado,ax3000-pwm-fan.yaml
+F:	Documentation/hwmon/axiado-pwm-fan.rst
+F:	drivers/hwmon/axiado-pwm-fan.c
 
 AXIADO SPI DB DRIVER
 M:	Vladimir Moravcevic <vmoravcevic@axiado.com>

---
base-commit: bf92ea2a46120fd0809f24d39ad3482d0f20876b
change-id: 20260923-axiado-pwm-fan-doc-fix-new-d0e42bbb0cbc

Best regards,
--  
Petar Stepanovic <pstepanovic@axiado.com>

