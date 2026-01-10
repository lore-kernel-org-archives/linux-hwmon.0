Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BE71DFD8B
	for <linux-hwmon@vger.kernel.org>; Sat, 10 Jan 2026 01:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768008251; cv=none; b=bQFEImvqPHiio9kVcdFjGdh55VYNY7lyyEsp26RYLqjYRIdoMjuMkRlfCNkk/SfGtP5CzthYm3pT0WFse9K9az8zcfVjv0euUkmKLiQ9BjDxfaVAqVV4ejeGbggctCPZAwovQ5yOhTpo3t9HsvmDHxoB7umb+w9NNEIzupFxi68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768008251; c=relaxed/simple;
	bh=0HZUy3Efrzltz8zOWDsnq4KxDebU+Evn00ngo3qLrhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hOkUVsCKOfXmHLmT4fAQsrCCrpzxbyrL1GREiY/LftjxcgBjK4cStd2CuzQOHN8iVCxDb3f9dsjXm4F6kx9+76uYXRMmJeaY+gLWREJdko54I04ygID17Wvy4Yr6vLEUyj1EmsgEESBhBd6MO0hM9O9c80Q64kQzwp9oA4pIVpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=vEtk2/SR; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="vEtk2/SR"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so2703715f8f.0
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Jan 2026 17:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1768008247; x=1768613047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=48uhg1n8pZrtKH3QTAeljNenkTOpWB0A9Zn6lZHQKGU=;
        b=vEtk2/SR9EJw6RW2o/tInoJgFysralG4US038MFaBgU39w+dz8tq0RRZ9rP/YxwJLb
         6tvKiYCOHu9uT+MvZu+5BzOxRx2+22gK0TetSGfTMkGNwYRhQWbGsQ8YABCv8Dlf1vBU
         iyNItudgWkHKSMG72532f+dUjL5FIRqp3ec0RCqoJ/2FTFLLgLT8qvU2p/Y4G28aut0O
         WKHyRuAijbl+ghufKrcyJTyzlSgoljS+E2PAt6ZQkuTX7+fkcLnghzJn3hyIHsogAD61
         Tior868Q2RkOwz8lhvhqsePdpBnP4OxsQxIVjXLTA2s8AapqVVxH1gAqlhrIwRDI+mv5
         sZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768008247; x=1768613047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48uhg1n8pZrtKH3QTAeljNenkTOpWB0A9Zn6lZHQKGU=;
        b=sBB8sCAoPbixrlAyzSgoYit452g3qZ0rmvKDLCAmj1ss9z71ADR5ORYq6/AJdIGY4X
         eMVLmdvFkOUUj5jdue3JaN4OSMzY/mYi7nyCpdxEysJu2t63eh1OXboXcRm3v+7fKFz0
         eZApvsN/1cvnPRUXWIZ6/yM0GpSc3Qgkq1c7bukCxI+jk/aRWV8Xz9pPx1q0/5nGE6BG
         cte1+BfoNBb+GW+j3qZcrannzMjvOvWj+dH30zET9vJiIZoWLtpKPTL/2D1UmbHBCohS
         ijMiyk9JOw0RcKL6nO4hTmMdv1PQSYdcS4g3QQdc8M6MoqHEN30oQ6UHy8PyPeAdMYf3
         A+Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUS6uxUaVjUa9DuPVXIxU3s2XZm9ASEfV3EaankLVjlfuDot3Ii+jwARMoNZZ4Dvr1lBjNsNjJNo16XXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVlzk890Nz4vajbr+i7rWUgjqWL1kyiBanSwD6pxxLv89+JuEE
	G88R+cBVqZmwOWWkop2jSXq3pxE8x7X5Zegmzycgq3jACNkj7pdN2Wub6fGJANAqmoOPcrqbx2U
	sg7o=
X-Gm-Gg: AY/fxX6lMXq6xo2kp4wFXCtpXB0cG0oynhqUbQmunegOGJUpByAqZ6nd3VVFd06lId+
	tL0GbQW8R3x0RSv1Pz+AYHfT9BJw0a0god0AqGd9rsUjdI/gYPhkmKF/3JWl0znRmS1a62YIcj4
	NAMA2PFGGkuJx7t4pQDP3dtUQLGKFSRXq7yJ1m8p2H36kSkuuho8CUQ1fswUja7hS2kl8kKVMZ2
	p58if1OO+7+NwOwz1Q4D2zHPDRk/Y8mHdcFrYlbXMJyxnL24iqZdMDhzBQh3CJjOtSR/1A4YcGK
	LemFDBuzNClXoOAG1ezZ3qqA3dEklqiWVVjVcpAJo6LmzPE02S4THuvIqHrWRTg+O2zQCmLRnia
	NMwIHcb1S87GcRPJgKWSU9wRlJlKjo6iJ3Kj+LGL/lt+6WXnlLODAa9ouXR03Df7A5d1kbINqDh
	pz5oT2/SAcw/jvr34srcpZDJ0GE71a
X-Google-Smtp-Source: AGHT+IHDX5cDjouWNQ8BhAyQtNk9/rlcuTAxcu2j1uBZGQ+Llnak0AzX+Fu4buxyM2LB8HGksdFUDA==
X-Received: by 2002:a5d:5850:0:b0:42f:bb08:d1f0 with SMTP id ffacd0b85a97d-432c3779051mr13533710f8f.60.1768008246967;
        Fri, 09 Jan 2026 17:24:06 -0800 (PST)
Received: from mac.net ([2001:861:8b92:2c50:6cf2:f0aa:7bc6:15fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee24esm25208007f8f.33.2026.01.09.17.24.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 09 Jan 2026 17:24:06 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH v3 0/5] hwmon: it87: prep for IT8613E support
Date: Sat, 10 Jan 2026 02:24:05 +0100
Message-ID: <20260110012405.47906-1-yahoo@perenite.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series ports IT8613E support from the out-of-tree it87 fork into
upstream in small steps. It first adds per-chip resource metadata and
new PWM temp map handling, then expands temp limits/offsets, adds
IT8613E detection, and finally the IT8613E configuration.

Tested on: IT8613E, MEDION B660H7-M20 BIOS motherboard.

Changes in v3:
- Send as a proper patch series (maintainer request).
- Fix smatch warning in show_pwm_temp_map() (IS_ERR check before use).
- PWM control fixes based on fork diff:
  - Use IT8613E PWM register table (and it8622 for future extension).
  - Clamp invalid PWM temp map values when reading.
  - Default new-tempmap PWM mapping to channel 0.

benoit.masson (5):
  hwmon: it87: describe per-chip temperature resources
  hwmon: it87: prepare for extended PWM temp maps
  hwmon: it87: expose additional temperature limits
  hwmon: it87: add IT8613E identification
  hwmon: it87: add IT8613E configuration

 Documentation/hwmon/it87.rst |   8 +
 drivers/hwmon/it87.c         | 336 +++++++++++++++++++++++++++++------
 2 files changed, 286 insertions(+), 58 deletions(-)

-- 
2.50.1 (Apple Git-155)
