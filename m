Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513ED2F25FB
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Jan 2026 02:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768356075; cv=none; b=vGP1tXzyLCdOBzF2Ityp7J+wdGJZf0npBkG8ODLHLD6wYIGQN/7g/Q+H+7LIq465/0uYwbmHtSCgVxDgzCUMmcEzHXkwnKqqTHJbO5kj7Et2VnTqV8GgiWoMkQecz929wWL8mfEfzKtAsbe15mFT8FJxnr9b2MDCDLAv47PhZvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768356075; c=relaxed/simple;
	bh=P5bf0JH7xtkT1EP8+DuCpWbp10MSGlZL2RNcVbVbl2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cMb3lWCKlJYR3IZ+vQL4iHeaikcU8EiaEaG4Q65ZMsNhuqXH0/qKmpZMGV6RbXTtLVaXIAd70CFzM3ytKujYNC+jLXtUNDJbptaaycY0GS3mscD7IiyWykTTyZijsDg3xrKyOR7qYdQjmRIgPVyj3we+DxVtEvuIwYq0gxM3/Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KolysG+i; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KolysG+i"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b2a4b6876fso1253589785a.3
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 18:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768356073; x=1768960873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFwdy6ucxpsUx3v1DfjYy28EmI+SCHhT+lBJ+O3Qz5I=;
        b=KolysG+iqUtDPHGH6mw+kMFJnXSYnzX1GRsH6vZUusJ5Jw6Y8/7egTEk0U415Tluk2
         VZqD8x0e1ogYCKj4+fBFZJlbXfcuqaleR3UjN8eDh9A4E+Y3EF3UcWQtkwNyaaBySupY
         KmKBBgbWEQu8diNqV5njU4ev/vgjNDyumBqRc49PlilApqjEnrksAVV7UgzmJ5oFnt+b
         WyUpddaS0S9oQIuixZjK5hJFJeVZajrtMLyu9W5GnwppUbcXP0B+GbFV/ysylqMuv6Cu
         13eqlhhPOs5U8eWHH6vK4n7ibHPPFQKQLXrV+wB6oE33VdlKYPbXAHYlicm5ZX6DYjwQ
         v+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768356073; x=1768960873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BFwdy6ucxpsUx3v1DfjYy28EmI+SCHhT+lBJ+O3Qz5I=;
        b=Hdyj4vdDzMqaHKEeyQqNzRv+FSX/JCeVkaMS5Vpg9kJW36YH38KxtIVpV2GCr56+4a
         yQlVfePRInE0okrZyuNXFSiTuwVzYPfMGppbVrh+L7s17iItPceDecMlQfE2QjT/9D5Q
         ZGaXHkvyC6Fh7m5enlVbvM6f5obrIEC/tLqzc20fKZ0uWnwRcADMajxDSODUJaQgtHCP
         YyOINTImhfB4NsICyYy1XJHYnGukwRK/3gzlGUZx1eGS7yFlzDr02JeNHAVhi1TI3zms
         u4tTKWeS8Jgvv0cZHzlQTENHDcluIwVM5f2gTAn342GscfjuKPKZbmrnoXt7PhsYVlAx
         64ww==
X-Forwarded-Encrypted: i=1; AJvYcCXlPBCprFry6PRCrBbnFuNdDWo+Q+AszfBosPp/PrpVIH2lki+XniGGe3oTnVmZBQR8m12Ri5l0B50E5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEfT4z4pSmDnNGrZphElfIi+2bq+WnunsN0KPAO54ZUGUIIHFg
	amqsuo+88zZdyJtopIx0ah1wYhrQFw+PgZn0G3noPUGHBGLs3rGFdHrp
X-Gm-Gg: AY/fxX5iQjcCx1D/bOHVvLDALtMY55ngBz6mjtQf+5qfLCCpehm3qWImSUPtHrZOd5B
	TZCnVvzdtc61zWVQvkqKrP/4Ulm643/q9rkAVCt9jejAQO875lLfsQ0jRYUmrAIgARmQNSS5L9s
	0+EIs2E4ic5UyPMpNM8samTtiGOizL7JmOAQfnsZDfmf3ASAHFfZ9DyFiaJmk5oMQaL80e7nYvt
	Sis0A3/jBkObnSTU3Xxb0FOCVMlqfj5qAHce3/ylM8ru4KloytFOV3OnKO6IOeCRsHXRSrec+Wp
	62YIqABx1cIs96/LaxkaNqYKgwSJRujWwzo+UUXL7J/MGPO+X0rpIeRxBos08WiGGQ/LYah2R56
	7cKSgByZcMIgPo+ivtdz8frFysAF3FUdZmMItSwgtzWStCoc6ndi9oHcckYoy70WYoelU39NzMr
	+myZTVwP35BA==
X-Received: by 2002:a05:620a:198d:b0:861:119b:3052 with SMTP id af79cd13be357-8c52fbe241amr178645885a.51.1768356073253;
        Tue, 13 Jan 2026 18:01:13 -0800 (PST)
Received: from melody.ht.home ([2607:fa49:2104:2e00::983c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530b792d4sm58495685a.25.2026.01.13.18.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 18:01:12 -0800 (PST)
From: leobannocloutier@gmail.com
To: pali@kernel.org
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leo Banno-Cloutier <leobannocloutier@gmail.com>
Subject: [PATCH] hwmon: (dell-smm) Add Dell G15 5510 to fan control whitelist
Date: Tue, 13 Jan 2026 21:00:35 -0500
Message-ID: <20260114020108.83288-2-leobannocloutier@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114020108.83288-1-leobannocloutier@gmail.com>
References: <20260114020108.83288-1-leobannocloutier@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leo Banno-Cloutier <leobannocloutier@gmail.com>

---
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 6040a8940..93143cfc1 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1639,6 +1639,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
 		},
 		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
 	},
+	{
+		.ident = "Dell G15 5510",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
+		},
+		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
+	},
 	{
 		.ident = "Dell G15 5511",
 		.matches = {
-- 
2.52.0

