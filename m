Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7832BE7BA
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455522; cv=none; b=aVoURAw/4MGk2eMSvdpqgO54qnDMiJnhlDw26i2KAnyMC7AWZEiP6CcCscFIfHwMrPTJ1IntX4kc0swss6heoWO45XNs7io/YJ8GRqhEX2bMYUWaUxC5OuceEGbJCtDE1Qz3mqH0zZwGdbdE4v5pX2+Z/Ut7zizDAk4Vx4CzGpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455522; c=relaxed/simple;
	bh=i6aTwAwqYhKywS1EfnMBzrcR2RFn6FL2uV3pD+KIHqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GkJGUAOq9Zg0qkYcfU+7qBAwGH3WPvr84hzhXYn6V5/uKj2pQBa3eyoSJWkFQnM5w8x14nRJPhA13nYJ3fHxuucnsjows9OcJk63hLntKc4GqTb0mt1wJo1WBESK93Qow3T/0CA2vguLZAJMqSeHriHCDzDdycKaRawd0G2WVAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiNJZAxk; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiNJZAxk"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-28832ad6f64so61438225ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455520; x=1761060320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8zTpdudG6u0PXHixonn+BsFWpQa0mRAPJ+Aq6jcm8YM=;
        b=HiNJZAxkMlmX9vVNBzMf7kCNkPEZbOnlZEFUFgdSgoofqNFsmAwyPEohrNfAx6iyWB
         qxsvfDnHNWZNzCXdYBYrjlZB6QU1A2vHwdAfmuDqg64WI8d2FVVmsn2tMfZO3IDbadPK
         6p+gAKrJKIk+mD0vTstoJEwNu3AmGjtGG8OpIXBUIfZRmgVty32shMwS3GGGZZav1t90
         nMMwC2AhrB5FIy3QaLGZJti0sgHlUK6IJZyXsylJDoSAwVjvk1IsV5bTKp+5fQopEAId
         2oEhRtQ4seTiAuRgekKPtV0Tv3131G3NgsCzB7/HmO55+104Kp05gCAqvNgZ6SzfHxj8
         4CBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455520; x=1761060320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zTpdudG6u0PXHixonn+BsFWpQa0mRAPJ+Aq6jcm8YM=;
        b=N2Zzx3aT9j7x6ay7fwLdIl1hYKhaznUbucv40Znb8siWD1Qwn5BNqK9mdSNyaR60NJ
         KT7HEoiM4B+jfBockRb8mf0Syo+XFvBry5qS0QoKBq0eFwYpwcT+Gp1oLoRZ6PErP6oe
         AZrY16NNHL0eN1Q5mjUwHFqW0s/1rt+ahDXj88v/H8+Q090c5oRj1HLtLvdFlMg6PUpJ
         AwOFpXCz7/3p0/u8D4R71AcAAYAlMnOzPvRdI/BOeqZ26jv0cQvZJHdDMXhGkqkWRH0e
         j+NHFjhRZhql6Ape8q/H0jyY2EGI0CRD9fDS5FyPj1XAap3JNQ2Qn2y4buLXKWGMxqkp
         q4aw==
X-Gm-Message-State: AOJu0YzoeCWCEksHO5riojlW0OKEN+WI59mF3WFugit3fzj4CAI8yhaD
	pePeyaUt5DVBcrLijSGcVQ5AjkS4YbJ+r9grbRq/dMc+Xv0X1Z+IMN25mclCYw==
X-Gm-Gg: ASbGncvEPH4/glWM6EmvlupXpMiufZ33y4mVBfLKlFg/gaafq5HNWiLEOxeo++vcuui
	4XHA4/GKLmF7cJEDHHVTVvU4CyraZt6cY0hzOF1C5TP9hi4zxnb6oylDyNcRAkeFl5gf5tPkLQP
	xO1xdJ4joWQdZ/d4eoXl7RKZrcajK0UuKXiA+1qN5a+j9OGR1VItEYTW0DwB5FAFe7aWk6ZT1yQ
	FocVbIvA2r9A3tE5XdrkgGkw00WqvrlTW9EABTI0tA0ai9bDHGUfInDpTLDmB4Se9VLRUIY09GI
	xK370dNpA5LD/kZnioOn73AvvmlwQS6Br7te9KA3PT0INsbTYtVet/oWvPQUyemQuR0lNqdvOFT
	tnWtViF0p6Z73qaAfwqng91aAdIdNlhALbc7aX9Lz5Kga1EB0iNuan2KpZP64VxfL
X-Google-Smtp-Source: AGHT+IHiNtC+pzGfZpBsJFkKNap0dLC1z9urN+KD9uvbt37DCV74hjTfeiUcHerhGfB/KZPTb4OCoQ==
X-Received: by 2002:a17:902:f64f:b0:28e:a70f:e882 with SMTP id d9443c01a7336-29027215bc9mr321951905ad.11.1760455520063;
        Tue, 14 Oct 2025 08:25:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034deb2bdsm168362305ad.8.2025.10.14.08.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 00/20] hwmon: Rely on subsystem locking [set 1]
Date: Tue, 14 Oct 2025 08:24:55 -0700
Message-ID: <20251014152515.785203-1-linux@roeck-us.net>
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

This is the first set of patches. More will follow.

----------------------------------------------------------------
Guenter Roeck (20):
      hwmon: (jc42) Rely on subsystem locking
      hwmon: (lm90) Rely on subsystem locking
      hwmon: (adm9240) Rely on subsystem locking
      hwmon: (emc1403) Rely on subsystem locking
      hwmon: (tmp464) Rely on subsystem locking
      hwmon: (tmp421) Rely on subsystem locking
      hwmon: (tmp401) Rely on subsystem locking
      hwmon: (tmp108) Drop mutex.h include
      hwmon: (drivetemp) Rely on subsystem locking
      hwmon: (max6697) Rely on subsystem locking
      hwmon: (ltc4245) Rely on subsystem locking
      hwmon: (lm95245) Rely on subsystem locking
      hwmon: (tmp103) Drop unnecessary include files
      hwmon: (tmp102) Drop unnecessary include files
      hwmon: (max6639) Rely on subsystem locking
      hwmon: (max31827) Rely on subsystem locking
      hwmon: (nct7904) Rely on subsystem locking
      hwmon: (nct7363) Drop unnecessary include files
      hwmon: (max6620) Rely on subsystem locking
      hwmon: (max31790) Rely on subsystem locking

 drivers/hwmon/adm9240.c   | 17 ++-----------
 drivers/hwmon/drivetemp.c |  5 ----
 drivers/hwmon/emc1403.c   | 46 ++++++++--------------------------
 drivers/hwmon/jc42.c      | 11 ---------
 drivers/hwmon/lm90.c      | 25 +++----------------
 drivers/hwmon/lm95245.c   | 16 ++----------
 drivers/hwmon/ltc4245.c   |  8 ------
 drivers/hwmon/max31790.c  | 48 +++++++++---------------------------
 drivers/hwmon/max31827.c  | 60 +++++++++++---------------------------------
 drivers/hwmon/max6620.c   | 43 +++++++++-----------------------
 drivers/hwmon/max6639.c   | 23 +++--------------
 drivers/hwmon/max6697.c   |  9 +------
 drivers/hwmon/nct7363.c   |  2 --
 drivers/hwmon/nct7904.c   | 63 ++++++++++++++++++-----------------------------
 drivers/hwmon/tmp102.c    |  2 --
 drivers/hwmon/tmp103.c    |  3 ---
 drivers/hwmon/tmp108.c    |  1 -
 drivers/hwmon/tmp401.c    |  8 ------
 drivers/hwmon/tmp421.c    | 21 +++-------------
 drivers/hwmon/tmp464.c    | 13 +---------
 20 files changed, 89 insertions(+), 335 deletions(-)
