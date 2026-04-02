Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFA636CE02
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Apr 2026 05:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775106935; cv=none; b=HV6ri9n4zIdLSv1WK87757He/+IWrSdMKmlpa0DFIJYSo3kzRS3qJmL6TDi1HXXJzILV35/NCW1fYyFpZOsLrWwjangv9cq6zY2ShsymVaY6N1xSuB5j/Zx7DzryGrD9PbqaH8byAXO2Ybx7hIDAJZ0vIvdIkKyG3I/PcvdD5BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775106935; c=relaxed/simple;
	bh=HVoeiC7t5M0u01gC8ZWrF1ZSdndrYAnSTfQH8ssTUVw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BDukQXCyq0Pb3lJ9cFCmtfrpY5pM15J5L1gCG/5EeIo9fd6mNn0DHRgicA0fL0rAzLXFMU1lUkPbWRQRez4sV9m88SBFKMSEyidEpI5xqd1taMtkOb/Bwfg9wA4CjtOLvVFViU9SnAoyW9qdGMbMPuTMACGQ6039EB95TdDBkyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aexidzYF; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aexidzYF"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35da2d35eccso263047a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Apr 2026 22:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775106934; x=1775711734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9VRhm1iFIbmMSuYjrKLq45KZf5lir66/ZO2vyNWUJDo=;
        b=aexidzYFvmt3YUxjauyrhjoe8SwDNNMksF916eZytT+OIQSDwv+fk8dut+4JpZJdf1
         FJ6tzmwntIrY5zt/ua4BlUIpJ2yr7BUK5vLmntaa6lM17aaSw1N65UnXEtmU4wQDChPa
         Hrp6o2VIXdXnE9X1zAmRB587COYxbWO3Rc6t3wbJcw9ZFYbhRbcLlz/1gfvPVHNJ9jLv
         jM2tr/bO/UPDAKTx81hkgJrfHdJlbUuBPh0WyDRibWzEJ7MRFDe4JIYLR0neXEaPYw7E
         VeLIu8Zo/y8OYP0GsN3gtGe2cj7cRi2CVT2rxGPmtrh0yvE2JDztD7sOsKR2AuvM/yjq
         ENRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775106934; x=1775711734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VRhm1iFIbmMSuYjrKLq45KZf5lir66/ZO2vyNWUJDo=;
        b=oadP2gGuEgRxH7h2OTFkWKrQKi6lnsiASa+YHZKjhfVR0X8L0gR6imFA1BseF/2lG1
         VxmQ6H+XDBms2EN5Pu2q7JMRLa8o1tSzyKddCcqZmYO0ozOyGA285hjRLyDxhxjv7kuT
         MsutM9GTJSjarln7+LIZaSgwGPdiB+dB2ZnkAxhyI4sgiaTHL9hbsImv46zlxOLmB7Ty
         qtj8UwKcj2+VCz84sHDgoyfRyrD3csz+zterDBRLgwWzWEZaBsbPdKse3l7oXTRPUBrX
         ahTexF5HmuwVKdsX3dz/9sTbPo4qQOCEUzksmMmyaEcYuTAPax0HGAQDRgOXwiEKt+7U
         wVFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfLk1+LE+wVhkY/3YlI0b0soUH9pHVYxRq7+A3ssLdVsY6TNJp8pQ2qQAoFDGTrm/4FTgcB/gMu/ZWeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMVKqTVOVBYzhxqWiaQ0fbNxroEkiZ4Nb7wD8TqYZY7hfEU6G+
	8gwGS5GF1d96twhksBdd8Sh6EIVwbodnkeuAH94FiERfDlp/xCM5hoVR
X-Gm-Gg: AeBDieu7bkiTdKNt5V3GnXRv55DGjhcf79krPmA3lx7h8OsklP6DT+1pYnAN7R3WiIg
	iUInBPzBNfW8E42WhirZgvi1L4NxHQwV1+0/bcWUUdm5xfTr+Pgs9OGJplBCD+LUjcArhLdtYAM
	KaqQRLfeIQDQQ1yiB359htHtY+JZ0dzT+Ph3EoS9lTJu+PNXKEMDfLhrkPh6wT8gU5g582EHjWf
	NPkoyou1pJmPnneQSuxPZ2/g4tRApj+TjuJaJMNdCvNxqCS1utNINE4St6zkCYW9Mh+T1Fb7CRt
	k/mDWDxkYC9rosjDBx2mlXqokEllC5FcMWctgWkneV4Lwn33kt6B3lOblxfBLSPreKK1pW9bcQT
	UaD9vAhzdSfw5oHaIR8cUxdk/9zdMjzgbCJehOr/0g0RKLypg3CaD8khqDyl0Xop7hrwE3i+Bdk
	yv84h2WyZ/LBQa7+yZXtX9+s+pnOKCHRnngLLsBBHlRPsOayaYXz36NYliEGY476e2Fg==
X-Received: by 2002:a17:90a:c110:b0:35b:9c97:3d18 with SMTP id 98e67ed59e1d1-35dc6eae327mr5651672a91.12.1775106933827;
        Wed, 01 Apr 2026 22:15:33 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe93661fsm6902107a91.11.2026.04.01.22.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:15:33 -0700 (PDT)
From: a0282524688@gmail.com
To: tmyu0@nuvoton.com,
	linusw@kernel.org,
	brgl@kernel.org,
	linux@roeck-us.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	mkl@pengutronix.de,
	mailhol@kernel.org,
	alexandre.belloni@bootlin.com,
	wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH v1 0/2] mfd: nct6694: Refactor transport layer and add HIF (eSPI) support
Date: Thu,  2 Apr 2026 13:14:40 +0800
Message-Id: <20260402051442.1426672-1-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

The Nuvoton NCT6694 is a peripheral expander that provides GPIO, I2C,
CAN-FD, Watchdog, HWMON, PWM, and RTC sub-devices. Currently, the
driver only supports USB as the host transport interface.

This series refactors the NCT6694 MFD core to support multiple transport
backends and adds a new Host Interface (HIF) transport driver that
communicates over eSPI using Super-I/O shared memory.

Ming Yu (2):
  mfd: nct6694: Switch to devm_mfd_add_devices() and drop IDA
  mfd: Add Host Interface (HIF) support for Nuvoton NCT6694

 MAINTAINERS                         |   1 +
 drivers/gpio/gpio-nct6694.c         |  26 +-
 drivers/hwmon/nct6694-hwmon.c       |  21 -
 drivers/i2c/busses/i2c-nct6694.c    |  26 +-
 drivers/mfd/Kconfig                 |  47 +-
 drivers/mfd/Makefile                |   3 +-
 drivers/mfd/nct6694-hif.c           | 649 ++++++++++++++++++++++++++++
 drivers/mfd/nct6694.c               | 180 ++++----
 drivers/net/can/usb/nct6694_canfd.c |  18 +-
 drivers/rtc/rtc-nct6694.c           |   7 -
 drivers/watchdog/nct6694_wdt.c      |  27 +-
 include/linux/mfd/nct6694.h         |  57 ++-
 12 files changed, 829 insertions(+), 233 deletions(-)
 create mode 100644 drivers/mfd/nct6694-hif.c

-- 
2.34.1

