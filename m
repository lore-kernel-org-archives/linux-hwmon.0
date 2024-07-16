Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3852A1AA
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jul 2024 23:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721170857; cv=none; b=UQWlPtoDf2vnKz4ftjpYdJjWfg8CdKIO8DMqlcGmWxDWM2ZolCp2J1JCUlMNqXQFZVOpuYLCc/zyMmND46XPOSXxoU7B21mWtErrGL7NQw706XXvAVy8CUc38aP+IF55VX6BRsOjQCOZo7Z9fiEwh6bxxU64Q0YMDtgJ20M4tns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721170857; c=relaxed/simple;
	bh=E30Wmvw0HrTRDTu49yA6Z0PBhI2/MYPAJbr6TyQiHqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=df8B4WP904dHpQ60baUJduVRoonXgFAKIPwLwD0rQEjf1UFtqA5Kf+gNAuDzxhgYzq3VZRS5RYmofKtaLKyYDseeiNCf+VpVYQdM+vw4rFZMJdjrx16N6Y7hgTRoSajPev6g3fxHUDaUzg9hNvv8bnobbzRIRaKGVC+52dOCVPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTp+gF2p; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTp+gF2p"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70b0ebd1ef9so4034401b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jul 2024 16:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721170855; x=1721775655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iESGkxPj5DWRaY9c5dvIYqnTAZgSBB0VUdedvOsKqqY=;
        b=GTp+gF2p4A3H2+8FdMXdvyDO0d2T6Ji2kYLTqKAH7MkzXbMfLdtafpAZ0QD+4L8OLp
         JgFbDwDy/mqzypb0pn7X4hXmZaepILLU8s0GmCGa81D9rW5OI49/OE2bXVP7mQBOiJrA
         jFypywlmkjLemnOEtweUnRQse+sZgEAVuvMt8oyIaM5Qbhi2HRahhYVDrpmSQyx7pab/
         /DTikx63y0SLpuZHzOVbTLKur7Xbt6OYvBoZJVhx5K6oj2bCJevFsGf05AIcA98V2Aur
         vGO6SLJQNMVXLkRwSWNGQ4f+7b1KsfE2E5qYNEGY5ksbLuZRK6JA2HZ6BhgNziS5WWqa
         uQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721170855; x=1721775655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iESGkxPj5DWRaY9c5dvIYqnTAZgSBB0VUdedvOsKqqY=;
        b=wz0y8XT89FwgwssWNNvfXGCp70IAy1eMTD1VNT3KM9eR0A1VaTCltIQjIEysZpwr8M
         xjkqJLZcRESyu/SZb0nR0p9u5yEcu07dCHKp0OjZP3fYFTP69Qqz0J5q6afWWdFM5XXq
         nOR8y2fmKNh5HtpmjORfC2TR78PIh0L38a3XWTPP/XlgaxchTvOBnlNRFUQJXXfz6IG2
         EenW6CY8Y0THi16n8vO5ghnh9r/B0cLC8VROVIR3L4FzXbCY+mCZiJOMFAFInKLwqPvT
         2ZLt1FbxkHzAn71NM53/zJlaKNWCz1iIbJEhzasjR9WGVq+rtf12NphyaRl5dwvCiAZ3
         JXFw==
X-Gm-Message-State: AOJu0YwxFYKiw7QP/nLnSDAev4KBzuaUs5EPqHZUr9geUzcKZE5Ergph
	KvJ4XWzcd3oM8PdGRXOTZEbnFdoX/CX2WZtrQaqebh8PZpT4HuPeRQPWDg==
X-Google-Smtp-Source: AGHT+IGAzD9+YQu0tosipPR4sUIHbB+qtB1lv5aSMktH2wzBrs27TBpueDi+jiROypI7HEwd1vrimQ==
X-Received: by 2002:a05:6a00:179a:b0:706:4a38:916f with SMTP id d2e1a72fcca58-70c2e9bab21mr4365836b3a.23.1721170854786;
        Tue, 16 Jul 2024 16:00:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ec7e838sm7049614b3a.98.2024.07.16.16.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 16:00:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/6] hwmon: Use multi-byte regmap operations
Date: Tue, 16 Jul 2024 16:00:44 -0700
Message-Id: <20240716230050.2049534-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use multi-byte regmap operations where possible to reduce code size
and the need for mutex protection.

No functional change.

----------------------------------------------------------------
Guenter Roeck (6):
      hwmon: (lm95245) Use multi-byte regmap operations
      hwmon: (nct7802) Use multi-byte regmap operations
      hwmon: (adt7x10) Use multi-byte regmap operations
      hwmon: (tmp464) Use multi-byte regmap operations
      hwmon: (max6639) Use multi-byte regmap operations
      hwmon: (amc6821) Use multi-byte regmap operations

 drivers/hwmon/adt7x10.c |  18 +++-----
 drivers/hwmon/amc6821.c |  30 ++++++-------
 drivers/hwmon/lm95245.c | 110 ++++++++++++++++++++----------------------------
 drivers/hwmon/max6639.c |  40 +++++-------------
 drivers/hwmon/nct7802.c |  61 ++++++++++-----------------
 drivers/hwmon/tmp464.c  |  33 +++++++--------
 6 files changed, 112 insertions(+), 180 deletions(-)
