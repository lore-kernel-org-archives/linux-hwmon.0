Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A744230BE9
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Mar 2026 02:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774061605; cv=none; b=TDObQAA6Mfco5jCIf0yWMHmeqnHfXcpMVmbyhuFQA9ceoiNv5y4RPZoG7Upd/2F6Ve9dm50ikDskwjUPEWKCVuv+vEo85SFSZS6LNuofpNaa80RwYvHOCVKPq++OOdIrUOF3Ap02UT4F2xQvLHBnnSPIaln2p6xfAATPIAPqGZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774061605; c=relaxed/simple;
	bh=F57d35ookYyk/LaZkTKu4645sseAkH9XBFxcXqxgtpk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LGJIpngOrae8B4K9UPmw+YOlboWp3e255jwLSq0DARfN7uF0AOFoZOIi3fZK7cQTOJ2AS1i5aSJ/4wLec9seQG+P8NduJGsQ3LHzlrKydN6ga/mRSQja7v69x6XZ1iQAp6uvS8x/SOCdMxXHXHQ9BPuP6beJ1Qbh+O+37Ih/xS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/5Rx1sO; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/5Rx1sO"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12a71ade78cso1816144c88.0
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 19:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774061603; x=1774666403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GWWKOs5m5XqA28/MipoPGREuRrLx5Brg20jLGeSy9HQ=;
        b=Y/5Rx1sOLKb1KdunXl1FLe2m4qvR+Qz32PXe+rBiaAbZOKgStmk4HETco7tXcbl6nR
         Xc6gX2qr+9TYBtdFgiK6tah6PRNGrj8/9hsj98RDY51Ijuj3Lqr1xRQ0mw3GYdDEM6D+
         Fd2JQXTjnb9b5842oFaHENBogu+MYx4TBFY7vjaA3yVuO/c00dwQGTCrDT6rtRMUdrdR
         t+BkBFWNZTmoEPQvQuSGoMoCjIQW5GKohJcqbF1Uzffimu/aG3fF4f1zgvUsWwJcZYxr
         llHuPzcOkxZ2WbNOQOnhR2qvZwKdScqm1Lq9+G3aKlN55rywQRT7UkuwacNMDpQ+EozJ
         vHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774061603; x=1774666403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWWKOs5m5XqA28/MipoPGREuRrLx5Brg20jLGeSy9HQ=;
        b=SMcz5Z/SonzM8Y1D9u5fMqPCl0kUIm5ofAukiJMGGHeq/UoZYoGBS/0v91tCqCFPAJ
         NANQG0YShqzF4VFbMEUXQISJqYAa3AZD4AJ+W350VPwZ1e1ajhS6o7f4S/LpkYr4wdsa
         hqViR8mmZADtd2o4dszjICQw8K45dXLWCB3XNZ+O1IYfNj9qcNpJ3C9Ta99mg5xTFY5e
         yMIa8wJJh4qkY7ckvW76xeEWorgetTaZ6AcVf/AwJYumJYYGux/ADNGYhAcPwevUPGd8
         UUqqmk3T5xkOcOWD9w64RZAhtrWVVJF/2LUqi8Qy0Z5h6aCZcTpZAzlnJmfrkD3UYPao
         qrMw==
X-Gm-Message-State: AOJu0Yxj6qX8DUIEH5C/o0u/X+UU4eRjRn7sCIr5XiTylvz4CEtQJVHv
	cjnl9lBgHRPNu5lQqcdizX8rUe+dCFLkvIPX1thTQzDDZQiATWkcb4Wf5H3C3Q==
X-Gm-Gg: ATEYQzw7Wcj5Q368xHJA/oCB++dwGu2ExNIm9u98RUzya6bePXStiAySGTN3jU4QoyB
	nk0yh3vwhflA7mgCagCrfBSwHIfCeyEIXTQ3eT0tRCBXlAFfwS5Bh2SmEP80YzywRvBFgK8/gy9
	FZp/lAz15kWtDLzOFTcP6xZQN2OSLI9IHL6t88OPSEfy0lw/Di9H/6SlMt1ACT/CQ/0D4M+I2pT
	SdPtZVT/kGrFYlxhzFJYVhQzXhZeTFiiBzlFtAPLEXl3m/jYnNOqw+NGU1itXnOhrVFIfnIMXNp
	aLq6jceswESYsLkJiH7q7kNO81USTy9k9c5Jff6Fga8yVT4hcEgO9tjaWcrXYT2Q+Gc2svSgLNh
	If5vfSfEpj7DCCktHP2eak4+CdMXoj9nDu54rQgCXJVRKEQcl37D71KEapnNBuuDTQh7qEe5rqN
	ffel5DvmmigUnIW7jcRsjkUGZGbJ2XZAOd9xhg
X-Received: by 2002:a05:7022:6892:b0:128:d309:854b with SMTP id a92af1059eb24-12a726fbe3bmr2134547c88.39.1774061602999;
        Fri, 20 Mar 2026 19:53:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a734bbbc5sm4437990c88.11.2026.03.20.19.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 19:53:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [RFC/RFT PATCH 1/2] hwmon: (pmbus) Add support for guarded PMBus lock
Date: Fri, 20 Mar 2026 19:53:17 -0700
Message-ID: <20260321025318.3882727-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for guard(pmbus_lock)() and scoped_guard(pmbus_lock)()
to be able to simplify the PMBus code.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
Untested. Submitted primarily to get feedback and trigger AI review.

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

