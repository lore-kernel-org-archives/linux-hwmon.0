Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4121B1E9B3B
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Feb 2025 08:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739348484; cv=none; b=vGN7HfAoTU5yrWA3uIgFBgLEtlQOnkZjnSf7xhp2roMQHpXFuODPOx84dz4YLpmUCSWaB0CJD97P72eiScfPH2UPXnIA9qVfU3o8PYInb3mWBB7BwwsYxGrF2FmaPBpBos6fiiSBp2JnYaKccPkY4WPJQTWvcPHRpLlMRe58K2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739348484; c=relaxed/simple;
	bh=6B8OyCvMj7V7t3F42m2acKKkG54tJsqI4RpmAbaNZZ8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=mQG/pxsOoeuKYKL4bdU9qQ0xGObCF+6qPZyOyo698ptXq3ZcaomHxMz2F+h6azrh6OYQ5l13J0Kt/CDnk8ikGfzf0TsbQhqYo0piBR2ya95ZtTKN8ziKtSsZ2R9uy0OEWkux0zSETyuplTNj6PwAJEjHjhf3ttOMvINWAH8yp+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=PtfQrC8J; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="PtfQrC8J"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5de849a0b6cso5559129a12.2
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Feb 2025 00:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1739348477; x=1739953277; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=znb0JIjtNpZf2uyw0CPX4m9V+96AbGhf76HdvSPY5xc=;
        b=PtfQrC8JwUafg3ACwPZId9/a7fsCkmg1ZfgZ/39t3jHk9gog1tXQ2KQqaFg8WJZ9vb
         PZls0buWu/OboiJgK1tyE3u52poCRKAqHnFfcV3pF9XNCuf8VftnI3rtqnsQo6aSe4O8
         XsYSvUQfIGug3guLUlVnK+9+NKcbaNiZRezJGg5CPoYZodwyP5UFP2Og9ebFWQrQqHzJ
         SkX3cTU5exUf/u5z10IoazPUVCXMamAbBhCCEEeAoz1Haz/Jf/6meAnvFC+HPEwnKW36
         6/lQNKJWqv6RZ2x2ltmv93LFPXkFfShVX04w+2VqisdQh+dX+bWJtA9WChocgG7+23vm
         SNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739348477; x=1739953277;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=znb0JIjtNpZf2uyw0CPX4m9V+96AbGhf76HdvSPY5xc=;
        b=SjiXdZzR6+8TAa9OrljWgLKiSJkGBtmHPnnyzKbTUdkXUzIgQ8g5+5XfqfHYbSEEVR
         AA0m6X+ddg+6Obw46QQI0u3CusCVf09HrSUjXqgVWljQqjbvtyOza9Yawb7f3sxktUPr
         7Ok9wY3LIeLAiGIOB3x01bBFR5haFj7UyBFPF3j1jeNTxA5WNyqGdokIFCq3WyPiPcob
         bg9heulknDj9ckjc/Ci6W25GKXFV1Xq8MvzN1BdwIB5m2d43v5f2PFyvY0PgvYmGkGbE
         FPzPIUEWSPppCycUj41Kj+HKO8bLlwvjy5d40WjBY1akFGIyJNhtnYGZ7NpbC/yv821S
         jmpw==
X-Gm-Message-State: AOJu0YxxnBJoxRqzflSPSMl0kEzDHR2fxBZDMAPlx3v+oGKstMe1fFNQ
	ia6fCw+/EIubuszJ5wM3BE1iHgiHZv+IzLGVdYdQipDMUE7G4JOSm7lljZLnNwy+28Q7oNp5PX+
	nl6N/dqS1OfFHqT0emdARcjYM94EZyxdT9NfBa02hvZgZcbVlD9I=
X-Gm-Gg: ASbGncvU65RE/V9V4RZV+3Jz1SoXBC0ATn54Wo2kpqJYJe6f1GtMeeneo7s+RvkEA/5
	n1gXEaUBaDL+SVrFQp3EoKjB0BL6kzFdSneiEM/gkpi3PrmVFjfk4DTE3nVD97fOu1VoAm6+qwQ
	==
X-Google-Smtp-Source: AGHT+IEPh83skUpVhAxGsY49tCUho77deV+53yI7H6OwUMeFh0hJkDY2FwpM5gRYraJaqWBJtqVIOQSk6CcFZPZigjY=
X-Received: by 2002:a05:6402:1f11:b0:5dc:c869:da53 with SMTP id
 4fb4d7f45d1cf-5deaddec13amr1878379a12.31.1739348476899; Wed, 12 Feb 2025
 00:21:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?Q2hpYW5nQnJpYW4g5rGf5rOz57e7IFRBTw==?= <chiang.brian@inventec.com>
Date: Wed, 12 Feb 2025 16:21:05 +0800
X-Gm-Features: AWEUYZmdYhxOginCxesdgwFZupKhqvkZruK8NIjuqyMG8CqO9Pcq8fYNZ_7gU6M
Message-ID: <CAJCfHmWJ9N1R8x6ikU02_RYq9ieq6yWY7CGdfvc4hRqHnX5szg@mail.gmail.com>
Subject: [PATCH v2] hwmon: (pmbus/isl68137) Add support for RAA229621
To: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The RAA229621 is a digital dual output multiphase
(X+Y =E2=89=A4 8) PWM controller designed to be compliant
with AMD SVI3 specifications, targeting
VDDCR_CPU and VDDCR_SOC rails.
Add support for it to the isl68137 driver.

Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
 drivers/hwmon/pmbus/isl68137.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.=
c
index 2af921039309..c52c55d2e7f4 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -63,6 +63,7 @@ enum chips {
    raa228228,
    raa229001,
    raa229004,
+   raa229621,
 };

 enum variants {
@@ -465,6 +466,7 @@ static const struct i2c_device_id raa_dmpvr_id[] =3D {
    {"raa228228", raa_dmpvr2_2rail_nontc},
    {"raa229001", raa_dmpvr2_2rail},
    {"raa229004", raa_dmpvr2_2rail},
+   {"raa229621", raa_dmpvr2_2rail},
    {}
 };

@@ -512,6 +514,7 @@ static const struct of_device_id isl68137_of_match[] =
=3D {
    { .compatible =3D "renesas,raa228228", .data =3D (void
*)raa_dmpvr2_2rail_nontc },
    { .compatible =3D "renesas,raa229001", .data =3D (void *)raa_dmpvr2_2ra=
il },
    { .compatible =3D "renesas,raa229004", .data =3D (void *)raa_dmpvr2_2ra=
il },
+   { .compatible =3D "renesas,raa229621", .data =3D (void *)raa_dmpvr2_2ra=
il },
    { },
 };

--=20
2.25.1
