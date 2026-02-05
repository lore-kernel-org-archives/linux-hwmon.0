Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26EB3A782B
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 10:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770287748; cv=none; b=KkLfNdXWKyCdhIaxdzuWDUA/TrBZL4JG7XSVA5xwbX8UuOc/FI1D5feRNphpUjUpFWlLP9cx0Ao3vTfjQUKVQns6shcOlGt1VE054QaaS5P3kpXLRyyERHdKVfyR+UQHxL/wh46nPIXIiCTxVbEiSQ9gLRwdToK8cBtBFg5W1Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770287748; c=relaxed/simple;
	bh=Uml2Jc5zq2ELeW2m7lg/hpmfJO/PpPf6Iv4tN7jmR+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ffKOA74+8Oye6HiXwyQPvkNyqrMBadn5rmvZJQ5DibI59rButE072gSM7Exra1JQTx2u6EVWgcIaDKgnKJfbQ729Y1cchDMe2/fSuXTTqd2H7VBUi4eLacQpcTq1Qjmn6GT7l6Yc5bY/3OTzhG137vdJbr7LYoatOMriq6VX65A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jc0ZzOzG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jc0ZzOzG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so6325035e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 02:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770287746; x=1770892546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5Uax/LDotqlsD55VWpiCWlcKNKI7QyNOkqZjmWwhCs=;
        b=Jc0ZzOzGz8ooCzlI1hNelGUfwOaOz9+fQjNxcsJB3qieaYM1ZhGjkzsyd/JEEm3qw8
         BP1iMrJ0nyojYPBGCCuko1ngs2RmsFtP9Vz2j10X53JAGrxHGwuuzwkVuvapH8nw3gZN
         gH3jNvk36XEU7WsUTdJ++rdnJ/Zy9ZElWLREqIduTWpaKhiJX95x0DvchaNeLOhsL/s0
         ULHet1ajRzddY0I0kYI5Q8ivvKNOcjEmBcFd2cy6jYkU56Xbbh9N9YywiU/ONf65EL73
         JTb4judH41bUwADOsgC5Tpf6snkRPH28JmOfcLJ4xbFaDy+4U8nXjgu+zDVCWMZU56yw
         cBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770287746; x=1770892546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W5Uax/LDotqlsD55VWpiCWlcKNKI7QyNOkqZjmWwhCs=;
        b=p5RWRcGNU5lRT9lUODKx+xCR+bb4+ZQ9SMTkVZPXUkiFqDbKxUUNb19WbKNmigueYI
         X13y5Z0gUOqZGyXxCfq26W8G6jMio1gPEGMGavzKpkMnRy2+DoYKJ9iagjXOnDkHo3uI
         isRZ7LlVV+HbKrmFWXRtMNNdSZMOKLcH76seZBDMJwG5Ic/X9RW6s9uKDd7g70VunBae
         IfxOghJFYDbj+P2fljJG0vCfvwFmHY12R/KaxHVpbAez187Ym8X/oPXzKk5qIs8FtZCi
         Ol3VnM2/aAh4vBcQWZKziCLWmJexkL1GQtT7vbba+41vcsgRmZrdAbEVvLemtKwUcr3j
         wvPw==
X-Forwarded-Encrypted: i=1; AJvYcCXlp10CcczWAqOLwSifcD1LGb6Ta3qaOOHEHH5HO6iwC3kGaGmAuLqfBkm3ZMXJLu411JMMXpm0KP8Clw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJSQ6lYMwfnQSHVWPVOaewZx/KVDe7a/TgM/nfJDzdUPKHvKQ6
	FA3AhlVWEGPmV0pv8//cOj+zbZTcnXreGqqdkxnZG0ukNbwu96ORBNN1lKgs7g==
X-Gm-Gg: AZuq6aJIgZWf7A2UvG5syp354WJnvTawsYgqzerIrRST4cAPm0UqG0JUiCg0VHW3we2
	4XFMysA2RezYlj8p/3IBf+IOkhRBwW0iS1fMQrJXy4coybCpzuu73AoIaKKTejOAWV8kBgHRknx
	3bHE/RJ/k8Tipg+Io1TtEQqr/l+QZ+16OFDXMRKx5HTe6fZbwkjfs6s1r8P0N6zlVyqNiYn7O+3
	ZaxFxt+cWUYBbLXthXP462o2h+L9ewSCvOJyRGew1qcN/VYUkZk0pfWGLQAjX7n4AA1RV+GKI07
	nBkinyICP+tONzJuBcbxl0DjO0PzVEwgLAey7KEu4bv0DwX9KzhbbBeiKNjLtLiMT5fawqrTwq1
	b0qLcxxEQNR9ISnMszsTLwXEYnvwK5GFcQj3XaVYfIyHXsP2KxQnSUvmOfXgxJx285FRD/uLhUA
	JJpPvD79j0X88XSNNdG6uSydyjl9KPcvwW
X-Received: by 2002:a05:600c:c4b8:b0:47e:e712:aa88 with SMTP id 5b1f17b1804b1-4830e971bddmr97102565e9.31.1770287746111;
        Thu, 05 Feb 2026 02:35:46 -0800 (PST)
Received: from localhost.localdomain ([196.191.61.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec4a76esm67876655e9.1.2026.02.05.02.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:35:45 -0800 (PST)
From: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Tinsae Tadesse <tinsaetadesse2015@gmail.com>,
	linux-i2c@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: spd5118: Fail probe if SPD writes are disabled
Date: Thu,  5 Feb 2026 13:29:25 +0300
Message-ID: <20260205102942.28745-3-tinsaetadesse2015@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205102942.28745-1-tinsaetadesse2015@gmail.com>
References: <20260205102942.28745-1-tinsaetadesse2015@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SPD5118 requires write access for page selection, configuration,
and cache synchronization during suspend/resume. If the host
controller does not allow SPD writes, the driver cannot function
properly.

Detect this state using adapter quirks and determine whether to
stop the probe.

Signed-off-by: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
---
 drivers/hwmon/spd5118.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 5da44571b6a0..094d05472562 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -525,6 +525,8 @@ static int spd5118_common_probe(struct device *dev, struct regmap *regmap,
 	unsigned int capability, revision, vendor, bank;
 	struct spd5118_data *data;
 	struct device *hwmon_dev;
+	struct i2c_client *client;
+	const struct i2c_adapter_quirks *quirks;
 	int err;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -552,6 +554,19 @@ static int spd5118_common_probe(struct device *dev, struct regmap *regmap,
 	if (!spd5118_vendor_valid(bank, vendor))
 		return -ENODEV;
 
+	/*
+	 * SPD5118 requires write access for correct operation
+	 * (page selection, configuration, and suspend/resume cache sync).
+	 * If the SPD writes are blocked by the SMBus controller, the
+	 * probe fails.
+	 */
+	client = to_i2c_client(dev);
+	quirks = client->adapter->quirks;
+	if (quirks && (quirks->flags & I2C_AQ_SPD_WRITE_DISABLED)) {
+		dev_err_probe(dev, -ENODEV, "SPD Write Disable is set on adapter; refusing probe\n");
+		return -ENODEV;
+	}
+
 	data->regmap = regmap;
 	mutex_init(&data->nvmem_lock);
 	dev_set_drvdata(dev, data);
-- 
2.52.0

