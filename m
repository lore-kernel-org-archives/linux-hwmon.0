Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2489D1C5F07;
	Thu, 23 Jan 2025 20:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737664178; cv=none; b=BGWPzRubwnpESNnpMILOPBdZ95MbQb+lRyw/iiI517087lf7WudWY5TsTMMzloIZ/W1Faf4XNw9HxGZGKhCmk2L8+GReGiSb8SIn4e92iXrNbTi1gs9jAXTQWvXobd1wJyssn4Dm46iLhLB6SabSrLkDCLcCDICQYlSNQBwAoqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737664178; c=relaxed/simple;
	bh=qBvrsszgUnqMfan6jm/MqjiMvw/UimLnICaVIDjSgX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bzarlY84GvRSk4+2RXg9/MQ6v0gklyikx580kXDO2m5QYdqTgZdd7MMVDkZfyanVIG8EEb1UXoeUAUcFiDPQiPq6I4Z/cyLciXbVkaVkw+uIWbdeI6M7iyKsdcZXIm7Ec920pWG3/Nh5WQQu8Xizr6lWBiFvGOPNlD4/lz8r83s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqXh1ZAO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqXh1ZAO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43618283d48so10098055e9.1;
        Thu, 23 Jan 2025 12:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737664175; x=1738268975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ildTFbwYRdIQtS+aUWanUrK5DCzK9ru57yozi2eEZZE=;
        b=RqXh1ZAOM+mBUEfYWM4VIkL9Bv7MhfhE/jKo10OLwjjLzOCRsElZA7hPghI2Z/OB7o
         ChoRPCaOIvvHapgwfLSinIg08tsR3UQhNiwMWr9XTUD5Z4zTle3UaIlDecRjKq75jbVw
         rYfPC+CCjoa19KPOxvoEZNvOYVYLlvUTn6VeN0tCOPkSeLWI1DbY2+DstyjpLK+KZzHU
         x7Z057lyN/FOZIwrV8AmnGNYjB18mHtdWYZI2+UBHAxVKzFQB3VfURFtBU6AtpzlWduh
         CE+oN65cLi5Afh197dNqsULtZ8Ljw2hh3HZbmr8mHAAAt1MysxEYn0/2VL6Uor4UdK63
         88Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737664175; x=1738268975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ildTFbwYRdIQtS+aUWanUrK5DCzK9ru57yozi2eEZZE=;
        b=haKKHjXD7ayH3f2lnRPhc2lOux5WBlH2sYnwGnexKxaS5f33e2ImosAPSPYYDdeVqJ
         30BafkYIob0kcFkcsUvOZHbi71PKSB8DqnHavnotL4AIoL5DCJOKlhnp3kJe2wPuhqxK
         bxDyUiEPbIAHLBPjP0qpzMvhE775J0KmErCw/GUlwNQhmlpcEj4/gJk9hpwJCYkOx5Xz
         IPDzo4RGR46WOn1J91HHhp4xKTHvTXAmMYcvL7kug3jRHgCdGAhhK1VyWhi3kaeaoZBR
         ou7du6kBjUTWL6Id7iu3wZLPJLnJ2ijES4C1ht7sxur7RFo9bQHqlH0O2t/wBh8LahBk
         SW8g==
X-Forwarded-Encrypted: i=1; AJvYcCUGEXF06pEi9UVr7Nas7FJnBtL9rLRm7dxXJh1jbFqTtgPbTlXD0HkHciU0WRisL0R71iQSoKZexa4p@vger.kernel.org, AJvYcCVIL53ChpH+6cj0wa2xRAlVySl6Fie+SKCnTRO1t5DrAaGbAV6sdfZRc4SgIaX6BajhQKQqtodZtmt/jwc=@vger.kernel.org, AJvYcCVgj421VR5O7v6jcX06OEozgwxCDBDMmBm+ZCnJaGkK6HpSDeqACvVPDGcOwhc/wcTxjHV8yjRi0HgURd8p@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1jqNJ1HgZXn4v7NFMrnzqK9bpvec5ePZvQ8R8mbWHbPIj5DYh
	cdqHparKIVk7pxcHOXcxkj8o+HdwWD19U1ssRvSfToWCmcnUBvmbtXTXa1Os
X-Gm-Gg: ASbGncshq8PpZ6bj+He/qSmYc6WViszKhYEYvCxCBz30K8Qfqruc6oEj6yE24dgVHiv
	C56FWf5krHFQZ9lIy59MnJyzQKgk8g6EA7oRA/OTO4Q6lhBj6pB9c9vXueibfs4c/DBrX2UlGfh
	axue4uhJI8K3DhMW8TzXNwcgmlkaSddwlS6AO9oe/DVxHenjxxPHqJmmzXetH/zs/0KR9Z5tG6x
	a5IrqzYRh/L8RtnRSbdonMwvbmdpK5uZIdlLbJRgcBkDt0DK7X1r2pxKsNAM30NETfgawIBnn9U
	WePB8Ms4H7MPg4BIp8ul8re9MbqCOUwHGJ7+AsJeRmu2NNa31RYhFeLiF8lqZrPcj+OXZNwfOu/
	TgGvQaLUpJPNDwWbyhKMKr945qa05q5zw2A==
X-Google-Smtp-Source: AGHT+IEbU+dLfGb0o0JD0JFDGibqgtmSbdLFhkK2W/wklh+V7jsy0rVnZus+rYkMEeNyMd223kFr6g==
X-Received: by 2002:a05:6000:186f:b0:386:373f:47c4 with SMTP id ffacd0b85a97d-38bf57c934fmr27280647f8f.49.1737664175236;
        Thu, 23 Jan 2025 12:29:35 -0800 (PST)
Received: from thinkpad-p52.telekom.ip (2a02-8388-e103-2700-a24c-4303-c631-1166.cable.dynamic.v6.surfer.at. [2a02:8388:e103:2700:a24c:4303:c631:1166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a176490sm628760f8f.1.2025.01.23.12.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 12:29:34 -0800 (PST)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Cc: andrey.lalaev@gmail.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add driver for HTU31 
Date: Thu, 23 Jan 2025 21:25:05 +0100
Message-ID: <20250123202528.223966-1-andrey.lalaev@gmail.com>
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

Andrei Lalaev (2):
  hwmon: add driver for HTU31
  dt-bindings: hwmon: Add description for sensor HTU31

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/htu31.rst                 |  38 ++
 Documentation/hwmon/index.rst                 |   1 +
 drivers/hwmon/Kconfig                         |  11 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/htu31.c                         | 335 ++++++++++++++++++
 6 files changed, 388 insertions(+)
 create mode 100644 Documentation/hwmon/htu31.rst
 create mode 100644 drivers/hwmon/htu31.c

-- 
2.48.1

