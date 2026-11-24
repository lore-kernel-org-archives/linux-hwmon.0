Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541584;
	b=Cf4IahdiTI9pIjTYmAP/5exmROi3kawhtc0VtqqBNEIugjNE64wSLNHO6NKefJXdzz0x
	 4eaz7Lg9vGp3V11T/HoE5xiea0U34EIdHFcvekhRyje6yF4kwifAmjdz0V55jaGNmj4E6
	 SM2BgIIwB5FYXCXLHphMuVQOpH6Bt3tNYlU7Ndf8X8EhkF18PHU/UPmjDA/esXj9XGa5R
	 f7RfgvMo++DxYjCYs1b9l0/sYFLpE7HCitcHpw7LX1FaZJNDYN2QJgWi8bHEeM7RaKOGr
	 R9o20U/jMxS9RPnVRcbpLFFFoqovphL2jBAvOWzDZTkVT225NqlsQZrux2AvhdYWROw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SGN0CE6hboOJyWQIpluS979Wc6QFsvjzK1IJ9fJlXFk=;
	b=a49y2foyk64fPA5FCmdtkh5fx1Pf/KXSbJwahCy7K4LlE4t3slMrRDk60Nzc831ytDvS
	 lR/PjpUSyB+3VstnyqVvGXVi72jTtfBgrJjeHU++jAEK/9On27PGrBGHt8Vyx41Pxhwjq
	 kUnaFEV8zshZiGySpQHDw0Z4s4cgkDuuCVKT/KpMev8S7F2hulhRXwasX4d7OCj1DNTC8
	 8JFrsJqj/XRsseVZqkXzKjwTPR9G5KbGNN8Gji1RrmyDkiSL8E+ted3yvBGZDLO1+r74i
	 XW9vFhICLXc45aUOjDgPOOEnePpXCpSp012jVS9dYOWikr/oG/ugrUy9jHYmvpnlJ3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RXwJn5AG;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62E260A2604
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 17:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C62E260A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RXwJn5AG
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso2239496f8f.2
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 09:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795541581; x=1796146381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SGN0CE6hboOJyWQIpluS979Wc6QFsvjzK1IJ9fJlXFk=;
        b=RXwJn5AGyO6dganRr8aighjFMZJNJh4XjfhOO2zFgOYt7YFmihqlkoSNP/Sd2qk7mR
         FfbpIqRpuaBVKaT+fMr4hUegmk8cVx6CP0R2/cm5K41diZ5crRoq0LTYsfsSc0xlGEis
         4wTTWUI8MViemNC3LrHUXWWpCCIvfPI8YHfyVz7VNAJKkQIJeYbgJKBnhRpzIckcSeSl
         /l/kI7mn0mx36m4fmMzXi9hpGqVByRsyhWGpUAtHxlchwVQGBJ73cKW/3E0pMSVOeJO+
         6oSjyXnQidug3UWD3+bGNMTRkr5z1+35e6FlZZ9XnGhhqoRHAfbz48Q6kOUeMZGbDIzP
         ARIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541581; x=1796146381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SGN0CE6hboOJyWQIpluS979Wc6QFsvjzK1IJ9fJlXFk=;
        b=wtGnMmfDSI/gtTiSl8MCsAErEyXYHz59Swz+Q3Pi+ncXSZdbUml+GmKuIogyNm2ep0
         lZNwXVQJcgp7hE+IVQQTvK2z398wOlxrwGwCDeiJAl5Gvx5V2tAo4JKLUIMb5bAnFxN8
         RQPT1MvX8wsyypBOAPUfPYpo7Zvi3TGP1cd+EKB4uOyqBvFBBXhpO9r1K36b931vElzs
         6WsCIqbWht57NUac3fDQgTZT7zSoBr5CJtAP60azbXw76CjC1mUCFUdCg53vr6JVx9GO
         4KPE6m9/25t9XYozQ1SVOJQLwYSyC+goGEOR3kxOQDeVVlmi9i1n0xIUfEeRpccx7ppq
         qOEA==
X-Forwarded-Encrypted: i=1; AL+hErHCBxfRxa3yjH19STNUR3QOf5D/VQhUsIdCynoKEi07P5p50okSZMSQi9XKjW52GjBuqB0nh+BJiSlZDg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/SQGQAMiamrvMwZV4ydm9MUjsIpB88g3wMVvrolB6vx+UzpzwF
	rZ57Sp8nDl+gFc8wnStBXHA94vkwSTTpQEwfAZKoKcnX7mMTP4vjSNkXGTx303GRBhU=
X-Gm-Gg: AZFdTZfvxV1aSh7qa1lTVGs9omMpPfL6TnLrUuvVijbJNivi4Fs3yE2HBzFbexUeCA8
	xRRSiOg4gHmiZhQgLP83iHhpX+/n1pLLef2QRDiHxBRVzZ9WE2mWu6902T9AAHVv4FvzjoGWno/
	twJ90DehwogKgiWw4aUaMZKg0qEC0boKXeAU/xFjys+w+Du0i0OeVgs63ZZkyUZ+Gi7gy4BsQDR
	B6iUJFNP2qkWGvpnPjLcI+8q7OL7NlG2hAcpS/YeWMbm/ex+t1IFdI+EiH4X0AmnNekadWWgLEJ
	mu4IOBmRbgyo4teNvCE7R1XXbhBJmk2OtT7YUMY79OImTUhW71esO2GDqKFG6cozjTm4gAJfXWZ
	9V7P9rnRbXIIToHStIhqsZcVxyt/8rbWIp+l3eLl7C5Gal04giLpB/hDWAYeyt03qQPJXnV6RIA
	2T/FecsnVju+o7cSYEINxVC7QvqTaeSP40rp6OBSLMzuqTDgJNbBqiDsRhtyMzOsp+uEiu3oEP/
	0fM8dQhmbXBog2K6J3Q5aBatyxCRxQ0Kg3oEWvU5XVSKtIxBsBi/S+lT/oezjD3D+JRsV6g65pT
	R44Mp8hkegKwhLwXX2j2thPWp64=
X-Received: by 2002:a5d:5d87:0:b0:499:9f62:d64c with SMTP id ffacd0b85a97d-4abaf64be07mr33775504f8f.10.1795541581121;
        Tue, 24 Nov 2026 09:33:01 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm29248480f8f.52.2026.11.24.09.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:33:00 -0800 (PST)
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
Subject: [PATCH v13 0/3] Add RP1 PWM controller support
Date: Tue, 24 Nov 2026 18:36:54 +0100
Message-ID: <20261124173658.31030-1-andrea.porta@suse.com>
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

Compared to v12, the driver now also registers a "fan" auxiliary device
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

Changes in v13:
- dropped the DTS patch, already merged.
- add patch 3, registering the auxiliary device for the fan tachometer
  and exporting the accessor used by the hwmon auxiliary driver. The
  exported function was originally part of the fan patchset. Since it
  is really part of the pwm driver to be be taken by Uwe, I moved it in
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

