Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2593443CEC7
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 12:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611614; cv=none; b=j/yB/amFz0fEqzrOHZrb20P+rBphM591uj/qCU7gmekRe0EG+aOknV+T/yzaGfoCig6s1S0JN5OFR6SO5qv2nDNr0+7Wtbvs3mvqyWUWatT+B++xFsRnuuUffLNRrf6/6Dz3xp/O9y40dRPYnCRn5aTLssz08fjuCY35Kl2BebA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611614; c=relaxed/simple;
	bh=RBmWZiXvrAnD4CurwrIzEoSHSzqh+JYfS7flif9HQRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ipUYW7rSncOn1GqQzu4hIUeNy8DiEhIIP25sP2gcw7ErgyQ1DUoeEd63W1x0GCAgCmo0wQ+WpniryoYBVX0BECu4wM7AHi4CQX7Q8+n2FUBzAxq51HedZEaBN8doQd4FPVvm6SL5Aims4RZX+SIT+CKDM1DgHxkxZrMUlSBxGFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWK0+NoU; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWK0+NoU"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b9318997so32284905e9.2
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 05:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781611610; x=1782216410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CwB7aQGaWawnEZmE+FIZyeSVxfmoZLdsIpADLzVSdq0=;
        b=cWK0+NoUa6WtYK9t6AMVZoDYRUnmbQerqiGX13PSQVkkAw8rI8HrtZ7MARnOBM8Cvk
         Y8zQCODn4/L6BAJeyYHZzugOkMB+dqRnYWidCB3eFA/otL07ABwf2Gang5ehRjU5ux8h
         xAr7OSQk6LS1m7XbhilyWRf6diUE7TgmimtqOdpGqWMmfM8T7vwoZYN1/DJJ1TkAjzvY
         Piz+tSb5HDmkMsSdOJf+XAp8NXjRszNFItGMy2+zN5iSqwjSXaT6mbxdFZ0TR+6u0dod
         8E5hiZ7Q4wpvjFo9l20bycrSglEL73VlVhhmHBZvm1qfCQkbaAQMHoQ5E58pYremctVd
         eQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611610; x=1782216410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwB7aQGaWawnEZmE+FIZyeSVxfmoZLdsIpADLzVSdq0=;
        b=le5qT7Lcy6hQSjVq+30lZfKhOcJM6D1rwj4UgQN3UW/VM5j2/I62ti4/sVlIF8EVhD
         51CK2u5Hfq4oMCLYxGLi1nvRt+B4uMlwmIeeg/7TrgNdJaxqiz1L/mJosdH0/vQhQ2O5
         SLLayqf/TV69wwPsL+0180xdpQOE0FQvNOwMqoqUHD6LQaTL8UGy4+qB5S1YNv53GzgA
         vCjRO6jz33FVdEB5Zi/dES9XKSRQL7QbVfIIB+qk8Y4xLdZZqXPHQFEtixAG3X4/lXX1
         hmf2CeyYr1seRn2jFGyz9i55J2ndLiZbJbOb/a/0VCeyhdLzaOIG+47VI3Etu3bwK7k9
         sWEw==
X-Forwarded-Encrypted: i=1; AFNElJ/eDZ3IxJkQp8iBZKIgZhehtEi7vBYDi4+KD/SiCUOmmPszJNZShzRt3xvBL758dJYBzHJXAwIjxQCQrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5ul5is/GtRRQL7PK7dAG9+shfdh2aJ7HT/GZD2NIuXkBoqMbW
	kT1fxtp1/VVcR67LqBg2KLg0DckJBVqDLVdg7+QNTcs2GNsRHglceb00
X-Gm-Gg: Acq92OED9ehr5DqaQc3k4YKt9qrtLL+BWFjEUF/9q9EUuNpBIjPfZ13Sj26xYWmXWby
	xduEClF2UW1UiqaBoLbyngsZGO8cqlGoPLrDOx2W5/B2FiNKZk1kw7fYLkdXa+SkPob/nk6yXgV
	03hiwwvOy6qAUIrXcJBbU682tO5/hfmbMm7iIyHvIdzGvd2q2XuPv5joFG9pBceeQpZTdMuuUB2
	2eCSWOHO2vPpTeJ6sV9fPueVnUkgpcnKi44ufmhQ6F5Q/d0cCx8c9kWuJqaBUdAeM/OrWWKaxFY
	HCDUAG4I+XLBo2ifu9Vb/cXLYhiRN8ZsJ1j2uyBqAqLdJHVQzXcMad7F4P3Y4WYbJzVhIf9VLzI
	pjBobhMKWA1dPXHJsdnv+SnxaDYCtmsMnt7nDa8qBV7a3M4/jwClxhUYQIdqGJCRSxTO4WXWg56
	7L/+uVCsdaTp8FzenJ8oUDf/W7iBxN0EC7YpUId6RPGA==
X-Received: by 2002:a05:600c:3650:b0:490:d354:bd0a with SMTP id 5b1f17b1804b1-49220143bd1mr140581765e9.31.1781611610225;
        Tue, 16 Jun 2026 05:06:50 -0700 (PDT)
Received: from xz (bba-92-96-19-210.alshamil.net.ae. [92.96.19.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4a128csm425401165e9.0.2026.06.16.05.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:06:49 -0700 (PDT)
From: Ximing Zhang <xzhangjr@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ximing Zhang <xzhangjr@gmail.com>
Subject: [PATCH] hwmon: coretemp: Fix documentation wording
Date: Tue, 16 Jun 2026 16:06:43 +0400
Message-ID: <20260616120643.29079-1-xzhangjr@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two minor wording issues in the coretemp documentation.

Signed-off-by: Ximing Zhang <xzhangjr@gmail.com>
---
 Documentation/hwmon/coretemp.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coretemp.rst
index f63b21f24d42..5ce125b0be2e 100644
--- a/Documentation/hwmon/coretemp.rst
+++ b/Documentation/hwmon/coretemp.rst
@@ -44,9 +44,9 @@ Temperature known as TjMax is the maximum junction temperature of processor,
 which depends on the CPU model. See table below. At this temperature, protection
 mechanism will perform actions to forcibly cool down the processor. Alarm
 may be raised, if the temperature grows enough (more than TjMax) to trigger
-the Out-Of-Spec bit. Following table summarizes the exported sysfs files:
+the Out-Of-Spec bit. The Following table summarizes the exported sysfs files:
 
-All Sysfs entries are named with their core_id (represented here by 'X').
+All sysfs entries are named with their core_id (represented here by 'X').
 
 ================= ========================================================
 tempX_input	  Core temperature (in millidegrees Celsius).
-- 
2.54.0

