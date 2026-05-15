Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3403F5BCF
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 22:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883131; cv=none; b=FPal+FjPisV4AkyCofRNBDI133ZILja5ug649DWqvhf9dLCgv7tirr7ju0DCaEkD1t01cQG4If4lzLqS66/6sjtmfGIg7aNc/ijrDeaIRIJ5YIxPshVKHbkCpRv4jIqjJzl2e9qJdHOvyUMeQ7Dsnmy2/0A5QOSs61lBUC+rNUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883131; c=relaxed/simple;
	bh=zhxWqJ52Q6qTGKwBiQNGvijQCBuYkpUO7Y7g9BcLdgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NF+ELEUFj3ITTkgq0QZq1o6LtESjNndhv2wjsbkD1n9JZsWlHz+nohi4xvH2dxsiAvDGo7gPxCJX9FwWUwT9m/ccxme/8DJOuIcLSJxeJneVVKVh+zIDCrxTDjPJ0k7wHmZOGTvsEBrJL7KpUYWDlO7dq4IT75cBDDtNR3kGn30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=N3nqLF9q; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="N3nqLF9q"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so1588559eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 15:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778883128; x=1779487928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JhuDfTWcij+46AVt9XxVF2c8YtBvHsSklz5Uok9QCw=;
        b=N3nqLF9qNrSnolynR+RLfz2vD1FZliEtVHUW0qaZEMCkg1rtqcBR0VmZ1fqbZWhUzK
         hOOyHEVyX5akc8aL7AYXWMrOGGBVmH+/0dHyo0vxQs5pilbFWOJ+FOhZ1zV9OCOrCfq8
         s2CmOHzyU84KFQ0QW0tNcFVEGqq7HL/c0HTCOxaiLbqTo97FRHqcRBoyyPL01qLUNxCO
         Q+ROv2gd5oCr6WMVuHZLxSP6zCfajRmLs6RzmFxpWLAdFQvC5AQriLx215IonzmTAZX8
         5DHo0dhYa35srx09ADCQ3E2QipcW7DdNaOzhxuckIiYtk4Vxp2HD1xO+woV9jWuCYcAH
         sn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778883128; x=1779487928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/JhuDfTWcij+46AVt9XxVF2c8YtBvHsSklz5Uok9QCw=;
        b=jCNlZtnOhV6LvoH3E0qzKpJjqXa1CXjqiJvuYwD4bZ54nmFvjJ1sZVrxjyjUHVnIUd
         D8OMJT7Wn+BH7nKqfkWZSFG0Y6G4KEFnzvH/83P6cXWLpzLi67oh1GkGfsoirwo8AN+2
         vytFt8m7I1I1F1nXodNNiSMmnBQV3BvxkJ8U6LPK9ZURU4gLSDzdsSDmdYmM5EetthiR
         NEF4QbuWEiQQv1KH/Y6uUUT7OLfmz8ISzQwetz5gi69KUkqshW59IjHTiJyIGp/mHg3K
         PkTZWteVnZTR/8XMoZMXnvTvrwB5Ues2ZEr3Lq8qv1/FF0syOUyEzZQufqgWwZDVoW9n
         Y5Bg==
X-Forwarded-Encrypted: i=1; AFNElJ/q1uWwxuIVZOL27NROaeRXHkT0lX+1rPJgBg9L+ffPyYu0Yrps8+dOzjuA3DuvxsjFEfNklG9KNJ7n8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAZtpPqQsi4jAGNLhDayJrb7O8DJNUswJJHuh3I+U6D01w3Khm
	HwATazW8uIt6irlF5Py2fYrcmOZKunNg4Yv8A2OL6oZktvsHIA4ysS5qgn5U3OmBuzk=
X-Gm-Gg: Acq92OFzKDDHCRPpxzVNuojqRIjhFR69vhsW2n68kk0rfIw8Mo1QRhumSGKzkxwF+qt
	DFJUpFhyNJwYTYc4NhPI7LJGPrnlSaCIq2jeZ8kRN0wWdHVT/fdCxD2HuDJhIFYd6+fpq0WiCD8
	FwrDYhL7GOLGX1KXQlhdk7gd1qnuU0D2zpIysnGP724SgupUw47TV685bZS/kUyAu7Wf3Pfv48d
	s473Bv9nU9ypfakwS8wBJs202HA51yuwmuZJtymIQsM/2QYBXecDFD2LeFcE+y2k75p8g1FMwPU
	1SSEi6EM6eaWmjIxajAqgA8mxIvMRTIZUA4WwbvLpOqkCPHSu0ZMy2bangOsKRvJ6gCaT9J2Rbj
	oql/8LxeW4wdLKO0Ojzd4153uvXZA/LZUYx+nKUv1MDJv85x7lSMZn/OzYiYzi56q3VS47f6jcE
	3aE+QG0XXL9LTpl8rfeMaTqjaQy03JSaK0gOVs
X-Received: by 2002:a05:7300:a907:b0:2f0:c8b5:3dc7 with SMTP id 5a478bee46e88-30398680c36mr2939435eec.22.1778883127883;
        Fri, 15 May 2026 15:12:07 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e686sm9626315eec.5.2026.05.15.15.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 15:12:07 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Fri, 15 May 2026 15:11:51 -0700
Subject: [PATCH 5/5] hwmon: (pmbus/adm1266) bounce blackbox records through
 a protocol-sized buffer
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-adm1266-fixes-v1-5-1c1ea1349cfe@nexthop.ai>
References: <20260515-adm1266-fixes-v1-0-1c1ea1349cfe@nexthop.ai>
In-Reply-To: <20260515-adm1266-fixes-v1-0-1c1ea1349cfe@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778883122; l=2365;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=zhxWqJ52Q6qTGKwBiQNGvijQCBuYkpUO7Y7g9BcLdgc=;
 b=e1uT0b11Dc+0JWe2IgewP/RzSkfCoMezb1XvRg+F7LvPJul78o2w22ZbaNVCLYoaSlvq4aNte
 Y3T+uz3DvJhAt3FHAuGdhFzdqnXaTNrnB9eKQgSSDRuPhqoUqLA56Ze
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

adm1266_pmbus_block_xfer() copies the device-supplied block payload
into the caller-provided buffer using the device-supplied length:

	memcpy(data_r, &msgs[1].buf[1], msgs[1].buf[0]);

The helper does not know how large data_r is and trusts the device to
return at most one record's worth of bytes.  adm1266_nvmem_read_blackbox()
violates that contract: it advances read_buff inside data->dev_mem in
ADM1266_BLACKBOX_SIZE (64-byte) strides while the helper is willing to
write up to ADM1266_PMBUS_BLOCK_MAX (255) bytes.  A device that returns
more than 64 bytes on the trailing record (read_buff offset 1984 in
the 2048-byte dev_mem allocation) overflows dev_mem by up to 191 bytes
before the post-call

	if (ret != ADM1266_BLACKBOX_SIZE)
		return -EIO;

can reject the response.

Contain the fix in the caller without changing the helper signature:
read each record into a 255-byte local bounce buffer that matches the
helper's maximum output, validate the returned length, and only then
copy exactly ADM1266_BLACKBOX_SIZE bytes into the dev_mem slot.

Fixes: 407dc802a9c0 ("hwmon: (pmbus/adm1266) Add Block process call")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 5c68e3177f64..ea1edb89d2a0 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -348,6 +348,7 @@ static void adm1266_init_debugfs(struct adm1266_data *data)
 
 static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
 {
+	u8 record[ADM1266_PMBUS_BLOCK_MAX];
 	int record_count;
 	char index;
 	u8 buf[I2C_SMBUS_BLOCK_MAX];
@@ -365,13 +366,14 @@ static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
 		return -EIO;
 
 	for (index = 0; index < record_count; index++) {
-		ret = adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1, &index, read_buff);
+		ret = adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1, &index, record);
 		if (ret < 0)
 			return ret;
 
 		if (ret != ADM1266_BLACKBOX_SIZE)
 			return -EIO;
 
+		memcpy(read_buff, record, ADM1266_BLACKBOX_SIZE);
 		read_buff += ADM1266_BLACKBOX_SIZE;
 	}
 

-- 
2.53.0

