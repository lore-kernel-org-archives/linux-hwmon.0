Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECED19D08F
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706152; cv=none; b=Id1JkG4YmozD0XhPlthWrlVB0vf/kPjhlNnCmHLhT936NGToisCEiJT1ZA16BsWTzlSMxkCFrB4bE5x/8oOiWwsrDTmFe1hbJ8VR0Oc69HcTTn0X5p63Qd3xB/NFQqknvu+6HN5UDk3owbdNjdPP5RXldx+Kc+7Z7cE2HXPIytY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706152; c=relaxed/simple;
	bh=z9HK0NglIefI19DTLZBx/pVK2fxlbXs2kFQw7kz3ths=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oyfvzwze5P4Dh8g0vXToO0o8qgKNrODohXvgnpR3kLM4sJ04iFH+DKVLbu0MEJzEGoHKyCzK26m0spfpsOXs4eSTHWdV5e9ZdHYmQHgZa/qwKzaG60QHAD7xg1vSU6h+oUxUwXZBOkaqqpG0YWZ9NFJQd2InklLYzx7nHHAh4H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bls0pt7Y; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bls0pt7Y"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-789fb76b466so1807739b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706150; x=1761310950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Jk76IhtOPg7rpI03lHByuP671NnZjzuRZXkZOqPDuJk=;
        b=Bls0pt7Y0QXaDpk601Wc1cBdIHecwmLhZwHxMXHHd7tmQFkjMHGhCZrToaxMOW11rK
         ILcjG+rmb1ARTBxvAxSdCJ783OZWtQ3KN4nsTM1Se5LJ4K6/RVcJ7X5ehwlNVGVIHTNS
         fdOpokkICorKQ7dR+7MqEsDN40oURZ0ZXZwT8qqYucl8kxaq86mv0GEqSdS57b4QhbnR
         H7kvv4EWzOQZfpYeeBgqAzsoJuZc/xnMD8eYolKKvnH4BywONBEaDO2A+PBJ6Zo9BmnB
         8JHJiKr2Rke8Ik9bJsCetxU9pFQN/0tr0cph5zzUCwnHQOQ6OnIWMjgLoQkbkjzPt1fb
         bWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706150; x=1761310950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jk76IhtOPg7rpI03lHByuP671NnZjzuRZXkZOqPDuJk=;
        b=OovZE7CWbVCuYY/STp0ABF6c+D0nXqYJXslqdONvhPjE33sKG+rpOxaJGAe/y3rSr2
         UcWYtRh7yNGMHnMyUti289I736NPjhpIuxpCJbYIoSxWoZ6u4l+iBr3BWz07x4g6aamS
         ImvcM3b8wZzDnOu58ZxfEd5Q5WDyV9nVCf6xexLpX9FsIhcu4N+RqIrUdEs08NDpnlVJ
         hBwQHt9pmgQpiioJq/doQLwvpidH9JdvlmqYhvqhwRaaFYa3utuNMTnFcVB/fT4LTLtP
         ZXM+yoOPsua4bg3OuXFqWYWrrQQV2njWvkuC4vFMEKonXnf36TiYTWRcSWjKKg+Fnd/6
         mBog==
X-Gm-Message-State: AOJu0YzwhIJnVyQNd7l5pXedNBZgR4T2bxV/LW9mojufVYhu46YNcKoG
	V3HTBddZie/i4kCrMMC0TYhT/inh2MOH6q1Y9Ya1llWqRMOgwPnfUfhXFuWplQ==
X-Gm-Gg: ASbGncupkpR9Up7f0l7y7OXgTL0UV61jTDluHAiKedWouDz0fmS9y2vg9cFU/srl9Cj
	PwKaSajxoUqUXlnYPdfqOAIvVsva/JiuhFeiXrGZC+hoblOQZcUH9i8na8GUO5Oo72CTCEvHmWI
	DB2LewGmjgEKBObtKEKku3bVr9GUVYo80Nb43YmkobgZsIrBb27HXeAjRM1sfVPE0qfVkXb2wjp
	neKJqPzzFPqWAlWTqeHUhoqYD2AbRnbKt/JRmxRU7JMoaaGMcw444nOFgAOb2ax+O8+csmYyES+
	A1RIHQPXlinopLCW3yRmd3gFK0jjT1xMgwk6bJtQ6ikOz2yQrUtEcvgXUVtZ0Kj7R+JpOqMvKgy
	rpDsfFRD2HkSekFoZ8tx/3lSt75qKS25e3EeJGeQOp7R5AXCsKj2c0EudmXzs5HLlg3JtjKZUtR
	chV1QU+IFLRGBnJhKl0V6tMAI=
X-Google-Smtp-Source: AGHT+IFJvrfNxTnL7HuCaKvvBGC+7ffpQbSSJTZp6sWrk9F2yMrjWZGPs0ZQzUvgbhV2KXUWpULuGQ==
X-Received: by 2002:a05:6a00:2346:b0:77f:2899:d443 with SMTP id d2e1a72fcca58-7a220a84300mr4574126b3a.10.1760706149501;
        Fri, 17 Oct 2025 06:02:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb19d3csm25647586b3a.31.2025.10.17.06.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:02:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 00/29] hwmon: Rely on subsystem locking [set 2]
Date: Fri, 17 Oct 2025 06:01:52 -0700
Message-ID: <20251017130221.1823453-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

This is the second set of patches. More will follow.

----------------------------------------------------------------
Guenter Roeck (29):
      hwmon: (max127) Rely on subsystem locking
      hwmon: (lm95234) Rely on subsystem locking
      hwmon: (lm92) Rely on subsystem locking
      hwmon: (hs3001) Rely on subsystem locking
      hwmon: (sbtsi_temp) Rely on subsystem locking
      hwmon: (ina2xx) Rely on subsystem locking
      hwmon: (sht4x) Rely on subsystem locking
      hwmon: (ina3221) Rely on subsystem locking
      hwmon: (k10temp) Rely on subsystem locking
      hwmon: (mr75203) Drop unnecessary include file
      hwmon: (powr1220) Rely on subsystem locking
      hwmon: (ftsteutates) Rely on subsystem locking
      hwmon: (ina238) Rely on subsystem locking
      hwmon: (lm95241) Rely on subsystem locking
      hwmon: (aht10) Rely on subsystem locking
      hwmon: (adt7411) Rely on subsystem locking
      hwmon: (ltc2947-core) Rely on subsystem locking
      hwmon: (peci) Rely on subsystem locking
      hwmon: (adt7x10) Rely on subsystem locking
      hwmon: (sfctemp) Rely on subsystem locking
      hwmon: (lochnagar-hwmon) Rely on subsystem locking
      hwmon: (ltc4282) Rely on subsystem locking
      hwmon: (aquacomputer_d5next) Rely on subsystem locking
      hwmon: (gpd-fan) Rely on subsystem locking
      hwmon: (i5500_temp) Drop unnecessary include files
      hwmon: (asus_rog_ryujin) Rely on subsystem locking
      hwmon: (chipcap2) Drop unnecessary include files
      hwmon: (corsair-psu) Rely on subsystem locking
      hwmon: (corsair-psu) Rely on subsystem locking

 drivers/hwmon/adt7411.c             | 59 +++++++-------------------
 drivers/hwmon/adt7x10.c             | 27 +++---------
 drivers/hwmon/aht10.c               | 24 ++---------
 drivers/hwmon/aquacomputer_d5next.c | 37 +++-------------
 drivers/hwmon/asus_rog_ryujin.c     | 48 ++++-----------------
 drivers/hwmon/chipcap2.c            |  7 ----
 drivers/hwmon/corsair-psu.c         | 13 +-----
 drivers/hwmon/ftsteutates.c         | 84 +++++++++++--------------------------
 drivers/hwmon/gpd-fan.c             | 56 ++++++-------------------
 drivers/hwmon/hs3001.c              | 10 +----
 drivers/hwmon/i5500_temp.c          |  3 --
 drivers/hwmon/ina238.c              | 26 +++---------
 drivers/hwmon/ina2xx.c              | 28 +++++--------
 drivers/hwmon/ina3221.c             | 19 ---------
 drivers/hwmon/k10temp.c             |  5 ---
 drivers/hwmon/lm92.c                | 11 +----
 drivers/hwmon/lm95234.c             | 12 +-----
 drivers/hwmon/lm95241.c             | 16 -------
 drivers/hwmon/lochnagar-hwmon.c     | 18 ++------
 drivers/hwmon/ltc2947-core.c        | 32 +++-----------
 drivers/hwmon/ltc4282.c             | 32 ++------------
 drivers/hwmon/max127.c              | 23 ++--------
 drivers/hwmon/mr75203.c             |  1 -
 drivers/hwmon/npcm750-pwm-fan.c     | 11 +----
 drivers/hwmon/peci/common.h         |  3 --
 drivers/hwmon/peci/cputemp.c        | 72 +++++++++----------------------
 drivers/hwmon/peci/dimmtemp.c       | 17 ++------
 drivers/hwmon/powr1220.c            | 17 ++------
 drivers/hwmon/sbtsi_temp.c          | 17 +-------
 drivers/hwmon/sfctemp.c             | 36 ++++------------
 drivers/hwmon/sht4x.c               | 40 +++++-------------
 31 files changed, 163 insertions(+), 641 deletions(-)
