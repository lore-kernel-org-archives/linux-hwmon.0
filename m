Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795118136;
	b=fdFpcRg8VDCJ+b9KONiYQAygeVUrSbqJrKx/mPFTxKI9xJSmdftxXCAymG4vSd4MmYcu
	 033OhHGIMg56k4xiuYq5NIhPqGUKxhNOb7vPvPxS/TQ8Zot6ESJ3AocndhW7HP8xrcCo8
	 XQvsgE0VF4ey/Y1Rfkcx0o68ptoNuAPvLHvymXLLLb01Q6p+A6URObxuvqsfywX3C9/M5
	 3N7rNlMnftAs6Yg4aUOl8r0JJ8r96FGm0FhA4rKPPCG/Db77mvtU8VCvjOgwbL4sm6JMC
	 H4TkCc0jbakw2meXW4PpPJ5WL3VckxEdRuqUIclxEsPn7gsDfWqms9eCq3Gj/4YiG7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=J494ajXgdNSDQDgG1hI5SAnZWfRn4U0a9SRkLTF+qp8=;
	b=DSYUcb7B1pbZgWIiSc350P+rhgfqL53yqxfHJ84xB5xl+4WD7+nw5scwFTnxbr1l7kEh
	 t5ixHBw1cgJxzQ5UEieoCrKIjXEoOdeXyGPBVAJNkqH4H2nafnpEA01AoBvqGYyRzQ2fE
	 p4D66rou2fofvrUnH0h1+BOjBWlibW3BWfYURFbPE3us4mrbYo52vGWg3Ma5leVABRdKU
	 CTSClt5tHb1GYFyiVqrh811m8lByFAoxdRr24/aVlM4d8uRWJ29YH75Ipessc8qH1zr7p
	 nnhLEadP5mZHy3S92ypCW2lDjnkdHITXxjR4LBYKrwh9HqIjgIqx8s+gzNPtlzE0MaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eu2QeLC0;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF730606A334
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 19:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF730606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eu2QeLC0
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so10527885e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 11:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795118134; x=1795722934; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J494ajXgdNSDQDgG1hI5SAnZWfRn4U0a9SRkLTF+qp8=;
        b=Eu2QeLC0xc4ylo9QZrYinAaygdmctgUDlfFESDMLb6EwoQapfLlvdtLOqJBJQPVsse
         q7H/FUIYypXonwwqIan6Owynvmobz8NF0zs7B+kl3lcyhT4pd8YtA7P2vLajsLQF9djK
         2P2vTlKEzC3izsZrIXTM4xxYqAhZ1piTMM+RPyh39ONVvYV9kRxOYjqJ7xQ8usj2U1fG
         Nj4vk6cYSvHgtk/yX8I8K1hFQWBf3nDeFGE3RqIuG2b1pHGi4odox4hnAoHDMomsMi1l
         KTXSxh/8F2okZ9sCzQaeZcFiOOE/ueQaiDla54sKW88po0Evnetu7mx+qox8TXFzHBXN
         qBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795118134; x=1795722934;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J494ajXgdNSDQDgG1hI5SAnZWfRn4U0a9SRkLTF+qp8=;
        b=uwvHpRLf9mYfpnNJOXqj+y0OcYPkaxBjvI07VShlWVcKCZbNImewDaBmCPBCSWGjSA
         ajKDROcWQ5blkZXlOR/RV8y2T7urPj+0OaPGspBb6S0Ol+vpWmqDdi20aFXLPoIkKURs
         kwcFHz2/NshlJp8GuoN+8ul3L3+bF0MPLg78Tavrjcc/Nuv2buFetbmAEJZOcTnBtOYS
         6R9o81tpQ5+8KdG6PmaQs4a8RlAtHq+aDg4mGIjzbay+FQsSl0fXLFjjINNTLs+BbLdZ
         ufB3xDpTg8CqDIH/HEzbljhWxJDZ6e4QJ1w1I8grFxgiTJ3FcwblQ5Ulo6/xOkeH7uwL
         Kaqg==
X-Forwarded-Encrypted: i=1; AL+hErGB/SQY0+6NK4p1a/llTPkLaR4jwqY0+61Z9Oaef5bXxhB+LBfhFmlCE71NnMR4rEaM316culrw1RqO3A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9G+Y3t6MaD9LlDyMaBd1wo9rQAn2ZiBRV6XQcNUvBeFrq/J+Uy
	+4IUxjm9ry3PrFAuAAMPfjhliqmHVtFuhbXJlDz1PocKF4nBIThpXz1V
X-Gm-Gg: AYBFou0/2cHdOGmXmlRz3/DZ7x6RMPNZYHcnhVNcl3k/HH/YxCY1V5+VHrgP8erL7W0
	hIHXp6jE5n+2qnMkozv1sx/umUJ/evyksY3O9Sb3O4TSHiqDmo89QBE9ouQacprXiwoiy/uEZA7
	ToiHkWHr8CIkLHH1g1mD7zPHTsxz/9fVDF1lnjQv9zga63mXlD+oLJdQsTEnlGLaQDNu7goQ3zn
	Vna4psvnLKx9oKgxJ+Ad4qtFX9/I3mPjCq6MoTRLKxgGNT1g3AlimwhXEVCBkRUMEUgRjVaiTNn
	r1nnyrA5PGjBJPyR58YbaEmCAC0MCtdEnox7LIGGpmI03JIAXfhpi7bJlgmzhsOkuo6Z2N5Spxm
	Ptbc4hz5p2ISAUmM9UfexAQVfD99RAFTobyJbJIUEHGZpP5aMwnSVRpdhN72PdG5lXFOcOHWWNY
	DC0BlIoRb+8gnwdB0WOkIf/QzchpCjWXl6P6bUnzV8pn3+mD4QvaiZJCCHKZZHXZR1loXeZ4YMk
	jIlxz/EtAqbWWhS0IlL15VZGm8tDpiATSmaABMuQ2C266cqS9MPQRXjQS2sWLknzQtEiriiqH8b
	X+rdxKenSVzKyjDEVHehzuvpIS9lFKhKyF0qwBsb9QhgCB1Ww8VfDLSw8NYQTC744VxyNMJ/48z
	LI2i26uExgriwjNE=
X-Received: by 2002:a05:600c:a085:b0:4bb:85d9:156e with SMTP id 5b1f17b1804b1-4bb8880fe46mr14596235e9.11.1795118134040;
        Thu, 19 Nov 2026 11:55:34 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm1442434f8f.33.2026.11.19.11.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:55:33 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Subject: [PATCH v4 0/2] hwmon: add Raspberry Pi 5 PMIC driver
Date: Thu, 19 Nov 2026 20:55:29 +0100
Message-Id: <20261119-hwmon-da9091-v4-0-0d6e345c3666@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/32Qy27DIBBFfwWxDubhAMGr/kfVBZjBRg12CsRNF
 eXfK9ubKKq6m9e5c2fuuECOUHCH7jjDEkucJ9yh4wHhfrTTACR63CEsmFCcc03G7zRPxFvDDCf
 aAthe+ROEEz4gfMkQ4m2Te//Y8wxf11hi3YvY2QKkZoAOjbVeSkfpEGvzCXmCczPngV6ujpY+0
 XOcrje6N9YZOsGt7lWyhs0QK0q2VMjr6k24n1OKtUPaSw7OGh+s9i2zzjrmtJSagQlaMdkqBUf
 p8GpyjKXO+Wd7wcI3l39fu3DCSZAyMBtMr2z7NiQbz00/p01oEc+weYEFYcSrXomj0MIaeIXb/
 +CWMMKlkYq10msnn+HH4/ELHm86wccBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2518;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=/cI4BmFxoKWc90KomTwkD4ajHOQjKaHIToCOP5kHF2k=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/1Q1wgA3e428Qtm0wT5CTZ5vybYCO4ZZu9KBY
 Txxt2C/e6qJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9UNQAKCRB4zXhFDAXI
 Z2qVD/92RSkvrjfjxsSE86aeiDZ9N5WNEyNPjo+o4TKpWJOT/wL0FbY/Ru/hNi3rWf2q3tvxcUS
 Nhf5Fe72wZPhQ8m8GjfwJPciwxUs05AlUkfoiQVrCiySGjCiY1+Pgp3GfGvrIEbwtH+0cO915FE
 AXqXvNIFVDXniTTCuL/El5gzwRwJ7UyjQddF9RVyaNm8lYc7Pru+sLCEVDTlvz8Pzri50893nX2
 pVU3ZrsLxnDkHO1WGF/hBpcwE3LIUDrntPCa7u7KpsLB0F/p2A6We7evR8J81B3Z1FZc492sB3L
 5ZqGpZszzounlGZ/ykjC0WFQQM4YBLT9/tR8Bo0kDi3gVcAdPLbSR4SIfUeynZ2r7s8E3EAUgxa
 kQCZxLgwNLXwWl/ERkaL8lQNjnRsk8jikyhY+jz9U1yPHyJTK8U9SNa5YC8pjDeG/77sxiTBbXf
 B3P/xHeZSrfmHgbgoXnAPxPLLgEeoOf7uJb78TzkVx8jVzuWIu+8qTuZMvln+v02CfN1FsOqFHs
 4bdqiI4GzUnV+vlh1FzclHcGw5chhQ2HbDqfBqSW6UmuF3DtHiFpae6F9azJMdcLyfN4aHviEIH
 /ovZ6dnL0nwAkIKxSYe6CwovdllpiVM5kHm6AcpF2KCW5vx/g0M3lYg3ykFPy1wG64zDPDU/pqx
 bP3z4uOWYKYN/8Q==
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
Changes in v4:
- Fix sashiko reported bug 
- Link to v3: https://lore.kernel.org/r/20261119-hwmon-da9091-v3-0-15956035d7b5@gmail.com

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

