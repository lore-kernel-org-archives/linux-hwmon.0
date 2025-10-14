Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73212FCC04
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455525; cv=none; b=Etc9ZlnQMBIN91SpiuqNgVuniQRRyKuJVd975K0hJpidpIQdPH3QQrE9EPGbgZGJWLfYqziFQF+gxGY5mGLq6RPXUqoZgMxdrfjIRkgIzpJvi9SZqLvATzHSU+7LZ1+dYd+rZrqayKW463Fae5tIKpotSVRowWq9BO7RzBdD7k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455525; c=relaxed/simple;
	bh=KvXJ9nvNOuIdCFLZiBGcVxcoCTKAZ/YkiDvHsaw3SDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6coQfOoByn1AFb2fvD4AhmJEdkhoboPhmrl9aXuCr8LX0NhX6AbBENwbze4v+ITot6Pd4gVlUij04pxjzVf2NXh6Hk4/MclKOT83nqegNG980qYDqZVQqR/f0MqNqQ2yf1yWbWvSz3Za4e3zlzdiWIW7V3DNWhbKSK/oeoXgFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzWzH1VI; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzWzH1VI"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-791c287c10dso4640105b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455523; x=1761060323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpcC4yMeAitqTT3kMKsCxCfITS5SYEnwn2VAwJ7uRDc=;
        b=RzWzH1VIe9h3ZyHMt7ow0mRViLuvmV4qA51eml2pv4lYUzLXCxbb9wQDp6d89AmpUc
         IPmbT7dbkyX57ozCiq/aRJvKEVIko3Shcq5zT+R2joS+LeS9TR0s24jXssBUTcKZAros
         uvXTSk70lFtFa4Q+hS+WmrGKgDVNcfiaTqzQElzf+lf4aYzMAvp98zdRRvCq1hrsyVGI
         mCRulQIH+C25mOnBtIZcwHh2nzU6Ob6AJmSmMQvysq1jFecV8YC9a2y7YgD4qKsvzm9j
         MlWCbeCxbYVR+7Pp0mxVAzk93FTMr8er2TPqwR88UNrKUvZ3Y34IcqEvkUta5Ejnv5AO
         BOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455523; x=1761060323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xpcC4yMeAitqTT3kMKsCxCfITS5SYEnwn2VAwJ7uRDc=;
        b=L1M0L3Vl3JxCfS1HMfdX0HPjxXrSzQSkdp4fSFfcHNv9QsI297yeCJ9i4E2XPxaJxC
         mNPMBv7hQgsizqXwKDAvUqvhwrNqu8vFZ2GJsbc5UBwbyCwNe1bt79dgVSAD6Mn2SbEr
         p46fkitM9+naOk/mxY6kNkrhnEJjHjQyiRr+RXYYIdNm+7m1BBw3svFy7IltijfiaedJ
         a0EbjTuuhPOoDGo7fOau81gO6rJsrTmoHMssN7plpRF/OnJ7/Y39W/qq8RWPEaQI4S1C
         7/xCsXff9GgrQ3WJmKpe5l9vO6a9g7cLNF8b0wbw09keprpoNMpNEh7Cle8jUPboAY5E
         Ta+A==
X-Gm-Message-State: AOJu0YyTcpRZdt/p3HE2MtI45+/vgfWjaEyr5fg6UPR3cfl2+wWdq4PP
	X6+M8aF3Gu2N39+wima0tuOisrG1X7TxsFasxstKw8PzIamBSNruF/Oe7bOtDQ==
X-Gm-Gg: ASbGnctn8lueTX399SSf6kOTnGpfi/uJXvGjrraQHaDun5peZr21xq+qWwII7kUaciN
	4YBtgZ5S1rM/cCpf/7Eypu4MfnnOtOLEz4xmnoga0UtNfB8DGv9kDND9e682F9Zpo5SP7rOFbuH
	RhLaf9cmRALjJaBpK8t2V1+VUfsuuEjRAsi2w65cWMeyzCrDDHtc09rBP9zLXn9eGJbzi1F8ebh
	ahtFbU2w+dmNxE19jX3RLJtgy+K9Iy3za6Do6ryzFvYLbwPM4T2MncyECXQPhjGhmBb3Lz/XLW7
	6Eq4QReYUBbtak2xQnkS+LmyigPQY0dItsC5KRLSpHxo2FGmEqZ6aoDKTr7cAB1MEUirT9ims40
	miRl2jy6VSvH+HpfI6nelxc+65OKQ+zRZ3dMiprgftPIxNEJp5N+6Jw==
X-Google-Smtp-Source: AGHT+IEgBdXAVeVfmEGXk98BCrjcbj556Z0e8Btj86FbXhYwxkBMNKtyCqWf82cMXhvfo+dGFs3f1Q==
X-Received: by 2002:a05:6a21:50f:b0:32d:a8fd:396c with SMTP id adf61e73a8af0-32da8fd3980mr33021810637.35.1760455522795;
        Tue, 14 Oct 2025 08:25:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aabbe8sm16302082a91.12.2025.10.14.08.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 02/20] hwmon: (lm90) Rely on subsystem locking
Date: Tue, 14 Oct 2025 08:24:57 -0700
Message-ID: <20251014152515.785203-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014152515.785203-1-linux@roeck-us.net>
References: <20251014152515.785203-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking n the driver code is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index c1f528e292f3..3c10a5066b53 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -108,7 +108,6 @@
 #include <linux/hwmon.h>
 #include <linux/kstrtox.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
@@ -735,7 +734,6 @@ struct lm90_data {
 	struct hwmon_channel_info temp_info;
 	const struct hwmon_channel_info *info[3];
 	struct hwmon_chip_info chip;
-	struct mutex update_lock;
 	struct delayed_work alert_work;
 	struct work_struct report_work;
 	bool valid;		/* true if register values are valid */
@@ -1226,9 +1224,9 @@ static int lm90_update_alarms(struct lm90_data *data, bool force)
 {
 	int err;
 
-	mutex_lock(&data->update_lock);
+	hwmon_lock(data->hwmon_dev);
 	err = lm90_update_alarms_locked(data, force);
-	mutex_unlock(&data->update_lock);
+	hwmon_unlock(data->hwmon_dev);
 
 	return err;
 }
@@ -1519,9 +1517,7 @@ static int lm90_temp_read(struct device *dev, u32 attr, int channel, long *val)
 	int err;
 	u16 bit;
 
-	mutex_lock(&data->update_lock);
 	err = lm90_update_device(dev);
-	mutex_unlock(&data->update_lock);
 	if (err)
 		return err;
 
@@ -1590,11 +1586,9 @@ static int lm90_temp_write(struct device *dev, u32 attr, int channel, long val)
 	struct lm90_data *data = dev_get_drvdata(dev);
 	int err;
 
-	mutex_lock(&data->update_lock);
-
 	err = lm90_update_device(dev);
 	if (err)
-		goto error;
+		return err;
 
 	switch (attr) {
 	case hwmon_temp_min:
@@ -1624,9 +1618,6 @@ static int lm90_temp_write(struct device *dev, u32 attr, int channel, long val)
 		err = -EOPNOTSUPP;
 		break;
 	}
-error:
-	mutex_unlock(&data->update_lock);
-
 	return err;
 }
 
@@ -1662,9 +1653,7 @@ static int lm90_chip_read(struct device *dev, u32 attr, int channel, long *val)
 	struct lm90_data *data = dev_get_drvdata(dev);
 	int err;
 
-	mutex_lock(&data->update_lock);
 	err = lm90_update_device(dev);
-	mutex_unlock(&data->update_lock);
 	if (err)
 		return err;
 
@@ -1710,11 +1699,9 @@ static int lm90_chip_write(struct device *dev, u32 attr, int channel, long val)
 	struct i2c_client *client = data->client;
 	int err;
 
-	mutex_lock(&data->update_lock);
-
 	err = lm90_update_device(dev);
 	if (err)
-		goto error;
+		return err;
 
 	switch (attr) {
 	case hwmon_chip_update_interval:
@@ -1728,9 +1715,6 @@ static int lm90_chip_write(struct device *dev, u32 attr, int channel, long val)
 		err = -EOPNOTSUPP;
 		break;
 	}
-error:
-	mutex_unlock(&data->update_lock);
-
 	return err;
 }
 
@@ -2793,7 +2777,6 @@ static int lm90_probe(struct i2c_client *client)
 
 	data->client = client;
 	i2c_set_clientdata(client, data);
-	mutex_init(&data->update_lock);
 	INIT_DELAYED_WORK(&data->alert_work, lm90_alert_work);
 	INIT_WORK(&data->report_work, lm90_report_alarms);
 
-- 
2.45.2

