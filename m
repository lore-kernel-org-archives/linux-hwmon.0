Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839EE3DEFFA
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 18:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779907383; cv=none; b=WZVMCJu+XNoKdCguQMDAkfNrvdecVMaBgJb/kd4pbCoQUxLj2iPa3n2z/D/q7CZvp0l6M+evy/3HzeVihS+WqZkWFQVWEnmzMk34VHHXQ8+WAb6n+WdzwQUotLjH92RpGDX8MirfCvX6y3PvSh2ch8z/9tTCkcSC5vDVB9x6V3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779907383; c=relaxed/simple;
	bh=OW/2T5ti5b2sbqhqvn1Ni3MKN8GMxrrtj3OHabtkuUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=US689HK2EeGGs/W536YO5zFVADjJoAKZYWOinFObLOX/VtBbSASHztjwSputbinc9Dsaha2KFVvefSEnPhoFmC4QJ03iJ7ol+QEKIlLf4B61jnEy/B3OmuI+tQ82ibqs09dncl/THTlcxqwxDxilf4zPbdFswGjiiw2HBKOQ7ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5hAehCZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5hAehCZ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso44334465e9.2
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 11:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779907380; x=1780512180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RXPzdN/PGoo61fXziAeWwTYim79RsPMwq42aKYCj7o=;
        b=p5hAehCZLm7whPpTj1A6tIipXZ1Cz8F82JZP1ZFkDadcrzacy4rW/R+MOALbZ2mEv2
         SN6Fi8zFaqGCdX9Th9hnzRGfllod+B+0ol0wcr04xUleRQrNkBWgO48pH9gQebvOyTtD
         EYke+KTd51j/liwuqps1kncHOlmmNy6WteT2Qbr6AUr3yOimpolmU8Y851gRXQU5+diq
         RLIkzJpuBENScjJdFpEZayRakkxWyknCrDUtbXtYPzQmoCSWXpUpxFqXJ8D2xtuCgaMY
         LFpwU0fIyaeoAVSDDDt4AzI+Kdr6NXXh3Fd6kCKzoKiql95zOjUGCHQQwRXRxM1fm4FM
         cKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779907380; x=1780512180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6RXPzdN/PGoo61fXziAeWwTYim79RsPMwq42aKYCj7o=;
        b=KSe3rrT3g+KvkoD6rFQhSRx8bFEmBHe2bdILa064jJ9jrHFwNsGgWiAP0Q/DHADYBx
         beAGqQ00MuzgspvPOAkVSoby2KUmdX8UQCe/gAluhoXM1hh7HYdwz0wTX91c3c/pgjKo
         3dtmcK/ZWOaburJE8J5FPuqEOh9gKEpUlGFaz+8uQZuCb/SIURkBD1+ksjMEn60qFQ/l
         0YRo/jekkIUlQ2wwVOivkhSIj2miBK9L27j3mWCn3wIb6yPW3TCBD6zlXPNP24MrL6VA
         cMOcOiNjdyA4RqQl4uEjx/D8qch00uviwLwCM3quos/L6ilTdDjUbIEI4K7yWe1PgPs+
         btRA==
X-Forwarded-Encrypted: i=1; AFNElJ9EWnuvNfdSJGyQ1e1zSu0qp3z/yl20CgMsd0Yv6bh3sz8+2Y+ToYZxlr5+o7dPjyN3M6i+DMuAlnl+sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbkFbwvxxO001vJFQhvS02ZpPvv7RazEZFJfSZkAFEipXsUTne
	hYrcY0qoQnUrXnF+vnVTXSrlt9kJwFr06Pae9QvqBAMDs9ByJWf5X6iU
X-Gm-Gg: Acq92OEpJSsik1J4NBuuszF34Dlv78WWHZrAcpyPSGJf9nBAFIpMXD+Ina91eDM9Gdv
	flvfuHMWTWicF9w63HqY2JJg7QPIbGcLY32VkVRvTxFwlyjIkjtAaDJ+bnbAMO+YiVuGl8tVsd4
	w0EBZv7XQ7+Q+Q8H9NQMC2kl3rUZqpbrsZ6mkUaseBzVyat8phz1q8uJQhkhJEITgLjlgDWmsXN
	BwqTkXpqDyZxERTnF+80UWS7SiQR6GtXiP8wwLtGyj8B+E7vwiss0iobLILLBv8MH+a00+1K90Z
	XVftw5dQW5dGZcCLL746QSyNgJTIpBsttyQrL/Jz1hqhZu67A5NUqcXhWQqUPtEMjiNGD0IHvwZ
	8FugXDPuipAJD/5hyaEA/DNguYLl6y/nzvaOf/nrKWma5xuxs7KWb2Og4E6GQL2d/sNQu47NpQC
	O1xZKjPQBygZEBpbY=
X-Received: by 2002:a05:600c:4510:b0:489:1c1f:35df with SMTP id 5b1f17b1804b1-490424a682emr379619095e9.10.1779907379674;
        Wed, 27 May 2026 11:42:59 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490809ca202sm35312935e9.6.2026.05.27.11.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 11:42:59 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: 
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Andreas Klinger <ak@it-klinger.de>,
	Lars-Peter Clausen <lars@metafoo.de>,
	linux-iio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maxwell Doose <m32285159@gmail.com>
Subject: [PATCH v2 0/3] iio: flow: Sensirion SLF3S liquid flow sensor
Date: Wed, 27 May 2026 20:42:51 +0200
Message-ID: <20260527184257.141635-1-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260524205112.26638-1-wafgo01@gmail.com>
References: <20260524205112.26638-1-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

v2 addresses the inline review feedback from Jonathan and Guenter on v1
(see https://lore.kernel.org/linux-iio/20260524205112.26638-1-wafgo01@gmail.com/).
Per-patch replies have been sent in the v1 thread.

The series is dropped from RFC: subsystem placement (iio/flow/),
channel type (IIO_VOLUMEFLOW) and the new subdirectory have all been
ACKed in v1.

Changes since v1:

  * rename driver/binding from slf3x to slf3s (Jonathan -- the
    marketing family name is SLF3S)
  * fold MAINTAINERS entry into the dt-binding patch instead of a
    separate 4/4 patch (Jonathan)
  * add SLF3S-1300F support (Guenter)
  * dt-binding: split the single "sensirion,slf3s" compatible into
    per-variant compatibles (-0600F, -1300F, -4000B) with a generic
    fallback (Jonathan)
  * dt-binding: add optional interrupts property (Guenter -- bindings
    describe the hardware, not the current driver)
  * driver: seed the variant from DT via i2c_get_match_data() instead
    of probing the sensor first (Jonathan)
  * driver: detect_variant() now trusts the DT-supplied variant and
    only emits dev_dbg() on a sub_type/family mismatch (Jonathan)
  * driver: per-instance crc8_populate_msb() rather than a global
    crc table (Jonathan)
  * driver: declare cmd as const u8 [static 2] in slf3s_send_cmd()
    (Jonathan)
  * driver: switch to fsleep() and sign_extend32() helpers (Jonathan)
  * driver: use named initialisers for slf3s_variants[] entries
    (Jonathan)
  * driver: unsigned int loop counters (Jonathan)
  * Kconfig: tab-indented bulleted list of supported parts (Jonathan)
  * ABI sysfs doc: _scale entry folded into the shared block,
    _raw block kept with its own KernelVersion (Guenter)
  * re-checked all scale factors against the SLF3S datasheets
    (Table 16 for -0600F, Table 15 for -1300F and -4000B)

Patches:

  1/3  iio: types: add IIO_VOLUMEFLOW channel type
  2/3  dt-bindings: iio: flow: add sensirion,slf3s binding
  3/3  iio: flow: add Sensirion SLF3S liquid flow sensor driver

Tested with an SLF3S-0600F on a TI AM64x platform; W=1 build clean,
checkpatch --strict clean, dt_binding_check clean.

Thanks,
Wadim

Wadim Mueller (3):
  iio: types: add IIO_VOLUMEFLOW channel type
  dt-bindings: iio: flow: add Sensirion SLF3S liquid flow sensor
  iio: flow: add Sensirion SLF3S liquid flow sensor driver

 Documentation/ABI/testing/sysfs-bus-iio       |  11 +
 .../bindings/iio/flow/sensirion,slf3s.yaml    |  68 ++++
 MAINTAINERS                                   |   8 +
 drivers/iio/Kconfig                           |   1 +
 drivers/iio/Makefile                          |   1 +
 drivers/iio/flow/Kconfig                      |  27 ++
 drivers/iio/flow/Makefile                     |   7 +
 drivers/iio/flow/slf3s.c                      | 345 ++++++++++++++++++
 drivers/iio/industrialio-core.c               |   1 +
 include/uapi/linux/iio/types.h                |   1 +
 tools/iio/iio_event_monitor.c                 |   2 +
 11 files changed, 472 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
 create mode 100644 drivers/iio/flow/Kconfig
 create mode 100644 drivers/iio/flow/Makefile
 create mode 100644 drivers/iio/flow/slf3s.c

-- 
2.52.0

