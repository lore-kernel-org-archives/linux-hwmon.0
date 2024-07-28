Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B665FBF0
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 14:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722177443; cv=none; b=K58Xc5hG7vlbvJG/QEq4qC/zvGi/0EtwIyuspGkw7qovgaEvmviXKhLIqvgMSfuG5jywqrjcj/jd07qUdRhW1nn/wbFXT/O+AHhTSgLwh02QyD2fi1Dan30EmhbiEFK7RoOKXRjepLQf7OsEhRC22RsQ6b4JcGgyd61olQEaUqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722177443; c=relaxed/simple;
	bh=zGK/a2SB57EiF3yNEYfU2LUyA1Ey1YNtte8R9rBGVR0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DOytr0WtzNS9a45Vxt6uvn4c53eMKErtjEjrOZEPVXyIuKBIWuwuY7iwq0wMUtSJdTJx3LQpDsPfMMmMhLRwCZtiSDpc4pMQy5nnM4UEVLGUKhmDBqKbfj+W4WVu+xRQFIwiiFm8jxNerqHGdrR72b2dr3/OLrIvVVnakvLlDzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKKPvET8; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKKPvET8"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fc66fc35f2so13492655ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 07:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722177441; x=1722782241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPQkpIPphZ/YHUYU4wZPqI4h9ZJ1ZAsztINnvCIUwbQ=;
        b=MKKPvET8FvPsOmyZDJVBBiec6c+FFImXUBdFEaFSRRxRyB0nFiYmnrsG5jrwx/QCwi
         2u1ta0Y9anw6do38Ewz0/DTSyIdh04+k2xmjq8Vy5NPoOjDb1kDpVwpa1jgaEzrB+CmQ
         K0oifJdIccJHkbZ+Ngx8xEgLf0i/wJcDI4GkvcMc06fwK5D5r4euWipEEzJlEdP/ABKO
         lSvNzNBpNpMV+wDwOjtTz8lrdyZbik6FI/Q7yXN2mmulgKpWr8gNLtI6QhPqCdVNtoZz
         VDHzNgoUt249QIlv5VBkBga0lucQ3pyzuz1AoJq41B3Zrlt7G4h7TmHuBxngYw4vAwFA
         rfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722177441; x=1722782241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OPQkpIPphZ/YHUYU4wZPqI4h9ZJ1ZAsztINnvCIUwbQ=;
        b=a4zInnqcXY1M2ag+MdvivdfVTl8y3DBs4ZRdqauS1/KoB5hH6p32uZG8sqwbZEra60
         FC/czg9nlhp2yzsdPANttKAZT+ibi2D9LCEKDmDpBIkkaWoQENXaI/nVeJzcnAUAsFpG
         uqIlu0WliqUP1MA9QRpnONezjpSUoxGMjd6tmK205tx8ObF3bsW3fwLutA2UmprwX6Vy
         3HMvvgiWc/w/M4Cn6oU0v78eSAoIk/T5Rc9ITvO/ln2wTty+NV81vTIUUgrTDe2sdnct
         ZABvwV8GbFja5AfhAZFEbM3vXXH4Yet23WHX2XyVxYIV2ya6G4MSsd/yT+UQQR0kuzXR
         UnPQ==
X-Gm-Message-State: AOJu0YxeXTIzM0/5M2/OuhFbB/eTT9BkvIjE+NCIY1Kapvrf7MRuHkhj
	j7dGtDI+gwHoU3pNxRQHDZ28+Ag0rGL1ppJSHYDsPljXAd1m2NayCsvPRA==
X-Google-Smtp-Source: AGHT+IHR06uXAD0zF/mnMuvfJoExKf67eKbwvDB1fZwNzUdW47V1wjPJakUWGgaKIZM3v9aUxhBBiw==
X-Received: by 2002:a17:902:dacc:b0:1fd:d4c4:362a with SMTP id d9443c01a7336-1ff04b01cccmr80405625ad.24.1722177440676;
        Sun, 28 Jul 2024 07:37:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7c85ca8sm65896275ad.49.2024.07.28.07.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 07:37:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 1/7] hwmon: (max1619) Clamp temperature range when writing limits
Date: Sun, 28 Jul 2024 07:37:09 -0700
Message-Id: <20240728143715.1585816-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240728143715.1585816-1-linux@roeck-us.net>
References: <20240728143715.1585816-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Module test code reports underflows when writing sensor limits.

temp2_min: Suspected underflow: [min=-77000, read 101000, written -2147483648]
temp2_max: Suspected underflow: [min=-77000, read 101000, written -2147483648]
temp2_crit: Suspected underflow: [min=-77000, read 101000, written -2147483648]

Clamp temperature ranges when writing limits to fix the problem.
While at it, use sign_extend32() when reading temperatures to make
the code easier to understand.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

 drivers/hwmon/max1619.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/max1619.c b/drivers/hwmon/max1619.c
index a89a519cf5d9..464f4c838394 100644
--- a/drivers/hwmon/max1619.c
+++ b/drivers/hwmon/max1619.c
@@ -52,16 +52,6 @@ static const unsigned short normal_i2c[] = {
  * Conversions
  */
 
-static int temp_from_reg(int val)
-{
-	return (val & 0x80 ? val-0x100 : val) * 1000;
-}
-
-static int temp_to_reg(int val)
-{
-	return (val < 0 ? val+0x100*1000 : val) / 1000;
-}
-
 enum temp_index {
 	t_input1 = 0,
 	t_input2,
@@ -142,7 +132,7 @@ static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct max1619_data *data = max1619_update_device(dev);
 
-	return sprintf(buf, "%d\n", temp_from_reg(data->temp[attr->index]));
+	return sprintf(buf, "%d\n", sign_extend(data->temp[attr->index], 7) * 1000);
 }
 
 static ssize_t temp_store(struct device *dev,
@@ -158,7 +148,7 @@ static ssize_t temp_store(struct device *dev,
 		return err;
 
 	mutex_lock(&data->update_lock);
-	data->temp[attr->index] = temp_to_reg(val);
+	data->temp[attr->index] = DIV_ROUND_CLOSEST(clamp_val(val, -128000, 127000), 1000);
 	i2c_smbus_write_byte_data(client, regs_write[attr->index],
 				  data->temp[attr->index]);
 	mutex_unlock(&data->update_lock);
-- 
2.39.2

