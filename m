Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25DD437112
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 19:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785742; cv=none; b=Yrvzufkz0cpW+yUxhm7gjNVq4IEvfmaLn40y9//IXKLcdLnFswAR/Uhwf/h/j1ISOEvW+Dhq8s1k4mYW3Ek7nGmExwkNGaeGFf7IZqvXRDlt6dT3Wt/qKiTgYxEBewpxc9phrhdeGqisGCm2DLco+Uvuo1lWyzvGPuwAxK0+Yyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785742; c=relaxed/simple;
	bh=B29Q0ejb910DNphY13Q6NqZLhMXGlrJhh4yIP/F7gDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LdudpST5i2C6csU0Zu5FR+HdvXIfxUuAeyKEz+VV+++3OSmss6vLFvr9xbIqIbAbUoPZsSVRbk/1ZxA3WTr24dE2krnMQMGRGT2LOxxRqDlZqzcWQgx2MBpJ0pGonbNPP/ZTphYzQgsHMrrTC3+9V0cVY4z3iCfbFVmCsXk9qTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJA4IxHd; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJA4IxHd"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso4066267b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 12:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785785740; x=1786390540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HrUGwzkTg55w0fDoyOUtyzfWYtH5Q46yiHGHQRi01EQ=;
        b=iJA4IxHd98X3q8wp4tvXQtKDCMXkftWD4zusnJPpF+xSUdkq2VRrezsv0XkvcU/W9x
         QUh1kuvqYQpAhH78ojjMhaz6Z+iiF/f/2E6SrLsy8QNwb+zEyyI4ODjEcsT6oaK+77zO
         LmvP5+Rdk/yPAmZ/lINYF6l7hc+gpp0FLpM9W3B5IA9Itl9P2r3LqS/9C+5cHnV7yK/k
         HQMAXwBw7y2btShpDVrDjL4TRHp+paIBMAO9d32rZQmMddb14fn4IAwULxVPSEzA4jcC
         wVATLgjNg6pFZVv5XRyFyWG98pfiyT0hHeFGp4QUAGvmXE6ZgrpRHyi2A3LYqrvst6Nw
         cKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785740; x=1786390540;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HrUGwzkTg55w0fDoyOUtyzfWYtH5Q46yiHGHQRi01EQ=;
        b=X4k8dAbIFkvqjPHfw6iKuGbwIQ846uFnN/s5QwnxIQKe7vbT9lzYMDoOJ+nmRj4Mgo
         3VEcI5tUuv0EKI06navDTwJU+3nxT9YLMnAd7kqAOMy+1Pq61VpnLHUsDchkzi9/rTve
         hmD8H6q+ntvV9m4ggOrgUytTmreTfvNZclGBIMoTCTDSShEe5m78I2y/aVAeOGOVyIxW
         3YmsN0GkRktViWCwJIIktt6t+2h9P05J9NBSoEQQt0c1ZCQGhVnjhUCTvhTjmpFz9FkT
         3XWC2e14IhmDe7agOnJHcJengsS2L6AoAOxZ/yLJP9mxnd4qF+iBkwupUVgrZrTMlOoh
         Xodw==
X-Gm-Message-State: AOJu0Yzkf3ia3mJYlz2dhqwaGN9Hn0qI9MZ7Q1KLvcxlXIXe/7gOxtfr
	vf8KOdZpv3MezPpYMB4bpGZxjuRjqeg754n0MfYQdmicReUcthDUd7qvN+puJg==
X-Gm-Gg: AR+sD13/AlN9YkZ9LEsucHoLrQRm/iHB6EgKhASxZkDkCyyiovQlgJfZTEXNNFvnqjQ
	OhLDiQoBU18+urn+CdWj70MmcWKvJoNqUUyhhnNuzQz55bRQ2Nfg2tzsEExmKsqAhnaIpN9KTO9
	wgPE9MLuPvTZfIS0Y5Zw/jSulWWZn4m2emiHnUIlh/wxmyzlnVgOE8/SGY2Cd2hU3k2Idm7oD66
	GYO9Je23zu6Nk1i+w941itFKuHBwv9VzyzIP9aKKLDhbZIxUGmo3zGqKEBQnLenoKVjk4Mx7lxO
	c2zi0b3gezK0DQzMI+e8CSqeCoAR8k5SXFYoqc28M5Ty38XGU/F1sIwwJnMtxHNLioOfP2+ghfY
	sAgLeo97a8+C1hqRyVmmC5u+Xqkv0HgDTLTbhZsIfMJAaqHTGl5OZeOlFdWbBIb0+Zc8vyOwz05
	38nJQ1m/fejRBDvOFRcnF87dIZ9S4lNhMMQNSarQgWMTAPB7bm+qmP/Z+mo9q7JFK37saAhecQi
	DcWkht/R9Kv
X-Received: by 2002:a05:6a00:4f81:b0:848:2f84:f42c with SMTP id d2e1a72fcca58-84ee49c3d11mr9858648b3a.69.1785785740012;
        Mon, 03 Aug 2026 12:35:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe3963dc08sm4019208a12.6.2026.08.03.12.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:35:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/5] hwmon: (pmbus/core) Introduce and use pmbus_read_smbus_i2c_block_data()
Date: Mon,  3 Aug 2026 12:35:30 -0700
Message-ID: <20260803193535.2286578-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PMBus drivers need support for reading SMBus block data. Unfortunately,
not all i2C controllers support this command.

Implement pmbus_read_smbus_i2c_block_data() which first tries to use
i2c_smbus_read_block_data(). If not supported, try to emulate it by calling
i2c_smbus_read_i2c_block_data(). Export the new function for use in PMBus
drivers, and use it in affected drivers.

----------------------------------------------------------------
Guenter Roeck (5):
      hwmon: (pmbus/core) Introduce pmbus_read_smbus_i2c_block_data()
      hwmon: (pmbus/adm1275) Use pmbus_read_smbus_i2c_block_data for block commands
      hwmon: (pmbus/ltc2978) Use pmbus_read_smbus_i2c_block_data for block commands
      hwmon: (pmbus/max20830) Use pmbus_read_smbus_i2c_block_data for block commands
      hwmon: (pmbus/ir36021) Use pmbus_read_smbus_i2c_block_data for block commands

 drivers/hwmon/pmbus/adm1275.c    |   9 +---
 drivers/hwmon/pmbus/ir36021.c    |  22 +++------
 drivers/hwmon/pmbus/ltc2978.c    |  21 ++++----
 drivers/hwmon/pmbus/max20830.c   |  34 ++-----------
 drivers/hwmon/pmbus/pmbus.h      |   1 +
 drivers/hwmon/pmbus/pmbus_core.c | 102 ++++++++++++++++++++++++++++++++++++---
 6 files changed, 117 insertions(+), 72 deletions(-)
