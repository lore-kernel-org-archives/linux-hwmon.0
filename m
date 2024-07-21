Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D308733C8
	for <linux-hwmon@vger.kernel.org>; Sun, 21 Jul 2024 19:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721590515; cv=none; b=NWahvaUBhPKVuMTdk0hVsPLMjFNCPxGsC8eXTa00w5vUeNGg7s4M5jNCiIRLtdhOSgl6+Hj/KGIGcpB/gwZUyxxBG4OJXWlIiUY0RjRLsSUj148AlxQ60dkxjY9b72H/f++NmGXk2eM+E2vYVoEvCTd22+1ozBkXiOPnTKZF9nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721590515; c=relaxed/simple;
	bh=I0N7BAaIV+7qN3e2MM1U1QcJ3YovGFQHWzIHuwdomB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K+GI51A1OY+jysQOo9xKB4UJ0wVvLbgDLX0/YcMow6V3CnU9P7DjBVEHN0tdhvBdIamnkkwMcOQUQutawLiMJ3mxqR9iK9okSOAqgq3cyPDOC1wZDQCD6NhvITIzys4vj5L/7rULux/gaF5a2alpPJOz5rMKuldLVAY2DvJ6tAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deC/IW0A; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deC/IW0A"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7163489149eso2803007a12.1
        for <linux-hwmon@vger.kernel.org>; Sun, 21 Jul 2024 12:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721590513; x=1722195313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgXnfIH6arkbZaSgRq2zz4XnGUndFu6tz8AoOxnnVDM=;
        b=deC/IW0AsjMZkijNjuaWWDRz3CMRf/ZIkCrHmOHVEoafukOf3bE/N+JlLUwk1puXdD
         2vPPrle+j2iqK5/jEdmz/vRdPz2okfdq0kguLeVukF5gBVQtj5Dks/wrwkfkrJb6eUhU
         J5N4bv7dKNtTb8cMdSlLhmpL2WZV4uuTPBANNbh99paYSoTnNHte3MUshpqX7W137r3T
         EypjN1TdrUd0ITlGuR33VnFDrikZRdRbMTgvdRAuRBou8c77EkW3LRzwmklFwxgS5Vpb
         UFFhVNX9Tl8BkwqZxe3+G+E1WIcY8MVp+qirT8ki5lF/kjgpk5eljRXM72lytojrjlN7
         JQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721590513; x=1722195313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QgXnfIH6arkbZaSgRq2zz4XnGUndFu6tz8AoOxnnVDM=;
        b=Dp7hAR7TsaD/PQsx06GjU7T/m92dUZ2EiA0HahUVUrYcDtWloN3n6+TnWSoT/lSqJk
         tw/QoKT4OyjJeN+DvZdqXLZF9HmzGhbBQL3Vu5xiyeO+omOilKr/5z70haetQN80lsHV
         X9YhW2zq54hWrYuNBWE8lBHoSopRjD5bPMZ0yTg3/qLZ3pdWlT40ScIueCtlUFYICbPx
         9TF7NolMy7rPLVY7WBZ4t5UoJByPTzHd7QqRvq0K6TrJMxmELvaimIJ+COjHSfjvFxZy
         tZ9J0UT47QXz9EZ/AaBC+dnBl9kbJJRJyVq6CQmRWI1ej4Xq9iCeVuhnexjmpG7OM3n+
         Gxpw==
X-Gm-Message-State: AOJu0YwGzD6RW03fMIrtIu7JzTWk1mkDFPq3IjWcUjztwtVS12nH4fjt
	txV2EbgzIZIJpLNp7WGK7Z3wdb4gYjp1v23m3wwCx54L39CqaK90cXwZvg==
X-Google-Smtp-Source: AGHT+IE9WQ3iTfbbKhTF+NM/oZABlOo3iITbh7QciQQmi22UkGGvUfqBf3EAJt2xs/q2IVEKeo3RVg==
X-Received: by 2002:a17:903:2341:b0:1fb:6663:b648 with SMTP id d9443c01a7336-1fd7455a1cdmr55488825ad.21.1721590512444;
        Sun, 21 Jul 2024 12:35:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f28c002sm40190935ad.70.2024.07.21.12.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 12:35:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/2] hwmon: (max16065) Fix alarm attributes
Date: Sun, 21 Jul 2024 12:35:06 -0700
Message-Id: <20240721193506.2330006-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240721193506.2330006-1-linux@roeck-us.net>
References: <20240721193506.2330006-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Chips reporting overcurrent alarms report it in the second alarm register.
That means the second alarm register has to be read, even if the chip only
supports 8 or fewer ADC channels.

MAX16067 and MAX16068 report undervoltage and overvoltage alarms in
separate registers. Fold register contents together to report both with
the existing alarm attribute. This requires actually storing the chip type
in struct max16065_data. Rename the variable 'chip' to match the variable
name used in the probe function.

Fixes: f5bae2642e3d ("hwmon: Driver for MAX16065 System Manager and compatibles")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max16065.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/max16065.c b/drivers/hwmon/max16065.c
index 5b2a174c6bad..0ccb5eb596fc 100644
--- a/drivers/hwmon/max16065.c
+++ b/drivers/hwmon/max16065.c
@@ -79,7 +79,7 @@ static const bool max16065_have_current[] = {
 };
 
 struct max16065_data {
-	enum chips type;
+	enum chips chip;
 	struct i2c_client *client;
 	const struct attribute_group *groups[4];
 	struct mutex update_lock;
@@ -162,10 +162,17 @@ static struct max16065_data *max16065_update_device(struct device *dev)
 						     MAX16065_CURR_SENSE);
 		}
 
-		for (i = 0; i < DIV_ROUND_UP(data->num_adc, 8); i++)
+		for (i = 0; i < 2; i++)
 			data->fault[i]
 			  = i2c_smbus_read_byte_data(client, MAX16065_FAULT(i));
 
+		/*
+		 * MAX16067 and MAX16068 have separate undervoltage and
+		 * overvoltage alarm bits. Squash them together.
+		 */
+		if (data->chip == max16067 || data->chip == max16068)
+			data->fault[0] |= data->fault[1];
+
 		data->last_updated = jiffies;
 		data->valid = true;
 	}
@@ -514,6 +521,7 @@ static int max16065_probe(struct i2c_client *client)
 	if (unlikely(!data))
 		return -ENOMEM;
 
+	data->chip = chip;
 	data->client = client;
 	mutex_init(&data->update_lock);
 
-- 
2.39.2

