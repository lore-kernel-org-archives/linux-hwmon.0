Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385727;
	b=n1kjTWkHm+Y+QhAMTS5iwsT6LT1+axppSDKc6oRTtwOT78JTaaBWguZO71yRUCAPPSzd
	 eYWMwtfx1Dhy8HwDif2Wb3ajM9bT+mfq4QQ7yJGQZ+MT8Gdag4mnHLB+ruSxiSBuZBzLg
	 nQ3otVPK+pz8+1olFAAGkGQDftRursa0FYG3JL1Tmiczlcp8+rmtHIfbRSZM4BXCfsDaY
	 TuXsNjR+7ZCw+POKGF4SKWmfmFgKjk+4xTfQGjpIJsCmnfAXZKrWE9T6Nkx6ON+0dnWfX
	 auX+XD8GKIQSLhTb8gv0T+UAxyF5nLy1dMLiWcQcXwHK8i2WKXk2xXt6vQxTxEsreaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=nLsYYt3mI/eDGnhUV9HkZE5A3HHR6uBsCx1xZC1MEv4=;
	b=DuaW0oKhLZ6eidQ0kdUl+1dWW6YRtj82MgsyrVaTuUce5lEJwSwBjUbRYS7rLOFJy2bG
	 PkbQltNiarHhDL3hm4fsY7hLjfElprxWzbK01Lslki8gJuk+Uimm9oPftyHviHH3aNcXP
	 0TLs/t5Amm4ykVZ7piBqQmFEUePLCbhgnQrJIBSNRsIrNX6bVBmWyiW5zDIWqD7qde7e/
	 X0MgGE5Po/zc7yp7+yhV63fFVVeIrK4tLFg34s5XWQmtZeaK6H77sTWDglWzW0mISq+69
	 Ymblohc9HLVEFRaOtkkcJR3d3p5mJg6IiD5S6sQYLe0dnOqhFhbCYdxQEoIPjqnzR/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WzzTYXFL;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A6B606A334
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 08:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83A6B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WzzTYXFL
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so189368166b.2
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 00:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794385726; x=1794990526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nLsYYt3mI/eDGnhUV9HkZE5A3HHR6uBsCx1xZC1MEv4=;
        b=WzzTYXFLYguLfwGt0FKAR3H1jcizpt/6hddQEqesa8HRjEXY58T1Pr5zf1Mm1hGNuT
         /oVatvs6tHltKygAbJS7W6mDqX3cPhsy44rSlrzBbmf+KfkxEnIXMfCJSdcgF13dYwgh
         AwldHAMnJSnfgExfO63YtTo3bRqQJJNrg2RQmd0I9f4dZ7tMWaHXt3zMqLmhNHBNnESC
         bRpbkXLQVU0A4TNEAN3BLm1mxjzWYrDQYfDyXtsmCc0+7/pEkBIcvRh2a/9pNxtAvoqg
         J7bPRMgNUJIwR6L0V5S+awR5boMBgVNelxvlOVn1q9qEw7032esvZsov2YX7OGkd5sbV
         w4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385726; x=1794990526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nLsYYt3mI/eDGnhUV9HkZE5A3HHR6uBsCx1xZC1MEv4=;
        b=xrLWfAO1zMKoHjRhzzZYZrA7g6t4fL5SQ+UM09kggUt19d0jP8F911dgffCdHtOM79
         xVe4zfaxlJF45demaFXdsvREiwj6MTwbzE5oWYbUxxwvolRjCyTIgf8QhcZw4tkOkE4U
         eEl3km3s9CW8DWJ5zJuXeR6jicexcAODDmX9s6m4MOaejZ14NH0sPz7JrZ5apKl0nJXL
         DhyE5sUbmemomzFHZH96TG0DCo17lj+mc1v2n75lGYQAxk6StsNHo0u11HGl9A6swq03
         9PWNm/yroSEH3HFmMPz8RZB4gUidqZl7fSVu6flPnmkPQIsHWa6zeiEjKF0TqXnaEdFz
         vMnQ==
X-Gm-Message-State: APuU4Z8KPug1mLfxjUVplltoQAyugPv465yqT1uIdX6YS1YPMiktY2xe
	Zkp1KZjpsRi71JSRhOJIPrf+RZzCYvQLdNUMFmQDDnuKU6j2Ug8W8VIW
X-Gm-Gg: AYBFou0h+uzmhUmNBRpspo9xN8lSZ0uBa//vDPNznMU8NrLvqKotSeHASZx4T+2sVIs
	JOlskUIy3/UjT4cVyjw4pOlOfcIN3GO4pagBgyczLfQ78SX/grguilWUkepsSccdvW7FAht9bAP
	7yurpvWjZIPzXi6l/iZz0Eh7vfq3ja6T1K5H349xed1M1hrRpYj2QGDIv8Coo1sjGaH8s+Qkkn2
	oQ8xJ+M73p4AArbDH72kp8ti2+uBgFdtW1/Xg8iXmtDUP1bmDGpYAqWzDm5Dc2cddr+9fHGMX/p
	Nax3+u5udBt3y1Hr3eO54vua67hWicLgPXGP7kizivaZd5gf3kNbNvz3L98IWV6bVEozUiSy0Mo
	3i1EaqGOcQ030yMeFGwXGvIKXTPcHlVzgrtwFlxWVgrcdKcJhNDaTtEGu7TU74wEw70E3PA4/iu
	sdIlS+Qe6u7TLJLECxWccPmtk8h4bbgjg1Jui75AxuQnuWoffUQIOD62fFc/CSczulCnB7Fy+xn
	YhFzeTJHQrndgJUNHOvsmES46aWIh3HujE0o03w+1C3hHDfUfIE48nt19933P57yeQx11jPXKll
	HiQRCLY+OJT+6vfBOjVsbSb2ik9hExUcAfx8DDFOcPENSbqHzkE0rDYzk/2XR3J5E74JTEkf0P8
	AxA1Zcav2nW6sh9PoG0l1b7y9Iy9MnlxChHZrU/u2XQdgOnIgWM65roK/iGkqwZtpL2iHWxk05Z
	2beP8Tf7byPZ1cXC70mTRuPqU9N1vnvT28XtknGJDlqEQhTPWxTlQAgo/oC48F19tjz+4=
X-Received: by 2002:a17:907:a909:b0:c41:1e13:4ba9 with SMTP id a640c23a62f3a-c506684dc60mr118230666b.6.1794385725683;
        Wed, 11 Nov 2026 00:28:45 -0800 (PST)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56ffc7sm210135866b.17.2026.11.11.00.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:28:45 -0800 (PST)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH v2 0/7] hwmon: (nct6683) Fan control and sensor names for ASRock NCT6686D boards
Date: Wed, 11 Nov 2026 09:28:31 +0100
Message-ID: <20261111082838.1418051-1-jdahlin@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ASRock B850 Steel Legend WiFi (NCT6686D, customer ID 0x164a) to
the nct6683 driver and enable fan control on it, reusing the NCT6687D-R
fan control that landed in hwmon-next since v1.

Changes in v2:
- Rebased on hwmon-next; use the NCT6687D-R fan control path and
  have_fan_ctrl (Guenter)
- Dropped the pwm_enable and pwm write retry patches, both in hwmon-next
- Restore automatic mode on removal through the fan control path
- Added the ASRock BC-250 (Fabio Baltieri), needs a re-test on the new path
- Added sensor names, fan header names and +5V/+12V scaling as separate
  patches; the M/B thermistor and the fan header order are inferred, and
  the scaling patch can be dropped in favour of sensors.conf
- The struct cast flagged by Sashiko was fixed in hwmon-next (c4a01c2a80b2)
- Kept Alwyn Kik's Tested-by on the unchanged patch 1
- Link to v1: https://lore.kernel.org/linux-hwmon/20260825092546.669450-1-jdahlin@gmail.com/

Johan Dahlin (7):
  hwmon: (nct6683) Add customer ID for ASRock B850 Steel Legend WiFi
  hwmon: (nct6683) Restore automatic fan control on driver removal
  hwmon: (nct6683) Enable fan control on ASRock B850 Steel Legend WiFi
  hwmon: (nct6683) Enable fan control on ASRock BC-250
  hwmon: (nct6683) Name the sensors of the ASRock B850 Steel Legend WiFi
  hwmon: (nct6683) Name the fan headers of the ASRock B850 Steel Legend
    WiFi
  hwmon: (nct6683) Scale the +5V and +12V inputs of the ASRock B850
    Steel Legend WiFi

 Documentation/hwmon/nct6683.rst |  10 +++
 drivers/hwmon/nct6683.c         | 140 ++++++++++++++++++++++++++++++--
 2 files changed, 144 insertions(+), 6 deletions(-)


base-commit: 44c8ceae2dd3ae536c5f4f956cedb24c157aac23
-- 
2.53.0

