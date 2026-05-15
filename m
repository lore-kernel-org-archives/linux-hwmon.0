Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD9D3F164F
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 22:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883130; cv=none; b=pVchHey4SzrwJdKdrpO+TOpBCBeW/77VEzuHeSxBctDj76utJPOEzh3raVd9DQMgU7oh1VKSLRzjdPuPhAghz6mt49csoX1TMxdJv/7Uczc0zeNvAzFa6N8r7NozeH3x2Sf/Z0hqaFXoyWg2wmO1emP4JEGoXF2ZZXFwwV7oELM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883130; c=relaxed/simple;
	bh=rP04PKwq1R/PP8JxrqExEG/Wa23i/3eww37NNCWqAhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZCN4byDfYoBRuGq3WWC+zbd1HEyZ4P3EiyifSANHYH0KrabBazIqr6UA/wgZb6sgqW9Q2C2YRbud4OrkRUy2Y+hTTEtSwOgEmfk3YTBHpYPSCudb9QdDE/VoQuYug1HSmhkFTHZq81ds3RYOmEs+Jl3pLnWBcv2rU5cWYj5H/c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=EFTofA3/; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="EFTofA3/"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1353c2f35cfso1159581c88.1
        for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 15:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778883127; x=1779487927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7X1kg6LzQMAP+o8E3PxdhGDCIvH3ZXQrhfmA4xsA6sM=;
        b=EFTofA3/8HbrcNDNLfDf9H4iqTlnrAZ9z8NBXS83a28ScmhFadv6/YmPDiQE0eBT1h
         VgOd6bY0ved+4dVTd287jcmIk3wDODO/Q4gSr4XhvdRglb3TS6AOa8e7sa0IkvGR5Eka
         F8xGy1uvu9cDjCNssGa7IfEAIL+VvU+uqPNQOjgE/EjwHulLZQXVW9YyLCVNWyShZ0VT
         IxBuoo/jtMVyfjtOWah18s9BLL1BXkT5iYFRvbmxCMTFIR+Vz8/KBTIVfVP4xVz1jOQb
         K48abYssYY/7+/SdLfLQR+w60PBF1X2fwIPx/8Fd8/i0DwRFFiFcZMXpVKvnu22eXp7i
         Ywng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778883127; x=1779487927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7X1kg6LzQMAP+o8E3PxdhGDCIvH3ZXQrhfmA4xsA6sM=;
        b=UocaKNehTPwPTENyyz9X6ciwkzeYiy2H0rZfh++letms9AbHXJjbtHopWNRu3k+l0N
         Hp0sLghXOERgL5vv9rDWuOs7PbW6GAuOO43xBj/5PMMmlLorm1qBuo1f+U1Oa5P2Yaxs
         W5fI64QmEdT0l+8ysszbWRF5BPN4wAptlrc2We5qLSrjrPA4r9AQR+Fx2yWelyYVWU/S
         7wzm0sd4VKrqPKV3nj6lBVbZODDOxQEyj7i4wc2+vYl7CbhC8DgNjO7QCbwR36BzCnfy
         FKgno/5EZvX36z3JWL79EyNKwp2tE/t/FN2cgExT+gjq0+U+QLNWbZIfIizDXEbAhb7m
         YwGA==
X-Forwarded-Encrypted: i=1; AFNElJ+FliGmowjZRortsmUL917149vhNqoTWS1uY/jlyEGjASckKz8/TDa3VDDp0T3gHsRuXeLr5P71MsmTeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+yHI7Da9xtwp+X8ILxQRgqs28Pr8xKo0KV7tnO0+CIR+4iboA
	ivqYA3BNsWKhfXj46N3SQ4DNvpg09APV0GIEmTgpSUKu/5dordVXDvbWqitYIPsiRKk=
X-Gm-Gg: Acq92OHQGuk8ltBxYrM1dO6T202aU5NLdY1k3wtW8ZpqDM69LAGjwuoNws6qZFnq25s
	iXoanWIWioT/eZyq+rWhCb/3sTsI7EF9oBHlIRca32ud6dnJxdynruqLFM1mUF5VuSpCFZWUpLr
	R+L9YVYyg7NIpsz/3zWqvAvah9p2rJ21dnk4ZSOoAyqcYJvfr9fz/I95bFki9/P5SpJnSB4TiDu
	7pRW26P/65ykmc9KHfzoDhSaxg6PKG5f7fThisvCIK/6T4+1qLsbG7MI7jnw+bwNgGItLeOWm0G
	0lCWfYgUz4mEeexCpx6tVm395/rsUhV9xf3MObn+2xwThb3BRE4p/mj9BchHPUe01hYx81aDjuE
	nePVj7WyhI/UrcLcsFB+qYr5XzZOO8HJ+Oi6gPn62NdhLABTRRpf5g2Nb+uWrO2/yzLkI2WlV5L
	3O4tN+NSC2517T9s97AkMN4VbQWg==
X-Received: by 2002:a05:7022:fa1:b0:133:54fb:f563 with SMTP id a92af1059eb24-1350473aa89mr2644596c88.23.1778883126994;
        Fri, 15 May 2026 15:12:06 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e686sm9626315eec.5.2026.05.15.15.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 15:12:06 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Fri, 15 May 2026 15:11:50 -0700
Subject: [PATCH 4/5] hwmon: (pmbus/adm1266) include PEC byte in
 pmbus_block_xfer read buffer
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-adm1266-fixes-v1-4-1c1ea1349cfe@nexthop.ai>
References: <20260515-adm1266-fixes-v1-0-1c1ea1349cfe@nexthop.ai>
In-Reply-To: <20260515-adm1266-fixes-v1-0-1c1ea1349cfe@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778883122; l=1565;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=rP04PKwq1R/PP8JxrqExEG/Wa23i/3eww37NNCWqAhQ=;
 b=2PNAO62DaJBNERe0/MaLo76D8o3WxNJxlnvyAB4KhOkACv+TmFuzh+cmzBM2k7B5wA4y02Xqo
 cC+jqrpbA3zCAvG9GXTyQMbl1cO2ngh7hRPx241ZkZxnr9Dc3zaszXX
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

adm1266_pmbus_block_xfer() sets up the read transaction with

	.buf = data->read_buf,
	.len = ADM1266_PMBUS_BLOCK_MAX + 2,

but read_buf in struct adm1266_data is declared as

	u8 read_buf[ADM1266_PMBUS_BLOCK_MAX + 1];

For a max-length block response (length byte = 255 + up to 1 PEC
byte), the i2c controller is told to write 257 bytes into a 256-byte
buffer, putting one byte past the end of read_buf.  The same response
also makes the subsequent PEC compare

	if (crc != msgs[1].buf[msgs[1].buf[0] + 1])

read a byte beyond the array.

Bump the read_buf declaration to ADM1266_PMBUS_BLOCK_MAX + 2 so the
buffer can hold the length byte, up to 255 payload bytes, and the PEC
byte the i2c_msg length already accounts for.

Fixes: 407dc802a9c0 ("hwmon: (pmbus/adm1266) Add Block process call")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 43d9e7407795..5c68e3177f64 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -61,7 +61,7 @@ struct adm1266_data {
 	u8 *dev_mem;
 	struct mutex buf_mutex;
 	u8 write_buf[ADM1266_PMBUS_BLOCK_MAX + 1] ____cacheline_aligned;
-	u8 read_buf[ADM1266_PMBUS_BLOCK_MAX + 1] ____cacheline_aligned;
+	u8 read_buf[ADM1266_PMBUS_BLOCK_MAX + 2] ____cacheline_aligned;
 };
 
 static const struct nvmem_cell_info adm1266_nvmem_cells[] = {

-- 
2.53.0

