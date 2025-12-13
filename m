Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68098305062
	for <linux-hwmon@vger.kernel.org>; Sat, 13 Dec 2025 20:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765656372; cv=none; b=q/iNUF/UBsy+sFoHC+EUKvtwX4zFXmWQqq3VQlDhLU+gOj8WN/zGeBgHnE0os7YvzDSOZPr8F+V3/QlaFlJIeYFyeaNFMz+sSeqP/Uwn9uyGOKniFIZ5LDWCocgQN2j7hXvCZBskLLJdq4FHlyWlWCvJ/fu0Njdq9ZyCtIzuUCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765656372; c=relaxed/simple;
	bh=vHDffevPJvWn0TDEIr3DY9YUUhJW/hc5O51BO7cTGxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lXwCccN3fnz0eyqUVDcz/JeadcCY1IgmMnTD0+Ald07CjsGd3QsBInX11nxY4sqx0FI0TL8pUt0wbJ4KKDQSlQA2njNcVuStwKvnbuM+uDPLLHwEyvFEJu58WXNh+14pYNvCdEnie4b+F0X+0+CBJptc9xfzFmahjrayWMB89a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdoMBnWB; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdoMBnWB"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso4793676a12.1
        for <linux-hwmon@vger.kernel.org>; Sat, 13 Dec 2025 12:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765656368; x=1766261168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/5dOQDrua+flNbbvn9G1hHNSy2Etuw4W2yCxnsNBYM=;
        b=OdoMBnWBXJUvgCt6FjFPSA/wI3XyYJr7VkA1XgisTNI/Z099SjhgpmX7ZbcSO6WQdK
         oBeNEnTLGBFqpzYaaGMJsnsLqL+m7G0lI95jbm2WrDS7Eh3jEj+/7axAGi002rigipQ4
         JlfS2ld4en8S8ZBmg/h9tXjSeZQrIpvwXRuM6RNpK1amicTUYPg8gbvxCFSkaJ/nouZt
         z6yBdC6jG03fukuvJBgLH4VcKW2BVBUVL5JWspFmJE5oNH2nU9XsIamZ3kjtI/qwUZms
         X4x6NXuYa3+O0TVJWn1Jh1inZBOMKYT2udZW2577AL7KPLl6nTIvz3I5iWcQWEUVXFlX
         Xrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765656368; x=1766261168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p/5dOQDrua+flNbbvn9G1hHNSy2Etuw4W2yCxnsNBYM=;
        b=pgwNaG8al04YAj3eONGWnd8KZ+IjrizmHaSpywpdh8p3qlt8aKFmB+OCNf7y5RIqly
         yHZb8S5afeCN8YOukbFUHJ2dAUPOQ5rA4lScOPEhyqo5Yz4s2K95f90kt+7MWbNzi7dx
         SVYi4OfsZc0WKh4Vcqvr/p3Hq4BmpHB44IXkujnjfngMa10LnsRTaEnSlg1qA0VuqWI3
         cLPI2php94KUd+BrASfgYoeGJOypbL/xKK+iiGSDRTFZ1lPehnNaqPnhaHJlm5PBD8Zj
         s6GSK1xVzBPMcuRr7WtUPqy4i4C0/aNVrXyJmtwUtES8UnT9lj0XyfP6bRSZxf1doUxB
         pdNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvDxuM4JSRkxbEUEzE03qsvguKYfXYDonJMlq3/LOcEngHKu9wd2KUDnAzH+jAHaQMmQp8epIDeeD48w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqCdce2PHS4wb5JMMO6Joa1PqsEFmKRqjiBlPQkdJmJk3/tlAA
	vOTdL3y1hPWCk25eoK89ukLlFQUyPd6bcz1WAwAE8qagB6LzEptRPAZn
X-Gm-Gg: AY/fxX7Ss6jW1ufD67AzevDx4h4FCOpcBowS9xD/VHYd2SUY0W69XPwkxzPFA4qe9/j
	qDHIo3opJnPIrRUWqU798815LPmF58yAJPVg0iPVGpwpaPTrYfI21ehrxThOcqkKg2w45yn0pCn
	gPNEiWMMYmVfiMUZrPmLA4CUW7lIO+2h2sj+qEyuZBl28qrAV1cdWzhfD4qjKej20CaFTBARcLZ
	BHzG1YnPxwtSk3PtJXDD/eSmctnVoo7jAHB9eP5ZWqzWte1PDmNtDnSUmQdlm5SqtxrM/UgXDfl
	yyhCOfL+RFwAuPahqomlpmm/CyXbHiHl9bzAsljNrUHRf/x5PPt4/4Ya0FfMxibWkjH3KfGwOad
	RjCiRZvL6VUcuGZqf3ae7MFIxlDL9EoP/na4ZO4XvsrS23b3FXieQBvh/cIZw9rcxbH0LUSMAqy
	7Sqkrxt/9nA/qJEqYxninHutsuPP69JQ==
X-Google-Smtp-Source: AGHT+IGkFR8KVg+zdxuuss0BF3hYrZ4HGGY7kbjmNzxD5Mlxslc8PoRc11H9ebO7TNQ9Ky1SaUI8cA==
X-Received: by 2002:a17:907:3fa5:b0:b79:ff60:8205 with SMTP id a640c23a62f3a-b7d217ed002mr729990466b.19.1765656367620;
        Sat, 13 Dec 2025 12:06:07 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa517558sm919073466b.34.2025.12.13.12.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 12:06:07 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Robert McIntyre <rjmcinty@hotmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (asus-ec-sensors) add Pro WS TRX50-SAGE WIFI A
Date: Sat, 13 Dec 2025 21:03:43 +0100
Message-ID: <20251213200531.259435-4-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251213200531.259435-1-eugene.shalygin@gmail.com>
References: <20251213200531.259435-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Robert McIntyre <rjmcinty@hotmail.com>

Adding support for Pro WS TRX50-SAGE WIFI A, which is identical
sensors-wise to Pro WS TRX50-SAGE WIFI

Signed-off-by: Robert McIntyre <rjmcinty@hotmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index fb32acfec0f5..58986546c723 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -10,6 +10,7 @@ Supported boards:
  * PRIME X670E-PRO WIFI
  * PRIME Z270-A
  * Pro WS TRX50-SAGE WIFI
+ * Pro WS TRX50-SAGE WIFI A
  * Pro WS X570-ACE
  * Pro WS WRX90E-SAGE SE
  * ProArt X570-CREATOR WIFI
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index ef4561ae38f9..8435be30c3f7 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -801,6 +801,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_pro_art_x870E_creator_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS TRX50-SAGE WIFI",
 					&board_info_pro_ws_trx50_sage_wifi),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS TRX50-SAGE WIFI A",
+					&board_info_pro_ws_trx50_sage_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS WRX90E-SAGE SE",
 					&board_info_pro_ws_wrx90e_sage_se),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS X570-ACE",
-- 
2.52.0

