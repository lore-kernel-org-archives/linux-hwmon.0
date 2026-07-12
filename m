Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93A12BE033
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 13:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783861432; cv=none; b=WaBeXPCIKx1ToWiOQYdpCWA8G9zDddIJ0LScaOIB9I9eHNn2/chj6SRvuw1LMQAB/DIYoUJHptdow5uXh4Knwj+qkVN4G/DkMLxWKOMMl1UyPnYRppOZ7Xjco8dB9OZIGZ9f0/y0U2yYmYUcXWjRu3tJ1VoOoFNU/bcA57+VFl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783861432; c=relaxed/simple;
	bh=kfEEVdtGnfL9jbdc8lvLtwD3szJH6g7A0Kr68ub+vcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iNUWlHg45gPNK5+JGC/3OT0nhSWkkKLLMtMCpao4FM70h+TRaqMAy/9BYoxS9jdniHrJst70S6DXUAk6SkAyorQVdMHZaFIQEcknRTZbaS2OCEVL0xb9CRlsru6VbyIIONSQiJObOFyumdU5BaNyYN3cu8iUjDvXcpZ+V3SOIDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rmyeEV2T; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rmyeEV2T"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b27c7451so40613085e9.0
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 06:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783861428; x=1784466228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2b4Qg7NWdsiZOE0P0kq0kaN5RgE2WJsRewi+cnBqqD8=;
        b=rmyeEV2TUhqJnPl5N9ivVP+pnanHbiO6L0fimqAS4z9w9ugXRa5VS3EoNAMabpfz1v
         7SVL/dgebtXTykldFhFT6uZit/iqv9dowVRLK2LNy3nY4L4MuqMTLydYp/kPEjTH+L97
         NMQ//GT207KYUrwe56lWzb6AJj9KVseYcBKdonuknU16xHPkEiOYtAUQV64EeJH9a8ia
         6yVVtlfmTB463AxP5CR1p3Vzo4v4EGiiaGmuIp7kpVqFwT5K6hdFTx3cfKi+wth+2pHS
         TvCaz9DilS/igGw50RZ5FF5rT+Qnadv49K83FywgHT0NyC3FwMO/EEa9xftetbHIncg2
         /QDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783861428; x=1784466228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2b4Qg7NWdsiZOE0P0kq0kaN5RgE2WJsRewi+cnBqqD8=;
        b=YU6nXUKP8PEsjv03vHoQ79eau6ejt0M2lKs+BrHjSaIk/EcE2z48unWzOtCcTHnFCZ
         Egcjq1i5H+Hr3aeAYLyNa7OHAEExU1HBtQ6QE0Q9VZ3TAfOGRcrVPRheaFfVLcZA5rLQ
         Mi67D9tBw9qNj0UhyqIgSAV3+Xb72DlJMpOzCRH7JQL5P9zl6ao/LjAeQa/6fA53s5+s
         JrVxncqPv0Z5QomFSGxtVJFDZd+I2G5NsQ7TOSxSMQ92yLbhi0jd6p7BPWqiSoFa6ST2
         XTS73Ip8WmZkxTrwucaSw6rAytTwkKaPE7RHl6TNqpxR/uw0ULWwphZWzDz+75xFxDAL
         U12g==
X-Forwarded-Encrypted: i=1; AHgh+Ro97fMOvIZtuQimOrqJ0Dh/4H4n4S3kJHqsw5ZBow546kRkxXl7egKVQye9SbO05tjBmv02QSrmMRdUcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzI9cpoa1ubZxNSdtgqDNkJdc0D4E/weOQzfdl53ppzVqtF1F6
	zws0RoZ9H2RlpvtHKwgfmMVOTGTZDzWX54++hF2v2eDPbQZ5FiHtg7sV5jTmTA==
X-Gm-Gg: AfdE7cn17NZmNsVubPItaGZaHaie2i+pAc11OtZAx1OvrpzEJ+nJvqbrOqn4/3onaMK
	4h3DxIqJFoo4NP3MlBuF1mBnQWsETfjlRKXW8XUY7xth2bnnMr8knSZO47/wjAAQUZru/iLqQaS
	uoXHh49a4Brs4d8TMuhwXFDNRwXNzxMTeqLToBf5vGGKboja444H02/SVv8NepWIGeh/RPjUQyq
	qtIcSTz//yc4xEu53//SnqD3n+QO+BPO4I/uT/FV+os0bkkc2ltk1JbhBvj84o6U+BQ6XgXWnNN
	OUGCo4eWbMYBHEDuSI1waZqSf9Pf3cSrVELcd+JI8GfM4r5v2sRnekoJjXVo/iuxBPBS0g2gGfL
	FJeAv8hnqDglOASinj5+ylfefAkWhy4CS1csbnMAC8LogfI/IgSN7y8klP06XLsG4uH4C0IJ4Aj
	4ERgpN4729LIgWwJD4GxE1kR6to1HZq7E=
X-Received: by 2002:a7b:ca4c:0:b0:493:b240:6a8b with SMTP id 5b1f17b1804b1-493f2ac0688mr73485795e9.14.1783861428001;
        Sun, 12 Jul 2026 06:03:48 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8cdsm79784006f8f.1.2026.07.12.06.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 06:03:47 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:ASUS EC HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 0/1] hwmon: (asus-ec-sensors) add missed handle for ENOMEM
Date: Sun, 12 Jul 2026 15:00:37 +0200
Message-ID: <20260712130345.1256030-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2: fix silly mistake when 0 would be returned from the setup function 
in case of error in asus_ec_hwmon_add_chan_info(), making the module
load in partially initialized state.

Eugene Shalygin (1):
  hwmon: (asus-ec-sensors) add missed handle for ENOMEM

 drivers/hwmon/asus-ec-sensors.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.55.0

