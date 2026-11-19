Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046990;
	b=GpP++L7UNUprcTOe2yP6eykeQgr71Ku3cV8aZ4dFNLGzIwP/aiZCGXkVZTbAUe4GgJwO
	 UgvWo2NmwgE7D8Qdlkum8f9J2oANBXWO6Eyli7tRZEiI0J84Fj9qJOoTC0uSJws2HEcsu
	 o5VUrKa6V6IuYdgq29PCfKiye6yAUanODQsGvffAVnazLbkASeTzk9W6tlwA3O+xR47JV
	 pwhtCFdsx3ZkVHztTmhUzK3bAkOj/MqqaZ44BKnQ8dnvb6E6KyzhCsoRWr9c8rRNo/JR7
	 0CTx8qZzOtSeEimPEF58IUKlsbsCBj5R7q1ETs7P3FUC3Xp/EkNpVJyDKx5+yOq5jkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TzWdGjxwpb+Zzyy/9NnH7/G4pXIjsT4r2OhXz+T4/Sk=;
	b=qygiVqIf/HqciunoDPOetVPMae2R3iS0/+sG/jU3CVPLwYK/6/sKPHj6G752zcR0gKq0
	 v1ka/39hXamgy81lkQ7r93uD8zJ89GOP2FbgPTQgRqV0xFknU3f5sN1vgm5a9wMnfMFnc
	 NE/0vcathJE5i1aWIWHzmwuUdGzdy7h/AS61NnI4Yr3BsbTc/5UDwXtl7g4kzFK+dlgV3
	 8wl+EtLo+kxTsvBb5srhevUOfPNygbNQBY+CcYZD2uFq6c6qSsj7xXa8hi9WiZDhXHGyF
	 9trGP4c5yYCV9O8dXI9RmaugVOGrMVSuK/fOyI+Blaw4b3GA+IJv0Q0okzNhDPVYGvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kNoqXfBo;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABA4606A32F
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 00:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ABA4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kNoqXfBo
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67dabd38cdfso1920939d50.2
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 16:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795046988; x=1795651788; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TzWdGjxwpb+Zzyy/9NnH7/G4pXIjsT4r2OhXz+T4/Sk=;
        b=kNoqXfBo65MpIrB/oFrvmc8BqqMPxNb6PSV5GG4Xr6thXWCDu+DvA3c4lcs85+0AbE
         7kPJm5IzlXO428M2jnpPj4WasQIw0SZUM02gY2qHM+G6uB8KyP/dGhY+7+ASzHxKpe9R
         AOdD6S9AjAyP7+ZZjCdxoQQQJQ+wzy4kgj/F4hobhyDXawvMzdKArlm5hNFXsFGE2QYa
         Z8LfAybEVlkJP7Y03oE1jGmTgExBDO3Ji/KL/QC+bIN/gL2cKLL5Iu1JVRMDBlvnK/3y
         9C589FEEgFoXfhZgt5Tpno881chfVnxMSU604X2WUKwokDV7gIKNKrk29ADQElqySRY3
         Masw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046988; x=1795651788;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TzWdGjxwpb+Zzyy/9NnH7/G4pXIjsT4r2OhXz+T4/Sk=;
        b=zNPJtb7qQPqRYoXKjQIdnxNfKjqGL+CQhKRcyBVa5b6n2lGOS78ASf5m6hQFZY9GnW
         bOQ/rBnS0Td+y6YZXTz6mKriSf62uag6Su/Di2F2dPIT/P1KU8qoK12tWTFAs2IeUGLP
         dBX9b0ha4vAIEZT9hbbwAfqYMSmev24o4HY7BTpAkqHNUTP5/og0zkAlbMrpjwodkWRC
         HnJPAdJcmRHSXVk7TsNrQoWSLAL7lSxEgWEvmhBUgyQRZ5hYwk/2aeoCVGU6LIpdfalG
         CIzwluOixTd1aX1zCGshCTqlDVZ/8FxgbjYqIJMEU1L5GAod9uHIq1K21Tp1OU1AX9b4
         1+QA==
X-Forwarded-Encrypted: i=1; AL+hErESV/z5HDLmHfoOIPQuNzVHXV3CPb5KzfmJt4ZyfzKVitXfJ+LFHuaAfSxx4eaHCQYx1R2obyJJj78Lkw==@vger.kernel.org
X-Gm-Message-State: APuU4Z//gq3b4GddxccOK3y1UgztQu2CIdSoYiRhJadN3y2ceqLt4apP
	0P7HRJGasXWv+DFeUJopjjMF3EP4DOwfnXc5Qzh9wHPwoZ2kgS/aWSemynzj3BRV
X-Gm-Gg: AZFdTZf0Q918AyhlG0j9F1DvF8d4cuKCr1PpIUF0JR2jwIAcu88ZyfbrCBlCey7hmVR
	NAUIakKgwQen9nHUA5QO2rcdbThgTXLiVgCOz56BOWzl1jPNbGXl/bfjml3fEzg+xVS2LeQeOhp
	xQSLNOiXWtdESKv7w9yNQA6JCUiJ5M8pce1czEjIE9w5kckPzDv8Ls6S8tkGg4Bvfx6OS19yJRd
	ZojhyDGXUCSxgCG/y6uz2uBLw3k+f46I2TW/0O73kcNjUIUCAlms826qhNiaYUXsOqwX+oJvucm
	fU7ToifyMJ2ZzgZt/B3PoeTVRn9wpoagiu7nJocmWKKxdjuJ8ACrz2hZhWcOFTbMd5iGxK86VW9
	SEX+MK4zeznk/A4oyvqjKYC/npetTxR9/qb97HuFhUeCCeWAg2AgTDA2DZz/eAgrlnaHQh0RkhP
	EonhN9wxg95KudqRvzFvv0m9z+Gje3cH7xoce9rAZLfEilvmOtj272q9nOmGYpFjvuR1di4NO4y
	8xklw6FuCQx4p1MGYrCp4mOJ4LSh+BTv7AG8hkw26xmVDzJhvjNHUdEd3hwtkUELby5ypUSfYJM
	NTukzPHmIMV2dxsggaVLa9v4UmmjTawAtNM7iWDOeUCZWMmXSPowmxilOalq7awQummrZpARyi8
	d4Hc69eS4/WpEuPHNi6Qkw6CyOQzjvOkHmF75M+TZ6H4VHsl0E372/Nmx6V37Nof4KRq/E6q6j4
	dyKJE+45CwSxQRDPiQ0g==
X-Received: by 2002:a05:690e:440e:b0:679:a252:70e7 with SMTP id 956f58d0204a3-67dd3fa4b1bmr1190009d50.22.1795046988479;
        Wed, 18 Nov 2026 16:09:48 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd587fa60sm2479747d50.13.2026.11.18.16.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:09:47 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v4 0/7] alpha: marvel: environmental sensors
Date: Wed, 18 Nov 2026 19:09:45 -0500
Message-Id: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NSw6CMBSF4a2Qjq3pA1tw5D6Mg7ZcoIaHabHRE
 PZuixMwDk9yv//OyIOz4NE5m5GDYL0dhzjyQ4ZMq4YGsK3iRowwQSnNca9cgA7DEHBFWFEayYV
 WHEXwcFDb1xq73r7bP/UdzJQK6aK1fhrde/0WaLr7Gw4UE1yUhLMCci3hdGl6ZbujGXuUwoFtq
 dhRFinUguagGcia/lK+pXJHeaQEKsMlqSujyi1dluUDJpiCnCwBAAA=
X-Change-ID: 20261114-marvel-env-d0289c736ba3
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5576; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=1eg0SKmNL7HF3/ydPc7qgVPBNZmKTXoRn0Pn707Didc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+2Xklhuz5ICIiFrt0wt7aR1kGpazXqydlHJ2tJ8eqZ
 c4iXLG74yMLgxgXw0wxRZa49Yoss9p2LPU5Lf0LZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jOIhcnoMGpnFxaWpRbppBUUOefkliSWZ+XnFevkFqXkF6QV6aZlpJRkZ+UXFqUAj9PJSS0x
 dHd2MDA1MLB0tzJwsHE1NnJ2dDJ3cHB2dXZ2MLM1NDJwtHU1cLc0ZuDgFYK6JmMvwT99Q+csji2
 8dkevyFB+sOHBy6g/BT193b5kef/J2dO2O5X8ZGXZ0Xlr78u+kJ49lPVtP6zF5ZVzjaJ1jF/5df
 ONbzqPHWdkB
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors of the Marvel AlphaServers (GS1280, ES80, ES47)
monitor temperatures, fans, voltages and power supplies. Linux can't read
these sensors, and the events the firmware raises when one changes state
are printed only with CONFIG_VERBOSE_MCHECK, and then decoded wrongly.

Patches 1 and 2 fix the event reporting. Patch 3 adds the SRM callback
that refreshes the readings of one config tree node, patch 4 passes the
firmware's events to a notifier chain, and patch 5 registers a platform
device. Patch 6 is the hwmon driver, which polls, and patch 7 makes it
reread the sensors and notify userspace when the firmware reports an
event.

The hwmon patches depend on the alpha ones, so I'd suggest the whole
series go through the alpha tree with an ack from Guenter.

Tested on an ES47, where sensors(1) shows the temperatures, fans,
voltages and power supply status. Disconnecting AC from one of its two
power supplies raised a system event that set the supply's in_fault and
woke poll() and udev, and reconnecting it cleared the fault the same
way. No voltage is out of range, so the voltage alarms were checked by
forcing the warning and failure states in the console's packets.

I used Claude Code to help write this series: working out the packet
layout, drafting the code and changelogs, and checking the firmware
documentation. I reviewed and tested the result.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Changes in v4:
- 6/7: fix the empty-sensor check in probe, which still assumed a chip
  channel and rejected systems reporting one sensor type (Magnus, Sashiko).
- Collect Magnus's Reviewed-by on 1/7 and 3/7.
- Link to v3: https://patch.msgid.link/20261117-marvel-env-v3-0-0edc370fdca9@gmail.com

Changes in v3:
- alpha: put marvel_env_state() under CONFIG_VERBOSE_MCHECK in patch 1,
  so that patch builds on its own without it (Magnus)
- alpha: declare srmcons_callback_lock unconditionally and restore the
  SRM check in marvel_cfgtree_partial_update(), as in v1, which fixes
  the build of a Marvel kernel without SRM support (Magnus, Sashiko)
- hwmon: check the second walk of the config tree against the counts
  from the first (Magnus)
- hwmon: prefix every label with the cabinet and drawer if any unit is
  outside cabinet 0, drawer 0, as documented (Magnus)
- hwmon: drop the update_interval attribute and refresh a unit at most
  once every 10 seconds, since update_interval is for intervals
  programmed into the hardware (Guenter)
- Link to v2: https://patch.msgid.link/20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com

Changes in v2:
- hwmon: report the firmware's states by their documented meaning: a
  sensor's warning and failure states are its reading reaching the
  warning and failure limits, not a broken sensor (Guenter)
- hwmon: report power supplies as in channels with only a fault
  attribute instead of power alarms (Guenter)
- hwmon: depend on !ALPHA_LEGACY_START_ADDRESS for generic kernels,
  which leave out core_marvel.o (Sashiko)
- hwmon: drop the private mutex, rely on the hwmon core lock and take
  hwmon_lock() in the event work (Sashiko)
- hwmon: notify each alarm attribute whose value changed, and only those
  (Sashiko, Magnus)
- hwmon: report a voltage outside its limits as in_min_alarm and
  in_lcrit_alarm or in_max_alarm and in_crit_alarm, by comparing it with
  the nominal voltage in the console's packet (Guenter, Magnus)
- alpha: define CCB_CFGTREE in asm/console.h instead of the uapi header,
  since it is a Marvel console extension, and say it comes from Tru64
  (Magnus)
- hwmon: return -ENODATA from every alarm of a sensor that became unknown
- alpha: drop the unreachable SRM check from
  marvel_cfgtree_partial_update(), and move the GCT node type and
  subtype the driver uses to asm/gct.h
- Reorder: fix the event layout before printing it unconditionally, and
  put the alpha patches first
- Drop the Assisted-by trailers, describe tool use here instead (Guenter)
- Link to v1: https://patch.msgid.link/20261114-marvel-env-v1-0-890328e4b7e5@gmail.com

---
Matt Turner (7):
      alpha: marvel: fix the environmental subpacket layout
      alpha: marvel: report environmental events without VERBOSE_MCHECK
      alpha: marvel: refresh environmental readings through the console
      alpha: marvel: notify environmental events
      alpha: marvel: register a platform device for the environmental sensors
      hwmon: Add driver for Marvel AlphaServer environmental sensors
      hwmon: (marvel-env) Notify userspace of environmental events

 Documentation/hwmon/index.rst       |   1 +
 Documentation/hwmon/marvel-env.rst  |  73 ++++
 MAINTAINERS                         |   8 +
 arch/alpha/include/asm/console.h    |   5 +
 arch/alpha/include/asm/err_ev7.h    |  16 +-
 arch/alpha/include/asm/gct.h        |   2 +
 arch/alpha/include/asm/marvel_env.h |  17 +
 arch/alpha/kernel/core_marvel.c     |  59 ++++
 arch/alpha/kernel/err_marvel.c      |  39 ++-
 arch/alpha/kernel/proto.h           |   1 +
 arch/alpha/kernel/srmcons.c         |   3 +-
 arch/alpha/lib/callback_srm.S       |   1 +
 drivers/hwmon/Kconfig               |  12 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/marvel-env.c          | 678 ++++++++++++++++++++++++++++++++++++
 15 files changed, 897 insertions(+), 19 deletions(-)
---
base-commit: 0b4cadbe7c39d830dec35c4a2655483de0dae568
change-id: 20261114-marvel-env-d0289c736ba3

Best regards,
--  
Matt Turner <mattst88@gmail.com>

