Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB87353A92
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 23:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788132111; cv=none; b=mNLzkHCrd7UGSgsjLCMa+0q9x245em/ykFdt4tpSL1xH7hIB8MaSer8elCItdqmUkweow93jK1vUexTH3y7A8H5x/6YE2jzvQHMq5+ozgtzySZp1xJryJiDAyHDzypZOMMt5IZ280j+80Cun2KflcDLYvQlmVvkXbZLPGxHrxks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788132111; c=relaxed/simple;
	bh=bMuYoioqlMaVnr1r9my/Evzfgwz86VHeL6VgoFPM4wc=;
	h=Message-ID:Date:MIME-Version:From:Subject:Cc:To:Content-Type; b=cNVoCGxppHJz6QUk45INe3Xm2qoGh/c+4JcZ8CIYH2GVPRc5VOikyULE2rosQ046Rq06xA0+Kvu+9njFr3K4xHW+VZ/kS9cEWuW4+u9WXZrEgIJMPz3Bif/oUuyODTXNmsE1kfhu6iOsEG+4/kQXAtGvQqUBhbLKjV0XrjIYTgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p9WG6RoM; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p9WG6RoM"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-85377c8bc96so2540167b3a.3
        for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 16:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788132109; x=1788736909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:cc:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H+q+KZyXMCQhpGVKJhlVxkIhaCMPebupG3k+Zp6a/h4=;
        b=p9WG6RoMNSlc97bxjlCjmPrWXDzr1bO7NfEdXbuYUwq3aijwEI/T+gkg0WVm7HUj1Z
         A+qfHUAWfpZG8qwykiDHaN+tp7inXYLM+4vFjRem9BryIi6+pCctSH2CeIdvRsFcfT0u
         0A551K+F2ttaGebcID7vwTQ2Y7PR3PdYezrOEW+YnLgEDt2yBH3k5aWse0dCttnZfP2n
         ArgLJm3x99RrsOMnxpIb0LQRsZjwoB+R+4NQHzuFRpSReIkPVnhoAQ4zHf2kINrxwp/F
         ArWgWgHGi7k7JQaC7lr5GJBMKOb1BuIPZ+FehycyAzwVgOP76ZfenGyQCm2OyGp0XfOI
         RkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788132109; x=1788736909;
        h=content-transfer-encoding:content-type:to:cc:subject:from
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H+q+KZyXMCQhpGVKJhlVxkIhaCMPebupG3k+Zp6a/h4=;
        b=Lw/kaKtslOa+OZ/cB4gItMPVUvZGVRJgq6ze191eu8LWnDKN6AWYI2Z1z6teK8Z0wZ
         ozzCxQK4udfjFRUFoYqGZuL7F+WtZDnlNIu74GUv3RgcUyiY4PCD+U2CIOqATq3oxFxC
         jS53tzruMKs/MIzVB8aaidLHUHxByrsmT3Niph6+i3nUb1FzThimHiUpMbivAAhdclFO
         lv500PaWERaK+BWQLfaxeskcAnN7K14hCq3/5HSzOyMwKCjLtEm430Ou1iRQVSDHmBQj
         pw9k2G5yyeuLflm3Plb8CQs7TkmWNxbePLS7PKrgJEccH8YqkL9gCGJBOW2Zgh+CHrdR
         kdgQ==
X-Gm-Message-State: AFuF++ky1I8XxkP5r9enNZCB+VToI3tDp+K2M7E3ffBw2J9q7aJi4BLG
	3x86pXC3FkNcYAPgt+9Pn+VvBvYfeBI3Cmv/aREDUx4+pWjM0xvpo9XaOcAh2gMH+Hs=
X-Gm-Gg: AR+sD10GSXofLmn32uDZpKGVs5M9UK+ih0jg+Lv0MZG/vISRack3MdzceCzTO1juknE
	wQ5VY5ObrTZL/313AtmHLLCUCjEyHu5pqrETCoL5bwvgEcRTPO+n3xUPQLm1eynB5Vj/bp2/Uv6
	uUJ3arLjO5v/S8aNK4gfHTLx3H389dlIV/e/xTnQFAKk2xbJB5fP96ztz9++ZF4WLcpRCid+cHC
	Ri5F/MEl4HcSnfwJqM6vbiLaf9h2rG5iksCt3gd3cLtBsq46NR8pyxSJTFAziaMWsGYTukqn0f9
	XTklEeJrluYshCIdW1qTEdeHi9B94obcn97u5pzKir7OGvVtiNacvj9ccs8Yj+01AzjM+cXPJeD
	6IFqzAQPz8ENaZFempb8ui5YfwWvzFpud13wSZRT1Ryvu3Q156QSEV91aqEMEuGHC/t1WSNNkkT
	d63nTzA+JMM2kPRHqR0siUqh8/FKjFnz0V70acDx5hCkdWnCy/Xr2Nc3e7Qs3MYjdbTHc44fJEA
	g9jMQXli+4h+jT63MlBxscSJusR5D4pi+clGAkp9clvCZMKSdEZtzEr/lsALw==
X-Received: by 2002:a05:6a20:d043:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3d265e3f83fmr39934505637.4.1788132108907;
        Sun, 30 Aug 2026 16:21:48 -0700 (PDT)
Received: from [10.21.0.95] (wnpgmb0592w-ds02-161-177-131.dynamic.bellmts.net. [207.161.177.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f341dd18sm3193537a12.14.2026.08.30.16.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 16:21:48 -0700 (PDT)
Message-ID: <1a8ea9da-1ac1-4312-a8ca-ea4a9f35093f@gmail.com>
Date: Sun, 30 Aug 2026 18:21:46 -0500
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Content-Language: en-US
From: Matthew Bettencourt <matthew.bettencourt@gmail.com>
Subject: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
To: linux@roeck-us.net
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I believe I have identified a bug in the spd5118 driver's suspend/resume 
cycle where register MR11 (0x0B) becomes corrupted and set to 0x08 
during spd5118_suspend().

Upon system wake, MR11 remains set to 0x08. This persists across warm 
reboots, causing the motherboard BIOS and OS to incorrectly identify a 
32GB DIMM as only 2GB after a warm reboot. A complete cold power cycle 
clears MR11 back to 0x00, after which the system correctly detects the 
full 32GB capacity again. Blacklisting the spd5118 driver prevents the 
issue entirely.

To troubleshoot, I instrumented the spd5118 driver to log both the 
cached and physical values of MR11 before and after key function calls 
during suspend and resume. The corruption occurs during the 
regmap_update_bits() call (~lines 505–506):

regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG,
                    SPD5118_TS_DISABLE, SPD5118_TS_DISABLE);

--- System Information ---
System info:Motherboard: ASRock X870 Pro-A WiFi (UEFI v4.43)
CPU: AMD Ryzen 7 9800X3D
RAM: 64GB (2x32GB) G.Skill DDR5 (Part: F5-6400J3239G32G)
Kernel: 7.2.0-1-default (openSUSE Tumbleweed)
SMBus Controller: AMD PIIX4 (i2c-piix4 / bus i2c-12)

--- Testing and Logs ---
Logging captured via dmesg shows:
[  277.569950] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, 
ADD=a7, DAT0=00, DAT1=18
[  277.570507] [    T113] i2c i2c-12: Transaction (post): CNT=08, 
CMD=1a, ADD=a7, DAT0=00, DAT1=18
[  277.570594] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, 
ADD=a3, DAT0=00, DAT1=18
[  277.571150] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
CMD=1a, ADD=a3, DAT0=00, DAT1=18
[  277.571226] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, 
ADD=a7, DAT0=00, DAT1=18
[  277.572067] [    T113] i2c i2c-12: Transaction (post): CNT=08, 
CMD=0b, ADD=a7, DAT0=00, DAT1=18
[  277.572082] [    T113] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[  277.572142] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, 
ADD=a3, DAT0=00, DAT1=18
[  277.573073] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
CMD=0b, ADD=a3, DAT0=00, DAT1=18
[  277.573085] [   T3293] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[  277.573140] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, 
ADD=a7, DAT0=00, DAT1=18
[  277.574063] [    T113] i2c i2c-12: Transaction (post): CNT=08, 
CMD=0b, ADD=a7, DAT0=00, DAT1=18
[  277.574130] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, 
ADD=a3, DAT0=00, DAT1=18
[  277.575552] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
CMD=01, ADD=45, DAT0=ff, DAT1=18
[  277.575617] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, 
ADD=a7, DAT0=ff, DAT1=18
[  277.576169] [    T113] i2c i2c-12: Transaction (post): CNT=08, 
CMD=1a, ADD=a7, DAT0=00, DAT1=18
[  277.576237] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, 
ADD=a2, DAT0=f8, DAT1=18
[  277.577061] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
CMD=0b, ADD=a2, DAT0=f8, DAT1=18
[  277.577121] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, 
ADD=a7, DAT0=f8, DAT1=18
[  277.578063] [    T113] i2c i2c-12: Transaction (post): CNT=08, 
CMD=0b, ADD=a7, DAT0=00, DAT1=18
[  277.578127] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, 
ADD=a3, DAT0=00, DAT1=18
[  277.579062] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
CMD=1a, ADD=a3, DAT0=00, DAT1=18
[  277.579131] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, 
ADD=a6, DAT0=01, DAT1=18
[  277.579560] [    T113] i2c i2c-12: Transaction (post): CNT=08, 
CMD=1a, ADD=a6, DAT0=01, DAT1=18
[  277.579620] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, 
ADD=a3, DAT0=01, DAT1=18
[  277.580170] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
CMD=0b, ADD=a3, DAT0=08, DAT1=18
[  277.580234] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, 
ADD=a7, DAT0=08, DAT1=18
[  277.581061] [    T113] i2c i2c-12: Transaction (post): CNT=08, 
CMD=0b, ADD=a7, DAT0=00, DAT1=18
[  277.581072] [    T113] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[  277.581128] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, 
ADD=a2, DAT0=01, DAT1=18
[  277.581559] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
CMD=1a, ADD=a2, DAT0=01, DAT1=18
[  277.581626] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, 
ADD=a3, DAT0=01, DAT1=18
[  277.582236] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
CMD=0b, ADD=a3, DAT0=08, DAT1=18
[  277.582250] [   T3293] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x08


--- The logs that are of interest ---
[  277.573085] [   T3293] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
…
…
…
[  277.582250] [   T3293] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x08

I enabled i2c debugging as well in case it helps. The lines I focusing 
on are “PRE BIT UPDATE…” and “POST BIT UPDATE…”, immediately after 
regmap_update_bits() the physical bus value for MR11 shifts to 0x08 
while the regmap cache remains 0x00.

I looked through the history of spd5118 patches and bugs and noticed 
there has been some issues around suspend and sleep cycles. This might 
be a deeper issue than just the spd5118 driver.

Additional Notes:
- Intermittent Nature: The issue is intermittent and typically 
reproduces within ~10 sleep/resume cycles.

- Single DIMM Testing: I was unable to reproduce the issue with only 1 
DIMM installed after running over 30 sleep/resume cycles, though the 
intermittent nature makes it hard to rule out entirely.

- Hardware Health: Memory stability was verified with a varitey of 
memory tests with zero errors. Issue occurs with JEDEC and XMP profiles 
enabled


--- Steps to Reproduce ---
1. Boot system from cold boot. Load the spd5118 driver.
2. Put system to sleep
3. Wake system
4. Check value of MR11, if corrupted warm reboot go to step 7
6. Go to step 2, repeat
7. System now shows corrupted DIMM with a size of 2GB

--- My test spd5118_suspend function ---
static int spd5118_suspend(struct device *dev)
{
  struct spd5118_data *data = dev_get_drvdata(dev);
  struct regmap *regmap = data->regmap;
  u32 cache_val = 0, bus_val = 0;
  u32 regval;
  int err;

  err = regmap_read(regmap, SPD5118_REG_TEMP_CONFIG, &regval);
  if (err < 0)
  return err;


  /* 1. Read cached MR11 value from RAM */
  regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &cache_val);

  /* 2. Read physical MR11 value directly from I2C bus */
  regcache_cache_bypass(regmap, true);
  regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &bus_val);
  regcache_cache_bypass(regmap, false);

  /* 3. Output both on the exact same log line */
  dev_info(dev, "PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x%02x | 
Bus: 0x%02x\n", cache_val, bus_val);

  regcache_cache_bypass(regmap, true);
  regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG, SPD5118_TS_DISABLE,
  SPD5118_TS_DISABLE);
  regcache_cache_bypass(regmap, false);

  /* 1. Read cached MR11 value from RAM */
  regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &cache_val);

     /* 2. Read physical MR11 value directly from I2C bus */
     regcache_cache_bypass(regmap, true);
     regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &bus_val);
     regcache_cache_bypass(regmap, false);

     /* 3. Output both on the exact same log line */
     dev_info(dev, "POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 
0x%02x | Bus: 0x%02x\n", cache_val, bus_val);

     regcache_cache_only(regmap, true);
     regcache_mark_dirty(regmap);

     return 0;
}
