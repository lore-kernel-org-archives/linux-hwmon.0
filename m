Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ABE318EE2
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 04:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785300413; cv=none; b=p9B4jGFA/t7ZFNDEg2DRcpUE9sEtIJok6t8cGORjmM90pVX+RbP3i7EMsdelM+QosH6l7x9raqpL7od7ytoRlllfGIKkAOUeZ8JxZh8x/3MToIh0fa1SuTcdf5C90zEC9Y5xHaAyO75iHiXc51evEjIkpzZUtTDqGDsyclvcpvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785300413; c=relaxed/simple;
	bh=BX7QAOofmDbVSjrT426QK7z8VWDtDhzJkXrvBic/mw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iaQNEgi9AjmPMMzavomIIIFf3QQnZ5z8TmpEULwUh1S2EbdUOwJSp5gQTUXu3l0caCrw2uXPnAJf0sCejaaK2T41yb2Us3RWXW99NQdlbSPpr2hm/ZvJR7eGZpwqCk+JF4EMyPiubZhlzFKsuPINMz5gU2emMsebKBrxb7VxxIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RS6xcj8q; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RS6xcj8q"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9e7391839cso465785a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 21:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785300411; x=1785905211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hoekbLvx48+rjORuZnTpjcNVtRnI+7NWPDch8cj21zo=;
        b=RS6xcj8qUPY0vxZweaVWknoIEl96P9c74Tklzwk27Tp/2xioaoNs9r/oxzSvZxPy/O
         mwx2kabXC7UneuDcshB9ah70iQ5WjAMNaai85on/w5LoPelBSJousdpKk4O/XTHzo06v
         rBcE0AdiXU2+dWvgYU1aztBWcxEPqz31tslzSJQceVAZn8qmYNb4WCvPJnd9YE9nM9FE
         pFyHrTQNkHMXnSwgEbIrve10O1NNF3QJJByU7Ix26BZQvC4bstP+53TsZBbuHLXN694A
         jChe8e2MRsVemR4HeR1gNs/czou33sxBeA2zonafGZhpCTGH1gjMa2P7O5L0tY+Ebcod
         sR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785300411; x=1785905211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoekbLvx48+rjORuZnTpjcNVtRnI+7NWPDch8cj21zo=;
        b=LEluVNQimMsmc6iltVyZXMY9bMLjfyTWJ+DU4uwKpEj4ZdRTH0GLY+f4aJUJo/FV3l
         Mf7yX+dqmBZANGuX9g2LFr110y+pXy0UnVXUQZQuFFDq4MOygq+NlBkIcd0dXnhSWdAs
         OZyZiMz2BsMOd7iHKYfnDXzpLELeyPZTnPCivuNJaLXg5P+/5VuJbjd8KraY68rX4tGD
         odyDeuss/LiMrckZ2u8kWWPM+nFyuodIs6swrmyUtKqdZfwKODpStRXjoSAd0dHtPuQA
         vDyXNrTXPEUHWbRGQ7qgbXwy0G/jLzczj+svPGQ/LkVTR0tSsRIjaMVP9YNW8HwBk0cx
         M5qA==
X-Gm-Message-State: AOJu0YzJ91/DOOGN/N7TfrZ7tsSoVO5DpJKXdxXZTBpDsqkJ5HYGR6ig
	EESb8if84ooLiiIwkOCgI44N3Fq1OXD/MgkMrE01KP7z55yAE48tYtjW
X-Gm-Gg: AR+sD12E1P/beE64dVxw57CldQVD2pt4lKcIYopat8AINMIp8dm4Ser39K9KDGrnP8j
	vuKw8/30ik40NAMi94ax431CP+3nF3fvRWSZ6DAw0rCuc4uEvuC2/2xmAIQi02XlLOd2xMnUTnS
	GWZxRBpRoOY8ZVm3+rk3jUOvilGVoolcunTg8bCbIA1AH5LDplRSREYgTBpntDiX1qvC+hsSxLB
	GSfoJOZSah8UTj896TPjKruboySH6MldX5Fz4HRYa6QnHXPX6u16eS2UEzEvmjsrGLVPvqiYHXF
	J3tZO3YHLQdP+w4vFwewd6wykQGs+4FYCNdZuBS2TA5F+JGU8hk46ftjp0SRF0Xz34i33idrJLY
	BPEtbVyGJWxo9RGhm+S1YECRmL8y88/5hpqR9T67bBzxO5RMV04Pk+qexWZldoIF+Xks+e/Tkva
	2gs3muAdIBmX5H8jAtlhyG0PU2r9g7XRX9Ib+xVRlSB8VNUCnBAKq0JMZtFJ7gHu4X8kAsidsQQ
	ZIf
X-Received: by 2002:a05:6a21:6e8f:b0:3bf:6c08:2848 with SMTP id adf61e73a8af0-3c8ba613303mr6543287637.55.1785300411348;
        Tue, 28 Jul 2026 21:46:51 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b6d14bsm4730437eec.10.2026.07.28.21.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 21:46:50 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 29 Jul 2026 01:46:12 -0300
Subject: [hwmon-next PATCH v4 4/4] hwmon: (adt7470) Add thermal zone sensor
 support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-adt7470_thermalzone-v4-4-c14039dfa0e6@gmail.com>
References: <20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com>
In-Reply-To: <20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com>
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
index 883838fdcd7d..6cc246aa1285 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -1349,6 +1349,8 @@ static const struct hwmon_ops adt7470_hwmon_ops = {
 };
 
 static const struct hwmon_channel_info * const adt7470_info[] = {
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,

-- 
2.55.0

