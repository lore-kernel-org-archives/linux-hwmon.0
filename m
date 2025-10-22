Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F4F2D739C
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Oct 2025 04:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761108432; cv=none; b=QIYxajipyXoNsdcw3Qv5fZMeM31WgktWP3vMwZaZ/1zwEnP19jfMIN7/Gq2FSYqzIvjcWpncwiMfLERZQCTuPCKhwXrJ083eORoQH55ShSV4X2pfkfQXQ1iAKUMZcCp1QkeufeRQtsUG2y0nsXYKYpIWr9VdlMfF9tLEu2R/lF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761108432; c=relaxed/simple;
	bh=DWS7b0OXi35GUhqaHArR2mIysKoute9ykjs7q/LnTyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hUqjJW1J18K1mJTDFCoaVNR0eHXyAE/17FWCKAAiUqa33TdKIk2agObvLhFZEmjyIbyFhVpc6sTIW1LlhaiYWF3FJSU03kr0Ao5OXqPciEH4wN3nGVxl0UC1rz8i+TNvQtIn5EOQuZJwfG/m6pOVWQXsfaCmeNbT7R9lSoKy8xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=G7JBiS9L; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="G7JBiS9L"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b55517e74e3so6520731a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Oct 2025 21:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761108430; x=1761713230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OBuTemYA/SGUaF+DBF41ycHM+zeDM425yx/z5PlZWVc=;
        b=G7JBiS9L+3GrHf4wseXIOFIEvK+EEblLVdX4IdLaVMl0KvPb+gWbsg5C2sdCX9cS4J
         MUOlVR8FexBqW2BMo8wMzqCSP/4GKhYw9ryofYizqLgk8oeJGKBTSDLNtJgSkYl9dmEv
         GZQZzmhp3v/AzLb+g8Vt/CdQBxf8mt4zgqByQNOLsIi3C9WOrL5Ig2MKrPGmeZ5xiYhk
         6z2IDXfqpBcxAQqCtUKpCVFMjehAfpMJhqzpTLr+J2oxyl+GlDsbHEhLQfwoV79mVJQd
         tG239J3aCJOCs6sYiNfDFINEEMsYQcLJ0ZkDKyTYm4T8wMHdZiyGWQzmW6aV04+OiU9C
         JHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761108430; x=1761713230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OBuTemYA/SGUaF+DBF41ycHM+zeDM425yx/z5PlZWVc=;
        b=mOB8jQcHjn1fL8xpQfy2uEcGR1qYroEq7dkDRbIYmUwUdY6qTefkeqv9Pu/cv1hsC6
         FO/Kg1alEiZO4GWUV721/lbKNrNxARmTXLCjq/TbtYuax2CkO9gKXZ4ZgsHI/v6gArPT
         7Y3dKTGoY73j4OqMWWynuCwaXW2Buq700QxrbVUGU96cgnc+z2/39TAXmO3MSG2lk8aT
         ICy0YYDoRgr4Ck4cx9rWRaI3qw6Y/dDnwwadypl/9MJ1taZFVEewCLii7OQj+hKEjZkJ
         BEqRSWAMjVeiJjSbwfJF1itimIZWGw+p04gcYL0pyzd59GsHDORGYq1QLqgiUcb7HjUj
         dtuQ==
X-Gm-Message-State: AOJu0Yy913mb8ok58XbYlGPSLY3hyRvp993WAYUzGHt0F/RHP4APq3vz
	ITVVlaCJgKND6UzOTxFmx9dA4KSIJK1plVT3MbEx+pEhoNGjyJbM+TmybYVmiS6GCOc=
X-Gm-Gg: ASbGncu0LLRUqbgD7xbUeCrbOEIXJzEeqNbVDvx1J/4PNOU8c7qgwKa2oM5WVXwwFQG
	eWA93eiYhapVSIj5VgKluV6AIf3pcO1rJkxszOeU9cth0IXkHsRvJBVQwdpUgA51xIRSxRDPe72
	NpjiqWU3bH204esg0S+PKSUjp7XkZ0BghWCWXOz3LtiurxsPi0Gj6yct1v/3CTJGpeQtD1ujNSG
	KJyA6HuL+AnZvSADnBYvnpfLxJE2uyqtZ4RAOpPLNwCSNoNpYXBH7xlES4xyHRxJJKqKAJfB+aV
	2oYAfdNxLd5V4OQytwzXmUEmlH10ad89PF8L1hk6x38wuMSlsSkVLBt6vtbawDY9ePS+bAH2orl
	GqXde49H6KKDKT+Dfr5l2FWdF+5ymIGIFQtXGwyVhSdICCtOiebqwIPeBfDuIqC0zwnRsz+gc0+
	+0UcTZElgMyYO1QEo=
X-Google-Smtp-Source: AGHT+IHMzyYghXKArrXF4a3abFsvEWo0yK9xR3k3Ts3BFNdVJw1LghdAf673yg3EmO+eQ2pXjMB9AQ==
X-Received: by 2002:a17:902:ce8d:b0:272:a900:c42e with SMTP id d9443c01a7336-290caf850b1mr243342655ad.35.1761108429966;
        Tue, 21 Oct 2025 21:47:09 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:8004:e310:f3d:dd0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223dd9d6sm1257413a91.7.2025.10.21.21.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 21:47:09 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/5] hwmon: Add TSC1641 I2C power monitor driver
Date: Tue, 21 Oct 2025 21:47:03 -0700
Message-ID: <20251022044708.314287-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the ST Microelectronics TSC1641
I2C power monitor. The TSC1641 provides bus voltage, current, power, 
and temperature measurements via the hwmon subsystem. The driver 
supports optional ALERT pin polarity configuration and exposes the
shunt resistor value and raw shunt voltage via sysfs.

Tested on Raspberry Pi 3B+ with a TSC1641 evaluation board.

Igor Reznichenko (5):
  drivers/hwmon: Add TSC1641 I2C power monitor driver
  drivers/hwmon: Add Kconfig entry for TSC1641
  drivers/hwmon: Add TSC1641 module to Makefile
  Documentation/hwmon: Add TSC1641 driver documentation
  Documentation/devicetree/bindings/hwmon: Add TSC1641 binding

 .../devicetree/bindings/hwmon/st,tsc1641.yaml |  54 ++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/tsc1641.rst               |  73 ++
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/tsc1641.c                       | 801 ++++++++++++++++++
 6 files changed, 942 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
 create mode 100644 Documentation/hwmon/tsc1641.rst
 create mode 100644 drivers/hwmon/tsc1641.c

-- 
2.43.0

