Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEdK/s9L"
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA09CA;
	Mon,  4 Dec 2023 23:49:03 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso3138516a12.3;
        Mon, 04 Dec 2023 23:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701762543; x=1702367343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hzfARqoRwj2I0ztTvad0SBw5orlkB0cK4aNM/XGImao=;
        b=CEdK/s9Lrtg6IWx+KA0iUkV71mQoW0lcCXlye9VhLm0AXiK1FzLieKWBdo0Li29pDx
         0Hlbg3Ztsmx/18h7AY7ROvV/WoXEcihQvnCzmwOPu63c107t0exCXW2FVe5ATlRbOd5M
         4+DajhEyIzWccGJjwxxYEra9ZNLS6wJ8QVEu6m5ykMQ9R1/YBUCtaDX1oIrj9ANLfVgp
         M0j1sMWB20hFQqeQRm1Y6cMdA0v7KjIQBNG4b05DSNMAljaBYkY0k9ySv14+aclF0lG1
         idbQhTr/jrZ1x5jM5muM+oyY2O0t+//l4EsSU88rc4sxRQ3a+OppKTW51u1IJoVgKdwp
         grEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701762543; x=1702367343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzfARqoRwj2I0ztTvad0SBw5orlkB0cK4aNM/XGImao=;
        b=IfPlHFD9VWIWEYHZE2ssDcAbUgqj9iL4wpEiiDme31Z93HHdGSzdNlQQQkhsG2VEGC
         /xXW50+N7OCwI1lDP2tnhobwuNJnx8clghfYwBox+bXrNLiZrSYMqJ0+zq2zyw74ABpS
         rYaMFoNn1xlNYW//qFfV0kZMer4mbmUd57GWM1/D18pZG06LIxCzOF/wJ49cwO+uoyEx
         sKR0XtelaYknZZn7EwBILE0rXvVzVGjqrshDkNqF0k9XbyIv5prU9F4muLeNSxHOQ+FY
         akviWLUftngteI6/Q15siXqiiJuVXXpjhAZw2sE4WHKihoDPZ03sdNH/0wIYcc0uDLtf
         1Fhg==
X-Gm-Message-State: AOJu0Yym848BFWplRoApChGR2mHr21cvU7F+U3uyxdo0X8+wT3rKMe2l
	+YzUNAWHNVCJbYO+fje0jmE=
X-Google-Smtp-Source: AGHT+IEWuKB/agZ2nqiCMH3DCejLtKl1yvpzh6ORWD7i36/F1cPPOXAepNpzYLpRiwKFm2W7AyoHzw==
X-Received: by 2002:a05:6a21:2711:b0:18f:97c:8a3f with SMTP id rm17-20020a056a21271100b0018f097c8a3fmr5444332pzb.106.1701762543361;
        Mon, 04 Dec 2023 23:49:03 -0800 (PST)
Received: from cosmo-ubuntu-2204.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id k3-20020aa79983000000b006ce54e08b6asm2582529pfh.203.2023.12.04.23.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 23:49:02 -0800 (PST)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	macromorgan@hotmail.com,
	linus.walleij@linaro.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com
Subject: [PATCH 0/3] hwmon: Add driver for Astera Labs PT516XX retimer
Date: Tue,  5 Dec 2023 15:47:20 +0800
Message-Id: <20231205074723.3546295-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver implements support for temperature monitoring of Astera Labs
PT5161L series PCIe retimer chips.

Cosmo Chou (3):
  dt-bindings: vendor-prefixes: add asteralabs
  dt-bindings: hwmon: pt516xx: add bindings
  hwmon: Add driver for Astera Labs PT516XX retimer

 .../bindings/hwmon/asteralabs,pt516xx.yaml    |  36 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/pt516xx.rst               |  48 ++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/pt516xx.c                       | 648 ++++++++++++++++++
 8 files changed, 754 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/asteralabs,pt516xx.yaml
 create mode 100644 Documentation/hwmon/pt516xx.rst
 create mode 100644 drivers/hwmon/pt516xx.c

-- 
2.34.1

