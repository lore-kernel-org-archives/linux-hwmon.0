Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4121F9428;
	Fri, 10 Jan 2025 08:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736497595; cv=none; b=BR0x7xd2A3tm5srq7Jf9mTrf/ctFsXc5mkJQMXQaG4ck3ebLw9cdub8UYKBEyXl0y2NZDLdDhUOE/QyWITL2TDwypWwJqqF9LddZXlwvtbk5cyBD98mvBrxtWpHI7KOnrzbLt3QDSRnw5UgHpi2gmIh9281Qd2/9p7IvJjyojEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736497595; c=relaxed/simple;
	bh=FmV9PabaVdfSsH+M6j5Swg14dURON+awRma4UTvNxF8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NNmarLQlgjzpZ8pea71hRRgzNQ8TGKCCfBQ2V0ylKIjnMXYBAK+Fba2nEcvSx37/oGDLwzNeQByokaUOn1Zs8eb/IgvttrlWQZ/1aKHoqE1pTYQd8i1hDwz62n3R5C6EyYmshiKtSp3GCpmni4fVGnVPScel9l/9u7fRCgy1vRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yc0UTDes; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yc0UTDes"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21669fd5c7cso29269005ad.3;
        Fri, 10 Jan 2025 00:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736497593; x=1737102393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MkxY4439ZVn0G9Yn4qlDjFjlAf32ewAQTaEyOEf0y9o=;
        b=Yc0UTDesIY+xQw7T00lh7XIunAbkbaM9iuxJj25VIBWUNHNR7ut8WeIHpelH/WvaSK
         n89VmGledZ+k6zFE/9ybJw0Yfmr17BnxvtIx5TSwKWPS40cbGmFPev+rjOtjfz02iKvM
         U5q0iBFSQnelmFsgzpIlOH0+6ADv0GfvMelY+8rmR0UZG84d+/5ZJgzjL2VRbxLlAd2C
         QA6+wN+UT/bUsk01KlAG3lPve9cUsDf8QaFyTx8KoTUGeM0uWJJjHA0+1uG7wGqzJjkM
         Tixqijy7UqyObC1sa7s8zXc1HoG9x/e+koBuipe33vciMimM7+UZISKpPsPQDojYn7ol
         XPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736497593; x=1737102393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkxY4439ZVn0G9Yn4qlDjFjlAf32ewAQTaEyOEf0y9o=;
        b=CJmOGuZxFcH/CNu48Q2fPwrxdDbQOdfnZLJ7bjxhpmMQSmqMZDwOlkdZTYZjRSt2bV
         7zDARcFT1AK63kxskT0ql7Lq48pS6SalLGd9anWsOxYhhs8ycLz1koRTodQO/BqEyDl6
         s6p7XdhaHirsvjCwtywp5vdgx5V1mn9Q38KjbQzuwx0saGp7eAbrGrEbUlL6di2eo53T
         xxOvjh6Qre1tDevtsBf06u9EPCVVu1zzfpUJW1WKVNOt/8jIqgRus/SK11dkm88Sd//V
         7m73oKZR85Tgm3bGjA9r7DEt4s7VQx6617aNvmHJWzv5xSX1hwva/6S4aLxZEROVg7K6
         dxbA==
X-Forwarded-Encrypted: i=1; AJvYcCU53e8VoZybOhQC/agBWEKrrx+1SBxJMiY6nXChJl/ht6cgfpPwcyVG9DFiAh3hMm8RTEjYt9i8PDRI@vger.kernel.org, AJvYcCWN4WBZT1Y1SZQuYtBujNBA+Yo1vH81Ude41U7+16F2jAABEcB/UyQTClmKcQ6lKEGYA8PuahhRjlg6bGEH@vger.kernel.org, AJvYcCXtq5Tr6zo7GtzagJ1w0KgMRTcKwZccLuedctBNi2sqhSMtI/1VwQSdbWSxY2WlWLXf1y/GTVs1PN+a@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8anbuj3dj6e0kvESlCPN1hHFZTovsAdKokHkHSCLipctgWqk1
	sGufMS4UuP3Bbmwsh35HISt2rdZpBtYnYtVy13xNWPsY59Y8o/nL
X-Gm-Gg: ASbGnct5EWrHLeoxEHhsd6bZDGkNA58AO5VjpFwU1Tr+cpJA+Oc3dV7m+oZmf35ONzN
	rcWaJiSFTOjVJhGN+IQQKGGwRpNdbgYBytjZ4QABW5kXkB70eAmGDoPe1YXEbVXNKJIPEvaAcLo
	VL6j22Vk1EMzvnCJrVxXSSLFVeIZb+B6uRk8Nx5RDVs8JBWW/ifQf3W4fa7SpsPt5A6k1ha6rlJ
	RnQIf1lq8fhwiLlVErID6xhqX4Z6xnGTPgPdzqYOV1hZascy9CpscNv1jvX6FX/x723BicU7VGA
	wjLZkUDNRCao66wcNFDHxxrR
X-Google-Smtp-Source: AGHT+IEQhgfYJ3B3PLmzgDygm2i1+Q1/7IW0OqFNOPuKlBzDqfkHM5ll23rN/kKR19g0YdsSmE3nlA==
X-Received: by 2002:a17:903:230d:b0:216:3dc5:1240 with SMTP id d9443c01a7336-21a83fde389mr144685255ad.45.1736497592497;
        Fri, 10 Jan 2025 00:26:32 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22d0eesm9346815ad.169.2025.01.10.00.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 00:26:32 -0800 (PST)
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
Subject: [PATCH v1 0/2] hwmon: lm90: Add support for NCT7716, NCT7717 and NCT7718
Date: Fri, 10 Jan 2025 16:26:10 +0800
Message-Id: <20250110082612.4107571-1-a0282524688@gmail.com>
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

Ming Yu (2):
  hwmon: (lm90): Add support for NCT7716, NCT7717 and NCT7718
  dt-bindings: hwmon: Add support for NCT7716, NCT7717 and NCT7718 in
    lm90

 .../bindings/hwmon/national,lm90.yaml         |  6 ++
 Documentation/hwmon/lm90.rst                  | 43 ++++++++++++
 drivers/hwmon/Kconfig                         |  2 +-
 drivers/hwmon/lm90.c                          | 67 +++++++++++++++++--
 4 files changed, 111 insertions(+), 7 deletions(-)

-- 
2.34.1

