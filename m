Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AA238D6B1
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jun 2026 11:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830453; cv=none; b=HQzF02o0rBzqwMF1u9GGkZon4Aoyys8prAHgtZvRqyhkBE29up9KAElBPa2SOFjSUoFcmZ0GvWUu+LPV7oSkW1Xa/Lu8Wc6bTugPuKTLHPEL3Bxy2WZM1HxZ5OLTUurNDwQSugv0ZVW6IkzdPDA39pzrgtSxABpIFJ3GjGsEwW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830453; c=relaxed/simple;
	bh=/509ma9uJjQImh7MAmr2vK4ZiNM3E3oHQUKMx6o/3qQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EJLcxa3ThdYtruRNd4ZWaVweW54n7gSHGjch0CHsPXOAiaQZHN+jH2Cjnl6H5AlvHdnBDairABP9ozuqiFRhFXE3AlrOTetlgYy+7rLv5ABERPUY+OjPk2bT8dWSqivWBOzewW2zSuVkcStw428+MUFTVFhkilnu5Hbh9uZ8n2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gn/9crz2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gn/9crz2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b9318997so24102465e9.2
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 04:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780830448; x=1781435248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zqaMDee4iIfK/VCno6YF52TUij0QQIt1FuKyUdUvXL8=;
        b=Gn/9crz2YL2GyMdeyutkIl/5NfAfsxOsrk7BkWkWNZvzygmUl7epa4JIVkvhh74pLI
         ANGCAkqFyrJeRoVjKVcHvMN/nEVyCsh0DIC1sb/jA8gt7ir5GGXkNEWbZoZ5qTLbgC5O
         z39xnINCmDK3DieY9+/YH1hrs0gvspz94Q6F8EHNmtgyZjswdFTB5NB8GbC5gD15IltR
         zPAuZaIZGYtAY4DIy3FeptVhCwNliTWOIU8b6IvNHQpPkf4RbfhULGJsUS9SLjjkwLXX
         Xd+dIQUQHPcu3zguzBF3Re0RoKO88a0+WlTbAn3cMo0C5lar2VPBhF0tKz1Nljd18lV4
         tb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780830448; x=1781435248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqaMDee4iIfK/VCno6YF52TUij0QQIt1FuKyUdUvXL8=;
        b=ZWy3JgcH+4S/QCOXthYFWJiE78uuivFmE5omSWlkU3jFhWkEG9PwvzhkGbt/2Xy+Cn
         qK4ZuMM7n+O+BXZ1xFoXo63KdIbwSP88HTCRJVJ4eDn2uW+d5kECmLb75kqD5yD+ue7I
         udl/G2Xr8orNRoMyIGjWmiKcjmooRUh0YIePmsjDjJ/3jVF/wJj6Oipyg0Weke6JvUjD
         aEtawv/VKHESw7TbpzXFPn4BGcAupMmMTZKnoe7RtI8BonPeMHfdo8o3+3xP4l8xZI7p
         cVpIUK4TfvCs3f3CJZ6zwpPhwiX5Dt+pVYjo6TeIMsLC72TLFDD4EoDKbAEY691qhWsP
         lAiA==
X-Forwarded-Encrypted: i=1; AFNElJ9VLsRHGCCwiDLt9W1HUhoFiQkCbyuEqWEmuTC6LAowxxOYDgwUBdTWjqnzyU02rbS5TLyFKkIEy4u03Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Gn7o1lHxZgVJLSXK6aIFZNeOTv8fZGdjNuQp9YSdSgucsmLh
	Ehstqlo+wuWsGEwDYOgaF9AWPnThSfWCXFxVZOGeiPGVneEBrsKr1eOh
X-Gm-Gg: Acq92OG3Gh7S6Zi4qrN1yUzJEXj2CeZvgYslLh315sXGE/p5kz+FP36R9CHm/wSiD6e
	zcjUK0/HPLlVtqjk4njv/MkvEuqz6FtjfJB9eo06FGdDfOoI0JASidFpu9l51SSPOeYGROi7duu
	0mBODIZsxN6P4osyQEOyr8LTAubPrUULG0qAs6e3hGrjAy1JiyUm9dAFg4vT5GeiywK8wOwvG1w
	ZtCzqYzI/qOdjehh0tAbCsNTdcU+PEKIyrscl8XGfLaXxpKV8CJwudGZMLTyQRlPlrrVexo75NQ
	OKL6DyAfag2J0WD54x7YXWpJgNDOC/Njye7qCcAqRXEaSvNLXvNmPlgEInL35Y9TXKRgHqrjfXX
	nk6WC3MdqwAvJnuYlh/EnoubLdI5KQrCByJiWxZlRn0DRaWWTnY6S8DYS7AOmKxqjbrks4PnnTO
	bnKl5RK+tKnmDdpsM55Dij5X5k+UQ5mzq+5Exo9eMdeV/C/99lS4C1Uothh9ZoDVM=
X-Received: by 2002:a05:600c:3f0e:b0:490:bb45:79ef with SMTP id 5b1f17b1804b1-490c2508a5emr209136175e9.0.1780830447648;
        Sun, 07 Jun 2026 04:07:27 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344558sm41711527f8f.18.2026.06.07.04.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:07:27 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 0/1] add ROG STRIX B650E-E GAMING WIFI
Date: Sun,  7 Jun 2026 13:06:09 +0200
Message-ID: <20260607110702.84599-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Version 1 of the patch contained a mistake, where the board definition
referred to a sensor, unavailable for its family. Veronika, the original
submitter, has not responded to clarification request. Another owner of
this board model took over and corrected the board definition, and the
result of that is submitted as version 2.

Veronika Kossmann (1):
  hwmon: (asus-ec-sensors) add ROG STRIX B650E-E GAMING WIFI

 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.54.0

