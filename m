Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A6E3F44D7
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 22:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883129; cv=none; b=BQih8n+PmTivfNh/c4U3NrPSrtvXIQAIkJPorgW+hwrQTRyZUxMNP9mTng+VTnkxaSlSoNZCWgimqlkUcqKIDBmFZExC1dGpUlqCd1Pgj4JSBmW5UobHrbGEksxfE4hAmf/GgsSa2k+fUXbKJUzrMQ7Vwxc4yu3ewkfb5PAU898=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883129; c=relaxed/simple;
	bh=ETivrwyXTq+z+Tc9f8R+CJ4bEtqYJQZwPgtTKbESsR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=odOxVWQEtHsMGBOQEF+t0C9KYYnx5jzgMCYjq+bgzIdTYs/BTDOd7Q3ToLLM3kLyeKRj5Py9JbCRL+/l2geMrvVzgm7zeI1BanGBvLFil8OWohljSt6VG8+d29r3kXjUr7EDBl86R6KCYG2KPHEudw6/KLTUpPsF//46Jt+Tqo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=NJ1liADs; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="NJ1liADs"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2f0ad52830cso455436eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 15:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778883126; x=1779487926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VK26/8ZVBf9AU0/JWVkP19gRCj8fh89lDWUebzaejUk=;
        b=NJ1liADsROPs6MI1VskgSPEiKEBv5K8RpAzTUZDHhIR2VBApk/ngU0/CYej7i+QzYQ
         PqvQeKV1um2cJYTyD67/5+RP0cFeFXuMbKNutbTRWHoeVs7GS8cLhEZyH5WQwEs/KMYl
         9rrB6+brdtGlk3PmLxnkKSCX7/zvf389CjG0MUetgD389CAyeUJ0QqKdFsUWce1iY1pg
         s2nbI4phVhRXk0Bn/q1Dfoo70B0UDgBQgVidRtYvzECPyyT92lh9pL0wOlxZ3Y6yXM55
         p0gCb/QBcIKEJg05VXuNuZuL3RCS6swV9eBy1Kjpfy/+NT1vwoaB7f6wjaBDFmwYdX3e
         EItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778883126; x=1779487926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VK26/8ZVBf9AU0/JWVkP19gRCj8fh89lDWUebzaejUk=;
        b=n7G0KhnYMFPeHvvbA7E+4uVh+Yn3WNVbRi3+d/BysDaXo/Cg6wU5nYz08USef+PYxw
         atGaonkhWYetq9O+GN8/nvrE/bRjQRO5lX7d7qTEXJRIv9GWmQToXFp8ZNifb8o9oXpu
         vgc3cDQrfDwRZFTe/czEaSqV6UHTeHUjgnUFNOTqr9h7T3uF2457FHRxuQt8fdpgFeUC
         aAi5/8OMRdohp8jPjBohGHyzgthmCEWwrbJ5E6Hd8smA31ANsOehYioHbxrf0IUkuql6
         MgezV9dBay5TI7g/gv9YqG6jbR4d39YTWVAH3f8noK/cqGfF3patO9XuQAi3UDx9GxbJ
         JawQ==
X-Forwarded-Encrypted: i=1; AFNElJ9cQXWAyXtBxSgdzH+EVeMoq/pTXd5lpRWk8kD1DwTX0NbBd1mrHl8hoVkDurzUVFdsydfXOA5ogaTEFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE71heo2+rS57XayRUP9+26fT3QHNLlb7S41KgjIyr6ZI8WHHt
	ImBUes0wKviZeNQmMEYLeywqtFjzu2oUXX6XoL6cckoFyegKsSnLNE63e5fuz/wENcg=
X-Gm-Gg: Acq92OE2ZJ8EDg6RWUHRKrZ1GYnuV2PWvTrSeyb/S+K/MjmIoS37cVhg5L7sWdcotSy
	RnUqxXn8i2/hfQuivlYat7NepCbKv36B3zRN3xP9kcwg1uAHMwD9gfREQaCK49UCcnx+2wwUxBk
	APIf0TiotuGd35tUMO074Z2At53UgQyCP8aqm8mD1XDVFlPTlpKpG5wkiM1AtdIK96N+qzjf67d
	LNKraYfOdGV5rKi4QgX2WErhJR65ADcA38ywfBXqr4vJqakCxyStwq55xtsH2UYjCAHYOTW5pfu
	U+a5ZzgN27YL3QD5BaJf1OGMMFvy66SxVADwrpW5lLYIKAvhO8KdzZUNIRIsYsUxJ+iZE892gAq
	+EuQgptZoz+ksJYKl2osayXFwKPxlyRzi+GSn13HVCN14EENHf1DG74zCt4DjLtN8TeTW5XTLMM
	Fxh1OAdZlx9axlrYUV7TLdUBFoqw==
X-Received: by 2002:a05:7300:2216:b0:2ea:edc0:4fbe with SMTP id 5a478bee46e88-3039818a842mr2935169eec.14.1778883126240;
        Fri, 15 May 2026 15:12:06 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e686sm9626315eec.5.2026.05.15.15.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 15:12:05 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Fri, 15 May 2026 15:11:49 -0700
Subject: [PATCH 3/5] hwmon: (pmbus/adm1266) reject implausible blackbox
 record_count
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-adm1266-fixes-v1-3-1c1ea1349cfe@nexthop.ai>
References: <20260515-adm1266-fixes-v1-0-1c1ea1349cfe@nexthop.ai>
In-Reply-To: <20260515-adm1266-fixes-v1-0-1c1ea1349cfe@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778883122; l=1706;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=ETivrwyXTq+z+Tc9f8R+CJ4bEtqYJQZwPgtTKbESsR8=;
 b=8SOiEV2agb7TI1iKZEnDC91LZaCRSpz0eGiAL3QdL8dFrPyfdiPlcPRE3IrlB+eRS+Lsy9s4Z
 vh7m3FRKHa3CNcO24bG0fgz5UMOGhblHfQwXn03pugAXPUmz0F0jXLE
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

adm1266_nvmem_read_blackbox() loops over a record_count that comes
straight from byte 3 of the BLACKBOX_INFO response.  The destination
buffer is data->dev_mem, sized for the nvmem cell's declared 2048
bytes (ADM1266_BLACKBOX_MAX_RECORDS * ADM1266_BLACKBOX_SIZE = 32 * 64).
A device that reports a record_count greater than 32 -- whether due
to firmware bugs, bus corruption, or a non-responsive slave returning
0xff -- would walk read_buff past the end of the dev_mem allocation
on the trailing iterations.

Cap record_count at ADM1266_BLACKBOX_MAX_RECORDS (introduced here)
before entering the loop and return -EIO on any larger value, so a
malformed BLACKBOX_INFO response cannot drive the loop out of bounds.

Fixes: 15609d189302 ("hwmon: (pmbus/adm1266) read blackbox")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 94691dec1359..43d9e7407795 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -46,6 +46,7 @@
 
 #define ADM1266_BLACKBOX_OFFSET		0
 #define ADM1266_BLACKBOX_SIZE		64
+#define ADM1266_BLACKBOX_MAX_RECORDS	32
 
 #define ADM1266_PMBUS_BLOCK_MAX		255
 
@@ -360,6 +361,8 @@ static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
 		return -EIO;
 
 	record_count = buf[3];
+	if (record_count > ADM1266_BLACKBOX_MAX_RECORDS)
+		return -EIO;
 
 	for (index = 0; index < record_count; index++) {
 		ret = adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1, &index, read_buff);

-- 
2.53.0

