Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753464;
	b=nAlcSsCvC3bLRrlKwf6zSCM2llSRo3aKO5W4COpGnaBtdqrNJWPsRPJKVZlwqASASB2a
	 mekQZq5bvv1Yaywzxuy9/Ax6VVJkOJgiREaubQa3AK0BMFHJPHrju+Zdu9AMgaiSDuQ6d
	 GU8P/PQglJELXlxnLPzW6sbVzKf6RhgtP6+Z9iSlrYqDmt3W+/Q0jGoJGXo+JPyFm4Rlo
	 y533Py7HfeZn/h70eKzWlt1eYkAXkJbIUidewW68QQp6wn2zd4kmAYmnIYG4nY35gnLEp
	 SWuA9nhIolCUUr9duHiOVBjR4wCyDmiMtIXq5UcA5LK/tfl270Td4st/YgJoJqSGLcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LZrrte1o5NSIPT2kPnWiRAF/yUTjYoJq4hLlMOko4J0=;
	b=q1N488U06LY5kUho/9F/oOSjyUaHXXaSqqV5Cl1PtEwlmeChBJPFj6ztMByIISxflmy2
	 pnECQgKW6ZsSR2Ez3/gI5oJ3D+OLBschaJDw1DgNjtp/0LQLpTu1sElFcEBPFQHorqu1v
	 7uqieaVIMXHFQvBHs2WueLZqS7aLnMfp24NAF6X8jL+saEsSMxoZV/5ItbQXFWA8+ug7U
	 Q560BBUrDxDbqcIZeYRmZ6xcc2Z6HRngOTEI34LqtwFpTLy6VuSFjsKmumNcfSRDdLl0+
	 maXCfd2AaYRnYCRhctqaAv2kamdS0CB/SOq8K92A4UP7IylJqO/0uvuhqPsvKs4gTBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JIGObF5+;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F494606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 14:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F494606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JIGObF5+
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d05d51553so13433845e9.2
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 06:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794753462; x=1795358262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZrrte1o5NSIPT2kPnWiRAF/yUTjYoJq4hLlMOko4J0=;
        b=JIGObF5+n9z2rF2DAEPIH2wEAG3uYTfbAus5HXg0lWmaFmYAMCO4Q4uM0BUtPHeg4A
         GPyH/Dr0LX9Cj/EkDbK7Slo/ruNLFYLk+ahuPHjUnLKBw0jjG7Z1njYWhFvhBj9UihxN
         UICSUPnKvcHJ4+4lSH0rEhuQK8PCcjMpwmCDjtumC/7XZY5PWWkA/gAb8v9nKkSbxrV/
         Y9ThN/v4ygArVzLZAXb3YM7BxUVKfigR84V8gBR45JeqbTPR2CfifN2+sENM0bcHdFtM
         lj61zu7W35zudlmbCik3sb15ddV3QrjhbaumMuJP4SWZ2/FHSVE/m0/Qf+yUjxTHpyeM
         Qc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794753462; x=1795358262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZrrte1o5NSIPT2kPnWiRAF/yUTjYoJq4hLlMOko4J0=;
        b=f7IuF2Lc8uBr1Wok5KzdOPa0fPBJVkF5L6w8g/lscXlkB7Whr+dl8g/CpEE7x7bDd1
         jklKWhw6fuhVfkRRJ/pfpomADQJknI9Y9lGA1SW2Ara1PeOhYcqxRyJPEGe9BoAh9tdU
         JyOtsPcaY11Dl4JAkbOs0u2+bZd+pQz3a8sdviodRRqgFezDT8hXSIhX2Ye5jlExOgZA
         rT1Inz2NvPUYCRnDxDRZwOxdb42N06I4wK3UPRluGIAYyJZw1wWQWbV+wQ815DKnL6Qe
         V5Qj/lk/upVpwAWRYEeZiWmJrMtCdGgzJM12FJmDs6t6bTFfYSoNHvIfZL2GlNON5zec
         QPmg==
X-Forwarded-Encrypted: i=1; AL+hErFoIZqBjzpLPiCidCPdjgkfzLzrzyRGBKeTfXg409kSM/ut2MmADg+rXQ3mFInjyoBP9e1KpY64olN5pA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8bG6NaW+m8r8nCZXnHEVLGd8U11z7wId46vlLA7rVvirQecmjV
	VMJXETQWqaeRfjGo2lRkwefntlt4+VWTzCKAEqSAjcC1/e8f1KxCfnW4MixbDzFvkSxPyQ==
X-Gm-Gg: AYBFou3z8rJS3tNU2upN4u3BGWwyBmTCS8iowbD6kWEcqCENN/vUXZjrH5bpKicRL/l
	GFgkakkpbgQEc1R81t0gYSFOcZzISUL9/4uF67G+GOgA4xrmgiY829T40ukCXUTsHFjFB+ZHqMT
	9zJ+YeQiYdlF2k0VTYlwa6sn/AuEjrDkrqDmaukdgPlIn2bGrhUnw/+jRh5zs4xYuEbC/3WcbOp
	d6Ml5GeQRcbVoceJ+2CYBEimeHLFBQ9pNdzvvxveKLddh4RGKCKYNGVadb5seis5LWg2wr/Nlcp
	kozwtXB+Plj/ethyFv/mbGb0wlTdbpv+oo6wcWroOtKLtz4ctFRk0hT7F0whQuDsX597XR9/XDt
	7cqhHh6rRUmyiwL3cHY3jPhhFNXDzKBKRmkCyc27068//UZe9KK/0T/zqXUvjTgRLwtm5aUuvme
	7R14qz9IOjwv74Z1E4L6y6L6BSz7yFXtdxXhSP+1RSPAWOLD/xHo53M32SMcs/CEj7cVpbutfE4
	RrFz4S6evoqLM9+pTKT9YgxWqjFAN9EgINDsslkY+HjtUR2H8iqKo+3rZOv904b5/XLFhE9DNx5
	LM485x6OEjBR0ZCr3x4xjxTElOCgmaiqYYdlRK0Ffjh6S/zPzvif+XRy1J5kJ2fSPVZnryx9moN
	LOrf77sdF2WGWGBY=
X-Received: by 2002:a05:600c:6092:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb55a44be7mr159448425e9.8.1794753460960;
        Sun, 15 Nov 2026 06:37:40 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm196174025e9.4.2026.11.15.06.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:37:39 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] hwmon: add three more board models
Date: Sun, 15 Nov 2026 15:25:37 +0100
Message-ID: <20261115143708.492883-1-eugene.shalygin@gmail.com>
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
Content-Transfer-Encoding: 8bit

Add three boars, submitted by users via GitHub repo.

Eugene Shalygin (1):
  hwmon: (asus-ec-sensors) add ROG CROSSHAIR X870E DARK HERO

John Roden (1):
  hwmon: (asus-ec-sensors) add ROG STRIX X670E-F GAMING WIFI

Kostiantyn Korn (1):
  hwmon: (asus-ec-sensors) Add support for PRIME Z590-A

 Documentation/hwmon/asus_ec_sensors.rst |  3 +++
 drivers/hwmon/asus-ec-sensors.c         | 34 +++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

-- 
2.56.1

