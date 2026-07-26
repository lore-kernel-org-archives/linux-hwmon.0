Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799F629AAEA
	for <linux-hwmon@vger.kernel.org>; Sun, 26 Jul 2026 06:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785049127; cv=none; b=TP4DHzh96ItIKJ6TYwYuHlk+KkIN0SPOz9IhrytJZvPuT5edFAV2KANbklu+yftzzwNN7d9RGciYQJFYodbMp0qXVS/kSNaoCXk2bwX92fuNp8x/hzwZm7rq+4U/qcx98YUlIV+EBI6KmFL94R098kShUzp+GLaDCXDEvUV2cdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785049127; c=relaxed/simple;
	bh=iWUJEIQp15Vv+mHQ2FLlbzu13SJ3z5D3SLnInr8haoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TJozp9QqM/3aMl3DP+ByKX/cPb8QaGWQqCALYtibaKBJeD3VTUYBvKJ6V9b6943DAt97gGQ+uOgCfgg0mgfCvPaLnY9lBwtpbbM8CnUmWQxKhUPYNl8svA7oFaPYvPrLsFe2mf61ohikjtE0IvbWj07A6M9ON0D37rj97UoNNAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PeggcgyW; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PeggcgyW"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cacb8416a1so16346595ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Jul 2026 23:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785049126; x=1785653926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kb8i2R2pDMPs/7f5uag+f02VBSsq6VTvV2JKsBdYskg=;
        b=PeggcgyWC7pITh0S3fZZ1eYrvAF0tRp53I0/XuppDW4O7nD+Jb0PeLBd8lTIZGW4rO
         SbZocmuHGBEi+wDmMFC3jvjz6lXqsBfuJtdBJZeg8LGXTv1+fvih1Nv6890hf3jwH/ZZ
         likhZkG055ExICO3bSlIvhvVHGF7eLznxNZGmVx6XUsHk36XpyyaBIPC3wXnjcFzGwIl
         sOeOzvY1hwgy1SzYQtXQ03Wu1BjzzJFu6YnM+C+8ZX7BLSprfmp49R0DDz3ZpH8azloY
         H0i3GLmME2dMaILgyaXPyauhUqWPw4qOASBKnElM17LYVJk3xakPa5Cns60KHB+K9QUr
         eqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785049126; x=1785653926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kb8i2R2pDMPs/7f5uag+f02VBSsq6VTvV2JKsBdYskg=;
        b=mpy0DgZpmFrl05QNrS4kpqwfonq8xOu7G/EOZUt7W9OzzqO6UYou++AJ467Gvfdi1n
         O6+slHDTzDPkZlMNwQyO1kkDt0+kd1WEUmBE8zFGo8aWuc6fnqiiIAVV0FIg/zmm97Oo
         5ocQVdF8yGolam3+xEDc6gq+qhbcePYGwenI5zrbi/VqCWKFeTrnZQoUOmbjK5DXp5p5
         Qa431aJfq57hHg+RaPW/m22s094/iaF56Uk0ZHdUbJg+mpcNCF4dWWjcHEBBo5oy2/Lh
         lcmiA+MnfHu8Igg3jDjBvk/0XZiyuNv96sAO/i3WRNlbFeTKVz2Rqfsb3ikMXwRmQMdK
         lMfw==
X-Gm-Message-State: AOJu0YxoXgF/f1uJBqdcbJMHqRKpgYbbfKTwvCts+kPXKtusZOkybpJh
	YZPdC0FDKQp3bDD1ru2w7sJVe57QeKuPhhWSp8vM1qCOJc2Vg6iQUujx
X-Gm-Gg: AR+sD11CiUpJI2W8vBzJ4c8pvWUj1IkYXIiLOqFgJOkEJBIW0pAAstvskSjLllwaK5F
	hhpA8TvUdE0STdoIgDvBdyEgoyScuuPUJs6Z2KRy5jiqX+NrNxYkPFPGeS5ZiPthHk4p4TPoEDk
	L8TZpRtPnL+MIPIieJmEtsPsPMiY3eF91pv4VS+wDqwKmNjFYp5NDlZi2YU7fmOgzdSRnu1PUNu
	rebdF+/a1jq+uyXTW9GN+/mcw0+OeexookSLQivBEkp5pHIPn81ZZjmuw01YgWgohmlF9/TUmNk
	kUmM+I/Rqoh84CzH2DC++owkmhDWvjejKd3+KqXqoxIciuTk3SNbSr0vLHQ4iNPNnSNAZ1onGQC
	maCG+NmZX2tTgq7ehEPf6E4k9PQwUQAbsjYexbBqacE7vlJfJmgH7Bq/ZdsggaC9oseSBAsrpFd
	dJsGGXz3Zj7uFdcXSwUnPZJDB2vwoRryo=
X-Received: by 2002:a17:903:18b:b0:2ca:ed57:8586 with SMTP id d9443c01a7336-2cfde83034fmr41352235ad.23.1785049125808;
        Sat, 25 Jul 2026 23:58:45 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e28easm17153545ad.24.2026.07.25.23.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 23:58:45 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: hwmon: fix spelling error
Date: Sun, 26 Jul 2026 12:28:35 +0530
Message-ID: <20260726065835.21012-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling error reported by codespell:

  supprts -> supports (sg2042-mcu.rst)

No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 Documentation/hwmon/sg2042-mcu.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/sg2042-mcu.rst b/Documentation/hwmon/sg2042-mcu.rst
index 077e79841d2e..431ed832d083 100644
--- a/Documentation/hwmon/sg2042-mcu.rst
+++ b/Documentation/hwmon/sg2042-mcu.rst
@@ -18,7 +18,7 @@ Authors:
 Description
 -----------
 
-This driver supprts hardware monitoring for onboard MCU with
+This driver supports hardware monitoring for onboard MCU with
 i2c interface.
 
 Usage Notes
-- 
2.43.0

