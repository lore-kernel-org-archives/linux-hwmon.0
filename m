Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA1E221479;
	Thu, 19 Dec 2024 09:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734601693; cv=none; b=jhZlrOR02hgIYwJSnpQEosQap8jQ7M8WRo7Y4XrBat8AQeyT2pxqfdJsSd8fARcXPs8LbP0LjfY3SFGZyNtyIpq+im5ATq9WQDI8KWGB4R6WBtdKGZOTZw7A0xwdoIbIITZolBndh3hhBcdvQnFfDJuI8XSXS6EhtwXbbvWSqaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734601693; c=relaxed/simple;
	bh=IY99j2Q20rM30ml7L3U7YJsEZRSn/kXFfUZdj1ziLuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dnwRMAALE61ODgxh9DZf5AdnhnYPKwD22on1f2wZ8jc/7Vfk8RRUJ3n4fbc8e7nIPzlxsQjYASY23Aw1sKeZ8mwMX47zQF9DfkwFACosa5LUNfTMYEG/yOm4cmkZQcs3jXmW39zJxpCBrqi4zRo8HzKA+Jd8eRMoh11/RiF3odg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWC+Cr3r; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWC+Cr3r"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54026562221so497001e87.1;
        Thu, 19 Dec 2024 01:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734601689; x=1735206489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8HGKDXnY4ZB5Jv2Zs9qpjyKQO/yNEa9cCq9vQzdr+yI=;
        b=YWC+Cr3rT0ANLBbSH1QMp4xCckRXe0kHvYDen/nRAiHPclFxOjbdiLvP/OGrFbIbtZ
         TRHrTCLUZFz64kI4Y3XXiO/ppdU59exbY2wJtvK6zD1jedC9jNCjEF9EZvGhc9q3x2op
         hScXRM7Lnv64fsaEEGk16PXU6Fgi7qQvCy9QSRbZsqZIWw4fpw07MGsw25gx+y6DKdWU
         J0QUxoPFDIffza/h5XLyXlhxKailcY802NfgqVfUo8yPDrwt0aTnApqritS7qm7IWRwd
         dgYWs5yJob3ZccWe/TodolzR8Yfm9acmYUr96M1h6y7RXzZn8GF7FKsLGFLHb0Ilvg37
         Y2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734601689; x=1735206489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8HGKDXnY4ZB5Jv2Zs9qpjyKQO/yNEa9cCq9vQzdr+yI=;
        b=Crr1r1baW6PSS2BnZk7JJEVOnyX2HpUvjg4qFP34SIuE+8l2TZgur7S54lw1sK2mwA
         Nmam2u/u2q8eynkl4i1DY/ibSZjrAaY8503mo5nsnGHSjZTYStAQvdITux0fQ0fG+q4S
         4jgYF9uje9nwg7Vc8mib2VGAMUOCTaI03SY3JISyXlQo6fnQM2BaLurC9wt6wRa+88J9
         28M7pn8qzyZ4LMLszaHUW1FkBadiLL1MDt2ado/fOF4840zW2wv5l2c5QIxl17YaXU9W
         ETz93yxr/h4KN/qbdQw/uaiflLVuzw9TrVhojN/yDyZ2I1lrvmoxhQQQQW81wiIT1zd3
         lYRg==
X-Forwarded-Encrypted: i=1; AJvYcCU5bK5Saak+G5nLSX5A4cq4CyumiC7dZoi0fJfaq/RBbYWyF8z8jig7JFVYTokztiIhOes+3KHFS+1GXV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YykKJZz9C+NqmWHCtls7KndglgxV6XFAOEMbZHxEvI5nIV4VLhM
	5SfM4RWwxcYhRSI0EGRFFpmf7Ryd3DC2z8eTk387QdbtLf7nhi0FHNJpufQ35GWvRA==
X-Gm-Gg: ASbGncuGcfO0oWdSnhel4JPhIkQa+ZG2OyI7XsKb9IvpDxVX9aQvy09yhiBXrBRBb0F
	mDddRIFpz8D8ZJyVzOMwfX5S1rjgoI0AkBabIlbobmYfcYVL7jOPeQX7jANmCJqDLO4Zq6lq0Sq
	cLQnCnPOw2F+gmvp1iqu1HLAPVqe1Deg8pRmU5hn1EBEHK4L5PSmfjFUGmNQRmLzAN1AfsUe+ZW
	c8omsRdN4cDIPc3dmAaA5Ug7a2YzNPMr/OBbCaKTXrk7bMqYaE8xGGhsezYXlbFyH+mHJULWQtZ
X-Google-Smtp-Source: AGHT+IEXmFpprXMJrI+CzYtTYY/MwPDxBNQMSJUsGk3+8LFyM1N/k/B/ssgmI9R5kiUTa0/wuZjkqg==
X-Received: by 2002:a05:6512:401b:b0:53f:167e:390f with SMTP id 2adb3069b0e04-54221030739mr721275e87.53.1734601689263;
        Thu, 19 Dec 2024 01:48:09 -0800 (PST)
Received: from kda-ThinkPad-X220-Tablet.. ([2a00:1fa0:487e:2931:7fa2:8578:ea53:de59])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813604sm123618e87.132.2024.12.19.01.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 01:48:08 -0800 (PST)
From: Denis Kirjanov <kirjanov@gmail.com>
To: robert.marko@sartura.hr,
	jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Kirjanov <kirjanov@gmail.com>
Subject: [PATCH] hwmon: pmbus: dps920ab: Add ability to instantiate through i2c
Date: Thu, 19 Dec 2024 12:47:55 +0300
Message-ID: <20241219094755.14098-1-kirjanov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now we can bind the driver with a command like:

echo "dps920ab" 0x58 > /sys/bus/i2c/devices/i2c-0/new_device
...
[616189.076211] i2c i2c-0: new_device: Instantiated device dps920ab at 0x58

Signed-off-by: Denis Kirjanov <kirjanov@gmail.com>
---
 drivers/hwmon/pmbus/dps920ab.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/pmbus/dps920ab.c b/drivers/hwmon/pmbus/dps920ab.c
index cc5aac9dfdb3..c002ed41f517 100644
--- a/drivers/hwmon/pmbus/dps920ab.c
+++ b/drivers/hwmon/pmbus/dps920ab.c
@@ -190,12 +190,19 @@ static const struct of_device_id __maybe_unused dps920ab_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, dps920ab_of_match);
 
+static struct i2c_device_id dps920ab_i2c_match[] = {
+	{ "dps920ab" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, dps920ab_i2c_match);
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

