Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFBC1C9B65
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Oct 2024 18:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727808108; cv=none; b=EX9JHtbwG5wqK3Td+UFLR3yKtA1cTYYpZKb7CncMnLIhAzlAs8EW226hvh0ewAy6fwRa3kgp0H04nXNMOmF0WdhZD5ZEBMKdn9G2l9/GUWQaQDus77SMXuT82yC0MruVa8s1tntTCX9zG3sduD5DqvQpxZIhZvRST9oyYfKLBRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727808108; c=relaxed/simple;
	bh=sdR39u/A1CJPbDBa22aFhD7LXwjleJsmDKEs/KqLOdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m1sqbSQUQ+6KfaPyOAFVlPM55VT6QQdXNnslZ52sJZhCemNjS/GWN3BUTG+e+bDHmsQFfkLAleqPtH+BIv59izkUvhgf+F+P5Og461gnIxavD6cR5jbvaF6cBnJew1W+XIFSiK+A7C48VgUvMDt2H454XZyq2CPH79A89j05BeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QReS2VI5; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QReS2VI5"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20b7eb9e81eso28826055ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Oct 2024 11:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727808105; x=1728412905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbRHTafoAcNqe3QKnUUONfOcbHQbqSpiRiLoZGxGtfI=;
        b=QReS2VI5ZK2p2Ngl469aBUyAZ3/kosKqP2V7ocUqBIF59+2DXUoVKZxM2KT0Z+rUGK
         PXG+Z+ihTD7mgl27B3zQnb+O6w1zLf3mBUHonsMOE+mtRVssYVtiCFW5U7FAz88p2LxU
         FP8HlB3tGEVYp8kRR20xZftlutTdbbNXFQj/bB4gij7IKBzNUk58hVozEmh8IIJT4vkS
         HMSuwz7zIqqJfZYgmdVbgbXt48QMmEwoh/5m26foISgjRTywNUP5iRJgSAD04WHFuI62
         jTLGQNTgIg4Lvu7dprImwQMP0gwJRx9UKvrOTkTmcnPm8iKqUbC7AKuMGtzwUYDHumYV
         xlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727808105; x=1728412905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbRHTafoAcNqe3QKnUUONfOcbHQbqSpiRiLoZGxGtfI=;
        b=WMtByTcWv7gEMLJECn+dPONpoqUp0dPohw6tv3J3NxnUVyCbfB8X1/PUUOvmBWLtC6
         cS9Zj179m6bAOAVsW7VRDBdZgwskbhiVM+VTq/Vuy/MnGCOWlCfEg6mRihwIJ7muWVlH
         4AJ6C0KuWvpzVGNLyvMQOZu2ef8KMma5YJDmrmfiC5QfnOb+LM3asT4nR9h4djw6xOic
         MRKqaYE+SsNaXh4hI1brcxqoMY0tC2l3Jw86QsPG6EtePKDJI/w2AV2hCz75uwZv/zwF
         mfvd5j22KixEZNaoQp2Ee+aMJf6DgRc+QAjeZYXi96Ajwe29vAPWMfVO22v/5FgYHl7W
         FAOQ==
X-Gm-Message-State: AOJu0YygDWPi8LQHj9LfQteHHbt6hx0kPqUgl04AphEqYXX65zw6D3eU
	zjxZ4pg9umwBSMf8726Yjs5OpM2QZ3sJD5LcCwb2NdKa19tEaI8K8yTATg==
X-Google-Smtp-Source: AGHT+IEnlA71L4rHnymToajg8m0o/AhJlMgM/O8JhwkLX9nFp1m4mRE5NT012rvtPHSKXsJEQjphpA==
X-Received: by 2002:a17:902:c40e:b0:207:4c7c:743b with SMTP id d9443c01a7336-20bc54c2b37mr9609615ad.0.1727808105365;
        Tue, 01 Oct 2024 11:41:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37d91aecsm72783505ad.89.2024.10.01.11.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 11:41:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	kernel test robot <lkp@intel.com>,
	Eric Tremblay <etremblay@distech-controls.com>
Subject: [PATCH] hwmon: (tmp513) Add missing dependency on REGMAP_I2C
Date: Tue,  1 Oct 2024 11:41:42 -0700
Message-ID: <20241001184142.1695624-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

0-day reports:

drivers/hwmon/tmp513.c:162:21: error:
	variable 'tmp51x_regmap_config' has initializer but incomplete type
162 | static const struct regmap_config tmp51x_regmap_config = {
    |                     ^

struct regmap_config is only available if REGMAP is enabled.
Add the missing Kconfig dependency to fix the problem.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410020246.2cTDDx0X-lkp@intel.com/
Fixes: 59dfa75e5d82 ("hwmon: Add driver for Texas Instruments TMP512/513 sensor chips.")
Cc: Eric Tremblay <etremblay@distech-controls.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 65ea92529406..68f585fc67c5 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2312,6 +2312,7 @@ config SENSORS_TMP464
 config SENSORS_TMP513
 	tristate "Texas Instruments TMP513 and compatibles"
 	depends on I2C
+	select REGMAP_I2C
 	help
 	  If you say yes here you get support for Texas Instruments TMP512,
 	  and TMP513 temperature and power supply sensor chips.
-- 
2.45.2

