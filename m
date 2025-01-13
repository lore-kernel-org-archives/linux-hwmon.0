Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995F414A09C;
	Mon, 13 Jan 2025 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736760543; cv=none; b=n00UEi236fjgAbtouNl0D+mOJDfww+IaMI2mjx3ght+LJiIiqn24pjRubQkP80LjKN4rUslGMKLFQE8N4u5tfwC5vUX9EsD4KRkVf/oisy62lMlDo/Ook0ZC0xrvGOe0KqEY8LO2IpDYRbFsixu3JtBRntMleXRo4x+ReBtWHew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736760543; c=relaxed/simple;
	bh=HdCdXCWCYKKqxlcgrFa3adax7aRLganB+vQaDKko+Ro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rsYGGnsYvvEPjBZiiAbh3wrqxsCgNTzehJX9iF0FJ1XAT7JKWffo/WbRBpw09cMlfdvE0xUyvJjlPdEo8sWZWCcG+pM2M2mxu1yzC2eOqLJ38aMbUnuG/EPHdC+6sx9a2ouKJJRAZ2af24+pf1xOss5LbDKhAleGBRkIyRrGqgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lT6AfIu/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lT6AfIu/"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so4052227e87.0;
        Mon, 13 Jan 2025 01:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736760540; x=1737365340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QpQ9AlCQLP6BQns+FgEwKwSOol1thjAJL13Qb3EeQnA=;
        b=lT6AfIu/IA/QDKtivymLjFkVirDaC19egd6kEq3/XH7tDdgZHOH3KiNX9YOEnvqnZ7
         O8vYV1qFTQS01zB3bjq9KX8Vs0O/DzOx4FT4SG8nwKxLaAFijYqv9t8/PjC4L15r4Hoi
         jz5hoz0mogbcxRGVEoqE9NwAVQIMhCYxmdlNmWfze5CrZDVxUgWfSm6Fkf3PBNuma+co
         Zr9yl01mmfgZt+Hbv7Zw3rphxaE9x6q5zUfPagrcG/JYzU849EGdYfqNJuf+coCjaPUo
         SKF7/JHXAgK/9cEOH/MeQOltI3UIhkP3I7x5V6DaXguy8p53WB1NGluQ2NIW7moty3+9
         33VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736760540; x=1737365340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpQ9AlCQLP6BQns+FgEwKwSOol1thjAJL13Qb3EeQnA=;
        b=otFZeXQIMPm4sjjbTYl6ePXv/eovo14yZByVaXVG5V1ZW8WepLYCmSAKSmw9QeC1F0
         zMjksqyjAZSJUXVvNu7HX/L/aF0YnfXWT0DJMkp3Kln4gJDUlyTfjxV0J8m1Z5Gn8tBT
         uYFxiRrGJbXaQvrPFf/04+uMW7c08aFUuEEWvKsmCg5zoj4/RiBT8Tya8d8CwmhCSdeH
         LvcxyoOZIrs9wPuFovwCh7F5686+jcCfLcV3q+CADWzDZCO1+zJRHYaJXWKDtU/8WMnq
         m3/3e9ULAekRbNsdnEusBVYAkrLzj3vr1tLdJr4X7/cV/JVCeJFkljUq7dtecpwTGtDj
         yaEw==
X-Forwarded-Encrypted: i=1; AJvYcCU0i+T7ECHdXcrhx2K1zsOlnEj50eN0bRZoN7BBreNPkhVj8f4/pItPyF0WVucoBsLZX0hoT4I9uU5eOos=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzptnd4onzEPXiUtJpvhIa7PBz0t77FAiTEOUGdVURsHKrkr2e9
	m24YrYMPttUsd46AbV8WuoMUfOEN7dpf4+uR/VPiG9714gnk9+nf
X-Gm-Gg: ASbGncvwMXBPFQgY5nvuKHugSuNgYJNIwYkaqenuOa7AHu4DlXS0OTxb11o2ep5zFz+
	v6QJRB/KUt8Uw9zqAicp5JdLhOU10z+k8ysX0GZqMmEXADN5NHwwWYHwGPdyx3gpZm0pTApoEuF
	KEMIRcCpZ9RSMC8avikLIPsVbQbcsJODzYyUBJlFlc+UQmxCGXbOPUueGQWcHEhVm4VjrBYfaHG
	A5Ase56f9eSsIASNLMXd9qqNI98ro0xK44GrB2VWZh1huXtQY5rDuVR
X-Google-Smtp-Source: AGHT+IFz3zzrCVLnXIXywVkKY8nvnD6k+VQjkizijZ9WdYWTp3JFUYUgsVJnclo93rrfkXC7m7gU9Q==
X-Received: by 2002:a05:6512:3c95:b0:540:353a:df8e with SMTP id 2adb3069b0e04-54284801c52mr6400828e87.39.1736760539327;
        Mon, 13 Jan 2025 01:28:59 -0800 (PST)
Received: from X220-Tablet.. ([83.217.202.104])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec073esm1295414e87.194.2025.01.13.01.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:28:58 -0800 (PST)
From: Denis Kirjanov <kirjanov@gmail.com>
To: robert.marko@sartura.hr,
	jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Kirjanov <kirjanov@gmail.com>
Subject: [PATCH v4] hwmon: pmbus: dps920ab: Add ability to instantiate through i2c
Date: Mon, 13 Jan 2025 12:28:46 +0300
Message-ID: <20250113092846.10786-1-kirjanov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for instantiating the Delta DPS920AB PSU
through I2C on systems without devicetree support.

Signed-off-by: Denis Kirjanov <kirjanov@gmail.com>
---
changelog:
v2: add verbose description
v3: conform to the canonical patch format
v4: send the proper patch version

 drivers/hwmon/pmbus/dps920ab.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/pmbus/dps920ab.c b/drivers/hwmon/pmbus/dps920ab.c
index cc5aac9dfdb3..325111a955e6 100644
--- a/drivers/hwmon/pmbus/dps920ab.c
+++ b/drivers/hwmon/pmbus/dps920ab.c
@@ -190,12 +190,19 @@ static const struct of_device_id __maybe_unused dps920ab_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, dps920ab_of_match);
 
+static const struct i2c_device_id dps920ab_device_id[] = {
+	{ "dps920ab" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, dps920ab_device_id);
+
 static struct i2c_driver dps920ab_driver = {
 	.driver = {
 		   .name = "dps920ab",
 		   .of_match_table = of_match_ptr(dps920ab_of_match),
 	},
 	.probe = dps920ab_probe,
+	.id_table = dps920ab_device_id,
 };
 
 module_i2c_driver(dps920ab_driver);
-- 
2.43.0

