Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623658;
	b=IhGFpztXpKePZ1K3uI+FTiJcKm1JnN3Cf4N7Xo1NGO6mPopzX70rfehpoh9vGvakx+go
	 /Wl844pu9P2C2xMCA5MoG5jrjD7xNa3TqTHJzZYc8uUM1KOU9+RFKivelYWs4uN7YoX1g
	 +Gciu9rehR6kf+CO+ec/m3NF4fUEVUGL8QfWjWgI9lRqk8CucCTOUC8i8o1WMu3esL3q/
	 dcnGTBzxzI6JMhfQ0nh0/IlkDUSDmGVq7OJ6gNq1g0/InE1oVDE6AL+zOXxvylk6yuICN
	 XJWm6LDIiqmi/oeyYS6lymuWevubhf4HxXtH+6W5yCIoI+iWfOh5hg5HuFxzWmtBE8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w6xtuLM9HrxHujYVMQV7MBMbD4qoIrs9MPoeBowe9/w=;
	b=cH9mQzDbjAbhULYRhEAyFYxobUsbouyb0G56AuDf1I5K7LMRc67vR3tzqf/RiaBF3oLF
	 qcUZJISwjoVCSfqmyrL3gnhUemnFSUmiJ2Bsun5Rc8QVNbLU6iwV8lKPVhCHn7FzWfhRg
	 nnMp6QRZNjz2WvX0TW7QEJveCNjLPgPzAJMyUTh5VyCZjIb60GqOXaUdaVLV6aeHk5+Gw
	 naERsjem3WyfXkZFKXneS5FXRWnEFP/sFLIwhgR9hS3tcgR2IkEvSASUQe3JDZnogD6b4
	 aT/ZDqZuSL496/MVoxPH3icvSKXj+eIhnQB+eSdz/7BLBFd2uPdPObb77NwxZQ6s1jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VnT24unC;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B96606A6A1
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 16:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24B96606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VnT24unC
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so77247475e9.1
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 08:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795623655; x=1796228455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w6xtuLM9HrxHujYVMQV7MBMbD4qoIrs9MPoeBowe9/w=;
        b=VnT24unCRzAxVBIvnn9r46a8R9A6BXNaRo+yX5cvnyLgwCp0henfgCBHBui2C0pAVA
         w2dpQaozcs8NFQaVxun/y3Z1KNoi31zDMQVghtQr1ZDmKDq8i25SqDpnW3b6PVKaatPp
         2H7v0esKzmSaUttqCYFwrKU5gmxOg7dUIz+NJ1BIX51gCGeBgaONqw1kGuq1n4aSZFna
         5+YmiNNlNk405nhM2LUPu/d029lix5yrZodVetHRVDVgG42weOXDSXQCmbUn40Y/+CCW
         mT2DLi1Pa/m+/H+6dt2njdaHvhINECXUK3U8AEUfLEaTCc4LYZSfydEqfJRWI4AK77IL
         S+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623655; x=1796228455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w6xtuLM9HrxHujYVMQV7MBMbD4qoIrs9MPoeBowe9/w=;
        b=Ery0Zo59aNUH8TXfuTB5f7iax7gwAA16TePZ2jWQPFC2mLHlfKtI+j0+AzvQTAlJyT
         R0j/TUmaW+tMsHzgqdyvs2dJSg+nyP/mO+h525llx94B9WmHEiP9Hay0+hdgwCw8fw2I
         nLuFOU792JzhJtEYplmpm5Ui6q5vFLcsgkfEjuZx5QbQ5LJvxXMbgA/TpLGHKK3Q3VG4
         Q9CSu57MdxfFWLC7TQbbCMp1Bbvxp19D9CKRdIcTNxpDG1as3tbjcUbM4o3yWlVsvt07
         WAXUjGBZm85cn7NyfsIlcvPnKcuU7xRzWgz43QYdXxyykMMo2t8X7fC87RoButpMYzsm
         TGlg==
X-Forwarded-Encrypted: i=1; AL+hErHZsyqGJbPkvQ3VbE4xcPhLpzuyG7VV7NyOhJZMyk+P9tGJ9ae9WhLMIC0xHYg3TlVMyJygOGQsG9iI6w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+7dNHhRB8aXisQYJ12pqQMu3VMPERSvv8iBpfGJTjSRhbPjOZm
	izuVZWW5Wxpv4dJ0oIKBIEECqSvaJb26C3ctS1LeQMa/M+sd2A24AsW5Xmqq2896Ll8=
X-Gm-Gg: AZFdTZfuitHr3z5tM5WB1B4eIL4lc4CFUwedK8jIIPhDYk3+SdcH0LAlVkfjyXpoXpk
	RtrLUQXEzZPMFwKzFdUUhnPSYoTVghjyA70xvzzGNElOdMtJFBYGXnZyoNGq//eCJOQSPbs//TS
	vc8bNjG1K+V9bD9ocGhIepQV7Mrkv5+bCiDdMtSAn9OShBliOti9kUovCGWo5foIaFBP65VRp/m
	Qx6rirePbwjERxEvoglEdjwe6a/cVXkhoBYUQE8v5ZtoE+i2OUrSdRs6WEtkEWnilOyEsKDhO8H
	2U8DWr9/Aub7BdRAXq8xZ/nRY8smghj7W0fdi2PdIE8t8J7f0yayxdwja2ofRtFVfr8rSPjtdSq
	FGGJ0KrEP8oLIV8U9sUimjKRaTWqsb6+9G8gtnM2FRJZdEQJkRtnIZysENpF/GbQZzEv2AA4QrJ
	dHLSvOrj2UWDDzZ49sai61GEn/DpqkUTjV0U6cbttBaqnnY8Rf+BHMRnXF0H7G9n3IcXfdcHjRZ
	h08k2y1EGW+4g4r2Cxtivk/SnGnfKtZI39xWBM9OG5Ufy/RbpKxSlAcIa7LajmxS8N3StGmeSU1
	mIrKE4kWI99fLAp7WPdYq45Zx3tt0w==
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr356474775e9.7.1795623655370;
        Wed, 25 Nov 2026 08:20:55 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm288622535e9.0.2026.11.25.08.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:20:55 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: naush@raspberrypi.com,
	svarbanov@suse.de,
	gary@garyguo.net,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v14 0/3] Add RP1 PWM controller support
Date: Wed, 25 Nov 2026 17:24:49 +0100
Message-ID: <20261125162453.23573-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
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

Hi,

This patchset adds support for the PWM controller found in the
Raspberry Pi RP1 southbridge, used on the Raspberry Pi 5 to drive the
cooling fan.

Since v13, the driver also registers a "fan" auxiliary device
(pwm_rp1.fan.<id>). On the Raspberry Pi 5 the RP1 firmware measures the
fan tachometer pulses and writes the RPM value in the phase register of
PWM channel 2; the companion hwmon driver, sent as a separate series to
the hwmon list, binds to that auxiliary device and reads the value
through rp1_pwm_read_tachometer(), exported in the 'RP1_PWM' symbol
namespace. This is the approach agreed in [1], and it removes the need
for any dedicated DT node or binding for the fan.

The DTS node for the controller is already in v7.4-rc1 [2]. The DT binding
has been applied by Rob [3] for consistency to v7.4 and is part of v7.4-rc2: as
a consequence, patch 1 is included only to make this series apply 'logically'
on top of v7.4-rc1 and can be dropped when rebasing.

Changes in v14:
- rp1_pwm_round_waveform_fromhw(): fixed a u32 overflow in the duty_offset
  computation when the period register holds U32_MAX, and return a zeroed
  duty_length/duty_offset when the inverted output is constantly low,
  instead of a duty_offset equal to the period, which is rejected by
  pwm_wf_valid() (reported by Sashiko AI review [4]).

Changes in v13:
- dropped the DTS patch, already merged.
- add patch 3, registering the auxiliary device for the fan tachometer
  and exporting the accessor used by the hwmon auxiliary driver. The
  exported function was originally part of the fan patchset. Since it
  is really part of the pwm driver to be taken by Uwe, I moved it in
  this patchset.
- Kconfig: pwm module now depends on AUXILIARY_BUS.
- added a macro to define the phase channel number from which to read
  the fan speed.
- removed the 'Tested-by' tag from Gary (see V12) since the patchset
  has been significally changed and need to be tested again.
- the controller private data is passed to the auxiliary device as
  platform data, so the exported accessor no longer depends on how the
  parent platform device stores its driver data.
- dropped the unused 'pwm' argument from rp1_pwm_apply_config().
- added a MAINTAINERS entry for the driver, its DT binding and header.

[1] - https://lore.kernel.org/all/ae9a4df9-b1f2-4f00-ab86-d9cf8d9bc387@roeck-us.net/
[2] - https://lore.kernel.org/all/7c437a10-985b-402c-b3ac-cfa97c53d014@broadcom.com/
[3] - https://lore.kernel.org/all/20261102192302.GA882027-robh@kernel.org/
[4] - https://lore.kernel.org/all/sashiko-outbox-231741@kernel.org/

Thanks,
Andrea

This version has been prepared with the help of an AI coding assistant
(Claude Opus 5.5).

Andrea della Porta (1):
  pwm: rp1: Register auxiliary device for the fan tachometer

Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
 MAINTAINERS                                   |   8 +
 drivers/pwm/Kconfig                           |  12 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 477 ++++++++++++++++++
 include/soc/bcm2835/raspberrypi-pwm-rp1.h     |  12 +
 6 files changed, 576 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c
 create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.51.0

