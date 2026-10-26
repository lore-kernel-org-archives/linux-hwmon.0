Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975272;
	b=mieb6QneB0H7klAOH/qa6DvoiFcs8Hz5S/xFNHl9BWtxiG8GOfA9WuPwzXnOk4irMeqn
	 yrPjXDS9Pu8Uud5TZ/5CtfsmD68qJW8vXdpsh/hCEaLKfy3VOVXxdYjk53wZemWsl/FXp
	 7N9qJ0c/+sXSG9YcTjjznOwyizHNazXal6xs+8xLx7EqKw9/IhrMUimiRyIW6I3Zc8WKr
	 3FWLfSD/qTrz8NteuDtDCVbT3qGxEg//dcHzgykG2xJUFcRcR/bMZpCUkJ/aJNfqlOpQt
	 y9kSXiPwb2Xzl2bqpzjgZbkILqtDQYBAyI//nb4po2zJkhLrcl81m9eNKIhE+uzcX4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PFobPJXVsXDz19LQO+RLD3R/7cNmq2aYjbNBSXJLmQE=;
	b=031EgCCrKtY3uxKvuXKaRP6NcseUWMWJ7fb2ZdjiGfhlYSzHqmsFl9QMTpBcNv6EZR4P
	 bcuuhXtxvfaHDuvqGEZSku1OEGYqyVFMMQghJoSaQ50cSrY9zm1EI/x3j9OmTqyaeWNwd
	 KqkJhQrPKPp286bw/E9yxXdawgl34MQf2HdZt1xNj3S7ElnFYRdtZvPgWy0qFFPbJ7cHz
	 jTuiv6vI9uVoPpvLXVWKtGs2d7LKcfwahOnIArt/2VXvkUFlRYeoPAwSVl42S19IlT8Pg
	 XygmCZ0P2Toq8BiCb+eQ/z2hE1Rq8MUTFcspM4a9pFwoTi2Yu0DOjoXvGwTR2Z9I8UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VKx+obQA;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59562606A31D
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59562606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VKx+obQA
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so3075235e9.0
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975270; x=1793580070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PFobPJXVsXDz19LQO+RLD3R/7cNmq2aYjbNBSXJLmQE=;
        b=VKx+obQAPb5/XrR9/roIFYPRYGDzzDrkDoIp3EMgMBi/JMmvYE/fBNeA1Z1c4kRnb2
         /5FawM3AjVvvX2Vrbh2TeCQRbtjZKXN31fGLMSFHZlpPbp6IvroOUVjulEOZx9U6Wt0R
         vw6XMPJz+4WhSv8rAMrLWA5HDcT33bu6gonFcqDZTJMHo5OqCR7/k65EenzsIYSVHt3K
         X5K9j8DMsvfVEImpHP6pQ5C63OFW9hT5m6zBFUVKsN/rb48+OTqeSmIUI0zrG74dep6K
         VELfJ4YXVWTb93hj7rhxZIB6NR5Vqzki9sivn9wYcT7X5QMTBRK2DCzwDEfHSgibQkoU
         Tc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975270; x=1793580070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFobPJXVsXDz19LQO+RLD3R/7cNmq2aYjbNBSXJLmQE=;
        b=dVD6VmTQj3R9gCD/MlhbV8byoyQllsl8V0GqDyez6LSFce1DgKgiy4A5VG+t7T3Zea
         y61vIkEOaly3fnClVYh21p2uPxsOXMzXPOCA0NTE9vu6DqfPgKt4z5rgCUFKsXRRA7cF
         fO81A5wLTMmkfY4KLyyCJj8WocaG1AQaOP6CQ/Hdfm3FCfx4YG48PQ+anQvsGZX9Ao9Y
         BAX7nPRzcfS4fSbfhYSoJq2NWDUkPVTP8rJT/Bpn1xC93p1cvuVPazCiay5tj3TLgJLa
         pn0thNXCodA7KkyAQsZUvjc69q1xE0vxcJhFAZ0ci7HbQABtTQOMVjJWk9nNj+sry1Zb
         m6YA==
X-Forwarded-Encrypted: i=1; AKwUvBzFtmF2gu24i/OGfEEXwVFM1QczUo4E+u7vusVDGtdALYRnLE2IAfdI44pmWMiraHGwjWCtyd5PZfaCag==@vger.kernel.org
X-Gm-Message-State: AFq9FYIZJlvcwWtp/KI9JzkDjJeQHA3obNJ8lpX7wnTGbOrP90dg/c8z
	Gv5c5jRhS61a5Dna9pqp7fvMqMuDE5Pn+dqVDvOrMBYNY7qRuZ2obasP
X-Gm-Gg: AYBFou1OEn/d96oneUgS2cHDpO9S6cX/7mpQCOXgsxfyK6zY+SVvICPeM6OQaTV/phU
	HA8+TvDwdU2MdXkzsvvLbjVtrqQtfqXalHZDDHfmQn7BnXAuXMy7ipZw66NoiZ8yL6bVwoJEq7w
	n/WxoJo4HfPsWNVmINS4RGVmur7RjaC9dv6LXjSNDU+Hkqlb9XzTP3jHyuv3bTV27OVIQoEY3Ym
	aFGzmdaiiM5MebdIig/nwj4j57VIdkf1Xo9kNrWxDXvmdmd3u+q7+8OHt1skeajfA7TnJE9AF9+
	9Be23/G+jsp5rGbgabExIWSrE0UC+nw7rRUYt+ZnqMj8gtEAIOPYhBcD7SvDk9/efe+NIJxsx4s
	YDyZggwfNSQNbFTm6tm41/ZUGaywXGG6JXAR7jTH8ZPLZOk+CoRUIuWBVigJG9hd8yNvVwqJb6D
	CPUhE033+IoiteKTNDg++1u+7Uym1xsAAGu9Y3KP+yGar3JhIUAQ/x87QlUp1ujyF9hJM1wkPVJ
	9vexJGd+fghi+0L/Uwd++JKGvcOZHtbxzq25z+BXEVGQz4PcZATDfd/ltnPjzPYrWvKOp4aZJ9n
	A7phrnfCgJVDow==
X-Received: by 2002:a05:600c:1c1b:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4a35aae5c48mr101973045e9.0.1792975270272;
        Sun, 25 Oct 2026 17:41:10 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm74574555e9.3.2026.10.25.17.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:41:09 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] sy7636a: power the panel only during updates
Date: Mon, 26 Oct 2026 00:39:11 +0000
Message-ID: <20261026003918.155321-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
can not power the panel only during updates.

Read the temperature in the regulator driver instead, as the TPS65185
and FP9931 drivers do, and remove the hwmon driver. Boards that relied
on VCOM staying on mark it always-on. The regulator also switches VCOM
with VCOM_EN, gains VCOM voltage control and binds to the I2C device
directly.

Tested on a PocketBook Verse (B288).

Pablo Mazzini (7):
  ARM: dts: imx: keep the SY7636A VCOM on
  regulator: sy7636a: fix the chip name
  regulator: sy7636a: add VCOM voltage control
  regulator: sy7636a: wait for power good, then switch VCOM_EN
  regulator: sy7636a: report the temperature
  regulator: sy7636a: bind to the I2C device directly
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD and hwmon options

 Documentation/hwmon/index.rst                 |   1 -
 Documentation/hwmon/sy7636a-hwmon.rst         |  26 --
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi         |   1 +
 .../boot/dts/nxp/imx/imx7d-remarkable2.dts    |   1 +
 arch/arm/configs/imx_v6_v7_defconfig          |   2 -
 drivers/hwmon/Kconfig                         |  10 -
 drivers/hwmon/Makefile                        |   1 -
 drivers/hwmon/sy7636a-hwmon.c                 | 102 --------
 drivers/mfd/Kconfig                           |  10 -
 drivers/mfd/simple-mfd-i2c.c                  |  11 -
 drivers/regulator/Kconfig                     |   6 +-
 drivers/regulator/sy7636a-regulator.c         | 240 +++++++++++++++---
 include/linux/mfd/sy7636a.h                   |  34 ---
 13 files changed, 205 insertions(+), 240 deletions(-)
 delete mode 100644 Documentation/hwmon/sy7636a-hwmon.rst
 delete mode 100644 drivers/hwmon/sy7636a-hwmon.c
 delete mode 100644 include/linux/mfd/sy7636a.h


base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
-- 
2.52.0

