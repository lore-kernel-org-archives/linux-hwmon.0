Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFB438E10F
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 11:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920344; cv=none; b=tAmaQerSOQ3zLz5oEDUXu3oRxeK6g8Peq6B1zU5l3vUb/5DErpQWwOufu9MhQl7RNx0ebaY28CVAjhOot7lsuEhmD/lm+DSeRKAGND3VSst2X/IjEGeVgcAGZ4cs1uGqqrPKIEeunwmG1qK0gF4NlrrrCKMSFDOkoLMl8ZovFwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920344; c=relaxed/simple;
	bh=r3l83g1ue4UI4qfae6/Uvh3dLsFN9DQXctSf12imHsk=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Zp1pYW0bqaNFZPydpFAJBffj0nZrOoHTEvemDYCadjgEhPT37OH5g0m5gYj2uF4EmmTG6DHZ5oHmkfIrof1Yivu5eBFG9xwqI3vm+rpWlNRndRgPlet10l/d0+beQPCDCuaRj5Tk8XOKpsuglzL/q3y/UcIJOX7ASjedgVi22Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fl7o5D2Z; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fl7o5D2Z"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c742882d2a4so484043a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 04:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773920340; x=1774525140; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nLDJ1VX2gC6oV8YYtAKoiukMuK5S0G4NkcPdE2NmXg=;
        b=Fl7o5D2ZtPrmIp59NBjWBXsY4dLbuaiuzQfG64jCll7ovJnJd0NGtRnd75nq5WB/+z
         a+EnNJ+EsUdwvTmFJvh2dHx8a6k0wyf5yRSti7jumjbjfz6jj3F4dg5fj0377bYQWb43
         pONwlPYU4VN8AEc172Lq7tHH5K1/ylo9MZ8jy/kQZEVlHd9jLUMCqY5iLUWAi7RWwoAJ
         0cLiJHzPKJFNaomJ7jwM80WepIFMVEio5q9Gfi9zXBR016A/ZhruyD7C3EcBGXssN4La
         AbmFaw0DJUmibYvw/8UWTnW8gRumivgMrJfEtto1tzTzo8+SVAsn0UPBY5dEhy57VlmV
         qeug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773920340; x=1774525140;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/nLDJ1VX2gC6oV8YYtAKoiukMuK5S0G4NkcPdE2NmXg=;
        b=UDR16eToODcjMrEIEMRtomrwQSdfKej2+Tx04BPkfcFeMClSt7m03hbM9zwxkFNbUK
         jQlQQ8VGtC/Y5fyMZtaYNMM6tVA8jhqbkNBZgTQI33Rydbd+li9PgQg9FXSs/I6mH6J2
         nIq3KGpdegwnEGowVHtJqKKChqhcOOZGWyA7sL+sdUbGPrscs9mmM0C9F79niVzeap1m
         FbTV0lk6Z6++xf/GsWpF8/iq6OM8iDL7SiUxaCi4nXgL/kP9MMZb3bASdZTpXIZg9fjx
         quVAiK4vFcOEtYAxeF8AErmXSleIyGjQ1By/pPxwCI8SQJkLi1B85t8xooftftV8pT5y
         jaGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWofJGNncJJN339WcnEXxXBq6bCyXNE/9G4ZQNU9kVQAjuFARvlOycz/gzV8V/T9t7/zBuRoMWD/E6f7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqhc9FKyu0CDcni9lPIu5P22Nv+GyIJcxp7HnuCY96Fl7/hqu8
	Fr3MCzcIS+UVt/4QihPE2iWxxkVGJAh3gVVQpVM2v8YzzirJDblE7c+2
X-Gm-Gg: ATEYQzxxTGSUDSLv/2AohrM7Y8sE+DKlHsbnSjok0Pgec97oBQ3eff+uoVFqOlV8l4i
	TOHtQcmBPPl/ogMP8n6LlTSmQiYJl33FqTe+A5Cw1Z3O56nikGy21Yys6vpCoxuBDSJnagH2lXl
	4wzDLU0ZMry8/WR1llmC9iyyeq+YLMj3Tl1MnAO7JxnejqvS8OVt1nN+7oL11kR+XMZlPR9AwgO
	tHnQn8TGQo5FzoYjUBWNTfW1rgrrGbokcX5F45HMoUJqJsWkO87M7hikGDqu8PWe6SQbl1nskKP
	ZMzwE+Kac2AvvnL5Bw/xTde3yUQnKUH/4LHyjtEdgBY5KS5AgI+ZbwJi02E/B7VpYuloT/D3n5k
	agDfmM+DXEG60tgj+UBqjpf8tsCxbnHELk3hLU2Loe9I0SGZS/8wzoacmbfGflXVCqcMkvT8D3S
	PoW6c8GoM5iKLuWyXLMJyqXe9VOKQuRlgpFOAAbPHo/loT6APFS3k1
X-Received: by 2002:a05:6a21:693:b0:398:6b26:dbfb with SMTP id adf61e73a8af0-39b99fdad0dmr6549918637.49.1773920339944;
        Thu, 19 Mar 2026 04:38:59 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e545d38sm4985706a12.19.2026.03.19.04.38.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Mar 2026 04:38:59 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v2 0/3] hwmon: (sht3x) Add support for GXCAS GXHT30
Date: Thu, 19 Mar 2026 19:38:31 +0800
Message-Id: <1773920314-17755-1-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

This series adds support for the GXCAS GXHT30 humidity and temperature
sensor. The GXHT30 is software compatible with the Sensirion SHT3x
series, using the same I2C command set and conversion formulas.

Since the SHT3x series was previously undocumented in the kernel's
DT binding schemas, this series also introduces the missing
sensirion,sht3x.yaml binding file.

Changes in v2:
- Fix placeholder "Your Name" in MODULE_AUTHOR in sht3x.c.

Zaixiang Xu (3):
  dt-bindings: vendor-prefixes: Add GXCAS Technology
  dt-bindings: hwmon: Add Sensirion SHT3x and GXCAS GXHT30
  hwmon: (sht3x) Add support for GXCAS GXHT30

 Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml | 44 ++++++++++++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml       |  2 +
 drivers/hwmon/sht3x.c                                        | 16 +++++++-
 3 files changed, 61 insertions(+), 1 deletion(-)

-- 
2.34.1

