Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E2E3D75CF
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 21:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785447051; cv=none; b=SnjrfA81b2bCJBynf+22KowrcCPiDT8gWRk1AnytVfessEz4/G+01Q2W3OGoyAHw1aL1SOeuc+uUM9Hg01YIoZgZnBSVVJpis3VZIUtiiRxbDkiRpDB5EOHs4xfdp9/2YQ50fxLa9KFr6zpcB27uYbShI6txC4lEz6sFEJnrvA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785447051; c=relaxed/simple;
	bh=+gw83Mh3Ir+pTpfrq0+pitALUCJUqx97EkYCdiBEbRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RUcKdyx9+8ztyy7VDvXAiZL9BY+2MwkgrQ+jnFi93LKSJT/N0lwRyMdAA++/X8bM9FLY9jjwabRZYMABub2l73kXXkdwIrjUoYUxIkmGLPylCaBEL8IxZ6xr02feNsGihIuvitrBxepBxDZfaTPGapF68HaLFM3ZhLi6wJMQUGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPYCuCDM; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPYCuCDM"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbb973e6749so304448a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 14:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785447045; x=1786051845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tv7r0pILyVz8vcjgz8J3/h+ifgsbbGqBLwmu7dyifLA=;
        b=GPYCuCDMKNN9IXev/qhPXsoqGCN+ktSnjkpIwop4bw4KNbxoJNX2sfCuxqmxiFJNVY
         BtjMtUtAc/ZPBJI8GgG4dl5hnIvnkLvLbbwaaa2IIBPE3PzTQWgL876ySkjox4Xzy+4f
         B8vGV40tbOJK5dlZEnCHcEnWB3FD0bEUduE3BQ6GaN2Kv+02oQ2zP8IdVBb66PRgkG9r
         7L+d0nm/rBiHpZSKUKMV8IQIqo3Xi5yVKKE+wikxzXnhZmi+GH+REPSYkKB8PNOrDrk6
         W2cv2hZ/fzulqksf1AuZazyjNmUVpi0n8LbHVVCQeBQJaIm83IxN9XWNHZPbTSyPv/jj
         EDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785447045; x=1786051845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tv7r0pILyVz8vcjgz8J3/h+ifgsbbGqBLwmu7dyifLA=;
        b=XMg/FojgNAsK6g/LEg5X38/H2u1Rj8NNEd4P4qL4raValeezGLHLMAVOcc+jcTgDvH
         CkO/rhsjBWsLlXepM4jwoWex+5uM2P7TJ5HtckM4FHEFElf5gn7lYZ7yuOs2rIEAeE4+
         3NV7mF0yOboiJxT7AkVijXvkql7HWgGwJRlfLLamSn2aMiggudf0J7VjLI+5NWRnPlAb
         IEuvn/MgKK1zBfspSXXTJST9WGgEPRiTZnyry+32LvM7e9jxyAry5fSU2w57dhdTV1EP
         lJljXPxx7mpYftP+ydSx/0zz235oEILYSIX6cmMhf6pdZUX3e98docHhVMShlRv++bWy
         kG+w==
X-Gm-Message-State: AOJu0Yz6KP+KzNSvE4pVVIQzMAY6RxKfmNzK5+ERsGxmhkiYz8VhAGM2
	8br8UDyhxFspInXKxhnmWQ7+kwqNm7+zIXmr9+V6cYsvCVKIltU+Lj6SqK+k3QNn
X-Gm-Gg: AR+sD1035Wtvccy+glJ7NXoRyQndj/8uq0arHwG5Mvk7hfW9rDC35bUZqHukx0qajiY
	FEP+y4ODV6i6dCVomiZj13VdJRH5RO0KWa9IB1KbABJ5GcYMs74pjy9Ya+fX16L7WjrUhOOHsrF
	7LhMD6mMW5ABBoCfq5zhe5z0qWxrWIgSkDgX/S8q4dj6f5FaytLqoVQpQOW/6aKlG/NFGBWT3GD
	TDR8oZ21KLuAsqJN1WiAOgyBfCu+Ba+LpK01ysrYpvjJGGnJgHFg/qKYIo36U2njU3XkhJhubWF
	tQECPSWGUnr6ChaZOofeleq1HEFq0oForVU6XYShH01K3nxKZrq/k7Evj+2uchO4X4XdcjBTANf
	Yd+NZGSBEGaAnuvheydUFySkPQIXheCKALvYvzQ42q0pwyl5OtNnt2xLcqKAranvzJHITMyU8vo
	gDpnpCf3hR0oMpySdQ/6+brPnBqhDLR/2rsgRrgldILttRS7h8oTpVZZ4STvCIaX10uR9naGnMT
	ZRC
X-Received: by 2002:a17:902:f64c:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2d035ce5f7cmr42775525ad.34.1785447045138;
        Thu, 30 Jul 2026 14:30:45 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d2ec2asm28584728eec.21.2026.07.30.14.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 14:30:43 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 30 Jul 2026 18:29:59 -0300
Subject: [hwmon-next PATCH v5 4/4] hwmon: (adt7470) Add thermal zone sensor
 support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-adt7470_thermalzone-v5-4-42995a6bb8c5@gmail.com>
References: <20260730-adt7470_thermalzone-v5-0-42995a6bb8c5@gmail.com>
In-Reply-To: <20260730-adt7470_thermalzone-v5-0-42995a6bb8c5@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-pwm@vger.kernel.org
X-Mailer: b4 0.15.2

Register the ADT7470 temperature channels as thermal zone sensors.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index eeec3db0da88..f652532f2f32 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -1396,6 +1396,8 @@ static const struct hwmon_ops adt7470_hwmon_ops = {
 };
 
 static const struct hwmon_channel_info * const adt7470_info[] = {
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,

-- 
2.55.0

