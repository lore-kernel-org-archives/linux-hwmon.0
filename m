Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCD4346E7D
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 03:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785123326; cv=none; b=nV4nKs/8+5WemQPu3QGd7HVg49/bPVieRVWpG4A59RVxnGKG8x2z6uxNikJkWubu5Q24y/I64HMAlc14q0u/6ra/jZoBuft8eoRaum5TEF7+TRmWmkmbmESfJQZsH+9sbeFxlLRhKv+27uBU/+I/0CI3AuJerL7DJZqwgVoij2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785123326; c=relaxed/simple;
	bh=wLjLpbFWMbhHOp9aLJeBNVxyRMFbtbEnJsEsWRcwYxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M/pVFcxfhL7uDtzAKDAvanhOFIsO3Y+yiioiALvsu3SHowY3HheJaw2uL4ZQav7CDeUCMCxInqY/iziS55ngFb2mT/yerO/7BLUC09FB9XXR4Dnv7onqCiLpFXMXAYaX184lneoeV0E6abz59XNtIb9ar7dCWfcydtczxOCrjnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5PqL7xI; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5PqL7xI"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66892c81725so2331458d50.2
        for <linux-hwmon@vger.kernel.org>; Sun, 26 Jul 2026 20:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785123324; x=1785728124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GREuudJI/7OKzA+NE4qImaNTOyvHQ0XAg8n50h5aj3A=;
        b=A5PqL7xIw5R+Mv8SF2vq2l8AsklpEnTUVvRcPYqoqAw4XwQLBzdPghf0C7Or8tvR5u
         F8fEf7RYXJf1UFFoedbns7wgGOw96TK4Rclc0VFT6TtJgdFzkkCknE5R8NXd0fvS6dsR
         UQRxg3ecaX/QofEHza4A+zjRCfR6wLRimIHe28lmEUPcuOvhgvuPNi/f5+TxWJuCS5eS
         u/1HXtsa6xhQpPU5NS10b5vma+ZXdGLy+VlIfvCt8JQoG/0mthSY0ZmW0i23dY2Ov4EN
         wnMJqq5cZveBZQ5U2PsPzulKJQoiPRIp2mEeKQOg3ssyCsLxkgWGHtzEXURfG7pnmmx1
         /TZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785123324; x=1785728124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GREuudJI/7OKzA+NE4qImaNTOyvHQ0XAg8n50h5aj3A=;
        b=o96xqEsThi79bAKOLOf8kZkyuRiQrtn/8y7cckACUvIkCBq6GqYxWPmlFA8MAhIrhe
         LbI6oAD1eO8o8DhS5qEFBa3WdfalofijiXqphCAmtWBAr+dZ3u56n27twj2yBBC0TjpO
         0TV9CSP1bEnNG+mOR1LlkhG3wG3Df+eyPZ/oRQEQP8ZWLrZOjcTsQssSjxpjC6oYRXsM
         F/o8OiD9jm7fhEnDjjt7bugTOrDP4Ls+h0nobC/wSkg4Ev7Gq7M7hpTGOD8+YilU4NHL
         B77OKurGiwpP/eNVzROfXrT06vf7BxA7RVKabQ3DlL2iXeJ1fWTmfCC0IHSoaYFkD4YL
         K4kg==
X-Gm-Message-State: AOJu0YwPIhBrbapjkWGYph1XByo/uU0mUvEhuQwRva212luxvoVX7i4T
	SJseigbV2+wtwQdTt0zFeh6HX5ttVGtFcQWWmvMHz9ZXZQ6ZT40ZSXHV8Xdqbwu/
X-Gm-Gg: AR+sD10C9bTuDn3IaW8a2bgx4zGdtiYxfFujVCU80kh/yQX5a+ZxGP9EtU3xWZTQTB5
	S7DlaUIk1Iurm+LAlpu7bEnkoAzTjUFGNVBCFwAi0cyyi53J20TuNxMNWnPKUBofKCDC9Op5LK/
	l66YrgbpHkyJ7Bc5iSBWI+LSsOa8VvRI4w5W5D7vqSuYL3WzJxmZe6v+T3I/BrKRpH69IDltm46
	RQCt0zyF+CJoYX4gTIomdk1MYmbSWPlTem6P7i/iuJhb7eJUL5q1qKux1NZOQWmJx00XIrRz577
	JxMmBqScoBOahH2T+k4JB9KEaIOZrv19Jp5VBWu8/lpqQFS8LR/MGNQt2xM/Cz3X+yjyYNnxn0h
	CXYySKc8C4OEYh4jHQEQVGtCS4TYaNkgp+zP90HPDFelT5d4ddr+1BfTi/neWfMhR0L2xIoKI9l
	4z6zsagDnjEgiCkRXjiA==
X-Received: by 2002:a05:690e:488e:20b0:664:ce2f:faba with SMTP id 956f58d0204a3-668c79b0605mr1431461d50.3.1785123324141;
        Sun, 26 Jul 2026 20:35:24 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-668c6d63596sm2751525d50.6.2026.07.26.20.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 20:35:22 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 00:34:42 -0300
Subject: [hwmon PATCH v3 5/6] hwmon: (adt7470) Fix temperature alarm logic
 in hwmon_temp_read()
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adt7470_thermalzone-v3-5-21424d550c3d@gmail.com>
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
In-Reply-To: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, sashiko-bot@kernel.org
X-Mailer: b4 0.15.2

During the conversion the alarm callback started interpreting the
channel index as an alarm bitmask, resulting in incorrect alarm
reporting. Compute the proper alarm bit instead.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/r/20260717211224.B9E291F000E9@smtp.kernel.org
Fixes: fc958a61ff6d ("hwmon: (adt7470) Convert to devm_hwmon_device_register_with_info API")'
Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index a34635526aaa..f1150f0fe217 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -569,7 +569,7 @@ static int adt7470_temp_read(struct device *dev, u32 attr, int channel, long *va
 		*val = 1000 * data->temp_max[channel];
 		break;
 	case hwmon_temp_alarm:
-		*val = !!(data->alarm & channel);
+		*val = !!(data->alarm & BIT(channel));
 		break;
 	default:
 		return -EOPNOTSUPP;

-- 
2.55.0

