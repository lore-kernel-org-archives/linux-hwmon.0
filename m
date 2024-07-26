Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF844C99
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 22:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722032169; cv=none; b=a40t/T3/Mu4t3LqRgkPBzVmLbGymiEICs4QSINwT/FVyCHceILro9wVZF2mKW0R3mFVFuJWLw8svofc8TUq4U752UwibWnpnel35Ux0Os6UCnIzImhKqFsQwrG1MMcBb61fK4z5xNtyjzo4b+OryMQM+SscHTISMQxRBNKmQb0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722032169; c=relaxed/simple;
	bh=H0Gnod2k/eOk6M3JrddFBB3zOHA0chbIbqlBeHjAisg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=it6i9KDhF0vmwF8179/isK3akRpKCVDjRjMeo8u02V3zRh3nZlIfeE/yMhsnSxxo/7SSgZnxIVjo9U6rVAljzjt2cvHVNA9S+VWveoAU7ZnystdOkniLnposXS0AlwVGD5ePRJwk7ckqnRGYu5pn2C+1xqFdnTvMHQFKAzz15zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHSw8n1j; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHSw8n1j"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fd9e70b592so9300645ad.3
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 15:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722032167; x=1722636967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hs3+rDnoNa11yqRKjIlgGE8CIDzcydZoSFfJtreRiGg=;
        b=YHSw8n1jzN9TvtSG7VLP8UFGpIT2WQ5NZZpum95ihsNQSxvRPRHVilEoXnpnzeQCtt
         WBf3j/AFq3tjpfTV4WROCHGLcsgb3FqYMWwRav+QGoscZMimLOelijuaBU9uTsJgq09j
         F9eXOoPtO4RFt7So/yj24AgobDNFfBzN434xPO4dQ9qoazX0Bprf8sVDAxGnUPk8yr18
         bpCkygWP9WKwrg2uoHjJ+b0Zjgc2V8SCZnkHwjNyVt3NDfWkBTXucSYHVtOcWjeHVXTm
         T1KbD1XnxLhZe48EkPbRWtSDO/9b0iGAm++uG0qG1IRtuqlzIDKslA3499Cd5K70GIsr
         aAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722032167; x=1722636967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hs3+rDnoNa11yqRKjIlgGE8CIDzcydZoSFfJtreRiGg=;
        b=JIjvfqHvE34UcO/fHplujEK3w4QahvMcr2AdYsXvrlQM3e5qg2cwW82Pa3PsY6i294
         8lM9wv2+Go9TeaBizyCZjptW2txxSaqArwgz52EbvjgoMd2yXUMkQv+pU1ajbcBC7Xob
         6nDsrUrF53DhvVecfqGxmP7oCzv/3xoR2/jFz/osXq5UxOeRKLv2TZxJiHxzSW0bA+U+
         acxGwx1pR5lLXHEe3y57ZekuC/rdyHQPeHIActbcBRR2ILBfRiTiIO/fZftx/8nL0ghQ
         0SspcYCOZk8+pLEdn+ZBTffC+2HnpzWlB/R63lE/6dXfpV0EYGOrpLMimNs0yT+ib4li
         gY/w==
X-Gm-Message-State: AOJu0YzTKLtSu7yqIfyVXMOoTFsvzElA4GmV3RiUxPZgoxQeJC5SOJkt
	yyscZoUuuX+J0b8mUUvCo6W6BwBjpktNwROUDukrnkt1ENVmxvU+x5w+BQ==
X-Google-Smtp-Source: AGHT+IGj0ttat9YdSJjhGEL9fY+0S0+t5UFOeCDN9JX3TV5fKLNUbyhV5WGcDFInEJQVuzeMRWeaBA==
X-Received: by 2002:a17:902:e5d2:b0:1fb:54d9:ebbb with SMTP id d9443c01a7336-1ff047a60ebmr10875755ad.22.1722032166627;
        Fri, 26 Jul 2024 15:16:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f2baf9sm37850565ad.210.2024.07.26.15.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 15:16:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 0/5] hwmon: (max1668) Modernize driver
Date: Fri, 26 Jul 2024 15:15:58 -0700
Message-Id: <20240726221603.1190437-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up driver and convert it to use regmap and with_info hardware
monitoring API to reduce code size and to make it easier to maintain.

v2:
- Added Reviewed-by: tags
- Dropped no longer needed include files
- Fixed wrong fault bit in regmap conversion patch

----------------------------------------------------------------
Guenter Roeck (5):
      hwmon: (max1668) Reorder include files to alphabetic order
      hwmon: (max1668) Use BIT macro
      hwmon: (max1668) Convert to use regmap
      hwmon: (max1668) Replace chip type with number of channels
      hwmon: (max1668) Convert to use with_info hwmon API

 drivers/hwmon/max1668.c | 487 ++++++++++++++++++------------------------------
 1 file changed, 180 insertions(+), 307 deletions(-)
