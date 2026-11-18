Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994184;
	b=0e71rDjz510bwpFQkfF85JwhCWTjbh1joOcAWqya6rBftKivLoVkH7pwD/L1c1n5sgAz
	 6GMr0VJkUGfJuUy/MV88laXjoXvsNSpnhkIqU3OCzXVxUsQbcFtO8SbbbgxrN+R8y8+cL
	 s7Jzdb74BcZEWgMSkvGHOzCz3MQq8kRCmY7iS+OJ8BmGLksCMJWVqMI42hQ3ySVkTbEWP
	 l8RTyOREz+UmS2cAaVS7XqAaLwLjErjxpXX65VDrMvdAwColE61UPZXsSc/x0FtIZuY/I
	 rIlG0KNr9ObydASJ9P+73xOFTYD11NaLZiPU33FrnNYcfovqkVeE1f6zIXzddp6rwqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1wtcEoR1ze4f6vnO+nmndwuoycIBypoV0YZhEBWZjbE=;
	b=MhL86+II63KpDl2psxl/N7XOyFY1YHQkwQ9OB6gmxdGwaLkfqiAndoXXsUqHQj950jjA
	 7psl6Bz65KU9F2CjISO6UdkjPzeGapCJDrVZeGYZ44yBoq3h3G3B1NfWHV1tei9wNZRky
	 jvmvjVWpzapEP84syH0ERpJ8P82ANfW6YY87ugU/xwp8fqFkbNMTsAupENq+H7nnX9ZdE
	 GlMGwhJapk3iFlA4EE32L+CL6KpUCqXN8qzqCThb2dWYH4V0/zpzM9CQk8tU171e+x+5V
	 ppLvDTmZdMZrdn2itw/plQ11GCZ434rRChN1tlp8tS7edda0uNGgErZN0lCnZyIMz+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTuIhM0J;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B575606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 09:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B575606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTuIhM0J
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490f38e9688so410703f8f.0
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 01:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994182; x=1795598982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1wtcEoR1ze4f6vnO+nmndwuoycIBypoV0YZhEBWZjbE=;
        b=sTuIhM0JY3teJYMPjEXHGfi04aaHB9x5db72LMAjwnFxPMXvTAqKFVU1YG0LBzDT04
         tMLgV2dh5qeXRR99wJ5pskJ5x7nT7PM5R6mwt7kuPCFGw7FOTe3uZyqqOU8mXtoomNLJ
         Jd+QxxFXdRWNj/KTujamCJLmChZrd5hfs3IedbOa5z/+i/e9dE/6zPZYCep2bzL30Iz0
         +mrbIAurcbxnvRoUUrcPnCfo2qMbCDgy9f9e4wNgRJiLR1IwZH8iN1OEzs4sV6uzF74+
         02Lk1UZVbYwD5kToVO5x+RaJqtqqBo6w/2TWBxCjvGhgeBKs0Fc9p4aWJSDHoLse5gGQ
         sNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994182; x=1795598982;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1wtcEoR1ze4f6vnO+nmndwuoycIBypoV0YZhEBWZjbE=;
        b=WdQbn6DBy+Eme7D1tc2CcoGmq4QoSo5T9pUT30gR+xr1gl3u3MS4j/ZakpqhHhN9bK
         MLU++8Sfvi5qmcE5e+5FZsLMYUqB7BYCioEeX3zXj2LPoYaM3BeXJHuqs6sINT3eRcQs
         8Vw1LR7++ZzXISacUw6v4tgD8w3hAM7PzVJippgNc0vt4xrNGUzgHU+o2xVqW1TE9cdf
         g726vYnTKPo3mX+oyTxHAvw4/5HQI6AzwI65fGIK47C2Df4aP5IFZlh243dVQjdNDAOz
         EUbEi+PRlWTmopFddXz/EIj68hqnpuzt8WL1WRmA4S4CYr44+4aRV+ZUdXKj1FWJxXJB
         XNFA==
X-Gm-Message-State: APuU4Z81Lhiqi8nRSF5uokqvdedQewUCGU+7d0puW3HedhQCpnf0AG9N
	AWbr+9MOmHmfjl1tZF+CL9KxSrrhRI8O5t3Put4SYy1LrTJqmsCy2J5y
X-Gm-Gg: AZFdTZd36AG7CrzyIXqgBgwt7jJwUUDQZYKNmbIiR4BmvVy3LNZzE5YZtWzYWgTTcN0
	pvjlTHaHBEP6mpeG2jhrOlX//nE46WTA/xBU1iNDQPnv72xXVCZ7jfWfljcNxjN7dMcFQiqqJDZ
	RHmzq1V4nXZy3PBd1r1ssOMq+YVLCjyXbKYP1BId4opLITnjyjQ0+HcNOztviVv7emIh6qO7rlo
	F7PoOAvnb48nwkscCQvBkVbWHqZBh2u23KvbRf7593PSyTI6gw0+cvWcn30p8B7cKqXXMq9uM4C
	sQ0qWeLMRVTJDD35Mbs9zccylgoqmxZ0n4nf4ePH3rf133bJOFsQkCFT2lxDpTd/2G5U+6Zr7sJ
	fAjTQDQJLjIK5B2GDpYR8ltOkrtC1DPVPvHusCkiZDxxeI2EAaAYvphP6RFsw6rjNo6+ZC4yuGH
	YQ8PiNheYdAGgLpgnNgIkYYkLTh0wdsd/jNWk4Mvg7CQT7tN+8TuGVJO/FIrt3GPFGWyXHc1fxP
	8Tc/Dua+TEGzg8ECEDcop3eOyi5P2Y3f+GpjmvXm9D6tClsjbChqkibqlbM42rYki2orqNRJ8mR
	Dyju/bJeB7WIKyFaIJYeyqlfURlzXSG8yr7oYtupUvb+5b2bCVZbG/WaKyG7LOkTlrvquEfh2vQ
	BsmjeUBaQ/Vs=
X-Received: by 2002:a5d:5f90:0:b0:4a7:bde4:4d26 with SMTP id ffacd0b85a97d-4a7bde44f1fmr1053178f8f.10.1794994182388;
        Wed, 18 Nov 2026 01:29:42 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654b807fesm3345789f8f.10.2026.11.18.01.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:29:42 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
Subject: [PATCH v2] hwmon: (ads7871) Add error handle from spi_setup()
Date: Wed, 18 Nov 2026 09:29:28 +0000
Message-ID: <20261118092928.163553-1-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ads7871 probe() ignores the spi_setup() error return value
and it attempts to write to registers even if spi_setup() fails.

Return the setup error before accessing any registers.

AI was used for peer-review the patch.

Fixes: e0c70b8078629 ("hwmon: add TI ads7871 a/d converter driver")

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
Changes in v2:
- Clarify what happens when spi_setup() fails.
- Describe the fix in imperative mood.

 drivers/hwmon/ads7871.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index 36297bc6d047..a1ffc35d9272 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -187,7 +187,9 @@ static int ads7871_probe(struct spi_device *spi)
 	/* Configure the SPI bus */
 	spi->mode = (SPI_MODE_0);
 	spi->bits_per_word = 8;
-	spi_setup(spi);
+	ret = spi_setup(spi);
+	if (ret)
+		return ret;
 
 	pdata = devm_kzalloc_obj(dev, *pdata);
 	if (!pdata)
-- 
2.56.1

