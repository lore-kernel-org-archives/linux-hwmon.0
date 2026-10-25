Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897570;
	b=2o7HMVhrZE4IATMdyFDlkyPReFXZ2FcwgryQJIZ8mCMMmHcVXEktFe4wBkw2fSmMBuZx
	 Qes3vCVE8ipU+DtUrwdZxJnRgPaK2bjUGieo/dO21/1h0gHmPsgnNGOQhN5ZYdHlLVlJa
	 jffS2Gwmf0gE/azlFQ9QdWAsSpLWmNvihFIPba1S5UN4SPn5TIBJmZdWZSMHjyPaKhOH3
	 cEoK1Z5DNgOX1+VrWj7Tq1YeyPcagYNrcvzpcNzC2O8AbwddfsadULdHdApzj9rvMlzsu
	 1RVRCYKraf88Tse/zsQ0N/diyoGkcjJ1eTFph1qIYDLqG2f9AWCckcjwDu3JGOEv8lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=lQPs+jEbXBZhr1n+6NKSHLzdxjjdigtdbOq9zqTS+hA=;
	b=MA7bbpKzgmk/WNO2eFrOF6SIk3QzzkGr9YPJzGnOAqPQDv2taMvoiALyVlDvK0OHGFue
	 CPkzKYE69PKSBUQcUc2m4CA7j2AmjdlRAvXlgl5cJK4rE+vhlowbaWWQOr8EFDgxSOIU6
	 tfn3e40ZnFMTXPb1ByuWJMZpy1jn7NfCkSdDgGR068R2K/OfyNumU7TJJ/mtCnhnKjUdJ
	 WFxmzwqniI4GPvOfZc2TTF0y7TXFxDsvOnC0xHgZ6bp/FxDiFcep+te0DrDvFgNI7giXh
	 +uyzVduNN3coqglgTQvN50VUmxkFgfKS+y3YOF9xy5ZUHoeYQaH1vPw4zxkeOXbkuMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gU7Z1vZm;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC573606A31B
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC573606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gU7Z1vZm
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3514b90bb89so4737660eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897569; x=1793502369; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lQPs+jEbXBZhr1n+6NKSHLzdxjjdigtdbOq9zqTS+hA=;
        b=gU7Z1vZmR0Iwt5f9u8AMyAazmCJce7TybJvO1MVFdKu/M2D2RLfCdVJppnJ8mmPVWc
         fAoDGXXKyzgXI5v6QqX9KYoSdvQ+wZ2TC/SLtOb4UjoZVDA/LS9HK093prL8iVMyc27v
         ZLnizMbKhu6flpUk283z5hexXNsk++q9ILpRTcIXNEmYJNaGAuXDH6hYc9U0LHOQfnJ8
         hiqvx5s+b1MoD7nZm3LhUejEylFd2QCHniaA6Nlu0SPuB982Mfu26+OY8cgSQCz8bEVf
         0S9+fR6YKaIEiYIHOcc+fFF9YRWshwssk9iY1qnBzY1AeHgYTcqYLsmfXlYFa5gKGqkv
         zm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897569; x=1793502369;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lQPs+jEbXBZhr1n+6NKSHLzdxjjdigtdbOq9zqTS+hA=;
        b=O+oXX8JTZQCIGwBwtsN8/5pbiNGdqHNMYMVqP9/6F/65Cp8ia3D4ffWx/nhH3R76d3
         f3u/FFzbWocbuO62TjwjWMwkSKTw+xkvqPniNxJIPa4fQSQbMsAKESKQ3v7BrUxgSjlJ
         KsdTT+RvbjW/scwYj4opLju4Ce7mVDgXdoMGQoy2lmD9SXs1RkoOipGcq2PIkReWUTdL
         jpYGtj3WIg/5S6/xbUjoXcMNHEo+Xq7J6M92aEbgRyqdhg581YecDbVTcsWO0RzgTZie
         gVATfdIQ3r3IVTnippGiRzeyYNQmMYh4N3/Zboi0U+gzXioYd2zPykQyTig66a+j0XOZ
         o6Hg==
X-Gm-Message-State: AFq9FYKaB2Xsi8e7vHBWFuNCoR4iSFPm60TM6dP6TR8g5i4cZR2L1XS5
	jyNxG7lF1N/FqH7353BI1psBLgDMB03yKgWb4jvmSXJZx4QrCvi4nDhC
X-Gm-Gg: AYBFou17QcXfBojcNEdk7UM0Ymsbxu15Lym6cHmnXXAcN2fe5OvpDDfgULM9+OKj3xG
	8qM8h8ROEEHpESEEtPVgKUROOK4MmtTaHtIGE1KBKJcwkAE7Y4qFu6hrKGUN4HSrSDE5rClobeE
	SIJ9G0fgZpB/Dnbi+x37W/u99NeXf3rl4rvazqojulLYfy1awUiB/wbl74qOa1uV069i4K9Eghc
	rHcH0YhR1beHF3Mgt2Q2SBhawZMfSzkzgjhd+RoqMzOTYPZjfuG0vXeFKz+1p5w1FS4of7NnWcX
	HW84p5kQ2zDXN0EoaebQ7wpZqBUXFUntspXwJFYqbUAtN/87s5Xys5o+k2VbziNwfNhA3waXF8Z
	lp7saXO1uJ1MLes0CFJx4tiYbnI078cdwDqNuEBgPKWJ3WCcoIkUwoI1J6nx5G+AoSUaxGpMIh5
	xxrgMGdix6QL2HrjcV7sAwUO5Sw01HneFvAAJklv3cMxQUr+5dq4LvyAOMs7ThLjdDbi9t1B8cW
	B64oF8aqW/S2hNBu4fxJXJNLJIDPC1OOVF9CqpnMTpHTu1AO30hAvSWP0YFFurDdQFlMm5RbbtY
	Wbv+N/qflaotCk1MSNXuiqc6ephrnoZpbT4mhvfoogk=
X-Received: by 2002:a05:7301:2730:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-369e845b09fmr5185274eec.10.1792897568651;
        Sat, 24 Oct 2026 20:06:08 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:08 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 00/31] hwmon: convert i2c_smbus_read_block_data() users to
 pass buffer length
Date: Sat, 24 Oct 2026 20:06:03 -0700
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIABty3WoC/yXNTQ7CIBBA4as0s3YSIGLEqxgX/EztqAXDtGrS9
 O5FXX6b9xYQqkwCp26BSi8WLrlB7zqIg89XQk7NYJQ5aGUMDu+xZGQTUcYwC1byCcOjxDsmP3m
 0dh+cdvbolYNWeVbq+fM7nC9/yxxuFKdvFtZ1AwNCuJ6DAAAA
X-Change-ID: 20261022-hwmon-i2c-smbus-read-block-data-554b91958a09
To: Guenter Roeck <linux@roeck-us.net>, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Andy Chung <andy.chung@amd.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Daniel Nilsson <daniel.nilsson@flex.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Convert all callers of i2c_smbus_read_block_data() across the hwmon
and PMBus subsystems to pass destination buffer sizes, adopting the
4-argument form introduced in commit 68f382641f8c ("i2c: smbus: make
i2c_smbus_read_block_data() safer").

For drivers that used intermediate bounce buffers (lineage-pem, lm93,
and pt5161l), redundant buffer allocations and memcpy() calls are
dropped so data is read directly into target structures.

For drivers performing string comparisons on the read data
(acbel-fsg032, bpa-rs600, ltc4286, max15301, pim4328, and stpddc60),
ensure the destination buffer is explicitly NUL-terminated before
comparison, and pass a length that reserves space for the terminator.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (31):
      hwmon: (lineage-pem) use 4-argument i2c_smbus_read_block_data()
      hwmon: (lm93) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pt5161l) use 4-argument i2c_smbus_read_block_data()
      hwmon: (kb9002) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/acbel-fsg032) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/adm1266) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/aps-379) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/bpa-rs600) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/crps) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/d1u74t) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/dps920ab) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/fsp-3y) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/ibm-cffps) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/inspur-ipsps) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/ir35221) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/lt7182s) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/ltc4286) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/lx1308) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/max15301) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/max16601) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/max20730) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/mp5920) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/pim4328) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/pxe1610) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/q54sj108a2) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/stpddc60) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/tps53679) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/ucd9000) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/ucd9200) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/zl6100) use 4-argument i2c_smbus_read_block_data()

 drivers/hwmon/kb9002.c             |  6 ++++--
 drivers/hwmon/lineage-pem.c        | 17 ++++++-----------
 drivers/hwmon/lm93.c               | 12 ++----------
 drivers/hwmon/pmbus/acbel-fsg032.c | 16 +++++++++-------
 drivers/hwmon/pmbus/adm1266.c      | 25 ++++++++++++++++---------
 drivers/hwmon/pmbus/aps-379.c      |  3 ++-
 drivers/hwmon/pmbus/bpa-rs600.c    |  5 +++--
 drivers/hwmon/pmbus/crps.c         |  5 +++--
 drivers/hwmon/pmbus/d1u74t.c       |  8 +++++---
 drivers/hwmon/pmbus/dps920ab.c     |  6 ++++--
 drivers/hwmon/pmbus/fsp-3y.c       |  3 ++-
 drivers/hwmon/pmbus/ibm-cffps.c    |  5 +++--
 drivers/hwmon/pmbus/inspur-ipsps.c |  4 ++--
 drivers/hwmon/pmbus/ir35221.c      |  6 ++++--
 drivers/hwmon/pmbus/lt7182s.c      |  6 ++++--
 drivers/hwmon/pmbus/ltc4286.c      |  8 ++++++--
 drivers/hwmon/pmbus/lx1308.c       |  9 ++++++---
 drivers/hwmon/pmbus/max15301.c     |  4 +++-
 drivers/hwmon/pmbus/max16601.c     |  7 ++++---
 drivers/hwmon/pmbus/max20730.c     |  9 ++++++---
 drivers/hwmon/pmbus/mp5920.c       |  3 ++-
 drivers/hwmon/pmbus/pim4328.c      |  4 +++-
 drivers/hwmon/pmbus/pmbus_core.c   |  3 ++-
 drivers/hwmon/pmbus/pxe1610.c      |  2 +-
 drivers/hwmon/pmbus/q54sj108a2.c   | 27 ++++++++++++++++++---------
 drivers/hwmon/pmbus/stpddc60.c     |  4 +++-
 drivers/hwmon/pmbus/tps53679.c     |  9 ++++++---
 drivers/hwmon/pmbus/ucd9000.c      |  8 +++++---
 drivers/hwmon/pmbus/ucd9200.c      |  4 ++--
 drivers/hwmon/pmbus/zl6100.c       |  2 +-
 drivers/hwmon/pt5161l.c            |  5 ++---
 31 files changed, 139 insertions(+), 96 deletions(-)
---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261022-hwmon-i2c-smbus-read-block-data-554b91958a09

Thanks.

-- 
Dmitry

