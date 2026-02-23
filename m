Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4603334683
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Feb 2026 17:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771868502; cv=none; b=YkrsHcuC+7f5KF83AqOfmANSu5/Fnx+6qQIM8WhsVxrlJnAk5USfi2mII/io6K6jKyMjx0ogzLSyEdVAcPzxyjgaNCfCLypCU4HPd51RgOa5sMUo1sPEhAnABssKH7UsCXJmEgMoC7CMOctCaPPaD2DHzT4+dmx9guLSy6dTzqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771868502; c=relaxed/simple;
	bh=Khuq/ueAESYsT52wcqjFV2ZTYizmCzhodvxUMyJ0174=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KIc9sBTrJKkg/Gfyu6ABONvxdnhE8Qdl4DjRRtnwB98RfYSueQaf76QSjf5UoF7J8w7ffFxXwWyWa2ezuPR8p82bTdu83nrP23kJBH+hIE2T8M1+DRw6LntpuAOamVUHXSgtgVEwKKP8mtXEPsAlIJEhT/P67xEbGu1pBtoPsC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLsaH7hB; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLsaH7hB"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-824af5e5c81so4342628b3a.0
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Feb 2026 09:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771868499; x=1772473299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erq69MkBx6/Wc04+kAo0cY5zISw8AsXOmfLz2/UvA1E=;
        b=SLsaH7hBTpGmDf2PE5i4YJcZlFLs2krWgigOBCNX4r/W004Coxu72SxOso3iw92WLS
         64YfL+ZzQWTaUpSMaZdjCJF7AWCpYC8xqf/6zKJdfTy+UHqI4wbrPiWliXkI27lVreHF
         2LTd2Y42/4riEniPPUy9SUMo3dSawKZcmW6krZlCEwrvHNPufJ/8qQLPZQMPIESoeL7+
         Lxo9k14k1kX4+cz7gqvBPHsWyrECJkMI/pp5l4AYL0YQHL3RGqFRjcBsG6EcNx/exgrP
         2E1IMLBton9eAzVE2t5493QON2C88K4V1uFRs3ezUwR+Qmi8XXAruGfhrxGM08yT/25y
         FshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771868499; x=1772473299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=erq69MkBx6/Wc04+kAo0cY5zISw8AsXOmfLz2/UvA1E=;
        b=cGs3QnmPACx54pvxGrYbcpAz6LQRTADA8/OoR4nJLMgO3UP9N1Kw0SEeCnj8bLYAzf
         w4ODqVMUqd4tdgUr2Vcg743wly20+i3/pnmvS+nf5xcWY4TFdNy4tRYuLXm//AI7ispE
         Xnr4LIeY/tAXqMNsKIKbLkZpAcZuC3+xOpobNK+Xh8EbrV01xw7s3GxOu/eduC8n6x+C
         bhVkkDSjE22iDA1RwsafNgbiTcxI0EOYiMU3pTrpOozKDeaU/CwtC5z2EgxJ9843uWoL
         UvqZXtic58zBABDgii6x+pmCfxs6PPmrUomeidizgZmFhWlKE4dhh2M1Hx38pNSL8Q/d
         h0tA==
X-Forwarded-Encrypted: i=1; AJvYcCVbWRx/FbDKcElb7/VGGLbAcolcWFEeZnGeDgClzuxLsuTXRuZIUPGBOGmgjqOM8o+PuwsEtNPKVyJHNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhYZhTk9EXqdaVacz8qUH8hwzzqoiRthSM9XCuH7cFO7cqxAQ2
	zgaENOD3OfLGcGBjrXDRrytDtAn9TaFHle/oNJXSAQ5uUe/G0uXKKYbL
X-Gm-Gg: AZuq6aLXU2iyJ5zl7B6yVm4d8NV0tcDpubJZVNtzrKfWGdrF1bo+EMYi/SVO0oJtxoU
	Rcr7F6CbIJRRh8SKNdcrrCyd3B1AyBjAHnR6OcT1vhN5klvPZzCvHnDApI34x969lqIfQdymhOG
	7lp7yqD3dbZ/A+OXLB1ioHNgeNo84uzt7moGmS37R34WfTGjPPINr3pbqYBnn5Dp7d4J71+uX0Z
	lAzjrbVYXuuGTO7de36tGTBuUirIe+Y+D0dkB4WM7I9FU7YUaLv6IqPWD15FAV3HDWmJjcn7nuk
	32h9sJ2kpyJOy15KGE2xfFPWpJXc7gGWcIlvAGgPkrEYNkz+MJkXI4/0Zd1lQrH/O1WkrI439Mg
	Ps1fWdJ3tJdi6dTyaGw1mnm9AYOZhPpDCdvw+O98i2fsUNuo7Btu95/HIVgx2FzIAn+PNOSIwwK
	TcQGxBCkMxZKJ42a+tNMthmPlkqyY=
X-Received: by 2002:a05:6a00:440f:b0:824:93e4:2ddf with SMTP id d2e1a72fcca58-826da8c0f3emr7578974b3a.13.1771868499250;
        Mon, 23 Feb 2026 09:41:39 -0800 (PST)
Received: from yu.. ([120.242.225.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd47c737sm7873090b3a.0.2026.02.23.09.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:41:38 -0800 (PST)
From: Hao Yu <haoyufine@gmail.com>
To: krzk@kernel.org
Cc: akhilesh@ee.iitb.ac.in,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	haoyufine@gmail.com,
	jcdra1@gmail.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org
Subject: [PATCH v3 0/2] hwmon: aht10: add Device Tree support
Date: Tue, 24 Feb 2026 01:38:51 +0800
Message-Id: <20260223173853.30617-1-haoyufine@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260222105831.7360-1-haoyufine@gmail.com>
References: <20260222105831.7360-1-haoyufine@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds Device Tree support for Aosong AHT10, AHT20, and DHT20.
Tested on linux_lckfb with AHT20, and the driver works as expected.

Changes in v3:
- Move bindings to trivial-devices.yaml per Krzysztof's suggestion.
- Link to v2: https://lore.kernel.org/linux-hwmon/20260222105831.7360-1-haoyufine@gmail.com/

Hao Yu (2):
  dt-bindings: hwmon: add Aosong AHT10/AHT20/DHT20 to trivial devices
  hwmon: (aht10) add device tree ID matching

 Documentation/devicetree/bindings/trivial-devices.yaml |  4 ++++
 drivers/hwmon/aht10.c                                  | 10 ++++++++++
 2 files changed, 14 insertions(+)

-- 
2.34.1

