Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37A62AF00;
	Sun, 26 Jan 2025 14:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737902621; cv=none; b=Ei5CtfAArthfCgjlHWkVfDSwAWhjVdewdf/2eMlfExU+ZXmdmJZwciFhbk7yD+rp81dKBhyw2L/pFLWhwpxhJZ7x1/lif6kIM9hGy/Ni1+ZWsU5v8f3l0wfGlvzBY0+l8wJHE+gl22eyj/h3w1yJB/j0D7N3QTQXymkMPHV2hJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737902621; c=relaxed/simple;
	bh=ktlTE+NjXzaQzZY2cQpzuYqSvNGdPNfeYC8biOoZ6Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F4TrMRzqHdx8GSOy3Xu4YVPvY9wYo4bAfiZh11vFifgMeruY1IrjdSMV9vIRvl6IKoc0o60e505QcF18BlgTEjjsZIee6R+ZvKu6UVEd1iYFVqgxZn8/7qpEC6larzCG/lbC+hsJrSItOmZ8aDGm67jSmd+UZS/guoni8qiPPwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+jsZ0sJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+jsZ0sJ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso25080905e9.2;
        Sun, 26 Jan 2025 06:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737902618; x=1738507418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pmfnUTs4mBD8rYzea6MXWtZJhncSAJZ3j5xWJL67j3Q=;
        b=G+jsZ0sJkDADfnpoAka/aS509TXT4DwnUjPxW0q/L8CLKEM9j09pfsRQC3Kl3zyzbO
         LXEJNepIQTZXXP12EK/JS5NfyTODr8ApYtLgXTXfTEVKWwW7/7HOYnE3bgpjqQrhzUgN
         vjAr+3VnpmQRMRZczCpwRNLcqjPHHlrQRECHYHIImsNicyPt8jDmogEIE6rH3rRnuCPM
         igwrWh91OhrHBgDrKnU6R/+p1rNuN8RQj6ohdQofRq6/nyoDxnknTwElgLC0TxQpvxSE
         CvNyDYV9bg1wL55N/1G3XquuAYtaIPq1d06EfsLgN4oziTpka4tS+NDqgNyF+44dwipf
         eRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737902618; x=1738507418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pmfnUTs4mBD8rYzea6MXWtZJhncSAJZ3j5xWJL67j3Q=;
        b=m5/mfddGMJWhvDgZ/+8RkoXRmXS8AELXdaC8SFnFEtSXjxtjhbk6z5kaozEvBzL+fU
         U/3BRyjZhIEMZx+0bTTi8Uq7viSuLq0hulosf1m/6nZeD9U/NFcCNpQHDU6kkaEOxgXs
         nw8z/+/qjAdX+26SSYF77mpT/ZDG3psxGBc8l3BYABQ+RR879m0gNhY6MvdT2Hp17K8d
         c/nUKC5mgU4MgQ78mGF04qPlk+SRKIeiiQRZo9nx2bmaYxw6lacy8o8EN9THhEHFCMkU
         q2H0nH4G317hODFiBZ8T3x9xpaVBDMdT5WYDqcyhoCkGvZPBHgaOPkHHubeqnPV2UcJR
         TQ6g==
X-Forwarded-Encrypted: i=1; AJvYcCU3Oqx/xxbGufxHERgf5VOhY7oZNaaIyJQR4BFN0ivHRIp7okoqeW+L5IJOPa+6H0PcZjb0N2LQ7kgtVEJn@vger.kernel.org, AJvYcCXTMkFPyQUXHX4bycFYvk/v+3+7aXNfy9MzRAT8V8ZsmPdBNSJl7wBh8RPSAiUGQbP4SiU+4DsnQKEW@vger.kernel.org
X-Gm-Message-State: AOJu0YyZgShjHwAF3j5DLqYd1FRWcySn1TkYlNpUP1qnLKacNr1F+LQg
	bBkMblBz7v8Ag6UeqmuARHM3TSLOKjkiInkSja24geQqwuNJVPCV
X-Gm-Gg: ASbGncvr5sLa+ny2Af1uBpYkImlMjWP6zGLEsr8LgkMSiXq68W8tIlV1AofMKxMLRBR
	jtloIhoNMv+cAN/C9Uavf1XkkHeItrqf+V+jiUGgQVyXjZA+rdkBOIi2WSuiY2kmLQAoGSKSZgy
	aj0TMpgupZNkRmoQ1YQntyPWgmM+ESxxhGqWz/vdczOA2RGHGAE5xHe0Go1OP0X75g9ibG25Vue
	pfSzcwyMSnG3tFjH1uEKy4cgsREprdTexN5eXhH69UUF+pRR+1Xnef+5guAo+iu7gCS22xJLkok
	ZGrCvUSA4ay0Z/o8Z3o9jjJEvP0oMNQPRZtMT3qB/if0kNk1dR1oSZJ+Z3D1JI/OXw7TPF3r79G
	rOYnku36tHDyoLcpNapB57OFyxhen5WfQ+w==
X-Google-Smtp-Source: AGHT+IHSfeK32ipJoh8wMlc5O9Y/h4JLrbRgVs2aSZgYDKrzt0RGBxC1d6QvJfozt802um4TsIz5VQ==
X-Received: by 2002:a05:600c:5486:b0:434:f1e9:afae with SMTP id 5b1f17b1804b1-438913bfa0fmr309785665e9.1.1737902617736;
        Sun, 26 Jan 2025 06:43:37 -0800 (PST)
Received: from thinkpad-p52.telekom.ip (2a02-8388-e103-2700-a24c-4303-c631-1166.cable.dynamic.v6.surfer.at. [2a02:8388:e103:2700:a24c:4303:c631:1166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f120sm98772065e9.2.2025.01.26.06.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 06:43:37 -0800 (PST)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	conor+dt@kernel.org,
	robh@kernel.org,
	krzk@kernel.org,
	christophe.jaillet@wanadoo.fr
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andrey.lalaev@gmail.com
Subject: [PATCH v2 0/2] Add driver for HTU31
Date: Sun, 26 Jan 2025 15:40:54 +0100
Message-ID: <20250126144155.430263-1-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for HTU31 humidity and temperature
sensor.

Changes in v2:
- replace DIV_ROUND_CLOSEST with DIV_ROUND_CLOSEST_ULL to prevent
  possible overflow
- drop mutex locking from htu31_read_serial_number, as the function is
  only called from probe
- add description of the private data structure
- fix the issues pointed by Christophe
- add an entry to MAINTAINERS file
- add Krzysztof's ACK to dt-bindings patch

v1: https://lore.kernel.org/all/20250123202528.223966-1-andrey.lalaev@gmail.com/#t

Andrei Lalaev (2):
  hwmon: add driver for HTU31
  dt-bindings: hwmon: Add description for sensor HTU31

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/htu31.rst                 |  38 ++
 Documentation/hwmon/index.rst                 |   1 +
 MAINTAINERS                                   |   6 +
 drivers/hwmon/Kconfig                         |  11 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/htu31.c                         | 345 ++++++++++++++++++
 7 files changed, 404 insertions(+)
 create mode 100644 Documentation/hwmon/htu31.rst
 create mode 100644 drivers/hwmon/htu31.c

-- 
2.48.1

