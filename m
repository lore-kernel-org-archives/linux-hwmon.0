Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130593;
	b=Iy7Ok58S3/ocdY6U/mntSZgtgdnq1BQUpA8xpCgwhRY9s00OhIDglIFeSP+NqiVtKwnG
	 YOLjPfv37vH415jeMrzaNeKnbsQdICWvxuNypoS0atcoV0pNIklb7Syeecx2HKEm6qJiF
	 4K+5QNvxRl1AIQhHvwZqkxYwyT/hU3B7RMO3slMTmJWz9jjdFD+8k6ra0opAxMVPa6dtG
	 X0LxPdaSxyvQTgFj3gQyeG4GmuNC1uEqmoIVuDWhSgXiv4Eew4mz2OQ3BvubetqOERN2y
	 lVRGQWwgI7iGmh2cBX9xaek2ewE5uHTuOI3cY9SNQFG8uVCHa6LkfSopBJNm+1QeiNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yd3r5u89C1nws23u6cOazWo8yNsN7RjySlD0iOTIu7A=;
	b=usFG8fvY4V9ruLX4pUaTDyE1r/vHrvfO33POn0p/8eo1Esc7hs21No+4aFoNI+6qG9ph
	 uB4shdW2WzKwHH9yXjJFxE6N682Uw6u0iwD5UOqnUiFmB9JNyM2wIypLLWGM4ew+bTZP+
	 vxXgLeiLK03DTjnp4C3L9irECVoFYPIgsGdM2G3yov30iG1xwauYRoELO/54sYZz0d40Z
	 7Gx+CWvPZ1T8fUrjqVOhVVz9QJe9yqAB5KyJMhHOHtSBSAbuIZpcLlgwURQ4tXMzNCxLP
	 Iclh6UsTiR60EONXgRPctJ/2WKlj7h8KiV1Ws9LHlBsV/GUVBAlq2D8bxK8rVZ/UonA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EgA2D0PX;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9209E606A323
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 09:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9209E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EgA2D0PX
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so2267085e9.3
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Nov 2026 01:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794130592; x=1794735392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yd3r5u89C1nws23u6cOazWo8yNsN7RjySlD0iOTIu7A=;
        b=EgA2D0PXjr5OVlOJ1qJdKWvqfNChTeLZaIutWFc7i8ppMT9c893UfwWDqREGn+aonr
         EMQTl30ad4OcYKQz1CVV2qUMU7vySG2WdwOhACUd3c6jKIwAsT9pwzFif18soBpqicYx
         zC1sjqfonn1LU1yqxyXyVwMClYrwkMbOs/ixZbhRjFTlSMno7fTw+Jvlc4SxUmbLAGke
         jLgI+3fNs8/8WjUR13CHqogb+9kf1LqpThzldouMeG7bw8Ev4ExuF69OGZ0ZfRlZR190
         TKl6a94eJSoSQxuzNMp77ln5sqpYEPL2mAwGXrIQTvabxqCAXXpry+YItLTGtqn+X9Nl
         aIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130592; x=1794735392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yd3r5u89C1nws23u6cOazWo8yNsN7RjySlD0iOTIu7A=;
        b=lMoepaGsSGoOM6yVRTjROg8n3RBQbn9phFbHhNOhwUgEM2D7NU9K+irQZ6J8heJztS
         0m8s8Dxieh52HqeAil0PQWqguziib6cwrBTnODCpuJEUd70CNu6BfbL452dNswNwZ9cD
         lg6A+4t1MBL+yp1i/PtINWNVctl9nAdigsO3kCQ5q/QYVCUilDMNh5AbmG6YSyEeIHk9
         YCcHbPDfzp15eL/E/0tis7gIM1zJRPiFTjlaVNIOaWdMi0gFbM7xiOM8Z8OjINRKnF8J
         ln4AeTTIc0gzEU32iISGrCSAUdOuX7gXziGLI7exYcPMml1sxpOa2vdSnmTD21ADhETs
         vZrw==
X-Forwarded-Encrypted: i=1; AL+hErE9Wg4spkthUuw5Zxe8aahqAMOXqTE9g9OrcABRvbxDK/n/Or2ypxrCqct4vaPVkVO9FY4yBp6NgeipwA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VHkac/0D1L6oeMso5zPRVJYnLMpsUacrRZYkIIIefZfVmucQF
	sr8B1Ar8n57hHA3zNebLVgGeL2IrWt/8KAozCHbp+02s1TihTBXSsfLQ
X-Gm-Gg: AYBFou0Ga4KojrNksGJ4RmHTKPmG4Mx8pJuw3VluVBxkhjCr4bQ5Ui1Ecvzom0VhyXl
	BtG24tBMU2KQaLRnDRM/eRpCpxKmRtykjVXUD5N1PrmW8sKhLB4HTqRSppegDvQ+pwPv0utmI0e
	hje9pNGZ8kiLU0do81iv3nZ9Fz6DzV75vBujG52KLSLOTT30AhCSeTv1uwPHVjymGct9zIaMSY1
	gcrh5QMtRXU+uXsXUpAnPW4Lt5moZkG0f2ScwJX1RDUdXHPKwf/4v72XJmjCZqLB16ZBbnu9AQU
	XR02rhQgt4w4fhB6Nzis4W8mscK4zL7QJOUsDQlGXKbCJsPkEI1R7lwHGlfsSxBKiy7VEk11sO4
	htv2vWETtvmZxLgEcbfODHku9PbSkeUVWl1cbwmbz0c13AalKSsHtmi//kQL4OLQWjMlLgFUC6u
	fGGF9rb4ivB7eacPkwCjQrQmqK/zNf+qS1MQbEhPMQKJ4AfaJy422oLVaEw/DmvLdWg0CzZYfKi
	5w/p9cABoUtYVdPkbdoiseLIUU4GHT89Rnb1jRi3x+a4FpHh/sYqNW0NNPs6TOPj5glXYecRLHv
	eqc5VSOU+XcEXj9OkrzINE+x7sIUxuLxEqkkt6FSR+vIUspc094zA0/lliQ5JKyp
X-Received: by 2002:a05:600c:34d6:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4b963c6c2d3mr19662015e9.6.1794130591941;
        Sun, 08 Nov 2026 01:36:31 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e6eca30asm141650355e9.7.2026.11.08.01.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:36:31 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] hwmon: sy7636a: fix negative temperatures
Date: Sun,  8 Nov 2026 09:35:59 +0000
Message-ID: <20261108093602.329554-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108093602.329554-1-pmazzini@gmail.com>
References: <20261108093602.329554-1-pmazzini@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The thermistor readout is a signed 8-bit value in degrees Celsius.

Fixes: de34a4053250 ("hwmon: sy7636a: Add temperature driver for sy7636a")
Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/hwmon/sy7636a-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
index d51daaf63d63..f01f368d68e5 100644
--- a/drivers/hwmon/sy7636a-hwmon.c
+++ b/drivers/hwmon/sy7636a-hwmon.c
@@ -29,7 +29,7 @@ static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
 	if (ret)
 		return ret;
 
-	*temp = reg_val * 1000;
+	*temp = (s8)reg_val * 1000;
 
 	return 0;
 }
-- 
2.52.0

