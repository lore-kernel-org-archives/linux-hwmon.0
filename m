Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD58F3B8D7E
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 13:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555758; cv=none; b=eKdZMJLyDmx/KK0jl4dd7I3PXdRHLto1hHJvLTtgdB+DDwvvlDCzhVc4kaRcGFlk2zbhEGweUEzDazqJ/ze3fL9r1jFJFvdZxGzbaNjcpP/eq05QkjF6hFtCrgmXOOf2OjtgC4kQ/SxbnfIRHBBlJCAXwnS4Fv7yKDoND2ung8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555758; c=relaxed/simple;
	bh=ZNw0bddlHrYOs23SRfLRhVW1FeTrm8OR0JmZNjXWpaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cAPWKBo7jZPMZxM9sZnbr0kZcH2eoFaTvYuUqKRW3EeGQoCRXDhJktk60YBEEftiMUoXG2U3x/WLvK7xTT3+Ii9Js7/EHBbUr0Tj6V21h0ABNzIfXNcThPWHpokOkuX+s1JJdY8FsLMfHGn7hXbDyJ6Y2uViHx72ok7FkAE4wYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nn4W9Arr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nn4W9Arr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493f6de72faso26798005e9.0
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 06:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784555755; x=1785160555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6M7h3bjk6MLKww33sscI9ms6FX75LwP2psgjho2G4Rc=;
        b=Nn4W9Arr5yBF9mYs8Rkxj8mm0XVYzDfoRHObGl24fayaLhcUmqHp0blRxtrJmGzYIY
         9rs0DqQdOZ8MFHQkGMLl71998qFBQV28g5VqQMJU13kp6R9tamszMe1T61laepxvWMbS
         MQIkArmMzx3ccJSEani7k4qsFxsBVF3lXrpnweiMW8UBCxGagwK3uBI8L0j7J5n50i4L
         ZjBZDtWLZJqr4nA4+/uaTDTw3N8x3k4NIIRW1c4TvxobXJV+pbS5fCdBGZ0sYpMtvWOL
         otp1ahmNvc9S8jesqHkllwZ4yPQy1t3XhJ9Prk4xXuBR7ux7xE9cMxsYIrTz/sbk9RNP
         nSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784555755; x=1785160555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6M7h3bjk6MLKww33sscI9ms6FX75LwP2psgjho2G4Rc=;
        b=AjCpo0hnia2w+IGWspH/auBDaXID4d+alAg0QcYGKAzvFUN5i8H9jdZps7DwKBRGQd
         mEdGZGnt4onoJox76l2mRSjUUspmmigvZElaAa4WgJMjxJ0JxBz3srTU+2U+dJmWjO6f
         QawLFnWwPpqcBEa66LoM0aIjVb4QJqm2unywktuTf4AXpj5xPzmuEs7BpX1rGjq9XAwR
         efph3kJqnwFw59SxBharSrblng9lmtJm0uC1zRyEBrlyGi6mITEJNjqMpLLgktH8u0gj
         qxg2phbf0OGCEw88Ds54zKU8lshIsXNDf3XPe5dCML1fo4A4Uu7m2duQWOIPWQmt0iV0
         5CWg==
X-Forwarded-Encrypted: i=1; AHgh+RonnUIMSIKrA2A2mZJk8iHaxBgyJ1M+ygwvc0ugmq7Wk/mcupsKgCUGxID8upiafdjH2v886HxPaYFJ6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCFbycOCjq2oyf5FpWTc/hn0J2UCDUQZc3ucQBGvtgRMcvhpjR
	DVJ9aqgz1PBDT6xdIzVstGJ8nI1C+Gy3x4hm1zJLJgefK3hCWqtnrXJR
X-Gm-Gg: AfdE7cmibfPhJR9CUBZMEvIqsjkTgQ5q5+wl/beWtMf2YDYZYBPuHf6g/XBqFnsUgpL
	DHQXcw+x++bFfN2Xl7dw9KuXBoqhENDpsxhy3LF8RIHCwK4BCFO+3H2WLf3On0qVB4K2UJu50lw
	B7zN08xtVQi6VhwwH9qMCT0ANVdGQe81chtCRtwxh+VoQYRsksmhABH5YaAQqCylcKj4laYjp7b
	fkZkwAY/0KAhHskHne1IXE5MpRfbNR52HdKYteRDOTMDOE/FW2hZPrAp400oEnKuOpBOSSY7ylZ
	ghjvcD2YLWLJSmotGMtlgXx5CScq0n/6RpUc9yQrl1nX2TGS94HOOx/+QApmmHyt6wxMLWI0fC8
	lH87/RVVHH4N4xHQkv4/vpAVHYdKcUZS7QovDh+jp5qkODj0r3S3s6YFxtcYjaEbpQk+YpAK0go
	vCAS7ThanWwDm9LhR8Bwh6NHmzq/yQvxMIvITyezcnSZY8Kt0hig==
X-Received: by 2002:a05:600c:1381:b0:493:b698:9247 with SMTP id 5b1f17b1804b1-4954a33dd74mr161258265e9.14.1784555754079;
        Mon, 20 Jul 2026 06:55:54 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.69.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954c0a81f7sm193185025e9.1.2026.07.20.06.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:55:53 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (lm90) Switch channel parsing to fwnode APIs
Date: Mon, 20 Jul 2026 16:55:50 +0300
Message-ID: <20260720135550.10654-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <edb03ab2-1211-4bdd-b4f1-21f80065ef6a@roeck-us.net>
References: <edb03ab2-1211-4bdd-b4f1-21f80065ef6a@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Jul 19, 2026 at 17:06:00, Guenter Roeck wrote:
>On Fri, Jul 17, 2026 at 09:37:30AM +0300, Flaviu Nistor wrote:
>> Replace OF property handling with fwnode in the probe function to read
>> the channels properties, improving the driver compatibility since this
>> method is not limited to Device Tree only.
>> Add also the needed headers for explicit include and clean up related
>> function naming.
>> 
>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>> ---
>> Changes in v2:
>> - Remove <linux/mod_devicetable.h> as suggested by Uwe Kleine-Konig. 
>> - Link to v1: https://lore.kernel.org/all/20260713190659.4511-1-flaviu.nistor@gmail.com/
>> 
>>  drivers/hwmon/lm90.c | 47 +++++++++++++++++++++-----------------------
>>  1 file changed, 22 insertions(+), 25 deletions(-)
>> 
>> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
>>  
>...
>
>> -	err = of_property_read_s32(child, "temperature-offset-millicelsius", &val);
>> +	err = fwnode_property_read_u32(child, "temperature-offset-millicelsius", &val);
>
>I understand you consider it to be irrelevant, but temperature offsets can
>be negative. Please explain how this is handled.
>

It is no about the fact that I consider it irrelevant, but rather I was mislead
that of_property_read_s32 maps to of_property_read_u32(), and the new fwnode API
does not have a dedicated function for signed values.
I see as a solution to add a similar approach to include/linux/property.h. Add a new
fwnode_property_read_s32 that maps to fwnode_property_read_u32, and then use it in the driver.
I will try to send a new patch series to have a working solution.

Thanks and best regards,
Flaviu

>Thanks,
>Guenter


