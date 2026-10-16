Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FA8471268
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Oct 2026 16:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168535; cv=none; b=V9fSK6xCfWBoN5KfT7otT6cIWALaT1/l1kO6ZNuuWD1Wx060Tv+gtDf6rYYGqLKYIdvnZ5FbH1khubGeH74p1Vc42OZyxLbSz14V9kw+jxyJ5uWKKDdW+fIh7bBpOq2ws01fDAL8pnSwEDtQmyng7StljWcNf/EJw1o3vP4U/oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168535; c=relaxed/simple;
	bh=5b1LSJchI/0MrZCsyqtEYTEFSPdgvZ9ZrmnPqy/vB8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f3MTrcVW9pWS5hjYsixvpSfU3IPAc3xGsIlJYiYCRhHyY3oEzkRdm+65vOlZ8kJnG5uRFLYCjYcwRHEr/o6073wn5u+wM53kKUvbn1r77C3dIWCEmkx3MHKga1hH4Xm+DdjUhJ2oS5BGiuJgms/sI2b5WInOnBajy+WHPpKO+ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lrU/WwFe; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrU/WwFe"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535a54bed9so62520eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Oct 2026 09:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168532; x=1792773332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=47f/8DXwm5RKkGVIka3Vq3IjvPnPwaCzKP349NQJgKA=;
        b=lrU/WwFekKY7r/zOZbUUVPaX1uhJBlgNCWmprJxzvZyr8iT7iZvuE1QGvLHbF00J1V
         +Yub72QYZt6GiLkz9pNm50XmdK9XfwOvH98CUihN8tUXDTXxRCBn09NFEb3JePdolOkA
         eqNPJuwVZG05uz9KNG0by5I5IsxaaOvU/QuZREp1Dy6BhspWkYaDthkUYg9w6GYGYkAX
         uV+1783yj3wSHC7gtCT3Bv+mrVAg0OJXu6862wr4MoUNmCGK5C9nHH3yZSvYZuVARDI+
         q0yDJqTjtPhqEWS0nga2ggkeU7qM3b8YAiH6EYTL7nJmx4saB5oXrzZiyrWSSxDIzJP7
         LjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168532; x=1792773332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47f/8DXwm5RKkGVIka3Vq3IjvPnPwaCzKP349NQJgKA=;
        b=S7HGhLZFtmB2JvQUCT6m/8Kc/7Da+tXMEfl2ycPEUBKzgDA2+cbAx9CGVLzx/lUkY5
         arc7KlNDjea+DrL8SzVR19LHKLzQ5ee5d0UBSdemmd/W8ibgPLPw2Qv+RTHzpgU7AX/8
         0R6OcS530I4W74A7ES83D2dr41OvAAFqDBmXazZtHMGU8jeX9Djh3uctH1kQNBP9wHuI
         l7lkr01sh2eM4TW82qFkcCmpeYRPYt83+T0LGLUgfE2ANQ0vOveIj9zgrSx0B9BoujX3
         dYnyCVY1YhqBOQWKxlVbBj1OlbIH2qzdXwhTEfqEMEz6KDkgVbzZZTBBazXUiXA2vO0Q
         KlHA==
X-Forwarded-Encrypted: i=1; AKwUvBzVyWYgt3AJrYqFpUeW6cWX3DC+pJUKw8f52WRY/HOe6Be6a8LdUScR2BLrPiQ3ZkqhSNhrz7ocwCbabg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIQKPk5hdCMzFFXp+XfeebiBPK048+mpVPP7WQecenr5VeuirvK
	qC5vM5j7UHhVL88qcg5clX9nQqRvsHXpQuByzXR+bvyojUwujsm5y9iZ
X-Gm-Gg: AYBFou3i0qPYCp3Ub+qYFt2yYNuaVR0SeleqDTa+xxovl5EwyArPHaqbAyCmPUTGoHY
	N9QH/dtSRxkU7woiilLuJEuqgw3xMc9KYrimysUCkoKk1OrCbnatcWVVaG+YcgTdB1t8m/T3Zj5
	jkMha17INmxs5bJVXankTS8vyOz7Q7kbgBqrFNGUGAcr5Nv6W8jILeMlUH9Ubdi8my6rhVTmISl
	PvexL/Qwnb/l/C4lGQmyOcKIchs/gGvc82sCqTuhFV9V7J77yxtrd1eqIWMzYqQjQS4nYMxl+Mr
	e7y+Xjo56WiTkC+oGf+WOIfh5G1SY9G3eb+io8+fntBYSJxGDpzmt5CauLYAwFRXtsL5bAmVYtg
	qVZyp4XVW3IpMw3TOnlXVar4aB4agWe0KpUGMhIO1LC5x8Hg4ySPxF5OVID72tZQB7aDg95DsMU
	xz35MUuzPdO5BALdAaQ/epR//PDbVltmBh2gNMJC2NJqhz23WqirU+3xpLVxDXFDWiQrwGMBKQa
	oyFWIf2y0jrb3STUzIp7kw9Xilm6VLbBR/KqyG1N4TUzAKAaJMLKVtR
X-Received: by 2002:a05:693c:65c9:b0:35b:782c:aa29 with SMTP id 5a478bee46e88-361a2941548mr312350eec.33.1792168531330;
        Fri, 16 Oct 2026 09:35:31 -0700 (PDT)
Received: from dev-oss-0.tail8d7c7c.ts.net (c-73-70-201-200.hsd1.ca.comcast.net. [73.70.201.200])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a02b8sm8348351eec.17.2026.10.16.09.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:35:30 -0700 (PDT)
From: Qian Xiao <heyheyco@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Ed Brindley <kernel@maidavale.org>,
	Denis Pauk <pauk.denis@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qian Xiao <heyheyco@gmail.com>
Subject: [PATCH v2] hwmon: (asus_wmi_sensors) Reword BIOS upgrade advice
Date: Fri, 16 Oct 2026 09:35:08 -0700
Message-ID: <20261016163509.249020-1-heyheyco@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Known Issues section suggests that upgrading to a BIOS with WMI
method version two or greater should rectify the problem. However, the
driver refuses to bind when the BIOS reports a version below two, so
every system using the driver already meets that condition and the
advice does not help.

Instead, suggest that upgrading to a more recent BIOS version might
help. While at it, fix a typo in the preceding sentence.

Link: https://lore.kernel.org/linux-hwmon/CAFGXJCm6ZWK0NsFhZ1_ycgYtTTT3nhqj9mose60t+Rrry1aPvw@mail.gmail.com/
Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Qian Xiao <heyheyco@gmail.com>
---
v2: Suggest upgrading to a more recent BIOS instead of dropping the
    advice entirely (Guenter).
v1: https://lore.kernel.org/linux-hwmon/20261014233318.34567-1-heyheyco@gmail.com/

 Documentation/hwmon/asus_wmi_sensors.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/asus_wmi_sensors.rst b/Documentation/hwmon/asus_wmi_sensors.rst
index 8f2096c..741111c 100644
--- a/Documentation/hwmon/asus_wmi_sensors.rst
+++ b/Documentation/hwmon/asus_wmi_sensors.rst
@@ -72,7 +72,6 @@ Known Issues:
    X470 Pro seems particularly bad for this. The more frequently the WMI
    interface is polled the greater the potential for this to happen. Until you
    have subjected your computer to an extended soak test while polling the
-   sensors frequently, don't leave you computer unattended. Upgrading to new
-   BIOS version with method version greater than or equal to two should
-   rectify the issue.
+   sensors frequently, don't leave your computer unattended. Upgrading to a
+   more recent BIOS version might help.
  * A few boards report 12v voltages to be ~10v.
-- 
2.53.0

