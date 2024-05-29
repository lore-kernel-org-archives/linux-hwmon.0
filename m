Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D7479F2
	for <linux-hwmon@vger.kernel.org>; Wed, 29 May 2024 18:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717005698; cv=none; b=ntmSzAz1ryuxrw2LjNpAG+upAZ3uv3NM1JnRMsDHfQJyB0+nSRVJJ3hLcf5NVbibunKny+A/NKrMugu+W662QSd6/zTE+sZvBg2REBMZikpO0U7n4f6rm6q2zl+UTJMHt8PvO6vESKYHHj5E+rTgfzb3m8sx84/8vnJYMngKt8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717005698; c=relaxed/simple;
	bh=nLmSGH7BeVayZL+22XxVIFe/GjXmKV7PpKbLPvUzjx8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LYidbhCg+JShSFmdPuejQUUWjYbZxDOHwWrJjXAg6D1RvTv18V2yyBBppugK8ZdIUzToqO1rZx92On30SHJ6l7ljAWD8UNP6kx298l26TQETIpu5k2LruTE299ZOM4+h5Gh70D3PQK2Ezsp2ojuTRJrueacD/FOaL0oyfiH+H0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jrbu8CYj; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jrbu8CYj"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2bff7b9503aso1798977a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 29 May 2024 11:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717005695; x=1717610495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nLmSGH7BeVayZL+22XxVIFe/GjXmKV7PpKbLPvUzjx8=;
        b=Jrbu8CYjKSqPkfrWuPR8sQCZX4Cs2u1vefEs8mD3MRA3qZfgdmdRFGf1jUGxxqSwyh
         uytC5Zeh93BvejQGppbDdWenk4cSL8ZkDtqbMtJmmSACSh+8mR+IHd7AY9y0EcMEg3JI
         6KMBoafKiGegxxrza4mr2mEK0dLoRojDrqNJOwpAq6QW5Mj+nezNqJXiGdno9dkd9nlz
         KrYN27pCnbZx9rNeetHx+7S6yIvUyQx5FBywXeOWL5j9mjcnc4elAYEBCoMp675peOX5
         c1/8pMl8uJesGZCKGMRZK04yDAxgExms0kntlbRje+gBhW7UozCbYfoK1JYHqWD6qhHR
         d69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717005695; x=1717610495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLmSGH7BeVayZL+22XxVIFe/GjXmKV7PpKbLPvUzjx8=;
        b=oKNJyZMhc+fDPHUOpLNsCdkFTztAspOBIOiDZrdl4zw7XJbwbC6HAQehpTEjkzrUn/
         mny4X9l16Wr8kzyKJI5+4VIOLNK8FDvs2tHfP8W3ySODj9EvxA7EySpE5cGItqvKYfaL
         Pvd89VigSwvqkv/KpMgIIjgXSht3bo35ePA4LM5Ha1pQbx9gL8a3H491unDyQAYN1q3S
         f9Cc0J0LK7bldmswx5bVPhB0q7hRU9gfNEylbe0CPBxr4xuwfJtHEiAauVsdh1dGTA+f
         v0W2uMx8X/YY+VFYsNwdEHQvio/WZAfI3j9kvktcdE6gPsCfyHlc0hBDfDKYi/i4xUW8
         utQQ==
X-Gm-Message-State: AOJu0Yzv2T66euyRP6BVL6T2MGtu5x4mC6go1Ueb3VFb/xZbIRsDC2Qv
	b4DoEBQUzlETTV6/Oy6SoJL4UnAPoVbe0fB2+YJQWquSbUBnEvNduiEcvg==
X-Google-Smtp-Source: AGHT+IEmCDbwHES18iNw97L9tgJv7RkMhOQRRIcM4CIyZqJUwActsXUUnrX6bF1WY83/+DtiyTPxJQ==
X-Received: by 2002:a17:90a:ad84:b0:2b5:340d:cfcc with SMTP id 98e67ed59e1d1-2bf5e18a5ccmr14495000a91.11.1717005695333;
        Wed, 29 May 2024 11:01:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a779d2a5sm62733a91.49.2024.05.29.11.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 11:01:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Radu Sabau <radu.sabau@analog.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/2] hwmon: Add PEC attribute support to hardware monitoring core
Date: Wed, 29 May 2024 11:01:30 -0700
Message-Id: <20240529180132.72350-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several hardware monitoring chips optionally support Packet Error Checking
(PEC). For some chips, PEC support can be enabled simply by setting
I2C_CLIENT_PEC in the i2c client data structure. Others require chip
specific code to enable or disable PEC support.

Introduce hwmon_chip_pec and HWMON_C_PEC to simplify adding configurable
PEC support for hardware monitoring drivers. A driver can set HWMON_C_PEC
in its chip information data to indicate PEC support. If a chip requires
chip specific code to enable or disable PEC support, the driver only needs
to implement support for the hwmon_chip_pec attribute to its write
function.

The hardware monitoring core does not depend on the I2C subsystem after
this change. However, the I2C subsystem needs to be reachable. This
requires a new HWMON dependency to ensure that HWMON can only be built
as module if I2C is built as module. This should not make a practical
difference.

The first patch of the series introduces PEC support to the harwdare
monitoring core. The second patch converts to lm90 driver to use the
new infrastructure.

Tested with ADM7421A using lm90 driver and Devantech USB-ISS.

---
