Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B2119ABB6;
	Tue, 28 Jan 2025 19:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738091860; cv=none; b=G+VjKr3tmAA3q7x6lb9pgmmhsQQ+tIn90r3j1Z2jLxN9gF8ViiCC44GOD0HjM+QrCuDEGA3xEDnGIerSU4tMCNJspLRHDm3RbU5Yf6kiPim8mTX91a7/b2rXM96btDaKt+cj6iGQe7zn67/6JCvafibi94Yj/0E1GclnOOoLXzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738091860; c=relaxed/simple;
	bh=HclQeSXNWk73MG/VCY0ymlf9djRRfgYtyS750b8YFf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iYL75kKSm96waFnFRZy0563jJuGqkNn9Z69QAjaJFx5zc/ggUMxmv5FWx3kBZhO9AOOYEot02VeEfDlVi0vtkAX7VnypN7ob8M4SRr5sycqaCx9wZurJj7rFM1R6Fdm/M8rGrRaCLMUAecENSsBSswce2M/yc1VElgnLdfq4DiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuLCdu6P; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuLCdu6P"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361f664af5so69081465e9.1;
        Tue, 28 Jan 2025 11:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738091857; x=1738696657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Csbh9siOV35c/RvGSTUxPDPr6dab+119Jwb6H885+xg=;
        b=QuLCdu6PcU70glgDEL4E+ZtUSUbPXtvqdFDarzLj1a6GSaevE5gqlkHSKwY5buyQXS
         4vqtYpz/ekKB+Fo7Dq2lYS404GMd2RdjnDV/VGyjHGUwXbxl4rDS7bIyGb2DxrP6XU45
         /fmc1klEnIasQeH+uOGbR2FJrb1oOPfCG2A5pCk2y9+PhsDNylMrzTLo4O+gPHn6zehS
         QQ+SeH+5izSJIHT/s4gGeJlyGFlGOm2N/4o1ic5zyvqp/3iCGBCGkuD556X9uJbzG1Yl
         t+hO7G0EqU91FthkdSJ39h+3Dy43bxaw+kg0vu8b1WLHmGsFlL57KkOY899xfcn09pHG
         eJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738091857; x=1738696657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Csbh9siOV35c/RvGSTUxPDPr6dab+119Jwb6H885+xg=;
        b=G7xUVkYQp91U3zSfdprOhSHdkmjGxFwsPrTWYNZNNgtvSCsV58Ufu4edhChv5yJyAN
         W03rqwzzN8z3PiYFDbn9y7VHWrRhJz0iw/gn4eCj8RSr9GFPzHzoI6TechYiRDYToHz0
         jgTKj2+LBUmNyE4sKw7szDdrAGwN2/SR8xlT+a2hANIvUfH1ltNVQNJ1e6OivsvPZRgH
         TQgOQMFHe3A/52LnQOspB4OSvmVDbVDb854TrLYdYTBtd4fd+MLWQ8yD2uzJ9fofmTVd
         juKG6KNd/ikuSSLNzZa+tz3IFkmL8g8AmI94S3DeEs+FoSeN001zHOOcmlk+nWc6fVuK
         9ybQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2Hs6vdUBpBm2IFuf3Kehyk2sfwqHPU99nztaSmOBlB+osXLMS6HV/bQ5d5s/PPaJeBLsyhALYXoHm@vger.kernel.org, AJvYcCXUaftmHSUYceDKWH6j2+sFWeigYPJmk4AIf3sqmiVtmnhnQL+yD6IBcCUYRgvX/wb3PpMR90Yt1VhhNtP/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Xp2BzS9PfMCtre5w5sZugVxATskTjVb7mrScIi6mr0gNlDnY
	Tq0g/B5C4hoQvdEvWAsRr4e/Pl/4HqQpdN8BT05E6obX4SYPiWSk
X-Gm-Gg: ASbGncsj1oelHjJYH/oPfD13xDFzDWw7nPcSYd6LOGlpN3fhj+uePgcU5UDBHdCKFCy
	JK8YU7IWWSZRYfyyu2UpJ566NCNBL1e2nMbANXoDQnza7QKkslWzdtYfVwOjVjvcurUWb6wTC+p
	apGWPGKg6IbjUYpm15IT54FE2GQ1QWCeLHXG9rXvwcHI3VoAyb6YQ92aN2NagNR2xFMbWNiT7sH
	VXFyUPxpcJw1vAV6igJqZSnbYUl9ZTJZzvO681dQZ7uaarnvq2QWbzJR0qOvzF6PZMkE2+Swr5I
	rDTfnala0gkQWHsT4CnV+esf5edF+BmC2djCSEebL+wSQ9WWIB0HXY95FAzNgkAKH8F8ksIWnhi
	JHtW3CmiUqhhGMNNJfSGlsFt3lT9E6OCMyIUtA2BVg3gU
X-Google-Smtp-Source: AGHT+IHC/OiEXS39+h0eXpymOh8xYQAl2W2ruV2a+SJE9qKy/dQIG0lB3tRhjyJ7qu9FDnc4NjyqRQ==
X-Received: by 2002:a05:600c:35d3:b0:434:f586:753c with SMTP id 5b1f17b1804b1-438dc3c3790mr1319575e9.7.1738091857169;
        Tue, 28 Jan 2025 11:17:37 -0800 (PST)
Received: from thinkpad-p52.telekom.ip (2a02-8388-e103-2700-a24c-4303-c631-1166.cable.dynamic.v6.surfer.at. [2a02:8388:e103:2700:a24c:4303:c631:1166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd54c0ecsm181224365e9.30.2025.01.28.11.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 11:17:36 -0800 (PST)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: linux@roeck-us.net,
	krzk@kernel.org,
	robh@kernel.org,
	christophe.jaillet@wanadoo.fr,
	jdelvare@suse.com
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	andrey.lalaev@gmail.com
Subject: [PATCH v3 0/2] Add driver for HTU31
Date: Tue, 28 Jan 2025 20:16:39 +0100
Message-ID: <20250128191730.739428-1-andrey.lalaev@gmail.com>
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

Changes in v3:
- move serial number attribute to debugfs
- fix the position of entry in Makefile to keep alphabetical order
- fix the patch versioning

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
 Documentation/hwmon/htu31.rst                 |  37 ++
 Documentation/hwmon/index.rst                 |   1 +
 MAINTAINERS                                   |   6 +
 drivers/hwmon/Kconfig                         |  11 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/htu31.c                         | 351 ++++++++++++++++++
 7 files changed, 409 insertions(+)
 create mode 100644 Documentation/hwmon/htu31.rst
 create mode 100644 drivers/hwmon/htu31.c

-- 
2.48.1

