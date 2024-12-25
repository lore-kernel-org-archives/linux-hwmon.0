Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8929E4A1C
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Dec 2024 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735120317; cv=none; b=LJoq0xUeOnVeXeLGAzaISyeLcwtQ5aQIGxYjqQgTSdEDIxkeV1KegzaSSKEzVxx7D2poXUPrx45AbkCWTKnM4U/p4fBNFryRYDFeMvCLRfvy4jBE3OPmTr1PyHmPuNFpCDzDPENOWQv4KdV7EuPkJtIz3jd/ezNwthu/MtJ6vAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735120317; c=relaxed/simple;
	bh=GJY9eFCWgcgIl5S7xFCYaZR+dQswlT0vYdYYAN9OivM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=eXPnnALo68m5jOAc6pA59GkkGtINz74+nOd5X9h8s2QSIWxU1WcZj2zBegIXnp9C825cz1xdWYQfz0lG/LIuba6CWCgk9s23vUDuDq++0Ka6yFP72WHpmpOSrpEvYcEBLv8/GSwx9tC1hE3weXQGASY7gtd3su9IrITVY06uNrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=FFStDA/h; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="FFStDA/h"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85bafa89d73so938644241.2
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Dec 2024 01:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1735120313; x=1735725113; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FGzHpKAFhT6zDq0bkFsf3Hpma73NZ8pu5Q1QaEq5ZgY=;
        b=FFStDA/hBVmYPxzwFLzdU+bHMCpd/9NoEQd3nYaJrJnING06se58dMxQyr8uEjaAUl
         ZAmskXU5INHA77z44TbA3TxgEHEwe9lDFOB3d6vmiOnKsCLnUx9iW0tlgU8VUAtAXLRt
         eALECkn3srJWnGvUHCiDPdDtWmUqpff9hm8kgxhayqaHqTsDJXFUEI7Iw9Z8cQBVcBm3
         uSSMmy58mYg3CaEExRsLe1i3pvZCqRlU4LfQg7ryPE8eS6FyQtNXFVsa+xhfKZ9X6MH9
         ErMEDpEI7Bb1Xa9ZqLKs4No48xOc8/pBRCtsBGMwJVzBPyVkzqrbHPRYJhLiNV/R97X9
         +yLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735120313; x=1735725113;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FGzHpKAFhT6zDq0bkFsf3Hpma73NZ8pu5Q1QaEq5ZgY=;
        b=IWStSwbyp3pAf2OuYtTr5iZFoLYJOqz0GFAwe/87KJosIHFUcd3S7SHK+rLvQJLJ5v
         scOlXczp1XyI+kC6N6ClpIlqRMcS0SV009O6EU1rfuUi2A4KrZAq14vbBNQWSoGMPBay
         6O8BhsJmRDXsvh0pC9TZZH+ER2YL4DaO4apXCRffvvtnYBeICwA/ciE4GcRQQY0ba9vo
         A+Nij4GQWbsbFC9yQtLoUHciWjgiRmAGPDgzTkghEjD3EL7LXDIsvsqpaThHQysZJPGS
         QW7QnmpvjvBKbdKtdM0NF1Q5b0M5AHAHS+bA+00fYhu4yQ85t1kOVKc5q9LrRNjj3gBI
         +CvQ==
X-Gm-Message-State: AOJu0Yx5326vhq5btNXGoeCGrgQXqreQQU0AKiVJ4ZukAMCapwNCk036
	UWEzxOzgRj+/1aWurG0ycq0+Nv40dz2++0Djgk3Dm4+23OnwjU1EHU8XUagiJFAh4TquUgDgCqr
	3Ys+KqqhUONJod/G738UWS/jlAl5jDDCrX1Gr/qe+RpKDOgNKQ78=
X-Gm-Gg: ASbGncsgQ5MxqITJQ6NsXj/VxQKOy1G/xyFZRYX4kOln4tOLK1JayOENvHICaFaihzK
	kaxazKGTF6AXpiAKIopU7ZU4Ipal/YV8yV0awoyo=
X-Google-Smtp-Source: AGHT+IEeTj5kjwaYPSiu7NftFY5phj96f8nkfsEZDHu2RYiG2pmvB+429D+zwnMEZzWRpLsvHVfhgDdGjtVyzea6i1Q=
X-Received: by 2002:a05:6102:6cf:b0:4b1:16f8:efc4 with SMTP id
 ada2fe7eead31-4b2cc36a2f3mr18888665137.12.1735120313403; Wed, 25 Dec 2024
 01:51:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?Q2hpYW5nQnJpYW4g5rGf5rOz57e7IFRBTw==?= <chiang.brian@inventec.com>
Date: Wed, 25 Dec 2024 17:51:42 +0800
Message-ID: <CAJCfHmVSG3c=E6dMkBgdF9EU0sxP8if2g-=xhkSU5t=vEsRbEw@mail.gmail.com>
Subject: [PATCH v1] modify adm1266 blackbox access flow
To: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Brian Chiang<chiang.brian@inventec.com>

Modify adm1266 blackbox access flow  by only accessing the latest index of data
to speed up the access

Signed-off-by: Brian Chiang<chiang.brian@inventec.com>
---
 drivers/hwmon/pmbus/adm1266.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index ec5f932fc6f0..d79b2208de86 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -352,6 +352,7 @@ static int adm1266_nvmem_read_blackbox(struct
adm1266_data *data, u8 *read_buff)
    char index;
    u8 buf[5];
    int ret;
+    char latest_index = 0;

    ret = i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO, buf);
    if (ret < 0)
@@ -359,10 +360,16 @@ static int adm1266_nvmem_read_blackbox(struct
adm1266_data *data, u8 *read_buff)

    if (ret != 4)
        return -EIO;
-
+   latest_index = buf[2];
    record_count = buf[3];

-   for (index = 0; index < record_count; index++) {
+    /*get latest index of blackbox data*/
+    ret = adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1,
&latest_index, read_buff);
+    if (ret < 0)
+        return ret;
+    return 0;
+#if 0 /*comment out the original one , this dump all the blackboxes ,
very time-consuming*/
+    for (index = 0; index < record_count; index++) {
        ret = adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1,
&index, read_buff);
        if (ret < 0)
            return ret;
@@ -374,6 +381,7 @@ static int adm1266_nvmem_read_blackbox(struct
adm1266_data *data, u8 *read_buff)
    }

    return 0;
+#endif
 }

 static int adm1266_nvmem_read(void *priv, unsigned int offset, void
*val, size_t bytes)
-- 
2.40.1
