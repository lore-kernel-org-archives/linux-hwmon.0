Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541719;
	b=Tk0CwyH7/N3xpu27R687bTWRpyFbddRoyzB24omsJNFwJ1BQe5uBcDkypykVaHfxmZ0K
	 Jd/FYCTaAkNRR5vCm+FQ4A8VgakzcDnSFfl0rfTbcObee68Dcf//CFNghgweHh9ZlRdxP
	 J16DG07IcuzcP+PPauf40bpJLXmBg7plWQkgbQpmB47monH0qYlQFZz5GVGRvqK7StNei
	 qXc7K5HDsj0y4hdv5J9KD4OBdzHu+yF0asKlPjDIyR8ZKkxL9Or6zBqhsknMRYI2tYVkC
	 F9IZooFFHFW309uAiZnop5NZ/dMiedSr1rj3Zi67Lkfnuj3L04Zu/rmU0Q0qZWYMHEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DmBwmrmEWgysYKtSDSRrr9hV9wxgIOlNWVL3lTij1CU=;
	b=WPPLJyEUJ4qETdaMRI89G50Di0qr1Nti0aJpmDz6+D1G11MJYTkJvRuF9bD3ltVWqBOi
	 vIfTv7UI+EloME47Eg/UvyeXVcEazv0yrW8gqQ2WzXt+DStKlIBROeCCDiPKa5B1IB3Bg
	 h3AzFTB3dCxyyQ4iMMzSrzs9BGHiU6asKBbHIqkRp6dQsCB/FODzBwR5wW0oJxZOsnlr+
	 fmKHomxWT2MZahjfhmn9krSnpP/r2oFDayl+EAovXQICCij4tXBcgG693Jkr91d27MFFG
	 uxsp7EbnQwK5i8umr2H0QtsW4xgC01UneK7DAWKmJAU7DVi7/zf7zrToA5afvNWzDcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="OmDIg5/y";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8F6606A33D
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 17:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F8F6606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OmDIg5/y
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so49785935e9.3
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 09:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795541718; x=1796146518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DmBwmrmEWgysYKtSDSRrr9hV9wxgIOlNWVL3lTij1CU=;
        b=OmDIg5/ygmndD+Kv5JZu155dClMlLF1P+Gd3Gn+MXXxkkH9P++zAq0uJKz7MJzb9Ep
         9GAOFzNT1AiHFEb6YOH7An1RM5Kq3wKKivuk4nuQ2F26uGAsn26+eKf47b2vNUBiLy2o
         yP7/7A+G9S+n+sSz5kEIYc0UjZhSJvbHU/YoXUjrUU1PrBb0qhXyaiW1jNz3XiXKNMPJ
         ftLnedCmAW9WeUTEO1ihLGasy5eI6rs360qul+IGcrXJSktAlmICnamarnC/z0xWRbud
         x156i62ARhcbuRiMmhd3W+b9uhcIWJ0YsWm3wC7Ad+cY1/U/8deDAuJYKwx5DiRFMU0f
         pJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541718; x=1796146518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DmBwmrmEWgysYKtSDSRrr9hV9wxgIOlNWVL3lTij1CU=;
        b=ETO7HKGqo2lrp0jCyTitp3MRP7xxgcTP8oIUxtdDVOtoGDgofYI4rkp3QQfjD3Sgc5
         8VHYF2nnTZ8RtaKTIrhIFeSaYdtEzjWX/T7q/XE/5idRHyqyOzL7YW3kewg78lhsr1Fd
         +8yXNJ0ruoqGBPd13mgVHBAW2Z5GmnEaeH4IERsy6HUFZ4cGgmMSzvkNbCSnzrUHw4LH
         BiY6uu0hhJvVXsBwKqMZE7mC6DPScT/P/FrktEQgF1bMuEVr+HYvCEIKEAs8Un7L7Rjx
         1jv+Yk/Z9PFlMYdSMZ8KZzEjKwKc2/3bM4a8kuu4xdMXWLCIclAGlGUBkQBHdY1qupR/
         qFhw==
X-Forwarded-Encrypted: i=1; AL+hErE6nxATmG73mdaKjw9i9lCKqVUlngEEFEAndZEhIOyz/0mLS++7cdk90Fl4EWSD7TONNKCbN0z1cxA7Vg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+xefAaeMpS1W2dcZWtbHhUAxPkUerCgZDei9DacA8PKaQoQoBo
	ntmlacOS5PV7yqi61CiyNTjrtJkc5uU0Ir7ox+M7RwAaCOMrwZDiCGD+2yuQRj4k9Ig=
X-Gm-Gg: AZFdTZeDKoIcKV6IVc+hawDZvujKmCRAsSNRhOuTgioVxeJOFbrZfwHl0wLje2vYy8I
	HYrd4zRblfmvzYRo2DR/9+ZaoFK9NCc0RJTimezJh6CSBAyAltIv+qa/tV6mMI00cLcXypi67Wj
	WrHWdXAr8NFdhzNyta6M6U2/MuRHwsxNz9Pq2/GeXSx9f9sHu2i6vi5CiDqDm/NHJFfNYnasnmq
	+C+3r6gEHM9lZcC+KBb9n+5BmJRh4AuuKlWp/u6DivgwspmcJn99Z1s3UEW9z1RHbVY2ce9rIEo
	lV8ZtZhZPkffaacrXDfO9cZke770J5Wb6BCJ/8IbBEG5rlwVHAwePZAhu3la0ABHJJMfQYkyFb3
	ozNKcG/izqBUDArac7SvMlLogzUYf08eiPj5JMIksy4ghUUIdSqmqiVR4fhPQf5leGoetzRi6FP
	wcgTd9kmyixymrauYkxrSwb1ZK2h2aKXn4/F9z+X/MY6Ddzah6ub1B802DucKuD+eOTWDvxod2E
	b184PudnaUS2fMTMchbapsclFG2Fjx8hXypWRadOhZquSJSLHpoDXRy3/dvY2L9gwwv9byOSZ1R
	78fMg3wSH/zXZBM/+zIlgLSWvRY=
X-Received: by 2002:a05:600c:a08e:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb887c3afamr345794445e9.3.1795541717677;
        Tue, 24 Nov 2026 09:35:17 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm460171975e9.3.2026.11.24.09.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:35:17 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v2 0/1] hwmon: Add fan tachometer support for Raspberry Pi RP1
Date: Tue, 24 Nov 2026 18:38:59 +0100
Message-ID: <20261124173900.31266-1-andrea.porta@suse.com>
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

This patch adds fan tachometer / RPM monitoring support for the
Raspberry Pi RP1 southbridge found on the Raspberry Pi 5.

The fan speed is measured by the RP1 Cortex-M firmware, which writes the
computed RPM value into a register of the RP1 PWM controller block.

Following the discussion on the RFC [1], the driver is now implemented
as an auxiliary driver: the RP1 PWM driver registers a "fan" auxiliary
device (pwm_rp1.fan.<id>) and this driver binds to it, reading the RPM
through rp1_pwm_read_tachometer(), exported by the PWM driver in the
'RP1_PWM' symbol namespace (as suggested in the auxiliary bus
documentation and agreed in [2]).

This series depends on the RP1 PWM series [3], which provides both the
auxiliary device and the exported accessor.

Changes since RFC:
- converted from platform driver to auxiliary driver
- dropped the 'raspberrypi,rp1-fan' DT binding and the DTS node: the
  device is now instantiated by the PWM driver
- dropped the DT phandle lookup, device link and reference handling:
  the auxiliary device is a child of the PWM controller, so the driver
  model already guarantees the correct lifetime and unbind ordering
- rp1_pwm_read_tachometer() now takes the auxiliary device and returns
  the RPM through a pointer, separating it from the error code
- Kconfig: depend on PWM_RASPBERRYPI_RP1 without the COMPILE_TEST
  alternative, fixing the link error reported by the kernel test robot
  when the hwmon driver is built-in and the PWM driver is a module
- removed <linux/mod_devicetable.h> and the other unneeded includes (Uwe)
- updated Documentation/hwmon/rp1-fan.rst to reflect the changes
- added a dedicated MAINTAINERS entry for the driver, instead of adding
  it to the RP1 PCI driver entry

[1] - https://lore.kernel.org/all/cover.1792748690.git.andrea.porta@suse.com/
[2] - https://lore.kernel.org/all/ae9a4df9-b1f2-4f00-ab86-d9cf8d9bc387@roeck-us.net/
[3] - https://lore.kernel.org/all/20261124173658.31030-1-andrea.porta@suse.com/

Thanks,
Andrea

This version has been prepared with the help of an AI coding assistant
(Claude Opus 5.5).

Andrea della Porta (1):
  hwmon: Add driver for Raspberry Pi RP1 fan tachometer

 Documentation/hwmon/index.rst   |  1 +
 Documentation/hwmon/rp1-fan.rst | 43 ++++++++++++++++++
 MAINTAINERS                     |  7 +++
 drivers/hwmon/Kconfig           | 11 +++++
 drivers/hwmon/Makefile          |  1 +
 drivers/hwmon/rp1-hwmon.c       | 78 +++++++++++++++++++++++++++++++++
 6 files changed, 141 insertions(+)
 create mode 100644 Documentation/hwmon/rp1-fan.rst
 create mode 100644 drivers/hwmon/rp1-hwmon.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
prerequisite-patch-id: 8a9c7c53e94bfc4dd1dc40e8277f22c1f410f404
prerequisite-patch-id: 3053bded44bcd6a78ecae5a255ae876c5a9cb49b
prerequisite-patch-id: ade915a82dd15722ecb44802d307ff9d60a79228
-- 
2.51.0

