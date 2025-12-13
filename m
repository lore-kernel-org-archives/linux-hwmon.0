Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AC723BCF7
	for <linux-hwmon@vger.kernel.org>; Sat, 13 Dec 2025 20:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765656369; cv=none; b=YI5TmiEvUCv4fSSK5V3kRKB5AyD3EdlTcACFHomp/BhpPd3lQM3Tf7m1NrpMerhU8HkZcN+O4AcwrWoUE5gkT282AzlodgSaZfDXebL9MV2FYsiIrQsHHks5oXSW+NfL/Mi0g2DeopmjKYXh3NMyM30xHmHcdYUNSbAwBiz7ZnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765656369; c=relaxed/simple;
	bh=TwEi4W3Wz7CiB3xdylm+NGxwozA6GQtRNLp8+VyMOEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IDPB/f2tw7LQQjfNcm5p72M9oA063u/5X7FaHydMPY6vtC7N+Mo++1xo8tT/V5U6rVUAn+FrztjfM9uz7eo124d4bL413faAXDhlJxSxrtLr/xWUYPrHttrbpUTcn4bcNyWowj97EmcC19sm4B5jqOwW1Ohq6ZS5II4Cdcz9aJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4SvBWgw; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4SvBWgw"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b79d6a70fc8so397272466b.0
        for <linux-hwmon@vger.kernel.org>; Sat, 13 Dec 2025 12:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765656366; x=1766261166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHGFOsqkS31gTErFV/5m1vr2r3hQ0elcZNql1xhW9iI=;
        b=J4SvBWgw8msKHT3rwe4EXz5t59VE2anbWeqMcdceA1+SuGHl8F0nA7M8A6Sxr9lNT7
         KA0oKRS+rQ4StMMsHdVmcgjmXBiFcz1hwSGqY5rxXWWe1cp/Tbv0XYOC7E9w2ZzSbn3j
         CvD7RFza/8SvhtHXZOkG+K3DG1vBrBLK/QPNZr0U4klHhX0gw8wM3U2x/YDGkHn+gM+U
         NtgHiSrOm3sUWO1BBEkBE3M3udddU6yWRIA/369QRUzGc7JlvG/6g4XM8NIsI4YE0EjR
         x6T/UkQzuyO439AYkUzl9XfclpEwv+BhplzYnpBZUK44WAbeP1KokOA87shktae4Nd3T
         sN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765656366; x=1766261166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eHGFOsqkS31gTErFV/5m1vr2r3hQ0elcZNql1xhW9iI=;
        b=ZvIfhOqIT8ktYg6JE11w3x+EMyUY4+SjeAT5QxOICE4oryMn2ROOtVR2AYn8tRvfCr
         0FGr2n5LldayfWVubSrpzqy7uLRcAQu0uP46qObZEVp9tDKmYkNqhTT5aC/g1Yy7nWKe
         Z5i15feuv3N3iy/jhhhRg7iprsi6GYc6bBGO/hPr1T+vrINVQn+JMHyjCdMFJydfcr0m
         NrDYRWFsli1k7WSc61Cw+YH8VidZuwV2kzylds23nde0sBNr8S7i7GEnN5uwIEZaKW/6
         1e7f1A+o7MWLzglRPB5NX0Zp2wirnvE7buWNcY4DtLAm6qLQ/w6mwmTigJD4XYBHfT4O
         uW9w==
X-Forwarded-Encrypted: i=1; AJvYcCXzExzpi6UlJIr71BynWWylLJoMTY1VFN8kEZsUoW06f6mpMYivFv+D6cdozdSEJIKBG5GeHpjWu8Agrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0fcBC638QOUoSzS19SOVbZ1B8AW0KbAYLE4CsFtNwVWavf1nG
	Y4IvexIBzF5jbh1V4HTFCcmjetYGl9aljJN8jXS2V9i6fBtHDCetBzUS1DyK5gAjn9dLXg==
X-Gm-Gg: AY/fxX5EUYFXBOpIIKGHX4+7351jJFuadTGH3RLxdGpXBcPCgWU/E1/sfZZtItEXqtN
	MV7Ri726ZuUmu+qgezgM+7D0HRrYs+1QLFHO780w1X/kRzrz3GEQqfQ/yDgOribEar75y/hXZro
	P/aI1IngnVPCk6V/R4JpnbhLZt1F/gqHhf18lqgGK/dAoGqCYdnI4LsPCtyq0HOEWoXGrYtfXT+
	oiyzQ51h/a6AA48oTEZdnC0lHBHzdifBGgAwliSE7BNKBI+gBZK0yuM5y3YFPt5jeUi6LlRy0GF
	qRRoay4c2VlXuDNuH+1R0XOVyq2kBdYP8H13IKj//SUV73L15jD+Ojl1+8p9WAvtW9PM97G5OiE
	7lojQZuUyNt0uY3h2AtFky8JqfpkAR0AhTgw7xskWKaTfFbTAsN6ki2vNDAPfRpMGuaSI6hMQyV
	U+r+v5rBSa7r8p1A4cKBA3gGaKRg+eBTlN69SFIeih
X-Google-Smtp-Source: AGHT+IGaCgD8cV0fgaZFejpb/WaFYRCA11d59vWkf2LFb2rS+n2zbSBBFJpot8a2kmK4HpgIFrCgOw==
X-Received: by 2002:a17:907:d23:b0:b72:70ad:b8f0 with SMTP id a640c23a62f3a-b7d238bb66emr630797166b.36.1765656365499;
        Sat, 13 Dec 2025 12:06:05 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa517558sm919073466b.34.2025.12.13.12.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 12:06:05 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] (asus-ec-sensors) add two new boards
Date: Sat, 13 Dec 2025 21:03:41 +0100
Message-ID: <20251213200531.259435-2-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251213200531.259435-1-eugene.shalygin@gmail.com>
References: <20251213200531.259435-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for ROG MAXIMUS X HERO and Pro WS TRX50-SAGE WIFI A,
contributed by users.

Reis Holmes (1):
  hwmon: (asus-ec-sensors) add ROG MAXIMUS X HERO

Robert McIntyre (1):
  hwmon: (asus-ec-sensors) add Pro WS TRX50-SAGE WIFI A

 Documentation/hwmon/asus_ec_sensors.rst |  2 ++
 drivers/hwmon/asus-ec-sensors.c         | 12 ++++++++++++
 2 files changed, 14 insertions(+)

-- 
2.52.0

