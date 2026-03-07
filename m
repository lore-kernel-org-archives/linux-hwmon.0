Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99F829B233
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Mar 2026 11:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883805; cv=none; b=tCeB3xb6++JWKZn7ettRZy8VQ569sYP71Rj+k8ULCJRwWcsg/g+mfh4NXKIt8VAH0dHQV1TxFfzxzcYOmJIzP8xiy/oVBJ2rIrSuK6irAdQMzeVdcpngFlJegbJXqmqaoy/n6jiiIBJDfN7VB6GDPEkuf0xVmVgwJHu/xwNhpaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883805; c=relaxed/simple;
	bh=IXfwFY3OESqP0kr8bRMSU8wArS0Wfr+8qwQ7WC7PpPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KOCp7T+Otlgurlz+m9N9cElZcWTeNS/pQdjGjgygTg6b37zvUTUMtSO9jcJTVrefwF/fjJxZ0W4TQ4hbwdxvxdOqJuA9lUQ+XZAm6+mMe36JWnJj4HCjfwiuomF1a63/w0N3ZuiAonndhDbZkng4xytbj3bBKG5hmWj5fdkrak4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqNm32ML; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqNm32ML"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2be1ab1fa7dso1682777eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Mar 2026 03:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772883803; x=1773488603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yQZpzM02+/x2oL0zfHuciQbGzUsWb2fbVWQdxt4B6g4=;
        b=cqNm32MLAdQ2xzdvEhoZNjAISZ/AexJE9NuF7QX4XEsnJ4c2qMySSevgJlftlBnlrn
         7P/GKlg0iD4ZaascA+9hgWk6kOW4BUAToENMkf3a/wlAoKeS7sMuuaD0AtUdY1RpSZMJ
         tQxWfbTesPmHyZZlTQJzxqz9vMbQmnEN0uhcE63i8RGR1ClbQRQtidBScHRCxDpZootK
         qXqhoPzmUWFjAxgUfOw0yfU3naiIvifntZUTKzuuS731Q2oBeulAEGmRWj/ETBOhIOx9
         6jrfkLzaWDeNV54ILh2O2cKS2bj4ysbPzdP6BVZTh3Cp1V/hFHW2BVC6P8pfGtd5zC0a
         kmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883803; x=1773488603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQZpzM02+/x2oL0zfHuciQbGzUsWb2fbVWQdxt4B6g4=;
        b=eZwTydCOC8DMJ2ktt5QmeE+tLt06TRxRYN/iEzxAKoe9BHEIk1WeM+Hiyx618rhlIQ
         Rl2ocoJBzkXK8ZCHjHDTERunSpmBMyYEgomyhfIYFvGQsbHQW5cDb00XAtnl7dnW/YHW
         CT8cD8VGxoLLdPZ6kGUKx4yY+mLiUGxB4+cQ/kU1yIc4LQ93TZzgLWzEozvYUWd3LkEy
         ip9Slj+A56BceYQY+0Y3QYaMQA8VaRRFqra5pz1SC1iIUqmYAIBzYCjh8coLNgeSuvTA
         vFZFkR9eerPR1+a4HMyeap4UVDggM0VthU2i5ZGRVaHq07jgrGuXCfrk/BMaI5zGcgpU
         364A==
X-Gm-Message-State: AOJu0Yx2vGmSS6ymg2gQA16DodHWxRoggf6GIAFApBPpNhErEuB9x0Bp
	XbWoFFanERoXugFBR53TPkRCXrQ8AhD3q/49EaEcItesF0u7bUSVC1JRIkSsgy1D
X-Gm-Gg: ATEYQzyz27oNiwwj2If/AnXWfWh2es4+/16UUloR7FFDXdi8TUinYM4JxHFVFvsPn2o
	pwF53vWhLGEpKgQgZhjDI0ETO/2xMbTBY12EqnXOF9iuMByAnYOT6FqR3tOh7wgsugfXO+odOKg
	akHui6nsB8SbftIVhb75RvItEWeneZe7TYK2kfnF0mLgpfuMUENbxFcS3UT/uztJOnIqzTmlRVr
	Eu/MMIkBrlr45Cq+n80wITOIpqMZUlEncxwaf7ZMHmF3lFkAgC3KORh/5grO3LxD77h2zhsWg2R
	cCY9vkyWCk7+abE24FTXXeYmmoNfA74YWTtV5Fn9xgNcnyntRZFOsuKPlv9TUEGOVy2jxVSD+0P
	YXdFLEXblcu9G+D8ziJrK3TeeFF9Cl0AIzTDKPLl2E0Mpx0qgOP6qpTB8C870Uq1HtNSbEUKTvS
	zPAFKFNJXMzJt0MgJUTIgaPdhHpvWlbLCeP5py
X-Received: by 2002:a05:7300:7494:b0:2bd:fff8:c7ea with SMTP id 5a478bee46e88-2be4e06a7damr2222785eec.38.1772883802769;
        Sat, 07 Mar 2026 03:43:22 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f80d72esm3737750eec.4.2026.03.07.03.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:43:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for hwmon-for-v7.0-rc3
Date: Sat,  7 Mar 2026 03:43:20 -0800
Message-ID: <20260307114320.1638058-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux hwmon-for-v7.0-rc3 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.0-rc3

Thanks,
Guenter
------

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.0-rc3

for you to fetch changes up to 25dd70a03b1f5f3aa71e1a5091ecd9cd2a13ee43:

  hwmon: (pmbus/q54sj108a2) fix stack overflow in debugfs read (2026-03-04 16:48:06 -0800)

----------------------------------------------------------------
hwmon fixes for v7.0-rc3

- aht10: Fix initialization commands for AHT20

- emc1403: correct a malformed email address

- it87: Check the it87_lock() return value

- max6639: fix inverted polarity

- macsmc: Fix overflows, underflows, sign extension, and other problems

- pmbus/q54sj108a2: fix stack overflow in debugfs read

- Drop support for SMARC-sAM67 (discontinued and never released to market)

----------------------------------------------------------------
Bart Van Assche (1):
      hwmon: (it87) Check the it87_lock() return value

Guenter Roeck (2):
      hwmon: (macsmc) Fix regressions in Apple Silicon SMC hwmon driver
      hwmon: (macsmc) Fix overflows, underflows, and sign extension

Hao Yu (1):
      hwmon: (aht10) Fix initialization commands for AHT20

Michael Walle (2):
      Revert "hwmon: add SMARC-sAM67 support"
      dt-bindings: hwmon: sl28cpld: Drop sa67mcu compatible

Olivier Sobrie (1):
      hwmon: (max6639) fix inverted polarity

Randy Dunlap (1):
      hwmon: (emc1403) correct a malformed email address

Sanman Pradhan (1):
      hwmon: (pmbus/q54sj108a2) fix stack overflow in debugfs read

 .../bindings/hwmon/kontron,sl28cpld-hwmon.yaml     |   1 -
 Documentation/hwmon/emc1403.rst                    |   2 +-
 Documentation/hwmon/index.rst                      |   1 -
 Documentation/hwmon/sa67.rst                       |  41 ------
 MAINTAINERS                                        |   1 -
 drivers/hwmon/Kconfig                              |  10 --
 drivers/hwmon/Makefile                             |   1 -
 drivers/hwmon/aht10.c                              |   6 +-
 drivers/hwmon/it87.c                               |   5 +-
 drivers/hwmon/macsmc-hwmon.c                       |  51 +++----
 drivers/hwmon/max6639.c                            |   2 +-
 drivers/hwmon/pmbus/q54sj108a2.c                   |  19 +--
 drivers/hwmon/sa67mcu-hwmon.c                      | 161 ---------------------
 13 files changed, 46 insertions(+), 255 deletions(-)
 delete mode 100644 Documentation/hwmon/sa67.rst
 delete mode 100644 drivers/hwmon/sa67mcu-hwmon.c
