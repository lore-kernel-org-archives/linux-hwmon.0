Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7FF2F745E
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 12:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781612157; cv=none; b=VGfa1JvxmIrgycgSDIpSXh5ELHoEJLVsorhRtvHFcC35PAq+8PPnQ8lLx3Un+2Yg24TXPRR/Msq/1gYGGEyuJI5+hw5xnvF+t66CqceowGhY2xNwHbNXgYz+xneIiI9ddfTlw/uyXNi2vqs6UtFjTylNBABbRpo0esQMIHF8teE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781612157; c=relaxed/simple;
	bh=eROihqtSnVRRTnPRiNwcXQwBEC82Y0qvpzQ19rl3oHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eyvgcBJY8T02G/Tsyrx4NigfTgyLG/3yVfDqvFCqpcrHq7PmoaPKErEbSu2p+4MWORsqniA1BF5KHDTgkoft7gjEbpqWvlGY6agNf2awo/Tth26G2JsWi3TKP2jR3EoBVhPDydk9nimy9+BgIetptgYmOQvzpcA6b1c4AZ8ImRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZDoSKCZ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZDoSKCZ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45eeba68948so3311145f8f.1
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 05:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781612154; x=1782216954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R5P50Gb8tDfM/qjpqyYI/u9pHQU6TkAQoU3h2mNWI58=;
        b=MZDoSKCZCg05zr/LC7Nnpldw2XaqQvF89kHInnMScM2zkoYto81BuUHIwJcYL1OgTr
         qkGo6x2sK5FJQIuNVsawMVBF2Av3i/ujd60ATKhTx9PwQrHMSvXkqPANt/UAxIuL3APN
         MLRKTQzXdi5OdIvnFGa5m42ZVfWxHjj6OmweLNv64qm3mR4laSFUTvSuk3xLW+yGWgWz
         D2aFyFviJg4ScmV9a599P6KaMP9jVoZ5uvpf302gRTqkBz1bXlZuNSzLAqj44Ug+Sn3q
         yecaPKScoWHPFrB8T5RlDIl9wIpFLM1yrgqAQfx12FxThUbKPwMmWfpbbPfzVjISh8L5
         p4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781612154; x=1782216954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5P50Gb8tDfM/qjpqyYI/u9pHQU6TkAQoU3h2mNWI58=;
        b=NCHJ/dP+30PyvOMdn31UsOm3I096S66BhrJxdCtkmGSCJJ4j5NUzKuY/tEtyfCt75X
         XObp2pM7ctZM88Xmvcq+UIbBxa7LM108K8Hm4j54jca4I+/fnJn2oufJVV8rpaKPBGjl
         v84cJvqouuYKJvjK9HtC2QL5172D1vJ952OqVD6nP1SM16tDYGDyOezd3CAU/toIyM+N
         Ci9m8cGmP1mxHrsE6FMBYNBikHBE1VLymbKWStU4YFqW+rPYnvgAHHbOdJTbIIHHm9XG
         wsHcla0hE7Bt07TznFYyTubjJ9F8kX5tTUBvO9JnOGxmBx0qPxDku+Lr+D9c8Jv+ZZc1
         mm5A==
X-Forwarded-Encrypted: i=1; AFNElJ+V2N9P1rlFD89rT89yk06kh6sBYJ9JFr1k169GJ0hy9JpOkxILRht+qem3/9nWrHgSUYpMVbM8QIcHRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNPFEGkeQSoy7g+ys9jc7OVpuY2NaUJ0dJPcd+WZSC4r1epD9/
	OF1wkJTZwXPAA2G1g+/fo46S3TiLUcAWusYc/bZDrchNDh9H+RZcSeD8
X-Gm-Gg: Acq92OEVGR5PxiKKTsNgUMZB/O1TB9Vvk3IyG9WXLdDicjVuom8KlhrNcP+2inDMvoR
	srRrw+oGyKd6xnsvjzvB58ssXE9LRBrO+WEi3abyOemsw7xDCBoVddtrtw99FKxlXUzVx2jwI2I
	l7RziS908LpgF+zl3JQXhrFzsKBxad2+az9tYneIGaR/vCdRnETj4+2QWrhtK9rb1AjgqWl3HXJ
	Xb2HThkPJG29UZREtZgJPy3SNM0wAf2uVtXBVmctAnPeT2Jz51BePkqx9rO57UYEb2r+9+ni8tp
	2CB1x3DBp1Ld+Mehw9ue3NVt6gn3/nNWyRFA7Tw1kw+Lk+QudwEKxZUlMSs+sxY4A1b40M+z8oi
	afYPcbD5PuBPynjAqd6J0r2LKVRdHIW8nc3eZ6Yrm2xaiqNGY/WsqgIhLaRAf5/TEZaT2VSMWu6
	KQbEVGu5Strh2N33yg2emD0jHtXe+JvAXWEwkxrXXxdw==
X-Received: by 2002:a05:600c:4f8f:b0:490:b99c:9337 with SMTP id 5b1f17b1804b1-4922ff938d6mr53775145e9.10.1781612153890;
        Tue, 16 Jun 2026 05:15:53 -0700 (PDT)
Received: from xz (bba-92-96-19-210.alshamil.net.ae. [92.96.19.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a8ebe3sm47684655e9.11.2026.06.16.05.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:15:53 -0700 (PDT)
From: Ximing Zhang <xzhangjr@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ximing Zhang <xzhangjr@gmail.com>
Subject: [PATCH v2] hwmon: coretemp: Fix documentation wording
Date: Tue, 16 Jun 2026 16:15:49 +0400
Message-ID: <20260616121549.29484-1-xzhangjr@gmail.com>
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
Changes in v2:
- Capitalized "The" in "The following table" as requested.
 
Documentation/hwmon/coretemp.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coretemp.rst
index f63b21f24d42..349301683381 100644
--- a/Documentation/hwmon/coretemp.rst
+++ b/Documentation/hwmon/coretemp.rst
@@ -44,9 +44,9 @@ Temperature known as TjMax is the maximum junction temperature of processor,
 which depends on the CPU model. See table below. At this temperature, protection
 mechanism will perform actions to forcibly cool down the processor. Alarm
 may be raised, if the temperature grows enough (more than TjMax) to trigger
-the Out-Of-Spec bit. Following table summarizes the exported sysfs files:
+the Out-Of-Spec bit. The following table summarizes the exported sysfs files:
 
-All Sysfs entries are named with their core_id (represented here by 'X').
+All sysfs entries are named with their core_id (represented here by 'X').
 
 ================= ========================================================
 tempX_input	  Core temperature (in millidegrees Celsius).
-- 
2.54.0

