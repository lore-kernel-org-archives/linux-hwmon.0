Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64522311C36
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 18:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462603; cv=none; b=Zc09cDb0R7X4HmtyU2dvwu21idddoe7lzARxMZ2V8lj+icjELIe44CuiB4QZfedR2CavBPbdB5UaNl4duVtpS0SVEBj91s+NmIReoRNFzX0BO/QFr4F+bu4qTdafdPJyW4aTgcYy29i/axRHVzeSNkEf9IZSoNNuHRQdBFf0x98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462603; c=relaxed/simple;
	bh=9bnLYzi7jbW2RWaJZtT2FckM+nRGyFgyNuEj7rU+eC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i15uQOJ69IixzFOGd0NqVZJoI1tv8D7BjBOTY9dZcJ5OC1LHOGwSdAy4j9dCVI7V0+4Gt5sIwXDyC0QbKnqAUrDzJlAmbMd8FyN395XgUFzQ0ZptoyOhRBZSw3DuSgY8KyOVPG3tJFY1wp+aAO7nsXCS2qv7Q9g7sFid4EM7+l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrLseLbs; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrLseLbs"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so98495a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 11:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462601; x=1775067401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShFfkl1nT21IOT8YeC4PpWhmEkgRXbE3mCszLp3aTyE=;
        b=MrLseLbsOP4vo5dK62YxTUskf11/UiXp7fDq11bukH0tiYpwA9n4Fdz/t1Kj53jG6s
         IUhzBIs2klDeO/3Zwj4jAut1U9q/maRzivxAaeT5go4YWNq6LOAKTbqD1aNSxTJPMPtV
         sB7DkABpemdDhpmaBiS4f72BwtR+yvzwa0wLyod96XEM3bnpiirWJISotcOT8nQbw5/d
         jLEnsgD7e8GbPrQJo6wOMAgOcjZJ6TTVOeEy0qVHuJ53Jm6bi6obG+aUixxuHNgg5yYa
         YSeI+lManKljkX4+V7bKabxfgXpKpOReC43GLU1AmXkSvcZRCY+hsqmjjVOdL80t3X7G
         RzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462601; x=1775067401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ShFfkl1nT21IOT8YeC4PpWhmEkgRXbE3mCszLp3aTyE=;
        b=iy1LSh/5EEIIXL/DH291IG+0c3zjBzScmDdWaNv0zs9LBxw9zccyrEvMA/JOFTtgwh
         fxT9p8QwPo3YtV6GQ9kLV3hooJ4DfBjpmpn2HsEMvQnTsbzFVEIVEoi7PgXYBHI8G3tI
         gcgSbkfAYb+aNviMmZMsrkZRO0WE6VtClxjAQ+KbQWScfyH8CxSS8BEwpYkcAK/6oio2
         qxf21svpOmb1DasJ6zv+TfP1xZfokhFqpNSdqtXYOeS0uFQbrzVuJX4q9Sy6TAFhA4sq
         BuGd2HIMfmABHivqzF3MAfDSjKp6CQ5DxreRSacmv7idBM0eOrgLDJxvGdsM0Ge8usfS
         eYyg==
X-Gm-Message-State: AOJu0YzdQL54POQ+Xy9YjyCcX0bzhCOgk+uALS9Es0leHL81377Syltk
	diCkqWxkpmefEJM5ZhlqvfEvyE1tA409gir91NE+VfqkFXYHv6oTMlCSW/9/YQ==
X-Gm-Gg: ATEYQzya5JBcyFVz2P9lpqF+ifwNKuBk/f7iSEnvAxgjblpjW+JVrP27xWBAvsvyKtH
	3hViDwclgVMbNKjdkXBM4o5rJWznVy1BtGkVVrNulZ3AW8U0NYUYXnvpICOxK/Rh2RjPmwHbAFq
	TChx1LmffMBfFxn8+YgixKP8US8uR+NEyHpOCQOGP2mMfZrwAO96FqRd9BkQ8GuQH36ElxsZ/S7
	Jy1ejyspWW+HMT5lAtOMkXQgrfNNrEEc2wfoD/sZhSjgH6hVaFi3TxQuUePLRIzUdfNVFXsMZLu
	k0PcFte7PovVznmA7eWNk6OW6NZq1uNlCb8L+tdfSkDB/Lj2DYz3u/Po4ju+kH0tSBRzZYQk3B0
	0FAAExl6Otw+H2D8cmWMyuhiWaHl8jr2ajhh437kTmW4Wa9+OZAGapIhnGb2O8LgPXiVXUU+Iko
	IkzYFb45/tzQEmn0eKSNSIDZpa+Dm4QFtWHh2M
X-Received: by 2002:a17:90b:2886:b0:35a:18b1:c239 with SMTP id 98e67ed59e1d1-35c0dcac48bmr3750431a91.10.1774462601472;
        Wed, 25 Mar 2026 11:16:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c1a13b8b4sm579631a91.16.2026.03.25.11.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:16:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Sanman Pradhan <psanman@juniper.net>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/5] hwmon: (pmbus) Add support for guarded PMBus lock
Date: Wed, 25 Mar 2026 11:16:30 -0700
Message-ID: <20260325181631.17259-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260325181631.17259-1-linux@roeck-us.net>
References: <20260325181631.17259-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for guard(pmbus_lock)() and scoped_guard(pmbus_lock)()
to be able to simplify the PMBus code.

Also introduce pmbus_lock() as pre-requisite for supporting
guard().

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
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
index 572be3ebc03d..7150f12d2630 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3871,6 +3871,14 @@ struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client)
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

