Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3E1390C86
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Mar 2026 14:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774104321; cv=none; b=G6Ej12dcIDBrVt3e4Xnum58gOhsmJlCtwmmBZ1aBwth0/aCCuqp0f5Fnhbt8iANusgAbdsPE8tOR783MvmBIJN+DhtS3o7cWjoS2Ex5sfYyXqulFMP9XP7QL6HIMUUXbeu+uZ0uzy8M+kYEyMlSWcR3pfzwZ4Hj1Umi0NWPQ00o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774104321; c=relaxed/simple;
	bh=I5Jbz1iLh1ZOZA2iQIUPnIReRTLqAIVDhHJavYpI4ps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C47rZJD/awj2jMVwB/qzohPScV2Br/LazOceBqcocwMT4uT+7iNmRb1wJkP0Ep+nQT/TId/EjUMO+N1TxcJeniHnWMpQ3oqGiNX6HXc+6eLXGR85GE5Sa28Nv0dghHGTvu06aa6eEZufXLpZquou7XakGygtX0wI5WdA/JSj6xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTkSCoB1; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTkSCoB1"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c0bb213b16so5011954eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 21 Mar 2026 07:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774104315; x=1774709115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OV59jl+vY0GtVbpPMroN1ZnCHDE9gXZl8E7hZ0ezKT0=;
        b=JTkSCoB1QsJg70pulTqyWVKR9lbaBd63h37hS6ljJvi8BRu324KuExKtNIKO/xlXpF
         xf46vNbkMtgAqbT8jt1vrhe6ClGFJTX7T15MK5GtN0BUIco6RlmI9SHQiH9kac3pd4DB
         1ldNHGmJAEpAR6J2/4ECBbNdoEMgedU4vnkcGGmlQUOZi6ovwl5nCFfrX+rCbNP1Dxt3
         Jv6phvFjCPRf0cfycLSGi+J5b5Gz3QH+bWTZT2AM4mLopib92eWtAKtTJzji7YIbVCE6
         2l/vtXOv9EDnYllqlfVGnIF4xwHs3WqiSlHRbdRKuyGENC4FG5QkmEKrS2+V8ciiOvxa
         vvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774104315; x=1774709115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OV59jl+vY0GtVbpPMroN1ZnCHDE9gXZl8E7hZ0ezKT0=;
        b=DYuJqg8obSTwGgdyk0E8QrNo1T1she2LS0b/3GinL9m92GAF8qwlode+PZDxBfXX97
         jna8KtLrvLZRfEow+KuSB7B8zG6YjE8/fGyklBNzUNyyvhvhF0CCmn9uuZkFoWFGjYKC
         myj/GPWQuOY3sfJiWUg3cuAMgT1vBMreSFBWC8EeDtO6pwZGsE5zt0e8o0lwDBDxLiJo
         p3I1LJLrz3tSP2L9c+K0YlVck6MxIJ3jkdUcyfOhJe+VIfw0NgOLv9iIPHCVePyWpX1j
         DwCiX6DQ18PUdrUsh6Al/2JcSGY3fPpsve1FfNx91DQ1UfnR74DLsbMuAmZevDbtesuu
         X/WQ==
X-Gm-Message-State: AOJu0YyF8sUAzxh9eW/lyyllbI8Rw3cRsPR55Zv7EQe/t0i/tDd5c7nr
	QzT5CmnRgGejw9TokDJJQbzR4NKpP0eqxn86mwpAoaUQnY/ar7Ik232Nn5zkcw==
X-Gm-Gg: ATEYQzy238mtUoJa0cpS+WYS87V5O0jALS1kzYr3LvSkQLfW5E6gPQRDG0gZC/CW8PD
	pk2LKJX0GJJEeb10JIxyX4KPYm3amFjftbxBovS6QgKKre+9gt/LxYL55A9ixu/52djD0Hb0kLW
	0aMFWHwbOKbwGhwNB6VVvOTOmyfcwztkHLn8hAhtrYun2cVZ5A14qXSiOu4ODuymgGs9ek+zBAG
	nc856oAqkIT7uqVadmIdLqXMBe4pVI29CZ5PBphvHeKYoJg6JJbWOHI2koGxMix7APRYURp69WF
	wyhjJoL7Rw0QHYSdSN2GJvau2g6RYdtw15d6FZ0I5yFiNZqPlX7LQWIdM9Y6BC2GAwXTLqJ8dYm
	4R92GxdMaZdZwziJ3x083a6u+T+4bYagHuyjnDsWUUTkl7ylCtjTjoJWC6l/TksbXxv7FPoYBqX
	xEomJc/7lC9WKB/NN66dE6taGRmDPeUQQVz3SsVMm9yqjGgjc=
X-Received: by 2002:a05:7300:d706:b0:2c0:d690:7bb with SMTP id 5a478bee46e88-2c109760abbmr3214165eec.25.1774104314550;
        Sat, 21 Mar 2026 07:45:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14bac4sm9465573eec.4.2026.03.21.07.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 07:45:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [RFC/RFT v2 PATCH 1/2] hwmon: (pmbus) Add support for guarded PMBus lock
Date: Sat, 21 Mar 2026 07:45:08 -0700
Message-ID: <20260321144509.1450594-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define and export pmbus_lock().

Add support for guard(pmbus_lock)() and scoped_guard(pmbus_lock)()
to be able to simplify the PMBus code.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Update description

 drivers/hwmon/pmbus/pmbus.h      | 5 +++++
 drivers/hwmon/pmbus/pmbus_core.c | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index d2e9bfb5320f..e499cdae9442 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -10,6 +10,7 @@
 #define PMBUS_H
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/regulator/driver.h>
 
 /*
@@ -563,7 +564,11 @@ int pmbus_get_fan_rate_device(struct i2c_client *client, int page, int id,
 int pmbus_get_fan_rate_cached(struct i2c_client *client, int page, int id,
 			      enum pmbus_fan_mode mode);
 int pmbus_lock_interruptible(struct i2c_client *client);
+void pmbus_lock(struct i2c_client *client);
 void pmbus_unlock(struct i2c_client *client);
+
+DEFINE_GUARD(pmbus_lock, struct i2c_client *, pmbus_lock(_T), pmbus_unlock(_T))
+
 int pmbus_update_fan(struct i2c_client *client, int page, int id,
 		     u8 config, u8 mask, u16 command);
 struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client);
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index be6d05def115..7ffa011cb279 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3755,6 +3755,14 @@ struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client)
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_get_debugfs_dir, "PMBUS");
 
+void pmbus_lock(struct i2c_client *client)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+
+	mutex_lock(&data->update_lock);
+}
+EXPORT_SYMBOL_NS_GPL(pmbus_lock, "PMBUS");
+
 int pmbus_lock_interruptible(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
-- 
2.45.2

