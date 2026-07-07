Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3D53FDBF5
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Jul 2026 12:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427156; cv=none; b=NS+yOlZfsJ18+VCSqqRD+JxYckXEydnf3lfEC0StMnLwnJ1jsYnTlF2Ijp7/FNzVg7oOh2nKAptRveWqKTgITKcqYsKcDEyC5MIdrNy+GgiXoLj6Bz8jSmauiDbpCBjr6jo+HKljeCj5Ot05d+dCxE47LficleWL74cSl2BxWjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427156; c=relaxed/simple;
	bh=G8k2dlXjt0dLe90/5TVs36FBriLIb1uJtIxBcEBwrSE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=m7ad6T2EWAH4PPrvikajVxRfEATQf0+s+X1kzSM9dvf1BRxXHrXWyirCrWz7J/kJtbHqZuDOAjxypg94dREVM8fdztyvuEvE4ww7LoivIxJD29KOSMXhgRPZ9HsenoR5dtWoe2O/gMgZcNG6/Jf+kzCZyw6Nh3TDa3XDCi3zaTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDoQnHds; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDoQnHds"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc97653887so24733235ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 05:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783427154; x=1784031954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=26bYGBBUuDRN4zMcNcg/2GhRbjV+wNXZETCzG6QZQtA=;
        b=dDoQnHds6W63tH1uxUN3gRkykNDvHn3wLy7Ft+Q4GoN7pfYJk/yH0cK3BxAiW6xOEJ
         emZZlXc+vWjISq3XUCg1Ulbc0FM3b/K/n72Nf5xRfHYqFRzHq+P8FF9j99rhvT2KPCyi
         qZ9rlYL3MMPt46eCEVRbZHckxS6RIzqc3Omll+MYJ0f7ds//eO/ma+7LtRXcj6bSqBVJ
         k1Fwu1PS0A31msdz61Q/HEBlErZ+Qin4sXciGmg9U8aDQoR3JdQT6f3GWSzahLbXZfJ2
         kESHH/YU60dq3XzX530MXeimvQ+fd09uohkhZn6bwgAm8M3/+wOsRsWwYiiwhzOjfIUO
         68Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427154; x=1784031954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26bYGBBUuDRN4zMcNcg/2GhRbjV+wNXZETCzG6QZQtA=;
        b=WRWTI8hJkzX5DWnnL5JXKYEB51iijtzEpwUEruvaYYz3ou6AQcywUcXLUAGdWYaoz3
         owZfqW7GApk3J6HtS36XJfljIXPCkHM87CLl6PdPWK8rbO9mFcthbpdFU4eTJqP4sgBD
         wcoaYsaGsiPxk3UZ21Z355XBtE1qxIlysj0NkMB4hQngABjy5SWyouJobzMBbm5zm7sk
         iQeS7K24p1x8pYbzdUxLl6QClCdvluT6rMDvNtX9bBOt8kRzfoMVwK0UErAv9qjXaJPA
         xUbAv9zcy7aUK9Ubx46MUhVqnMFd4pKbvRJ6pqXixQ5QRU4frz+9a/u8Fe7lM/Ksn6ZN
         RF9g==
X-Forwarded-Encrypted: i=1; AHgh+Ro8AVjE5D7+rNi2WlBPYWAL0A0S13iwr42E60xaNsLbqYAUEGMLfknzhoUmqZ3UdUG3Exn6u8KLuQtFuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFVfhpyY+W9cmeOnhFHlLoHy0Ve4pTpeiqltdMLkHQ4iAAu6Nl
	V6rYeOdWJtf4nsWUne9NmK9XFHti76I0xVY0BJeedvr8dfmxToewEF3g
X-Gm-Gg: AfdE7cmIRO2CfWLodX1LPwhWR81eXuNcQICSt/o7BHPXQHVgOb5Hi+qrPFFRoinkvwO
	K5y9Yz9rgWssjWtZciNPxXEXDh4ucI7FmOGNoUum0djY40qqMflwk1LO20Q60wkwIsTYvvtC+4l
	a7lU6wXySX+tPgOIGMfzh2QVZ5BZ1YgAcBafv9AMGnW9fLtOFzyN1/VFDNDZY8kgusQxo9NLi3f
	5t46QpcH0xIAQuDr9cxPvm4O/bDafcc8aPAzojyN3CaSUazskItXc/pJwvUGeET4AOzGY7EJPDp
	c6VPYdg+tOCRKz5sL4kdpd8ZOkMnZWv9I4A1GQiQnSRWI9sq1L88ZOJadbvSJddIs6sED28r+nW
	+jirTqv6m37Oyioh06iB5vggJ+1adxn2nrwNMBBvPy4VkB0IcKjsttzgbu1rqv3peFNRvbyx5t0
	xTEfxg2+LacPuAH5sAf4nxW6DjiehHv83rNbKu+65ZLCtJm/EMBEiDU2pu6Jey4lsjxYCE+w/YQ
	Q==
X-Received: by 2002:a17:902:e74c:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2ccbe625b96mr46458745ad.12.1783427154327;
        Tue, 07 Jul 2026 05:25:54 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c21429sm11078765ad.37.2026.07.07.05.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:25:53 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Frank Li <Frank.Li@nxp.com>,
	Wensheng Wang <wenswang@yeah.net>,
	Colin Huang <u8813345@gmail.com>,
	Brian Chiang <chiang.brian@inventec.com>,
	Eddie James <eajames@linux.ibm.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Syed Arif <arif.syed@hpe.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/2] hwmon: Add support for Analog Devices MAX20912 and MAX20916
Date: Tue,  7 Jul 2026 20:26:36 +0800
Message-ID: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PMBus hardware monitoring support for the Analog Devices MAX20912
and MAX20916 dual-output multiphase voltage regulators.

Both devices expose two independently regulated output voltage rails,
Rail A and Rail B, using the VR12 VID interface. Each rail reports input
current, output current, temperature, input power, and output power.
Input voltage is reported on Rail A only.

Fred Chen (2):
  dt-bindings: trivial-devices: Add adi max20912 and max20916
  hwmon: (pmbus) Add driver for Analog Devices MAX20912 and MAX20916

 .../devicetree/bindings/trivial-devices.yaml  |   4 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/max20912.rst              | 156 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/max20912.c                |  70 ++++++++
 7 files changed, 248 insertions(+)
 create mode 100644 Documentation/hwmon/max20912.rst
 create mode 100644 drivers/hwmon/pmbus/max20912.c

-- 
2.52.0

