Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591333;
	b=mervkpS0ejyM2wacuLQFTjyFgG6wLQVJxYbFrzmKlck3um0Kf13dvZ93IkptiI9WPKvr
	 D5RBHnfOAoqU35ZHw/sK9qgszvEM/en96KAnd1UyOLxjqN4qONk5U9+VMbqrsJT10H70Y
	 2XPSAdwb5YxMc664E8C9cO6dPUXkPyFf3SxYcNvA3WqCcRo+QSYguyfDK7gt8fNNqoxUp
	 fpEqo5bwZ/W8qZIsEYuuGkBuFA8s0qkALrVzoD7kx/xPwi/dhYGYCv9QsP7+Vp/Sq1sxH
	 oBZnLN2G5nAPnQzzWed78wwNQn2ilDiDeVIkIh6kdrziB6I0iXilG+p4C/1/ZUMQlbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=1mqak/oTHzzf33mZlhyESkRVPDIMxG41q7JJp3wZRXc=;
	b=yb41BAosDNnaRUzTcsJBID6hJTUUgY5x/pQr5MowVAVIzYgFe2xmZOFxAwXMXg4szvtS
	 TRDFLnfBMd12gY4gjkG/0OmGdtn05yWkmXIyicFjKyd3UcPBvOg+2VkxVxhEXlqqhmyie
	 pHicjotzCr62ssuQEaSQtNUBGo82Z1fQCfW3+ffFm8rPvN/dyqCuzF45/TtDaWgTUMdR9
	 v99BMdLKiVHt3iPAvlcLRCVCisUhnBcP6BWYm09g9SozIb/OvHGXwb17TuwsJbdhM6FUZ
	 DoPAXGbSEsxVMBRo4SboT65FN7pQ2+esqecT17Ty3ekLTsmBNnkTY5EI0vCdJjp88WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=APGRYVVI;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EF4606A321
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 07:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8EF4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=APGRYVVI
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492690dd5daso4076417f8f.1
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 23:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795591331; x=1796196131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1mqak/oTHzzf33mZlhyESkRVPDIMxG41q7JJp3wZRXc=;
        b=APGRYVVIm1Ke5XKCEvoemamE7OVMlp1jxFmv+I634jpq4E0mDh/I94JcmX2VnyHJ/7
         /Q+AquHUYDya3NbI57GAAvqSopUHf9zP8ACSRQyVeOb1wV+A+AbQRrwJa/XniOTRhFg6
         zxOFFnKsZkqMbaRk9R0KM0dwwzju+B1ikWgMCbY7kAoh/zk2Y/jEEf+wwohmh1pwoJ3Y
         yYWTxCg/SEAjOc7pyiLJMimkGBdHGaK8EJP9z80AJ1MZr96ujQlYQLrfZLkQckAeVQgB
         gszx40G6B0W8MnZ6otBlYsHIVWzuiOEJecDKRIVHqVZTyBhDtT8rr0JJEMBg7Xi6PPkT
         DAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591331; x=1796196131;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1mqak/oTHzzf33mZlhyESkRVPDIMxG41q7JJp3wZRXc=;
        b=RQ2q0KnbdTYDdkblayWATYonvMqnMvsZhMIDO/xkXO6xOA0x9n4uzRNKSbOzmhD0rk
         ZH6lipAaJi7IJp+HqV0PExjJ9wWfkeDX0rciyXXQ4vpraMoxukfYYGHXJD58PoMBd3nl
         oGk6lL5LuUALHhqN5vJ3hUleosT1fArp42bYLHAeG2uzm59t1cQ58hthsCDwZwTVdPtM
         rDnik+sIMEYQbUAksgJwiIJ+yLekMc7a8RVle/vyoW7W3dCNNGRXZd2GF1j1BtCdNoHZ
         4Y1YoackP1BB1jKxBLsb3vDyA80pc3ZeAqQwBGq89OVBJGBVkeT0Ns0n6+ixzmP3n4uv
         1uOw==
X-Forwarded-Encrypted: i=1; AL+hErGZsduGiBGeHWzWCrb2wKJy/mpb8z1KWY5AN09d+ZAuTVPN8lv3iU4llA5VqY8aw/SV89mAejEe8d26ag==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Dxs673dOEt36nPxc33i9D5Z2rJ/N4vjAVhPnN/6i/0gUvNcjF
	bordyt/UWxrz1QZgUc8qbS9UrBqv5j6wIbC8wv0NzUF8jSK2voyGkktiiOuIJUA+JmU=
X-Gm-Gg: AZFdTZeYDheotqtcnTD6ukAW94Lj7QEF6Uv6HH/vfvam3f9UueoCaMKgaQ3jl54rHMw
	rp8gesHZoOnCnFpGAwVH37asQRY10DG4aOHQxosyS48PMBS2AlYwDdq/z9G27nY6c+xi0sbzYUk
	yrCV3PT+k+8+LOI1X6PD+Z4QpBVFpIsVFJ7kAKLhyHyrKjgkdFzWfPsGlHeo9CPJ3SlEOsPa+bO
	srzY8St4oEteMc/R0IpNG4dsSFptMH+DPWyG9jjGRq7N1qnIQbm9kGiz8xbt27VbCFVvDFWfJ4D
	wgM5b7JJ04kO/oQKO5P3HzQnh3A48BMAIaEf3TGU8YcibjUtuk2biemj/o0KbM4aU2GWq/Ay9Xs
	TtA3fkI7ZCRZoLrrS8ZpOP8enZIkulgE18IJGD/njKkuvbY3TK6aLAbxlDbsO6x7IanufUUSykG
	irDb2XYyWJmGAmIublH46Ob6fmwflcJ55xowgE4UCrqOEGK4Nj5B3x24kfcRMk9H5WTlXPdFU2S
	PQlnebLENS+o9w4kflFPo1M/ehAIl1EVRpIuUFfR+viRfgumG3VFF72o2hMcf06K0/piJPquhta
	e0iXoxRzg8898WRHj/uRbUWwMQWnei60ryt9CuS8De+C+8DoG7cx+gw=
X-Received: by 2002:a05:600c:3b1a:b0:4bb:875b:3d91 with SMTP id 5b1f17b1804b1-4bb88820bfamr357770365e9.30.1795591331274;
        Tue, 24 Nov 2026 23:22:11 -0800 (PST)
Received: from localhost ([2a02:8071:6e30:8500:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884b8429sm780146835e9.14.2026.11.24.23.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:22:10 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-input@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Aleksa Savic <savicaleksa83@gmail.com>,
	linux-kernel@vger.kernel.org,
	Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	linux-hwmon@vger.kernel.org,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	"Christian A. Ehrhardt" <lk@c--e.de>
Subject: [PATCH v1 0/9] HID: Make driver_data in hid_device_id a union
Date: Wed, 25 Nov 2026 08:21:32 +0100
Message-ID: <cover.1795589119.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3641; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=WKAFjahqsz1WADW4GQZA2AqcKEs67qPodb0ziWRr2bc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBox8D3OsqGVp8d9eNjV0Xl3jDEO2G2/iqVEi5 ZFnCUOaW1iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawaMfAAKCRCPgPtYfRL+ ThbLCACxJyH7addcG5QUOzghaAV3UIuswR+tsPVOGz6kUyM+BDF2vXNYHYrOKjIk49Yjd3jnIPm +bVDgcXYYG1/XQnI6911gqpKD0ku/4iEz8G1bgMFiNJY2RaUfcBga4hA4z7SZtoo3tB95V+WB0z qp2+PeD+FsIx9C3VmOh3kTonHyFMJxarbh7N/v4RhbeeGVVuXa0XgMunhqB3BFmag5t1mFdZm/9 +3wO74TfeCeL+rRKj+x+LDAtrtHrc3FYXVo8I67CGAIaQlTXo9U74eG5f8//8dboyg/wx260KNF t2VCkGPI2ac/ZCBjcZu9wrDCYDLtceoPubxfoUWbYQv1yOsd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

the 5th patch of this series replaces .driver_data of struct
hid_device_id by an anonymous union. Drivers that store pointers in
.driver_data can benefit from that by less casting and still more
implicit type safety as something like:

	struct sometype *driver_data = id->driver_data_ptr;

is catched by the compiler to lack a `const`.

The (IMHO tiny) downside is that with that union initialisations must be
done using designated (i.e. named) initializers. The first four patches
implement that for the few drivers that don't do that yet, which IMHO
could stand as improvements on its own. Patches #6 and later convert
drivers that store pointers in .driver_data to the new .driver_data_ptr.
All patches intend to have no effect on the build result, so this is
only about easier source code and tighter compiler checks.

My original motivation to work on this is that the result also works on
machines with CHERI support that have sizeof(unsigned long) <
sizeof(void *). It's still a long way to get these running mainline
Linux but the nice thing about this series is that it works towards such
a future and improves the code for non-CHERI architectures, too.

Some of the existing initializers use an unusual coding style. In the
first patch I converted that to a more common indentation while updating
to designated initializers, in the quirks patch I mostly kept the
existing style. If you have a strong opinion there or think the
opportunity should be taken to convert all such arrays, I can do that.
This conversion is also the main reason that this series doesn't have a
diffstat with nearly an equal number of insertions and deletions.

The dependencies are as follows:

 - patch #5 (HID: core: Make driver_data in hid_device_id a union)
   depends on patches #1 - #4
 - patches #6 and later (...: Benefit from pointer typed driver_data in
   hid_device_id) depend on patch #5.

I would expect that all but maybe the last patch go in via the HID tree.
I can resend patch #9 to hwmon when its dependencies landed in the
mainline.

I build tested this series on top of next-20261123 using allmodconfig on
arc, sh, alpha, arm64, x86_64, s390, riscv, mips, powerpc, loongarch,
sparc, m68k and parisc and there were no build regressions.

Best regards
Uwe

Uwe Kleine-König (9):
  HID: asus: Use designated initializer for hid_device_id
  HID: i2c-hid: Use designated initializer for hid_device_id
  HID: input: Use designated initializer for hid_device_id
  HID: quirks: Use designated initializer for hid_device_id
  HID: core: Make driver_data in hid_device_id a union
  HID: steelseries: Benefit from pointer typed driver_data in
    hid_device_id
  HID: tmff: Benefit from pointer typed driver_data in hid_device_id
  HID: wacom: Benefit from pointer typed driver_data in hid_device_id
  hwmon: (asus_rog_ryujin) Benefit from pointer typed driver_data in
    hid_device_id

 drivers/hid/hid-asus.c                   | 199 ++++++-----
 drivers/hid/hid-input.c                  | 114 ++++---
 drivers/hid/hid-quirks.c                 | 400 +++++++++++------------
 drivers/hid/hid-steelseries-arctis.c     |  39 ++-
 drivers/hid/hid-tmff.c                   |  22 +-
 drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c |   2 +-
 drivers/hid/wacom_sys.c                  |   8 +-
 drivers/hid/wacom_wac.c                  |  10 +-
 drivers/hwmon/asus_rog_ryujin.c          |  14 +-
 include/linux/device-id/hid.h            |   5 +-
 10 files changed, 438 insertions(+), 375 deletions(-)


base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.47.3

