Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872D331F986
	for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 01:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787449134; cv=none; b=IZtwsNSzeJg4iHvqUCEFK95z01MvpnRcBKaweEZKlxasZfOeZfJiVHHBrHUYhaZDKhoGqLXpVXBVSCuxYWxwtsdncFYK8Kwbv7KzXokxfh86Ot0KO7FT+wUhi5OpTGIAzpRpi5gfRTneZ0C8RZNkII7BvVejhYPTUmEXyPW+qbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787449134; c=relaxed/simple;
	bh=uAR8aeqSjSKTxiI8C9EVjSsrNfV8QYjrAUzR7KjHCT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gzcF0o7H8qQZtSAsrbQl/AIatnkKme2nUADHVet+6KmaBwoTwpfZaVBAl+YCwV8E3p2G8dHupsk7Ibwm6aRgetGSRMvq8iEQc88kB6FisjEPSjSt6Kspax7arsN+Py1x/9AUGtSWogmn6Ew/Gv2G0tPoUbzyzmmB+kGnYgaYQX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZMGH7iH; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZMGH7iH"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8487214ad2bso3129296b3a.1
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 18:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787449133; x=1788053933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tLOPF1Xa2gzZPzsppebje30+MImFxV/CsqBmJ2Hu3es=;
        b=EZMGH7iHfnRYTsUq/brJ2zdBkrsTYKZ3Zyq72uRW5RiO8w+to0i8sYsXadVJx0gGaU
         x+2MWz+IvPj8NOL6fNQ1MkbT2Yn1+4mhfYfGaYQRC0Py5vy04WKrO3CjbpScIfomYSQ9
         jFbXLcrAZBvucsFKNda15ZLOGOQ6/5q1EwwbQKimmeUftElfJlmzs6pYhW77Wh0IMEG5
         VjC5t2Co/MXQ8dzHF7eW6RRW9wEiozgRfHFDx3wNUdckZrpNjNRqVUAeUThNozblkiXy
         6YZYYAwcZK1c3aTh8l4xlYad+tA3c4xcKGwIJxwtspGfFjr/iwSf3OwUyIxW4OmUuIKZ
         qqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787449133; x=1788053933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tLOPF1Xa2gzZPzsppebje30+MImFxV/CsqBmJ2Hu3es=;
        b=Z1zmnRRFSCpOZC3HtGLi6kjag3M6VVkVNT9nrFXyBSeOy3L30IOPD4tzbWjl3lrTGW
         Sw4uCPS/Lj5GBkfeDSAjqv9jsK3/ixA4KfGCWVAJNBBSSW/XeQ0xmCDEAYNcgjipymYf
         TygZBbToSCBx8sUKld3xaRtYQxaC880tz92NxVjV5Z0/u/eOE+6rn5gn7vyvoS+68Xtx
         smOBkbXrHQfR9u0E7UDmfAu29G3I6sU1nFFzzUH7gPDftZVCNDOcS36T6FIZ+d6i6uMK
         EuznINSrCKpGGdGG5CT0D4/ZXF0ZclFPTHAngIvpyLeMjTQXfsuw8S766XUH4AEjfIAv
         Lp5g==
X-Gm-Message-State: AFuF++k5Ez5cKxvc8SdSl+VgJeYNNFvyKWPl4NlRO04/QGftlf7kccpY
	blrtrHJUNp3dFJ8BuS8J80eyusQ0xpcN3B1UsAPPDQLGj4ddsUn0qvtGM9Y1m/Yit80=
X-Gm-Gg: AR+sD11I6kXsM8FUB53/X+F2qis49KDUxI3qmBtU49CgTHQM2IK+tqYEyc4bz1N46UB
	BesTRaAxXpPLCkrpxVriAEc7tA9R2WRQ2ov+B1imBZmf6BWt1s+XlGSp8dEWlAYvew+56SsM328
	7QGtyGwar4KfHx13gpRX7ZZCFBwbGXLPriTURdcmYVDmmIo6XOjksy8PN1UCYm2A8JWC2T98Emz
	0n88d3pbgQfMgI9CiPoK+AoU6WQoJ1/FHcBv1f6xUZLBbJT6qVXV8BzXFg12l2Z6qvJfj8IvtE+
	+pNAyK+v8i0zXvxsclagwMrf4PrVhgaBAcBaaKYc7Zu26FIxp1Vos/iAOb+s0pJfCZXL/0MbASt
	iZnU6lnvosIYCTi5LoFOkUdcZT9vjt+vOmMwA+sqm8le2cOs1w0ImqMu165SQPm1lb4IpWDIZ03
	EDerl5zr9zj5bVyrJGoJL7cwKzVUyyZP34P9Fe/0GTALf3q9nhkXnZGs7JM2IAqq6xEt0+iUAAG
	8Bb8rS1hib4Cly0lleiFvpo/uf5UuU0Y60/YunTM5X1wOKzequv
X-Received: by 2002:a05:6a00:988:b0:848:6f5c:a327 with SMTP id d2e1a72fcca58-851fa04cd54mr22662252b3a.15.1787449132682;
        Sat, 22 Aug 2026 18:38:52 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520ef09251sm933205b3a.19.2026.08.22.18.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 18:38:52 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>
Subject: [PATCH v2] hwmon: (yogafan) fix non-kernel-doc comment
Date: Sun, 23 Aug 2026 09:38:41 +0800
Message-ID: <20260823013841.2884472-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821115720.2017516-1-hanzhijian1991@gmail.com>
References: <20260821115720.2017516-1-hanzhijian1991@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file description comment starts with "/**", which is reserved for
kernel-doc comments.  scripts/kernel-doc then warns when building the
documentation:

  Warning: drivers/hwmon/yogafan.c:2 This comment starts with '/**',
  but isn't a kernel-doc comment. Refer to
  Documentation/doc-guide/kernel-doc.rst

Change it to a plain "/*" comment since it does not document any
function or struct.

Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
 drivers/hwmon/yogafan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
index 48fa5148d..278cb089b 100644
--- a/drivers/hwmon/yogafan.c
+++ b/drivers/hwmon/yogafan.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * yoga_fan.c - Lenovo Yoga/Legion Fan Hardware Monitoring Driver
  *
  * Provides fan speed monitoring for Lenovo Yoga, Legion, and IdeaPad
-- 
2.43.0

