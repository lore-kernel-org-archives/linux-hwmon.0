Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4214877635
	for <linux-hwmon@vger.kernel.org>; Thu, 21 Dec 2023 22:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="DRrLoZa1"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3bb7376957eso918914b6e.1
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Dec 2023 14:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1703199114; x=1703803914; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqXo/hOcM+qx4dUwhqDqLKByD8sfA5/BJTEwAur9cms=;
        b=DRrLoZa1J7r+kh+8Jswby0jwq02NNb96h4V//v2TesiURHv4WR3E64yQwgcq/Sarh3
         iwHDFYHRv9l3wYRyvBjXOgXXWVc7+EzTYwnCb2U+xISAh71AqXzIeDH8FstLk3XhyxxG
         RtYIdkCjRdP0RYgkkBLVf8Aqp/7owcaXomwtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703199114; x=1703803914;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqXo/hOcM+qx4dUwhqDqLKByD8sfA5/BJTEwAur9cms=;
        b=bd+GvsNE2VxOIk+VCcLc3rAjjT6XxhfA3IegNrVySiuBlXXIsfj/rk09hIzc6/2zZr
         TcV2HUJsUx9pc5vzbiCbanKmcU+XuKBBYYyjbSLrtDaGqxszzKsoD0o8eBsYhje/wzO6
         k2aipoXSpg1zYI1SlNKbcdWrOtJ85JJ4MLjsFQghkMIXIDru5NWqGAW0f0KmMaklpfHc
         q5TnC83Q96oP1s24XsXuK17U/3M1KaEcj0uJRaa93LmhTE//muggQHGed/Xk6HzGJj/h
         Ur91CP3p0wmjLUlThfqX9XaRCrQLM4hvNdQ5bQoVhJUvU6dKmNE15PcCUvP+am8sT6b/
         U5Ow==
X-Gm-Message-State: AOJu0YxdMtPK5VPeer04W/Lcxtia+Ajerhm7Pp972GvmIpRuSZd5SHyc
	+/qnXC2HZqTpixuYQAk4If6VK+mJy/8fXA==
X-Google-Smtp-Source: AGHT+IHnAzzZRn/dA0BuVaCYR1hvqJdOIFrlaKhJX+g+dRc5gK1nXkGsJohHmECy/noeaAAYmP44UQ==
X-Received: by 2002:a05:6808:3985:b0:3b9:e8d0:6df5 with SMTP id gq5-20020a056808398500b003b9e8d06df5mr602024oib.23.1703199114242;
        Thu, 21 Dec 2023 14:51:54 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id a15-20020a0cefcf000000b0067f812c4a58sm782733qvt.60.2023.12.21.14.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 14:51:53 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Ivor Wanders <ivor@iwanders.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH 0/1] clarify intent of fan min and max attributes
Date: Thu, 21 Dec 2023 17:51:48 -0500
Message-Id: <20231221225149.11295-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

In [1] I got the feedback that fan min and max attributes are intended for
writing to the device and not merely providing constants to userspace.
This patch clarifies this intent in the documentation such that future
contributers don't make incorrect assumptions about them.

[1]: https://lore.kernel.org/linux-hwmon/ab8a1ff3-6d01-4331-ba5d-d677d1ad80b5@roeck-us.net/

Ivor Wanders (1):
  hwmon: clarify intent of fan min/max

 Documentation/hwmon/submitting-patches.rst |  4 +++-
 Documentation/hwmon/sysfs-interface.rst    | 12 +++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.17.1

