Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E9D35F5E7
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2026 19:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776453332; cv=none; b=Pe8GwLRwFGAk4ClZQzOTDIx32Tch4Zxcv5+peP4Q3fL+iXdifzxKj/WoRYMg6nk+HV3Qf0NOJmnO1E4na8/lXIA2NlGgeT60YWpkjIhsr7YmjCgdapJOzOrM8VXZ6e4XRwi4u2p3+6XNkodnqiL6e1A9Y1sw8jlR1ShZ+oJRhjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776453332; c=relaxed/simple;
	bh=zwOsI9YqoPTo8fi0WymBV6+U/2mo9JYQHx4uLvXs2r8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KzZXQbuheceJVG7apSdonrEjV5L/OpGKk/+r5tel18D1K7scE2MHkZO44t675yU6LBN+r0Bc5L0eHMXSQLXxWMKZeT/WcHg2c5fUgrVwHxk7QhNt4UuBg2F20/BrRckHzKwLoudK7we28UCFgpvHESt0n3TF7ulyeyA79YNA5vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HeSX4rts; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HeSX4rts"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so1113972a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2026 12:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776453330; x=1777058130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gh+Hk3Cy5JAjfm750WfXAcGG5BEiaUMyViuuazgvLVA=;
        b=HeSX4rtsDJ+ZSIV2SW9x6OiLGUbuh7ULk/xGLaHAkrp7FTkBX7UOOrGr3FJnErKx9c
         k+NzOaPeke7Hb0b473DY5hFsV9xWN7Bwiq9EmulFsfqlbGC4uj/k4QaYyFyoEr2tjXyX
         cDq8QxvEqSz+EdShYM86DcIk4LuedF0Raor0AQAYdpyPedQoxqY1c4XN6sT0STSQ+x4i
         /086Lre96R+jig9cU0MM+6GldNcFYBxt6eLOAi9vvsIyfIu9F7Ddo0ZkR0nTdKdJCbry
         LSEJl6CLaju4N1keNjykK/WgF16ZRrMfEQDNic3obgHWvIzryGIgwive09WA/l0deXBG
         sU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776453330; x=1777058130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gh+Hk3Cy5JAjfm750WfXAcGG5BEiaUMyViuuazgvLVA=;
        b=lNBVpJh3Q5ujsrHBjQkqOta2aKN4xOy0zvJI3LAPxlaND0RzcM4u+M7yOUr/qJlzZw
         nENSibxrfqbojS2G3Um9UedtCD9/Lgh8+ZakhxWLAUkTCjZaWJ19hZK+G+PQbWEO4FUM
         83LX+oBL8vLF94zu0zlM79Pj4zhO7eSvAi4uClUnyiNbemaAnOAeMrtxcqBciyIk6nRE
         CLtA7YFqbqf7Z9Q8vhpp/yQEJPkmEssGc9ld6Aslus6sHbPEM8MWt+o6lFYC8DNW/XfA
         apVAscpndpZ8NRU9p5gmbiK+zt7exLZ9Fahf8EImZ5hk3jtMoAirM9LuvvUDgjHRc0Tc
         LnBw==
X-Gm-Message-State: AOJu0Yzl8hkKY4uY2pUZKwMwEwEoVTM7Xwi8ha7mijEM0M2GLuWI3R6P
	yuaFSd4qZsw43kNera5XDvxhoHQa4qc3MHlsV6zb6S0Zd5VkXOak/UDU
X-Gm-Gg: AeBDiesAeJBhb0bqqNuGFOapyYs572yhIwSEZpIOz7u9Kz+k/kGh1ghknonZdesTmsr
	Y4QPcE/sPtLYpAVmppUgHpptxg5P2LycFhOl+Z2eNjPzclpOTfYEgfRchhS/lpfNngK6Z39LIFx
	eu1cqUqKPhYTI3wn98RXUxiNIRRI5fj3IQID37sc0ZWYsIOIUWZcDWjVeY4WFSJBScqxEKTWYUW
	g4jfirmFKLo8J/9baqwcUQBivnkFGua1dPwMQJ3DXNGzEaaPPKeiLBIJxwR8+SipbDyhnkdpRF+
	EMywq/JVAwLcOlG3RSRJWuD8kUEVp6Qvrc2HYI1usa+zzH2BPCMnwSw4dZ/R/7RaK/sAlGH/6Gv
	h0Dhe4ijCT9sc3XsJbXMwDaDouY3h1jAvRpmnCs7hVX1TkMYoA4oEfFYC094qr0dyINWPDBJMkL
	3YXjPywgtYQEwllZ/xBPiHAoQMCD6T9pHrlVknFnJ2Aj4uVzGtMaPCdvbXVnJf67yn6TmPkly6T
	Yk+a17WO7kRIyjHWkms87g9BnIl
X-Received: by 2002:a17:903:2acb:b0:2b4:6398:6aa2 with SMTP id d9443c01a7336-2b5f9f3a802mr46557695ad.27.1776453330154;
        Fri, 17 Apr 2026 12:15:30 -0700 (PDT)
Received: from fedora ([103.181.54.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa92c428sm33800605ad.0.2026.04.17.12.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 12:15:29 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: sergiomelas@gmail.com,
	linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] Documentation: hwmon: fix link to ideapad-laptop.c file
Date: Sat, 18 Apr 2026 00:44:11 +0530
Message-ID: <20260417191411.713958-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ideapad-laptop.c file now exists inside drivers/platform/x86/lenovo/
directory. Updating the GitHub link to the correct path.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 Documentation/hwmon/yogafan.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
index c553a381f772..68761947a1a8 100644
--- a/Documentation/hwmon/yogafan.rst
+++ b/Documentation/hwmon/yogafan.rst
@@ -135,4 +135,4 @@ References
 
 4. **Lenovo IdeaPad Laptop Driver:** Reference for DMI-based hardware
    feature gating in Lenovo laptops.
-   https://github.com/torvalds/linux/blob/master/drivers/platform/x86/ideapad-laptop.c
+   https://github.com/torvalds/linux/blob/master/drivers/platform/x86/lenovo/ideapad-laptop.c
-- 
2.53.0

