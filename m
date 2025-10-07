Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B556D2D97BA
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Oct 2025 11:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835880; cv=none; b=cLTrp+Zojvv8Ms+llsc5sT9sknmcwrILFyLWR+hYP+/7kS97OeZSSQIMYmFoUiI9VH4t+JgneRBA8FggNZylzp9ik96j0fS3alVJIN82ktOzr9yhIRAYsC5PORiGONNLQJGXZ4lbDcl8F8MT4AgH/NXnuj8rKnLxzJPbHRC93wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835880; c=relaxed/simple;
	bh=DV+93RqA20zYsiZVil2ilvoMWgypauFCp2tp4wJbtLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iMPGDOz6Hy5p1PB2gGCPL0riTwSaYA6IqeRy+biBBN6XDjuQjsPqfXvT0lHm2RdrPJMxn51B1+MWvTJgqUIGig2wpcEhec0qsD/HRjML46befMh2C7+dRo3H/yx/OZO6nwExRaB+phOYhqi4kIuaIslzYteuu+1Dr0vU6Rgo9Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUFUxkSq; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUFUxkSq"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b523fb676efso5172091a12.3
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Oct 2025 04:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835877; x=1760440677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yg5EzbqpAhrvR1YouHoLR93Qim7L8FFl5LtkM7LFT7g=;
        b=mUFUxkSqbSQEfXHlUsLbFkpFN8+XU8CW4GlZ37fbIHB6iLr8aVOdUYLI9SEiZu8WSd
         Y+AHyERc8kaO2WLCNKplotSNN+FhDTpsoallFUf5EY4PBQu+PRhsAWJQQoJBrt+XGhGx
         XTJAvzY2tJiVgoqUex9zRPKAeSOPdAKB1UZJaGfzm9l6PJMjFI8JORgRhBaXbUOC3PJZ
         8QqbtMVq4Wm0L24jVBf3qZjJ0dgCHuWsn8PHceYjKRsluLphzmkknXF3vzfLhlQd8yqR
         5KCNm77rTc8YhwuNuuVil1CPpzwGqH8msXiRC8lHbyM+THdujOjOYxYRMSKnlLDFvc97
         9JXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835877; x=1760440677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yg5EzbqpAhrvR1YouHoLR93Qim7L8FFl5LtkM7LFT7g=;
        b=eYjd2LxfM6UPOddvbGVDRgBoarT5Q6U+s+MnFNRPGcBEmDiDGnxj70i2w7JnnQw5h/
         L/kOd6xWZBbT/QjjE49ZXRqw15yJluvL3g4DWSyDnSSfyzIV7w3KBJK5R6Cz3hx18c70
         z6VGv4zGUgCMF0U7lbRhixX2T6lpYi/6P5SDNpZPHuLj0ZwFq9Pus+LVjXfiC/p9k/dA
         L5UeKkuTX1vvm6o6513YmNKzgeDdD2cqp937pv9YwhWWG8J1+vQAQwd0dpQN5PIyBH8l
         QIK4KOS94pjxEDd2AU+IZMU1AvS64SiSdrp6aQ9FSktDnaNIyT+AZa2pBYvXFINfa/hx
         BTZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOhHlUWL8lDFQ8J2usdRH7YBysTcJ8zfGwiZoaHBDn6B4YglBKbj43mnJlam8d5ZAvW5NgEjs7MXuJHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlKpJ23eQkEyrcKkyt2dkgYW/TE/xVUt6j6xNnJL/NeBRS0O0Z
	WnsB1eXgsjC0jzIbM7AiGCkCSqz2XqttdgCc8sT5q7tEfGfhebWsWrLu
X-Gm-Gg: ASbGncunVc9t2W593uiVcpD5pBOZ2v0pjuwgZlU3jtJHK9cCushPJzJMUv1kwCRq/o7
	DDOCGtueer5X354IX+jzIxPgbfvNy50rOpsQPqtvxTiCCpC8vIRF6OAdTCwGYMS5vMISnSZ25df
	oCDCoc+xWjFg+ZK3oomCG3uuKZbtftALVlo0vhBmdYxYQ8qHZR4HGLGhz6cAdjnr0uULR9ljmVm
	o8901qPxtRMg/1Rs71B/HJgSZWR8Drp/jqB01eme1AdAeO/ftZ+vnktNJD7e7QNIfVYmn5wMgZX
	q7aY2dlgWDcDoLGstgdHc3DEIjqESTyXQPiqh4typTL4rMHeZ1HBsLSwgzquZ7Y0f3liIojwtvw
	D6oKm+N6Qjv05nvtCoH3BPoLN2JxI5ICPJ4SjbxtlDq9KyEJJZkpb4EzCwv641ayv5RH8xij6hW
	YlVyboRw+NAbjBaBL5gchwsMFOzyHAOAUkpc2PR/gr/w==
X-Google-Smtp-Source: AGHT+IFRXYX/j0MXYIPWCiTWR10pwTbuC3G1F7eZBn2sHdq/jwsyEH4FFhVQSAeDU8eQ2ogOkSv1Jw==
X-Received: by 2002:a17:903:1103:b0:262:661d:eb1d with SMTP id d9443c01a7336-28e9a5cdcf2mr198695115ad.1.1759835876672;
        Tue, 07 Oct 2025 04:17:56 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:17:56 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:46 +1000
Subject: [PATCH v3 05/13] mfd: macsmc: add new __SMC_KEY macro
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-5-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=DV+93RqA20zYsiZVil2ilvoMWgypauFCp2tp4wJbtLo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3tcZkTMG3aVOZXVXxrFpwS+56WuPRU0ayerHnnf
 S/v287m11HKwiDGxSArpsiyoUnIY7YR281+kcq9MHNYmUCGMHBxCsBEwl0ZGf6qs+5+wnVo5xOL
 A7YzpstdY3508FK26vvLGpci7afbLF/P8D982frPV3QKvQ49zZfh5tEvMbh03DUz4Z/8M4mWRZv
 2XOEFAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 errors
out with 'case label does not reduce to an integer constant'. Introduce
a new __SMC_KEY macro that can be used instead.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/linux/mfd/macsmc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
index 6b13f01a8592..f6f80c33b5cf 100644
--- a/include/linux/mfd/macsmc.h
+++ b/include/linux/mfd/macsmc.h
@@ -41,6 +41,7 @@ typedef u32 smc_key;
  */
 #define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
 #define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) | (s)[3])
+#define __SMC_KEY(a, b, c, d) (((u32)(a) << 24) | ((u32)(b) << 16) | ((u32)(c) << 8) | ((u32)(d)))
 
 #define APPLE_SMC_READABLE BIT(7)
 #define APPLE_SMC_WRITABLE BIT(6)

-- 
2.51.0

