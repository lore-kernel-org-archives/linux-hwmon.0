Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418071;
	b=3BulfuQtq5viouJCrK+me/EuDlH5cgJTL4qF185CFvZZGcReAc7vMyVgKVySnc+KzKzo
	 q2nVk1gibEkM7MBeCsrrS6WdXIavIQAHIkieLxtD8XRO68iDNWRGrtwXhc5lb1uPgeEYi
	 GmZGHYqh26zPdD4UxbcHahj7bFomEQi2Ypnn/Thj8qV6Ycso098Mehr8HTy9CkVuSw7HT
	 TGSY2C/DNdIzeUx/WLRb4w3tWhUZtOBXi9Ci5fBL/v76SU7+wQHpgGREy5nCecYiAyhaC
	 qeJPoYG/9avxWN16mKBkMoFeq5ra4vL3tAkKZoSUpubChsDgdMd3BqCs/wZagLoh8fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QfM2VNQvWyi/mqC6r30oK13kaH2l/P1yHvAT3sGGD0Q=;
	b=T8+YtMgPguDBBJgmzBjoNhB8999HP6HtM3/P3QazW33j6doiygqW6U2p79sFBhjaBHTu
	 NE3f0BIzAmFcBL+a9hQc0ekAfRkI0ilKVamWzgxDjhWCQYlJXCV/Hdz9XqlYZbueQ3i0U
	 mE8bhpsVVTCs3ygUY/K35GtuDGV4sdmLUSKxcT0Y1hVJfBr4LukspaTkQGMhwzaR0yj5Z
	 /4m2Djl8dqtzzVOqEgO5fLJNQbUqZ7+G739T0lTO0/wud10wxuAwsi9cd+d4GlW9V88m1
	 Madud5m8TyRiR/3pkkJrPdAEvwVYUAiyZ9McZqAvjwh/rJr/vpzpPRCUn7iLCRm4GNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zW1Etnf2;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92CE606A330
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 17:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C92CE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zW1Etnf2
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so27837625e9.2
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 09:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418069; x=1795022869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QfM2VNQvWyi/mqC6r30oK13kaH2l/P1yHvAT3sGGD0Q=;
        b=zW1Etnf2iHetvY9S8Hub9WMWlF1BBzcSv6X26c9ps3XDPBobBcV3MTgCcDKt4Dn4au
         udB1QWfSGnZ/KsKe+Ca7R9yEx2FIoYdqv+UMYk0UiYukL1FEOvUYDAI0qz5cxrmPG1m0
         dPvjKddb2F+kuZqkbjKZaYIs11qGYPO6EiKdjpifaGe+J7cvEyGPONUkk1wj+hxd0E2l
         3JfHGBxA8tJpWUf+EoeCPSnp1cKfnSp10NFy82/8gCEzpQe4zrjRHvkEyzHHHBIP0kdF
         a6qybUy3h2X7OSsdXXR+qgmFHeFMDziRnJFRAYPNQJNJLDCpZnmOMuWVjoeg4jbcGtal
         +SBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418069; x=1795022869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QfM2VNQvWyi/mqC6r30oK13kaH2l/P1yHvAT3sGGD0Q=;
        b=fgAOXrsXptIiAHs1Ed0nWOebBGI+ru+Tj64nnF41Og1I/7K3P9hmFR91sMu2Ggq+04
         VemLyth3MncvAqAhEnAcvB3/FQ5yhWwb6cl0hFF0aBI3PxylJfFKurDUBThRwiV0U/dr
         Xi1LrG4IIvvRQo9zdPMYsmljAlv4V0APf0OfkIxxto093u1/fmkIGfC4lnP6puvEluOW
         tDp/qtsfPYyZdInlaLDptKMMxChf83XxQ2/Wolu1vVAbvf7vm8KOH0PQ6REtbnXix2B9
         l2ULxti/vpLJ/zXXu1XWlMTbqxZ1ndhq0fT/IpnusQXKvtdJ4BjqhPukOgVIxyMnq9+v
         7djQ==
X-Gm-Message-State: APuU4Z+gbUYrzyG3OsZ5TuZxnjpejJ1YDrh5gCo/gQWb12IYmM+Ra6/c
	hGdGx0/2cIyD4XUIRLclSiJZpfJeyTZsL29JwochJisy4AQQm43YW+wv/0JOCRJup8dlUg==
X-Gm-Gg: AYBFou1JMfpLaWW6XX9FOceVbi7HNztapjUt9SuBOYtFJwb9foC6rApC5y4jw9mOrH7
	oxLf5ELvS9qMxCrNbTH/zoRHKVLPKAwazupWqay4YsOo0QvkTD6Ej9fs/82reLTB58jg6v+w6cg
	qpFk0+waz/bOFQXNLqz5LuhH6YpsHqfpqxjid9xzNu+OksqhJtPuKGZV/q8AM70SaZwTz83Csl2
	2qg2zicP9OURAe7Nm006OLhL5W+PsYw0D/lJ4Qjt8MRm4Yn68dygY2pTe9X5xhsd/Dikjjm0Zyp
	xTenrxaf8lDcAqXXFLECx4kcWPmFg94EttziMhoIpjOrP4N3tbSZpxWAL1H7beChek0RrmJmHbl
	0zeFM5dToy9aUy8El0AYJhEXxAsz/6632u5WbxxDG5RvGe3ckPizvAmA84RLp4+ihg3LGWYLRZP
	TzHyTFYD8dtG/8wxE/knDBf22I3LT17zHAQ9omK+hMn6nijks7LJX5lOAWnpvBop2aeCStx2Pfi
	FCAxEikPzj6SSjOY6nLmyYTLXpp1AZLlObwAVasZ9F+nPCotZhl/TCM3gbfITxM8DiezwDbAguU
	1Jp28vFVB2etLEBARJHis9hZmoSDJAp3r0QdHnBPacM=
X-Received: by 2002:a05:600c:c83:b0:4a2:150f:1605 with SMTP id 5b1f17b1804b1-4ba0936f386mr58781285e9.24.1794418068978;
        Wed, 11 Nov 2026 09:27:48 -0800 (PST)
Received: from sd-lap ([212.104.214.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e35e44sm66897175e9.1.2026.11.11.09.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:27:48 -0800 (PST)
From: Shady Abu-Hussein <shady.abh@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shady Abu-Hussein <shady.abh@gmail.com>
Subject: [PATCH v2] hwmon: (dell-smm) Add Dell Pro Precision 7 16 PW716260 to fan control whitelist
Date: Wed, 11 Nov 2026 17:27:33 +0000
Message-ID: <20261111172733.84217-1-shady.abh@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111150435.75965-1-shady.abh@gmail.com>
References: <20261111150435.75965-1-shady.abh@gmail.com>
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

On the Dell Pro Precision 7 16 PW716260 the firmware fan control
cannot be overridden using the default SMM method, writes to pwmX
are ignored and pwmX_enable returns -EINVAL. The firmware AC fan
policy also requests speeds below the minimum sustainable speed of
the fans, so one fan repeatedly stops and restarts every few
seconds at low load.

Add the machine to the fan control whitelist using the
I8K_FAN_30A3_31A3 SMM codes. With this, writing 1 to pwm1_enable
disables automatic fan control, the fans follow the requested
state (0: off, 1: ~2500 RPM, 2: ~3950 RPM), and writing 2 to
pwm1_enable restores automatic fan control.

Tested on BIOS 1.5.0 with kernel 7.2.15.

Signed-off-by: Shady Abu-Hussein <shady.abh@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 5ec487843..250d8c1e6 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1687,6 +1687,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
 		},
 		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
 	},
+	{
+		.ident = "Dell Pro Precision 7 16 PW716260",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell Pro Precision 7 16 PW716260"),
+		},
+		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
+	},
 	{ }
 };
 
-- 
2.56.0

