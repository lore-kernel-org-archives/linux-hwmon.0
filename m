Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117311;
	b=UGQ72YfzrzUr2i29NscWhlIf88NpPOLOW6xIeK10SatVew5eVYwhbNqh840IgfMs+dFO
	 Fsj58ZNbFHoBk9Cca8N8GhLZBs+bZbN0qcvABiVwhGflcTwIjT7CU/ensV6Zmkrrelj2V
	 i1VpnCD/Mouct+dubUeL74lankZmcm8c75Z8It0XZOyUAdjbkpJkAte6MJNp4RcFPtV0W
	 apc2rZ6AI+/L7Vc/jR7gE3EnV+h3P+pRajEYRRyZCUPw5YndIftAZU7W2zgl1xTXtEBNg
	 r8m61YkIaMOpxPJjue4xVFjEQ5lVmEmpwtn7QPvgu9ofnPXv+wVwHtAPoO8l57kRdKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ngmZliCBVIWdLZYwfTne0S7zcUfl4a7Lkkjc0y/n2eE=;
	b=AvshLJqJLis5LSvsSeVSpEjEl8R+Zl1a+AlJ1oP/dzsZG0uHV7mo3eu8SlLZ5U2R1IUK
	 P6AQNV4OP1cNtF1tHoz+4sekNhPhweuj7ZvLtu3RrFZFScLnbUVBllNFJ68cnUgBJ0cww
	 KWwZmhoWF6rxo4tBdLynZhlUA4YcT/G7fx3ZOfYgkoZm3hH365A6A4ib9+iB/xq0qC3qU
	 79PDpGrjbcdANZZPE6b+DwPIerCwFGukAdxFptOT3ARhEvzJ5GAdfVLaoE5pjbxCF7qnk
	 HiptXhoibaODHCUtvbC1LwePlYH5h6Z1ExpVFv+yaQnSe2yT7Bfjc74zMz2XLEVL+6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBsoZyr8;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9762B606A324
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 19:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9762B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBsoZyr8
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e3b22e971so48808f8f.0
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 11:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795117309; x=1795722109; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ngmZliCBVIWdLZYwfTne0S7zcUfl4a7Lkkjc0y/n2eE=;
        b=HBsoZyr8yRDg7emj5UqyjwG522xu8+jzuFsEKDzs+pwOuidW26AKQOwUNLAU0VgQgl
         xm3VIBxTyypd51RJ1NJ+s5WqxbsUIefcrNZr6yX3QG6m6wju/UQKDt7/Fl0JvwkYJaSd
         +cm3T3R9Zh1DZIlUPflX+iKSvWkBfkeRGojWC30pEBxWQZFTvE7rvIl9ijNq517jqQsZ
         Pm9Efx5CTxjMn6jEy2TpnaNnsjckDJViayTYWjllZgf4XWfrsj78dGpw/1ToGwU3liWS
         1VN2EyT9+eA31vU9GGVsqiTSv4vdopwByUbPcm0skuh/XjaztaFC+x/KjlD2cJD/zq5U
         2Fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795117309; x=1795722109;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ngmZliCBVIWdLZYwfTne0S7zcUfl4a7Lkkjc0y/n2eE=;
        b=eFXRjs1/S9A0w7lrdO7W+EEGfthcbcUnjH9MS+ZxCXbFkTBbj3doDakjJzDdFmnWnG
         otqMknrgFdq8QWWC9RKGbcS02n+3Qa35UeAmPOIkKDJ4Q/B3QPmmaeYgoQmZXpnMz6w2
         qNUALnkg7tz2PwFMV5Qsb/lwEG/FsDHfaooQTABT2VAA4s2riKg0E5iFUkxwv/giiyNE
         opLCdqQi+9Mu2L/UkUOawRrAD2G/Z36ch1Rzl3ot120GBm3v+uCpmgEdYBf7PI7E2HO+
         P3PNqw/ieL7CDV86ebrFzMm6sVMzU2sPl6uYmfdGWzak6aIy46pSoSxYGbnw+gmf+FUf
         HgTw==
X-Forwarded-Encrypted: i=1; AL+hErFs+cXoEo8cn33pL5bsgc4dVRIHmID4z6YaaQDR1OxGAW/WxyyJTY4Y68SjOiyiwcbLnagjySx5vyEr9Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/drrYm6nbZcqSWIz5b3rQjbemABJku2r2hTgbzaMgvPjS1imZc
	eHt87muVk6dfGb0oY4px7MfrgVsTzzvJVD0L7wbkNZaaQ6n97M4nA1yT
X-Gm-Gg: AZFdTZdN0MsnDz6/TqiLg44geZOR2rwfQRvCdYow1Qp6BbEZ46yCtE+0/3e4Cc3wsvq
	iBhlaoYPiYq8w4kgcFUnUY2dYsZwsMDbpleRVvHh5yg8Xb/VciNHeCtugbS4EKnH+sym3dIHvor
	MzieI9hhRQKdxJu4EEq4R5vrgeLoRO/IElkkXvEKc7BpKR02FAlOKnYjYX0B3C4yUg8LHBBf7Nt
	yNSl8nVBT821NdAtinjmQgO/Zful8ro5SnF2AZXEI54OetKFZq/aoGpIqLiKVBKK68O/SUGQLg1
	/IMlSUtr90ddu855rAnIwUGINhpddPk/f5DODUE8y6LKWfi0lFHI86Mo/ywyRfNFNyztqhwkSuU
	80zxSkjCrCya9pxRocccwKCsevYT5fJhAQEIkpZ6/FiNJt2pbdkq8zgia9FX4vzlScu11TYJ+Mi
	db+js0F84aX4ykgX4e+RP7QcFpWHYtQgpFdVJIvns9T4Z7T4WQeHcOIl9AZga7siD7SXXhTb1iy
	salrUirtAf5kvEXH8ZWz8ovrA24zjyZ9qPLYhhv3qBTL4xrUNTJ2xIpQ/jVfAySFpdeXRNnnGWL
	NBFmgZdezLOv4dddu9WzAB6bnfTNe/UMZw+dplVMc9Nnwk0m5W4Xp0LyLcToJLmdZfetdyQucmh
	v112jhCHJhXhyFigp
X-Received: by 2002:a05:6000:188a:b0:4a9:4dfa:c150 with SMTP id ffacd0b85a97d-4abb2910440mr802988f8f.33.1795117308684;
        Thu, 19 Nov 2026 11:41:48 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm1375537f8f.40.2026.11.19.11.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:41:48 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Subject: [PATCH v3 0/2] hwmon: add Raspberry Pi 5 PMIC driver
Date: Thu, 19 Nov 2026 20:41:45 +0100
Message-Id: <20261119-hwmon-da9091-v3-0-15956035d7b5@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/21QS27DIBC9CmIdbMABgle9R9UFn8FGDbYLxE0V5
 e6V7U1UdTfzZt5n5oEL5AgF9+iBM6yxxHnCPepOCLvRTAOQ6HGPMKdcMsYUGb/TPBFvNNWMKAN
 gnPQXCBd8QnjJEOJ9l3v/OPoMX7dYYj1AbE0BUjNAj8Zal9K37RBr8wl5gmsz56FdbrYtLrXXO
 N3u7THYdtoJ7vVAyVY2Q6womVIhb9a7sJtTirVHygsG1mgfjPIdNdZYapUQioIOSlLRSQlnYfE
 Wcoylzvlnf8HK9pT/X7sywkgQIlATtJOmexuSidfGzWkXWvkrWf8hc0KJl07yM1fcaHglP5/PX
 9YuHaSKAQAA
X-Change-ID: 20261117-hwmon-da9091-7aeeac6d8ef8
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2380;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=yJOPDLQoZxq0M0HwoMdMVCgup0u+fcMHSpG5grv9Ph0=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/1D7Bp+PuNFkolK92E8hqdLfEGM/fT9WgFb6S
 tV0ogyCCpSJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9Q+wAKCRB4zXhFDAXI
 Z+nmD/9WJIQuY+FZyi7TV6Mlyu1e/Avb0VPyfPmghIdI/pM/MeOkW5TRUvGWntcanjFFcCEW0/z
 deTLPQO3uLhAijwsSjcoJWcxz93EvIK//MdZZQQDDRPbACV+a5roVPUX9N1/Vx8okYb12HB+S3k
 NLeELeowoItOiP8wzNGWVE1vPrtl+id/ENRlp+AgXZYXT6TnGVoNWyKfBf0VEnpaQB80oCmbnuR
 jwEGTpbEUO8E06lMchSCnAyyCDmK6KfMuXjLohMdONN9XWTxu856ncrqV5D7Ex+6ejQUhV7Y1ov
 V9y03bVVj7YDl3ljXs0Wcaq9UoJ2UEu/kpJRBsycGZe8i6C8pU5lf0qJmnVbBfyW6A5py90rXJp
 raFQqzDuOPUcHzAxdciiTOGHMIs0Wdtjg4OF4yuIOHg8ob+cUJmg+qFDh+wbd2qDEoQNV5fsYJt
 E5+zHO1NB+feixZUpxebO7T/OkAVZ78fJA/dEeuZ1+IEPiOm/NGYMFaZW1ND5fpK/Srg3ZaYDYg
 XYEf1EnKvv+FV6SF3BkjSoQLjc6SQjZkl+yCqbToFfZPPAizBMy/pKhfYYUB8oSIEzfsZ55wem2
 Bc+EuUuOgcCyAQH+NxJGJ/y0MQYBd8omtz0sz8B8fxRDDoBjdYYJ9oomvKcmHmblZbRR9aHylua
 rGIj8BYHaFBhirA==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

This patch adds an hwmon driver for the PMIC used on the
Raspberry Pi 5.

The PMIC exposes a set of voltage, current and temperature sensors.
Access is only available through the VideoCore firmware mailbox
interface; there is no direct register access from the ARM side.

A structured property tag (0x0003009f) was recently added to the
firmware. It returns the ADC values in binary form (index + length +
array of values), which is much cleaner for a kernel driver than
parsing the text output of the existing gencmd interface.

The driver follows the same instantiation pattern as the Raspberry Pi 5
RTC driver: the raspberrypi-firmware driver creates a platform device
at runtime, and this driver binds to it. All channels are read in a
single mailbox call and a short refresh-on-read cache is used.

The sensors are exposed through the standard hwmon sysfs interface so
tools such as `sensors`, collectd and node-exporter work without
modification.

Dependencies:
- Raspberry Pi firmware that implements property 0x0003009f
- CONFIG_RASPBERRYPI_FIRMWARE

Tested on a Raspberry Pi 5 with recent firmware.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
Changes in v3:
- Fix sashiko reported bugs
- Link to v2: https://lore.kernel.org/r/20261119-hwmon-da9091-v2-0-d6c624272a9e@gmail.com

Changes in v2:
- Add documenation
- Split firmware in a separate patch
- Remove DA9091 mention
- Remove extra lock
- Use 64-bit jiffies
- Remove lookup function
- Link to v1: https://lore.kernel.org/r/20261117-hwmon-da9091-v1-1-f55f0af9c6a3@gmail.com

---
Sander Speetjens (2):
      hwmon: add Raspberry Pi PMIC driver
      firmware: raspberrypi: Register PMIC hwmon driver on Pi 5

 Documentation/hwmon/index.rst                  |   1 +
 Documentation/hwmon/raspberrypi-pmic-hwmon.rst |  49 ++++
 drivers/firmware/raspberrypi.c                 |  21 ++
 drivers/hwmon/Kconfig                          |  11 +
 drivers/hwmon/Makefile                         |   1 +
 drivers/hwmon/raspberrypi-pmic-hwmon.c         | 296 +++++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h     |   1 +
 7 files changed, 380 insertions(+)
---
base-commit: 7d51eba9dfa7d30abab0b75570e9f7605366e45b
change-id: 20261117-hwmon-da9091-7aeeac6d8ef8

Best regards,
-- 
Sander Speetjens <sander.speetjens@gmail.com>

