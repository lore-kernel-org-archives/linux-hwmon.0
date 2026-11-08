Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794110410;
	b=KoNUaUDK3/DSSL1iPhMGp+Ws1rZKnYCUOEs0phSAp/Nxc5x45Q0rcXHm9OzbWNQgmaEP
	 eLrqrKajg7xzd8sUwnRZn7v47FVNCOp4qovrcYGeCeDVeCfw/FmI8FWOsVruXxfuaRwrW
	 0xRLPwowM0zkJXTxS/NmB3xkpmqzkVfsEuNXqJcZ0vymBfEkdK5Ezy5qpGoe1sMSn0DtF
	 k0AogzVSrYJQytlkhCi2IMhh857fOHuKOTcf9tpYZcbdc3PkZHxOKz+eLq1QV4tFp91yq
	 h8yQo4ihhEk76HvxxoqydqXDYfalKy4np5y6j3e1Ur7cgk93y4FqmezOi7zRTf967Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794110410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=MXs/vYPbzWYafmxmgKumqAJHyqvTX01sR3Js7JwVAao=;
	b=cq1WADuMGnzsiShhe2Y7+BBfBhLiNP8ejalcrEGLpFRUiw9VOe1AeZKkw9LX9dqcbO5U
	 eePEk5U1cqdG79Csz96vwDqXhJ9kZXlZwaLJCHy8ud/jyAGtotBH3JaM5NCGbMVEQhsAK
	 3XGhj+o2RCTrwShXQJcKkbjfcWMQtH4Kno0LwZVtj9g1r7dBEH0ag7zPbUYgyNyyoT6+7
	 9pfsLMrEWhC2ChRcE4mgbtJZQ3/WXt7rIv6UUgosbYMOje227tSk/+5XfiyEDo/t6MsQu
	 hrCdlCnrA2HqfhZ1PF/nJ/wTwa4FvSd3hVItbHbelo/PWBDSX/JVF4UJ+A66W8cwAoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EkCR26WK;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C7A606A31D
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 04:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C7A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EkCR26WK
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso1476545e9.1
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Nov 2026 20:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794110408; x=1794715208; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MXs/vYPbzWYafmxmgKumqAJHyqvTX01sR3Js7JwVAao=;
        b=EkCR26WKGBesWOMeuUYBjQxQ9VPM0sDcZMo7omY9i+uEbe3+Q4QslZkKDLsGKI1GGI
         sTQ01EoP/syAhkaNcd67YQ1RhS4XmzavWUgPgZ3fMkTDiYipMTq1J7Y9i4rklxd3vyVE
         ZUE1FRLKQRqOih5d/cC0uitnflb8JpIHozECrD6WPC45IE1tdYK2mZrp9DaqZnCgmnAL
         a6+LXIrzoR2CDfAi8OzK0ioqDMhHZgUCZSr+H5+ZBEQgtCrkEiTw3JkU2KbnXK74atIk
         FZxGud+NuLPqjPWnj3QnE/xzd0poANc/iOMmh6TFsUauczd3Wyk8YQBusljapUEWv15G
         faGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794110408; x=1794715208;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MXs/vYPbzWYafmxmgKumqAJHyqvTX01sR3Js7JwVAao=;
        b=EEe6VJ8KMwhyoHYICjDC++4gxaKpYD751zmVd6wRnmdroM/XPhF7q8Np5dSm026M8M
         EvVxh4vudoH6KvnEfaypAljFenjLc9fnRk8+Eor1O+IS1hWG77sLNQkgVbxQ2thmwaKS
         XVFynkseFQ6R+5lqX7jT+9npZ3pyFdFw3qZrIamd5zCR0jjqdl8Va+JJBRGrF3ARX9j4
         lGgwT/WV40wsdP2nbXLeEHtX/J2M0tAs+kwpXXLtMkdJw1WtK2tPj58uMobVyl5AyMOK
         CgYLRxZcPGpraj0ar4OKt14lxbt/slqkYlDDla8SETCAx6/YZNNPtWezklLj4+BLpZBq
         d9lw==
X-Forwarded-Encrypted: i=1; AKwUvByuXKyhfLJe+qXXsvoqh2xTA70enAO8nhmPM/wFOHFeBd5YZjpuNvy3ecsHr7qfKtU+IHnMcPE1EfhOrw==@vger.kernel.org
X-Gm-Message-State: APuU4Z864hVcHmDH40A4guCovQ8SLidLBA6J4sdjJxwPJ2r9JiQlU3ww
	qpZ1zKkuXVcVKPauaaybtIKk44GSHUJ9xHMiUXY1JCsbXI9fKeeZDTuf
X-Gm-Gg: AYBFou02IRyD4PMNbFRo5pbjVrlbGTr/49pImuVR8dCZDB7HAZ4cfcGu7PE26gDrU2B
	FKOY6AzQVclpXlNa82PIuODnRihn5NhrXR0RjPG8ia+bDnRaN/0qFvUIcQpa4Ej1/R6e2+ARnyH
	ClcNXurirwztgWx5mblOf5OyKNgHoqRwBDtg3MDtxTQ8FNEOcIobsvWwuw+/sRswVxNT4zxhC85
	umN96QVUK0Sw0/xw0SK/e4l9WgWZ0hFJcvAfPexrJKRUV8/cT0eDs9VyORaD5J1XQVkee0KvL0v
	9gQ307oyFzvv0VVQ/ZPc4NmREXXDqj8KKbYiSK4ylvspdr0sexXmGIh2ZzvhdAhlkbXiNhAmuFu
	OJdZoemuxzHAGv9dUe5dnvcpmszl9pwHVc5hGkJOU0IHzqBRgfD9t/xZ0AlLvEkoLHlr7uvZRov
	kucOZNUcrE7mPMvBligADFiwXJBPT0OXaz9b+a/e96525LMC4QTgRsDukECZBX3ZdjzPqkYZfws
	YUo4ycRio0RA6o4N8twy3RVzLK3JHyneVCFF4SLmy5AWVlMk1ChLK4tAaJaGuf2n05zH57jmuRH
	f5wUrw70RIv7toiJrkhAIZ+04IjIGbFCANTuddYZKmST8IFtiphonWBv6S0aIQ==
X-Received: by 2002:a05:600c:1c02:b0:4a2:74f:46c1 with SMTP id 5b1f17b1804b1-4b9633cee71mr11013845e9.8.1794110407861;
        Sat, 07 Nov 2026 20:00:07 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f3163sm1736310f8f.11.2026.11.07.20.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:00:06 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/3] hwmon: (max31760) Fix local limits, standby and the
 initial fan speed
Date: Sun, 08 Nov 2026 03:59:52 +0000
Message-Id: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALjz72oC/yXM3QpAQBCG4VvRHNvaoazcihwsBqP8tIOU3LvB4
 dPX+10gFJgEiuiCQAcLL7MC4wiawc89GW7VkNgkQ7S5mfyZosus6fgkMdZ3mCtThw40WgN9gzZ
 l9Vv2eqRme1/gvh8nIgcJcgAAAA==
X-Change-ID: 20261108-max31760-fixes-0af187603717
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nurettin Bolucu <Nurettin.Bolucu@analog.com>, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794110404; l=1156;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Ziw3YkmSyzfldrT5i6PlnnWtcqRZBGP8NMAy3Z4o/Ts=;
 b=qHzpvm9GMvYTw/xiK4s4TFssjytv12/+x3xSgdIuIXf9FJPgOU0TrfD4sMQ21wuUNcrf2feeT
 oA9/nxYXcq7C8I9oTlJLyFbBI7dOP5tdxTYqmMfxn8HrGk81FFJUsQY
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Three fixes for the MAX31760 driver, found while bringing up the Samsung
Galaxy XR on mainline. The headset uses the chip for its two cooling
fans.

1. The local temperature max and crit limits are swapped.
2. Probe never clears the standby bit. The Galaxy XR bootloader leaves
   the chip in standby, so the driver gets no temperature or fan speed
   readings and can't control the fans.
3. The fan speed reads 3000000 RPM before the first measurement.

The patches were written with the help of an AI coding assistant
(Claude Code), based on the datasheet and tests on the device. I
reviewed them and tested them on the Galaxy XR.

---
Stanislav Aleksandrov (3):
      hwmon: (max31760) Fix the local temperature limit registers
      hwmon: (max31760) Leave standby mode at probe
      hwmon: (max31760) Report 0 RPM before the first fan speed measurement

 drivers/hwmon/max31760.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
---
base-commit: f4e680ffc2e50867c5b590e26a37f8801a31e486
change-id: 20261108-max31760-fixes-0af187603717

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

