Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE6230E82A
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Nov 2025 20:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763064980; cv=none; b=aqyQ6EGUbhWtOhv6Ml/fYqDc6vf2nLsnurJgAZrTuAhTNWP/45LtgtMJat6scck0IpAJkXH1cD2fplk0SFfvscGaWqtd8V/abxEHa89xCizDv372hNgTRIC/fi68LWkQs+c1hRx5WH+nO4nyW3RlF0WD2XPM9IgnMn5UU14oqTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763064980; c=relaxed/simple;
	bh=yf1EHWp+oJ9T88riklNpDr00ygEQpfbRIeKxiAz5kkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CbM7dZnXZHjd3tlbqbZtmwgnbvXAmNyXHpwjqqJUlImRAJEy0woKXZf2H3gu6vJXwoiU/f+vsKBEMcQ/sSdmomk7FQhwUE9AUfMWHQ80vbTSURTBiDxmb4Wrl66Xg4IN12HfizIcn2ejpjsKF+yWTHVHkkERaWhWJo3OguQF5VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KADkgYxM; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KADkgYxM"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-bc1f6dfeb3dso731572a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Nov 2025 12:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763064978; x=1763669778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/XDejGhHXhVL6gVxXV5iH1nREnEWCgL+SUmr0gPvMkM=;
        b=KADkgYxMH2VIA3Wm1V8rKEqSYgeZr5QM1opvvWeIY5zrA4hCAL7ScHSKzJi+DGDGjl
         91XLIDqkBa4zM2hQigt4mwi90s9da1/wRd9VzWAg9EwE1IYoiHYHl7+j5i6tyr4PnihQ
         wlujEtMV/hIw8VSXIPMfOAptuyM3JHYI/cZ0oSKJDRJOWs2VJpuC239Eg4iJOxvzCHlp
         vEf6ZpjtVikSH5uy9Gg8teqxkw+L0m7pwYOH1R7GrFX2VS55TJX1orBuxgrrr9OlM/zW
         gVn8QJ64NQqXHURA5Yl2XYzC6XWGMOLOo6TA3utcmG9D9kV3kCnX00z3rPL/C9DrXdSm
         5gDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763064978; x=1763669778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XDejGhHXhVL6gVxXV5iH1nREnEWCgL+SUmr0gPvMkM=;
        b=lDRemOVJNgAc+7yEel6EmMa9Nfrqls7JhM66t1TIhPZWBMFOp/3YxwxbhHyqieNmz+
         ATc2BjfEdoSWonGET939BYkMAXguCsrKwQGVe4azy4oT/wglHaahPxw/krYaxOGNpQUC
         DF0a6uL5PF7tw2eDqTrPWrQ2Mf11br78zLLxOHAlOHLsTa/ZCtTsiRShmnSk3pLuPCT1
         tqOe6iHSG8eQUMz+H7YxR08YFBe5GRtFMqgHQ+rO9FPUeDxXDoI9mONlWl8YeaVDo0MS
         2fZzJ0KIrhTzX/x7zMsBh2UT+loydGrSLN5iCqvEAOcDcD3R6JIhArGi7DRAKVWSo2M9
         H8dw==
X-Gm-Message-State: AOJu0Yx8bmaIc6Hd8d5gEXgsiVqSp22IrfVFICm/UYLSjsCrYybiz8F4
	huE0oF3BwoaPEUDITGWDipEDO3/OTUU9OEMH8ckSx7Kl9DM5qrUpUVcR
X-Gm-Gg: ASbGncuw/eDZpgHPu6oEE1KtiTheVJ3WVKmFDoVNOUopFRt4vos/aOCmPuotxsW3m+e
	+zYVuEv8vc0zquZcz6k9wsU1CS0cEum9V6ezduKB1EwPiaCVVzM41rqyKhZWH5do+txz+TqOGaK
	aDQGTeY/k0z7FD8lAKPe2vuxQ4M0q6q2HvuWgNah17xUclHpSm3eSmCPVFFxBciSr3ncn3GMsxC
	6rQcUX4QwdjUmD6eGuKK40xw/+ijo+W9jzOgnwSQAC19j35H/gKVL7GO8ZTASRdOJQZ4fkJ9kCG
	XO3TJIjfuuvheQAXJR6lGjGYcw9T2zE+zKvu30oQBQd2mB6bL/UoTVmNB7mKOpJag78i9SJeTs9
	ALGANZqO9QyxK+ENq/pUk+R9pQgih+MPK9r4lyNOO5ndhWFC2coMKGN2ZaWXlwqhIS8iFvWNXtg
	9CFKJaWrgu2Pb1
X-Google-Smtp-Source: AGHT+IHSGWGqwRw7x9gftTw9fyzbg2PSwjLjsLR6bgn1RgvA4hukM7wuY4gkxzWH8Ongauvvwzx4ig==
X-Received: by 2002:a05:701b:240f:b0:119:e55a:9bf7 with SMTP id a92af1059eb24-11b411ed76bmr135454c88.19.1763064978178;
        Thu, 13 Nov 2025 12:16:18 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885d8sm1272392c88.2.2025.11.13.12.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 12:16:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v6.18-rc6
Date: Thu, 13 Nov 2025 12:16:16 -0800
Message-ID: <20251113201616.1579169-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v6.18-rc6 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.18-rc6

Thanks,
Guenter
------

The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c:

  Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v6.18-rc6

for you to fetch changes up to c55a8e24cd129b6d8fed20e3d63c10c2263e2fc8:

  hwmon: (gpd-fan) initialize EC on driver load for Win 4 (2025-11-12 11:54:37 -0800)

----------------------------------------------------------------
hwmon fixes for v6.18-rc6

* gpd-fan: Fix compilation error for non-ACPI builds, and initialize EC
	   when loading the driver

----------------------------------------------------------------
Cryolitia PukNgae (1):
      hwmon: (gpd-fan) initialize EC on driver load for Win 4

Gopi Krishna Menon (1):
      hwmon: (gpd-fan) Fix compilation error in non-ACPI builds

 drivers/hwmon/gpd-fan.c | 54 ++++++++++++++++++++++++-------------------------
 1 file changed, 26 insertions(+), 28 deletions(-)
