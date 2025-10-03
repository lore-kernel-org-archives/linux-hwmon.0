Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5426324C692
	for <linux-hwmon@vger.kernel.org>; Fri,  3 Oct 2025 08:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759479010; cv=none; b=ZmTI3F/ng9YptqcD6A2e4vRDRifK0t1FTxc9PxdoqV2cGNPGfQIKr2o17pt7xb/RTb6wIet2qLdQGtMvAr7CSvKw2ONG48HephZ24pgjavIf7unI2UbcCEm3pelwsjVtyHXIujGaHfw1IVIP6qM9XPoYF3JgljdWcYD501hJeHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759479010; c=relaxed/simple;
	bh=FzgDnW0LHkuoqjWLgilY6g+m63WHYz7SU/ljq6issTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bR6QkYzqXpTHu7XujR6zZ/sl8hN+OUpAN5qi0uI3iDEHwFStzt1akXA4QGKTw8eeKE7DN4V0RgpE/5/JTqXD4x9DRaMZB0SXskrsdgbtalacXNGPZPoaNcDYTDOMOfWxN5aVPGq5/CmZvo6T9b089DmxHk24k/xU27zKllon9y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/tNuh+z; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/tNuh+z"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-631787faf35so3864769a12.3
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Oct 2025 01:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759479007; x=1760083807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HEZw1xZN8Gwz84nw3aSSSOJI7RYFRhNHk+gh+sXEEnk=;
        b=e/tNuh+zsDEAlX6VcApxZnX2nGROEwZmiXTgoGJ8MmyHM158Wzl6IWPyec/OEycfXU
         vYpDdAEkAdDhnychZVxgog7e9Z8HibCv3cWXKc7tpVZ+orVL8r/mz3Slk1kjSe842tpF
         Av/1r9wUH5z0uzNl8SBbb1PWgIYTBUuAk6x7Zlll8FrkemyQoFX0K2Mpv9QX7dcG9/JJ
         EL4Z8NK+x41YBfbV5FVxwtkC6+PBCvpOb0Ugf8YpzYP6zrWZI9+RpnGBDLR7XHKKBUiE
         C5+/WVfgd3OqHw9PHozZOAn/PCuIWjJLqQab62zLZPp5fkljy4AXDLcqUvKV2GMCRtm9
         JdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759479007; x=1760083807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEZw1xZN8Gwz84nw3aSSSOJI7RYFRhNHk+gh+sXEEnk=;
        b=cdiWdSTL5KHROZM+3H1A4CLwGA6CI1gKfb7yniCeErgycmAlIGx7FacQVbtsZ9946U
         +Kck/D6jsoIgXdWIl5r8FHalFC0BBjijFtaolNHyZ+I2bGBAuPcJf8i4EmzFEomxFibr
         MwGKqSbqa5uvw7zOv1SdKGPvDP/6kl7h4sU/ybyBj/Q0wNVXQ9Wrv2PnvqnkTyA6gea9
         BeORjDIc+CFld470mKG2pSbc6vRFgb2RK7+yhi0wHJiry4VtVv5U9YslsZxy5a/LGfwz
         ewE0n/tu8SMj6IQLtK3haIVzd1xgFrVgE2Ya8kJ18Zl6QFbnGfCFGisvd8MnVAxnqci8
         WvRw==
X-Forwarded-Encrypted: i=1; AJvYcCUAcDNmHrn1ROOUrsbdFoNJvdVsmkS0zbu7hCGOUTiNGceWlUAhYlnz8dsPvvLcr+nWp3oH9O3EZLsO9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqYaTuROqUbTaCi698HEBGMYDpIpwXcJFBy0o/nyLhK4I4qs13
	J33cH28IsAMof7eKlbYxTREgxq+BrAStgjnbRI6ig75TR3y8NvQLMopU
X-Gm-Gg: ASbGncuGyR20nolr8EI3GxQPL13nZycn90M3ylg5z5lDRZ8ZHN/BOFFxgippFLJCKMt
	CekNAKVIIjP3f3JwOnwfOl/L27J1g1zZqQjtHNbIv2FtgZHx3qvOOPkBiEzUO1A3ojqjRy7AdJt
	4XW4dJ/VDJTmNxfHDNnsErHr0ZBxEUbJmWILr3gz7MQBmwi0MqSeo9LIeX/dkxX3+KDnMYjqE10
	6Szfbmq+T8gNgzwbY5k0lImLalz9TAXrdmDBYsDvI8t5HNda0RP5Ao5iCe9iyTsxr0PBMLaLkzT
	vCAiplV3GCv/T87EkCuXVjk8+7OFSGtT5jC2HIYVCga9WBHf54E9M3HZS48RDGQa5ONk65eezQv
	3nWPRMJRMS5GPaRDlnZtrBbjY9jlqo++EOLDbtu+ZNw1qskaUTQ+U1k1x/u6B3k/DaR3Qek4ecm
	KK/g==
X-Google-Smtp-Source: AGHT+IFPgJfqYIt3xEwZNIT1Msc5qVT7rxz+HOc3PPade29V+DzSAFRYs26WIggmAMRkNOXQP5q9JA==
X-Received: by 2002:a05:6402:2110:b0:637:e2b8:605b with SMTP id 4fb4d7f45d1cf-639346c7b36mr1995788a12.5.1759479007333;
        Fri, 03 Oct 2025 01:10:07 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b3ea:9c00:26e7:b56a:5a2d:1d72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637ef848199sm1990301a12.21.2025.10.03.01.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 01:10:06 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] (asus-ec-sensors) add two more boards
Date: Fri,  3 Oct 2025 10:07:55 +0200
Message-ID: <20251003081002.1013313-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches add two more boards, Pro WS TRX50-SAGE WIFI
and ROG STRIX X870E-H GAMING WIFI7.

Maximilian Luz (1):
  hwmon: (asus-ec-sensors) add ROG STRIX X870E-H GAMING WIFI7

Paul Heneghan (1):
  hwmon: (asus-ec-sensors) add Pro WS TRX50-SAGE WIFI

 Documentation/hwmon/asus_ec_sensors.rst |  2 ++
 drivers/hwmon/asus-ec-sensors.c         | 32 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

-- 
2.51.0

