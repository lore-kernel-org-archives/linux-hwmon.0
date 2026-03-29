Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FF31BC2A
	for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 07:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774769658; cv=none; b=hbGNJNfm68M7VbNKNcbUIBFogds50IdUGsFcnxzjD0W70auwYCKb2Br7LgfOaVpth5TsXRgHTfZzCkLtvmk0hPPn2rbQujAxG+DJY8Q0JHuqL+kyRawmG9oMdr6QxdXgL+wW4sUcnP0NFB6cDNHGNqCEI8T250U5dYZbSG73D1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774769658; c=relaxed/simple;
	bh=QgelfHPL8Pk/5WMJzKtnC2P+KhsxVKPiBXMgmF2yFxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I1td+/GdNgZ/Ryqj1IHBKnpdWmYypemkYoqqoVAZlxlcsA1y9TvgD+aGVBt0XILDppMgxXjmb79xrYB5Q/AT7Hcy2g3ssARPLnQFp0pJ2CUClNcQ9NEmYyPXE1eYEmMiZBMeZ/AiNMXowwnimF2NSK2CAkx8zcNKcjdOd432XnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rjq5AkpW; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rjq5AkpW"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ad4d639db3so15770665ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 00:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774769656; x=1775374456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WvMZLMSPEFXi2C5Ng6EuAMyDvu2TyckhqWWZFiCQ9H4=;
        b=Rjq5AkpWNM337g4nZdgx5SeTk7bUDu4+i7Q21QdGVbyt+8efLO/rVi33txA80ja85d
         f+Kd01H3Uqm/35HLiAbpI//IUUHjujzEsdpSDlK0glg6siYBOupjhLRsKRQeeeR3s0Ql
         1vg0fGmPkiMz1Re4kdOOVdJkKfEJWvV9HpIv2gJTG9vdSQQXWPB4fVzGSxxZ1O+cMkHy
         f7lkDpp40/DDx4gT3gMF4s7HRSdxi26FeC71FvmxQAa0QAGhL0Jv3L+lTZU9IcpV/9So
         Q89lMi5K3Xax4Vgf4tcJOrNFVeOkDGNN+n8BiXris1koQwDVXXbuNvXYthP5RvxVxg5c
         DRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774769656; x=1775374456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvMZLMSPEFXi2C5Ng6EuAMyDvu2TyckhqWWZFiCQ9H4=;
        b=CbxbJbQtJV2veFAdbQTeJ/jusSjalBISeHEL1qAMMqoh5aIN6euorYWkq7Ki12U6jZ
         hT3tL+wFsH7DxRO2PzIlmpToF6JCgTAASDAZY6qBAuFezZFP/0rQT9gfnEvIYOjyH+vy
         0hMd865jAV0DHYlrWYtdwnmKzqoE+GxXZStMHnGfkseQBC7s5f8kOA3lfxR8cxbsy7as
         EkzZcqIVrGjU1uc3TqSX/J87ykjICpLuuRVB7vFeRjcBCd08Rmfaan0ff1SApEnWXPVY
         X2z04MiUkmhNjJYCJYqqLGbq/4S6Vzf2vxqPudchGfoLoUZoMdK0ddKdzxgMHJ7ZZNQ8
         w+UQ==
X-Gm-Message-State: AOJu0Ywpy32Eit+JAJlhI8VPQYUCfZG6bSDh2KIoZ90YpArZzTxk+hZo
	YvkwdrIlWGKpjTO1P/TKUlRrR2gU4vg2L+//0Z/9tbiVysZCGsLR/QNF
X-Gm-Gg: ATEYQzzpUwqAnZmuSGeox+oKpFJNoS8qGRi8R23ci8dIKlPyAcaBBr1pI+UoYcwlBZq
	0MiFB96moxhV/9kPS2CJbJJsyHhOIA7DmY5EOomHF3/N+tLaXPs8wdGqN5ASXmh4D+LujxWva6E
	mcZOPH4kIg+Du+SiCWyTVBjV2XXRRxhXsGYlsBYeemsgQ6xzvQHnmRn4twiywhz+zfvUAD8Gjtv
	uQW0CjQqhUpMKfn6hVRNrURdYW0Saks4mr8NlHyqetqUJtSOLsvGlKb3bYM7wJeDdlqZy+duNOI
	DXLlmX7rQ3wB1XeNlPFoaKmk8SoTn1DWxwIzpjbAJhZFeCPlyKgFeoRfPh9dawDwFoJeEBuFtiI
	gnIlHQ89B617gJsmlQNorkc8MzAId82ol1ztZfGsL7/GF3cNX7/2hHBMswLAKrEmKxb9tshnxav
	SXYp0ulV1gIp59C/GSSoYJA/3SbmWF02PPGr0/5SkG+BNAWzH82vfk+cBwxmA2I53n5w==
X-Received: by 2002:a17:902:e78e:b0:2b0:61f8:9f01 with SMTP id d9443c01a7336-2b0cdd21fd8mr94854095ad.44.1774769656444;
        Sun, 29 Mar 2026 00:34:16 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([115.96.68.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24268e7f5sm42266995ad.35.2026.03.29.00.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:34:16 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH v2 0/2] hwmon: (ads7871) Modernize and fix DMA safety
Date: Sun, 29 Mar 2026 13:03:50 +0530
Message-ID: <20260329073352.270451-1-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series modernizes the ads7871 driver by migrating it to the
hwmon_device_register_with_info API and fixes a DMA safety issue.

v2:

    Dropped custom mutex in favor of native hwmon core serialization.

    Split API migration and DMA fix into separate, logical patches.

    Corrected output scaling and sign extension to meet hwmon standards.

Compile-tested only due to lack of hardware

Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>

Tabrez Ahmed (2):
  hwmon: (ads7871) Convert to hwmon_device_register_with_info
  hwmon: (ads7871) Use DMA-safe buffer for SPI writes

 drivers/hwmon/ads7871.c | 110 ++++++++++++++++++++++------------------
 1 file changed, 62 insertions(+), 48 deletions(-)

-- 
2.43.0

