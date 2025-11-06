Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C1528488D
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Nov 2025 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762425958; cv=none; b=B8nz09lwP8C7cPicZuoqOzvScfbQU7fsm+NY45coIhhVFdVSIRXceEOzgvIblqHaTKW6rKZHIPvOEXnA6OiWNtSrn5nxTEhD6jQDMREXkdgCv7vzLorOKorA9Hvg+5dOL73s9NI0x0ananb7C8kQtKiIZAr3JIJBC7N4Enwmu74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762425958; c=relaxed/simple;
	bh=j1+M3emMe9tqmPSbKCgIoXD49IQZIb4FHliGCLpUH2s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nas3LYIX9puxVEJ0s5QtbYiZqTJVDRSHtFqdp2lAQg/vKdVDNKM7wW0lIYIOVAWlR1uOXVmB6L1uRaNtO544AsGnW/Nyh+pUd+o13jIRhogHWDMPrfffEi3Cpwd/Qo5+KQ8OwGs7fnFm7moXeudWoFm6ok2a5dgxSMLx4eLRY/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPC8C40F; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPC8C40F"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3401314d845so1204330a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Nov 2025 02:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762425957; x=1763030757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bU7AjJowjDZcDckJUJRmtF/yOybguMZZsthXphjlG7M=;
        b=dPC8C40FSF/2NU67d8uEdc/lJIsnEun9IWGqKUw3aMl2FucG7j8kNYX1dtolirV9Py
         oEzWU6dYkAkiuduU3A0VtR5YQjqEuWi/I9A+Cnlsp8v1JB9QYlAanhCl7XvmgNm8YIPT
         OfH+dQXcFv4gLiGaz5HgT45Ut6z3UddYUxzX13MSPNgAqpmEb6HiKFfAex9Uk3Q+DHyL
         kVzMkIxUzXIzcUqbN1n1tJ3UauIcj0YALBZmvi5rTImpETp+k4zJjSh/wjDM+Y1Xw0ZL
         a30Hrp7/Ek8Z14RSDBQedZStuA7vEv1juObUfZGbAowxbqYGP2ND3CrC/GTd5B5kgilg
         D9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762425957; x=1763030757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bU7AjJowjDZcDckJUJRmtF/yOybguMZZsthXphjlG7M=;
        b=KN+zpdJ2XWERB0oct7vskXcVZTHwUzsWhDphVsj8wAfUA+j8ocvOuiuO0HpAdeINjm
         7iiM+hDFKRWoneH/u3CvpsfK2B2mCMD6kpt5R96imfje9xciWIgWLSiTtJvsNbihBM+S
         WuW6ac/D6YB31aUNT+Yaajh4B/u/ITjEwkZSMEBS1VGQSA1dR2W9tYfGvKAHGltYwUvC
         MH3nNzBk3sEd76BMK4i2AmruawnQxKlfvfjWVHWSQeb0zDRqN4ZJWCgHg5Q9ephxzWrl
         sMFZMqaA/A0WlQ8jO6sZrp7l3XbisGVzzco29zTdQPb81MI7BTESJd5Pe03D8RNJ7NuC
         kxZw==
X-Forwarded-Encrypted: i=1; AJvYcCUMsLlAaoKtNfllSQ//SJWDSG9cTogE0QRk6n080mXt6OXNib5yzqfeyl3eUKevFOc7upPJ5dtYwl3xWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtT2KC0cJ8qiuc0umAXqdAvkkjEJZrdpXSTQlRf7Czzih0pm8F
	h1L9dFjn+Wh+2HNWiyyiQBGRrpl1lQUTh3mBjZFPm9xSyUM2wJYVB4f4
X-Gm-Gg: ASbGncu8YPmof1DSHMa8tDA4DCAZXrDxJ76sLnuubcTtQJcd/0PtEbs3sU71hXR2cgK
	RTIxSNdGiP79oeyedK0Hp4TiJesLRbal5fqVbyyVUQcHKS2CLMg+sCXKlfY9uk4dUPjHzwfEu49
	7hRqKH5AHF/wZn/+h/ezqwX6XQKab0iMlHK8gFyTBATW1rcJ2vgJSzYtorRXUwbryNmzfgFPc1z
	p38oczcos6OFAEwwZvv7XVYFt96GhQiFGcayv9fkt6pkeynIqUYNnxkFwoae9RH8O2aaY5bCmcJ
	dy+k8YIp8YhZGiWSviqaVewkZoRMdjPMtg2j4DIfa4+2sWvwRF95qE3GE9uO6Mg5GabcySz1VaF
	kZPLQ/VkfiMZSZpC1X7Ed8xSDW7ru1LpvoYjA4v6YhMtEhLVEldNk6LxNEOlUm40jQ6VGfqfl/8
	9zclGQw90xJ3Po6VmEYYZQFhQcdC9Ex4wJnyhCYaS0/1IDyzZObks/08wQEaRcnz802x8PqxA=
X-Google-Smtp-Source: AGHT+IGYrXhINDrTOE+vTAyq/Tkw8JbEf+DgYAklG0E/QFs01OgyfTt1FyK/cKOnyNVyajgOy73KAg==
X-Received: by 2002:a17:902:dad1:b0:295:8da5:c634 with SMTP id d9443c01a7336-2962ad835bemr73847405ad.9.1762425956833;
        Thu, 06 Nov 2025 02:45:56 -0800 (PST)
Received: from JF.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5c72esm24199615ad.33.2025.11.06.02.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 02:45:56 -0800 (PST)
From: Jeff Lin <jefflin994697@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: Mariel.Tinaco@analog.com,
	andriy.shevchenko@linux.intel.com,
	cedricjustine.encarnacion@analog.com,
	chiang.brian@inventec.com,
	grantpeltier93@gmail.com,
	gregkh@linuxfoundation.org,
	jbrunet@baylibre.com,
	johnerasmusmari.geronimo@analog.com,
	kimseer.paller@analog.com,
	krzysztof.kozlowski@linaro.org,
	leo.yang.sy0@gmail.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ninad@linux.ibm.com,
	nuno.sa@analog.com,
	peterz@infradead.org,
	thorsten.blum@linux.dev,
	tzungbi@kernel.org,
	william@wkennington.com,
	Jeff Lin <jefflin994697@gmail.com>
Subject: [PATCH v2] drivers/hwmon/pmbus: Add support for raa229141 in isl68137
Date: Thu,  6 Nov 2025 18:45:19 +0800
Message-Id: <20251106104519.2014853-1-jefflin994697@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The RAA229141A is a digital dual output multiphase (X+Y ≤ 12) PWM
controller designed to be compliant with Intel VR13, VR13.HC, VR14 and
VR14.Cloud specifications, targeting VCORE and auxiliary rails.

The RAA229141A supports the Intel SVID interface along with PMBus V1.3
specifications, making it ideal for controlling the microprocessor core and
system rails in Intel VR13, VR13.HC, VR14 and VR14.Cloud platforms.

Signed-off-by: Jeff Lin <jefflin994697@gmail.com>
---
v1 -> v2:
- Modify subject and description for the requirements
- Remove CONFIG_SENSORS_RAA229141 in Kconfig
- Remove the part for multifunction pin in v1 patchset
- Rename function raa_dmpvr2_2rail_isys to raa_dmpvr2_2rail_pmbus
- Link to v1: https://lore.kernel.org/all/20250926014552.1625950-1-jefflin994697@gmail.com/
---
 Documentation/hwmon/isl68137.rst | 10 ++++++++++
 drivers/hwmon/pmbus/isl68137.c   | 14 ++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/hwmon/isl68137.rst b/Documentation/hwmon/isl68137.rst
index 5bc029c98383..e77f582c2850 100644
--- a/Documentation/hwmon/isl68137.rst
+++ b/Documentation/hwmon/isl68137.rst
@@ -414,6 +414,16 @@ Supported chips:
 
       Publicly available (after August 2020 launch) at the Renesas website
 
+  * Renesas RAA229141
+
+    Prefix: 'raa229141'
+
+    Addresses scanned: -
+
+    Datasheet:
+
+      Provided by Renesas upon request and NDA
+
 Authors:
       - Maxim Sloyko <maxims@google.com>
       - Robert Lippert <rlippert@google.com>
diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 6bba9b50c51b..97b61836f53a 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -65,6 +65,7 @@ enum chips {
 	raa228246,
 	raa229001,
 	raa229004,
+	raa229141,
 	raa229621,
 };
 
@@ -73,6 +74,7 @@ enum variants {
 	raa_dmpvr2_1rail,
 	raa_dmpvr2_2rail,
 	raa_dmpvr2_2rail_nontc,
+	raa_dmpvr2_2rail_pmbus,
 	raa_dmpvr2_3rail,
 	raa_dmpvr2_hv,
 };
@@ -399,6 +401,17 @@ static int isl68137_probe(struct i2c_client *client)
 		info->read_word_data = raa_dmpvr2_read_word_data;
 		info->write_word_data = raa_dmpvr2_write_word_data;
 		break;
+	case raa_dmpvr2_2rail_pmbus:
+		info->format[PSC_VOLTAGE_IN] = linear,
+		info->format[PSC_VOLTAGE_OUT] = linear,
+		info->format[PSC_CURRENT_IN] = linear;
+		info->format[PSC_CURRENT_OUT] = linear;
+		info->format[PSC_POWER] = linear;
+		info->format[PSC_TEMPERATURE] = linear;
+		info->pages = 2;
+		info->read_word_data = raa_dmpvr2_read_word_data;
+		info->write_word_data = raa_dmpvr2_write_word_data;
+		break;
 	case raa_dmpvr2_3rail:
 		info->read_word_data = raa_dmpvr2_read_word_data;
 		info->write_word_data = raa_dmpvr2_write_word_data;
@@ -469,6 +482,7 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
 	{"raa228246", raa_dmpvr2_2rail_nontc},
 	{"raa229001", raa_dmpvr2_2rail},
 	{"raa229004", raa_dmpvr2_2rail},
+	{"raa229141", raa_dmpvr2_2rail_pmbus},
 	{"raa229621", raa_dmpvr2_2rail},
 	{}
 };
-- 
2.34.1

