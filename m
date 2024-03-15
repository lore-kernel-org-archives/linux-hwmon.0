Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE612562F
	for <linux-hwmon@vger.kernel.org>; Fri, 15 Mar 2024 15:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710515983; cv=none; b=P+U1xaD2zdUF7QepL5yl+ejWTr3aRsO2Er8Q/Cc/WJrbrCSOeIwqkB5Ft1zbW+//sHru09UATpuxvy0n20Im9qzZXr7GjmBNgSJJbCIk/c9/RIkAJ4vdFykFkctfaOUT0nbdli+8Kyk9xNgzSFcri9vYkpl+yZxB/Uu6mop7lB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710515983; c=relaxed/simple;
	bh=D1FotdFEhvOITNpiqBkRWWc6xYauYfDNlIc5q+z5oeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D+3/srVVpJURF+yrh+ehWcyPigux896zn4MhZfF4s0punFKrPzzq8XiUNdFel8NBRdfkSW/0X8mfhlVOzwwm/IUT4fJYcIlvL7bI1hk928Y5rHgovPJ9g4/lcd5Ry7XPnEv4oQ29SIacnKGDPZMv91YZ+5MhaSgsGk6Rk+XDfnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9vm7ZYh; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9vm7ZYh"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5131316693cso2896914e87.0
        for <linux-hwmon@vger.kernel.org>; Fri, 15 Mar 2024 08:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710515980; x=1711120780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/FAJ7jdkPv2iAvwDYT2xB1fzIlvFbRZxjevNVZv4Y0=;
        b=M9vm7ZYhg4Ly/xc6GIfi6yGg0GkJlRR7uUNgnd5QQzy9AzkVPJ9UAQ5r3F1/KBjPJD
         1/31qOx7f5Apq84K0Vi/rvQT8fPcY4IhWor3mJkNO/CHx/NWp3RNamlOkOYHXxaHtMoW
         AL9DBjdUxlb8FWLUxoj3DfYKlO/FlAXPLfFDlm3w2yVe0NB5o+vgADE92wcCetWi64I+
         RzUgj8s7m9dTimphGz1Xxu67jbSq1b7CCd7Fu6/B3eJWfObIBEpB8pQSl013Q1KlbDGX
         gMwHEFtgleZ2nfCRhCj3Y+QrBO6rAM1NviZyNdD8JRrNRgW+3s1WMNRtsADShY30BMlY
         s75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710515980; x=1711120780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/FAJ7jdkPv2iAvwDYT2xB1fzIlvFbRZxjevNVZv4Y0=;
        b=ZpCO+tqEuvuOxuV5n5fUmZ8sa0QvDvA2bV1kLYAYNsyFuZviWVseEA7hUymi93IIXA
         ZOQqg2qIKcOa2Sh1YQ+gv+VFkOETZQ6UqgtpLNvPwmVLMQVY1Igv93xUsojgl+reUoFl
         wjUSV4N86Z5JWAymHxvjRgvaxGPKCmjYmmK68katyVHLEThNaxwOi1ZJx2VyT/DODi9w
         fnxGE4kH9vTSe0k4CqVeI7XSJsksv9YWh9xqIXXwk13uiBNnzgyPBJ4ao5hugESFcqbP
         s1i3LN+ERrkqyEnxjIWHUohVcBLaayK/3wntYViKjXjr74NebJ9g+boVy3PxvXCOeRF/
         +Zfg==
X-Forwarded-Encrypted: i=1; AJvYcCVbYwHeMBsBaHZM9TcUCMNhaTVc3ih7LFjaIsIh+Rv8xFu2SrYZenWMEf5x7pENg58Hy/R5Qxd+FcdJLqnm+YBxHnFyZo/uLIlIp/c=
X-Gm-Message-State: AOJu0YzG2jfbyXK6j9eLtVJH9bjkZacA1elDnNKR6qp3LJVCfo7ByQxS
	GVnLyYQIUBqv/Spy1qX3DdSm15QadQmnbVnVgakkAeqEuxv86Srw/6WW3H6A
X-Google-Smtp-Source: AGHT+IGSyksTiYnDKfZESBGhMQbLKk+ZVuaX64Y96uar401DWV3p71W5EcKPNW2RAPJbICIiHeWStg==
X-Received: by 2002:a05:6512:284:b0:513:d4a7:bdbb with SMTP id j4-20020a056512028400b00513d4a7bdbbmr3142964lfp.33.1710515979946;
        Fri, 15 Mar 2024 08:19:39 -0700 (PDT)
Received: from lpm-pc.appeartv.lan (195-159-183-44.customer.powertech.no. [195.159.183.44])
        by smtp.gmail.com with ESMTPSA id x18-20020a056512131200b00513ccce5c04sm672914lfu.227.2024.03.15.08.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 08:19:39 -0700 (PDT)
From: Lars Petter Mostad <larspm@gmail.com>
X-Google-Original-From: Lars Petter Mostad <lars.petter.mostad@appear.net>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>
Subject: [PATCH 0/1] hwmon: (pmbus_core) Relative encoding of vout related commands
Date: Fri, 15 Mar 2024 16:18:54 +0100
Message-ID: <20240315151855.377627-1-lars.petter.mostad@appear.net>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PMBus 1.3 allows for relative encoding of voltages in certain output
voltage related commands. I'm starting this thread to ask if adding support
for this, either by me or someone else, is of interest. I have made an
initial attempt to add support that is adequate for my needs. I have
included the patch for discussion. I don't expect it to be accepted as is.

I'm working on the software for an ARM64 based board that uses the
TDK FS1412, which uses relative encoding. This is the only chip that uses
this feature that I have access to. I only have access to this chip on this
board, so I'm only able to test it on this architecture. I have to use the
kernel sources from NXPs LLDP project, which ATTOW is based on kernel
6.1.55. I'm not able to test on a newer kernel at the moment. The board is
fairly expensive, so I don't dare test setting voltages. I have only tested
monitoring voltages.

In relative mode, certain output voltage related commands (e.g.
VOUT_MARGIN_HIGH) are encoded relative to the nominal value (VOUT_COMMAND).
If e.g. the high margin is to be 10% above the nominal value,
VOUT_MARGIN_HIGH is set to 1.1. This factor is encoded the same way as
VOUT_COMMAND (i.e. as indicated by VOUT_MODE).

I have been a little unsure about how to best organize the changes.
Decoding the relative values requires access to the current value of
VOUT_COMMAND. I decided to handle it the same way exponent is handled.
I placed the relevant information next to exponent in pmbus_data.
vout_mode_relative is true if relative encoding is used, vout_command
stores what is believed to be the current VOUT_COMMAND. As exponent,
vout_mode_relative is set during decoding of VOUT_MODE in
pmbus_identify_common.

I decided to assume that VOUT_COMMAND is not changed outside the driver,
as this is also done for VOUT_MODE. VOUT_COMMAND is read and saved during
pmbus_init_common. It is also saved to vout_command during
pmbus_regulator_set_voltage.

pmbus_regulator_set_voltage usually clamps the requested voltage to be
between VOUT_MARGIN_LOW and VOUT_MARGIN_HIGH. This does not make sense in
relative mode, as the margins move with the requested voltage. This part is
skipped in relative mode.

pmbus_reg2data does the actual relative decoding. The pmbus_reg2data_*
functions return the register value multiplied by 1000, which in relative
mode means the permilleage of the nominal value. If we are in relative mode,
and the current register is one of the registers that can use relative
decoding, the permilleage value is multiplied with the stored vout_command.
Currently, the vout_command in pmbus_data is stored decoded, i.e. 1000x and
rounded to an integer. Better precision could be achieved if the
multiplication was done inside each pmbus_reg2data_*, before the rounding
to integer, but this would be a bit messier.

I welcome comments on wether this is of interest, and what is needed to
get it into an acceptable state!

Lars Petter Mostad (1):
  hwmon: (pmbus_core) Support relative encoding of vout related commands

 drivers/hwmon/pmbus/pmbus.c      |  2 +-
 drivers/hwmon/pmbus/pmbus_core.c | 85 +++++++++++++++++++++++++++-----
 2 files changed, 75 insertions(+), 12 deletions(-)


base-commit: 8debe3c1295ef36958dae77487eed9cf6584c008
-- 
2.44.0

