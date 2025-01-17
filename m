Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CD21FC7D5;
	Fri, 17 Jan 2025 10:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737108557; cv=none; b=U5GQ6cFuUb/+jXhEHCcVDfzNid19cgpZWih5srGWV1yMusxNcyRwd/Pe8M/TV60W2ZZPHKW4VGs+zZ49ffGTuaIJCXtOdN7/SbH6PhwkSdYvxyBqKU6S1LotUz5RUhdUl/il7wzJAaQccqY5SN/xEJ5VAbKAJLEZxa8y2zH+A6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737108557; c=relaxed/simple;
	bh=52x2K4XaEolIsGejS76c+NPI1JdyzRbN2cuY7bk06SE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NsfaPC1UR/vdFjX7DrzPLRwOdU2loZCbmffbru2i5bAmvOlR2LBKavOCf5G4uOhXxRWb5CpTK4BAtqfzazvRtiaU/1N+ldp6OeXQmxX3OAk9Dei5M5aNmKoE54yojQqWwp/gjxqj0c5LJjlVS3PvgpxGmzthyRpM9CLP5V9bi6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OcMI4wBf; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OcMI4wBf"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21661be2c2dso35637305ad.1;
        Fri, 17 Jan 2025 02:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737108556; x=1737713356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qAUQuTC+OVIezZr8CjWLKujkPPq9tg8Q3f8vQT27JwA=;
        b=OcMI4wBf6QQaP++aMKgfgn8taey0Amw1HdPa4yVE5KL9j2Vm/QeRokwwfPp5FX7DGM
         2z3lyg5emmtYkvss1jjjP23VTOF6H7/egdbOpLX5TRN85C8AzHSAlpmz4jjVp94cKR5d
         +iEByKlylp10FtppqhlOvKFyOawRuxBGP2owycTvKz/RDUL8VHOOJdS3NGY5zVJW0Juk
         ac8wreOSxGgo6zamgn2S5WevLjhokyCajaiRquYSkKg8HM8QJ59iPQlnqd+nLaNZlGXZ
         W9QZ/8WMKFpl4PAFU9tpgbeI96Zo4Txv0Ir1qvX9FceRKXuTBZY8+9F1R2sWr9Pt0KfQ
         qDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737108556; x=1737713356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qAUQuTC+OVIezZr8CjWLKujkPPq9tg8Q3f8vQT27JwA=;
        b=jVrhEDMRWrPKD19JsIWj558A92QxWabP0BZNV5eJasUcZ2oO+IWLaVsSvpyWkhlfHe
         WACTpoGduhjMrU6bcX4YSlASvp3JfX1FvLYJv9yOKAu0F1Zp4nBQwpYqYmDTHgEG87xn
         z0X0VeuctfXhXyZ26TXJNR/PcOANOzZPLObPW/nC0+W1Z3CAkCRRr4TPQt7PvmmBnvi2
         h94uD1K6M2jD+hHyM1I9sLIXwBmyYqcNJKKTq3+7/z3ainWnHwxORc6BD31sJwgqXDiX
         HXZQmQkXsUCDpvrTugpYJhkMQ/CGxP3OybAWuYar/xwT31QeVrxbdrTapF8shOQQPPjS
         JSmA==
X-Forwarded-Encrypted: i=1; AJvYcCUr7SDOuBCQpTD7sFMjM4ViC7+9G3pbnYigvzR7FjtDhSZtilGl1wUmwhTcgUmNUDR06uKPiYTpGHmh@vger.kernel.org, AJvYcCVnkmOCZ9sxzvIl+FMk8qtdhj8zg83+YB8NPrN+wLXl4uKnZFda/RZZnVmyWLl4B14njb4iUWA4myY+@vger.kernel.org, AJvYcCWyooJ7V0Gx8hM5WzrGPoV6Efmo6rJzejnTHsHkh6LoG3/88bOnqZBqr6CtxJbEK2YXe50cNzfmD/Lv5pB4@vger.kernel.org
X-Gm-Message-State: AOJu0YzZpfKH71ro9M2G8fOQY54o/o8gntKKj+l8u2ItivqgL0f0Jjq9
	qC0bzGlWRvzi1NNkG88Sdhpa9gpdTOZFey72M26dNMZX05/xDTAo8+bRWQ==
X-Gm-Gg: ASbGncuoL8lmTIEykNmq9UEa3A4xvcyLsMWrtn4pJueO06/lcucBvh4ISweYZdC0qXA
	DT0T9bP230wAWC7BOBGpc9VxtwuhNzFgVgBWIJoLMcHMaSMfX7Lxw1Mm/yQsKnQJQTRW/4R5mAU
	azbpn1Vnu3xG8kHLmaTe+kJ0ZM6ga/I2/uYxzXKTDKT8QuRRLSFYeDN5hJwbcyIZKukIzy03Xq+
	ntcH0RIuPZAiDahPDZgK5a/CxuFt4FBgE9sVWsFFB6LwqCP6KY6KfB+WNEi+zrWIZAufqluxK7U
	K/LCAii+dTHyO5HFY5777fdX
X-Google-Smtp-Source: AGHT+IGqMS3Skg3KdLLKq4pUhJXnKdaJ3p1DlWN7OCdlJsyQWOffVAh63LgUc0DugcirCw1PSAHDGQ==
X-Received: by 2002:a17:903:1108:b0:212:68e2:6c81 with SMTP id d9443c01a7336-21c355405edmr38660565ad.24.1737108555734;
        Fri, 17 Jan 2025 02:09:15 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb9af5sm12756925ad.82.2025.01.17.02.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 02:09:15 -0800 (PST)
From: Ming Yu <a0282524688@gmail.com>
To: tmyu0@nuvoton.com,
	jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH v2 0/2] hwmon: lm90: Add support for NCT7716, NCT7717 and NCT7718
Date: Fri, 17 Jan 2025 18:07:42 +0800
Message-Id: <20250117100744.1571385-1-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series add support for NCT7716, NCT7717 and NCT7718 from
Nuvoton in lm90.

NCT7716 and NCT7717 only have 8 bit resolution local thermal sensor.
NCT7718 has local sensor and 11 bit resoulution remote thermal sensor.

Changes since version 1:
- Add new detection function lm90_detect_nuvoton_50()
- Fix the check for register values.

Ming Yu (2):
  hwmon: (lm90): Add support for NCT7716, NCT7717 and NCT7718
  dt-bindings: hwmon: lm90: Add support for NCT7716, NCT7717 and NCT7718

 .../bindings/hwmon/national,lm90.yaml         |  6 ++
 Documentation/hwmon/lm90.rst                  | 43 ++++++++++
 drivers/hwmon/Kconfig                         |  2 +-
 drivers/hwmon/lm90.c                          | 82 ++++++++++++++++++-
 4 files changed, 130 insertions(+), 3 deletions(-)

-- 
2.34.1

