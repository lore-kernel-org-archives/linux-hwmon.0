Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2652253B7E
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 15:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289166; cv=none; b=djm5XH8FzR8d3kf6phpliUyHAe1+FA+RQsqX0/NU4eReHWIEG+kbh0Lq49BkeGVAma1To8ZGiYXHjoDe3J6jk7kX/p2BhM7j2LMxsJj8W4ZUMcmcmUFQu4+eFYw29sSh4bTYy4QLJHCxKUXMGMfQmf06xwFApSh5f5zRRoHquSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289166; c=relaxed/simple;
	bh=b7BmnWeRF3gZrVJhUopFJd2Hk39yZVFPA/FkcoSs67Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g+0JRpPBuxmbG3NxF65D3rrCHvfiWliPBusGA5lBSnr0eeoES0k3/fuk2if9cL+qT6VycbYHoCGAjSK4ouCYEdwf2dk1NrCGIk7hY3L7bq5rgw0OsYKXv+PdVd+7EDzsceaRv0VC2LONoTkmpPwMnX/2+RyKZz41hY8jGNVsny0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIvC/BTq; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIvC/BTq"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21f5268cf50so62174425ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 07:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739289163; x=1739893963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=podBIZupjum9hqRjg/OTVZkDWz6CvVGX+SB+9L6GNAQ=;
        b=FIvC/BTqBaUEKdJEBUBRFVqL3XjT0ypTKJDLtD1Te0IJmNau9CBrnxAY5QLib62scf
         zTpte+h+FG3RAzKLqMIPQ8yy6F1EYUVOnPCgLeL06IBROHd0saZP4B+zyIepZ2LlKVpp
         rXPhQVBnWQg1Ci5Kw8O9tZedamV8DsiAC0I62hRP5i/+HTtQcTvMRHxvBTnLoaeldYMH
         EPobcgQ0K0VZAtaooNcYt5aSvvac5Rn70UwhTkBySG5iM5tuO8b0/LyP/kXkVWO6Z851
         +FKbU/ykW3E9RpTo4XTpLwMCkP75/BXtLbUIsL1AJHYoN7wRyf9ccI90sKdnFxD0yHsk
         NwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739289163; x=1739893963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=podBIZupjum9hqRjg/OTVZkDWz6CvVGX+SB+9L6GNAQ=;
        b=w6wq9aQP/ONkHU6AJyrbopUu1jVlHRc/sEZF/MdVU8E+ryHxybNSWsXwOTMPvpVwYo
         t8DIlPsZwQ5LK31pADgcKc7CmC98iPV95oD8RXGprRbJJ+sbcmMfxE2tlTCjzEc96xFc
         IR3VxVv5eo4V1loL41BRo1cM91OHwH5TN6TnGFIlleOGPsDcLxukRmHv75LylHL+gpcc
         03QiKMC83aqiF2tG6AHXqATbN2oB0eFUSiG/W2Vlk2R3JZUoihlqM8mMplFULBeL9O+w
         VhT2Ha4lrRh/G24tuGRuTHpO3WnWGxak9tGmv1RgHOZajAzVvnJpAjyVzyh/lLhGorKe
         G7qQ==
X-Gm-Message-State: AOJu0YwRAPnvdsiz1tC+zJBnX5cBWJAbZNZ2FHfYgEA/p9iS3izR7J8O
	ikM60+tVj01bKdAZyi2sapJTJE8EpAyXRjMULx/LWRue5uu2I678PX1/vA==
X-Gm-Gg: ASbGncuztfKCvSXAio5p96l1jSF7Zz+t5utAIC571nh/bwsEj/aIM8WjDM08Ebzo5zW
	A1FJRh9ZLpgY/TbrlmqxJWNakoFBQe+gak3ibVwVWsv+n0YzGpKKvp1n8sEPZDuIvTWh+4a3UNK
	/hE4vzHyZu3dA6Lzq1AGq/myajiIElAP1x6Lv3cy5FqkKtTyTmUX99Du0JFizvXzcuTF4U0lK1e
	L70BVS1NxICZj6gDs8NUzmeuxBOmDPZShehJTaVI6dK45Ah7iFBeDKK9WNqLiA1wAFELUjssWNu
	HZPQAuJrbQps8Wcb6BQPt6lD34hR
X-Google-Smtp-Source: AGHT+IGoT179Nhq/Ghigastg/KOYKJVxHVarbomqnYBxiTcyMgoPcOoFW33yRNwdrCHgyVq2EZED9Q==
X-Received: by 2002:a05:6a20:7f96:b0:1e8:bd15:6845 with SMTP id adf61e73a8af0-1ee49d3e237mr7973111637.1.1739289163220;
        Tue, 11 Feb 2025 07:52:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-730851fa25bsm4691683b3a.180.2025.02.11.07.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:52:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/8] hwmon: (pmbus/core) Various fixes and improvements
Date: Tue, 11 Feb 2025 07:52:32 -0800
Message-ID: <20250211155240.2077464-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve debugfs code by improving its scalability and making it
unconditional. Use the new i2c_client debugfs directory to reduce
local code. To retain backward compatibility, link the old pmbus
debugfs directory to the i2c debugfs directory.

Report the CAPABILITY register content in debugfs if it is available.

Declare regulator notification function as void since its return value
is not used.

Last but not least, fix various coding style issues.

v2:
- Add Reviewed-by: tags
- Use ARRAY_SIZE() to determine the number of debugfs entries
- Fix number of needed debugfs entries when adding the capability file 

----------------------------------------------------------------
Guenter Roeck (8):
      hwmon: (pmbus/core) Fix various coding style issues
      hwmon: (pmbus/core) Use local debugfs variable in debugfs initialization
      hwmon: (pmbus/core) Use the new i2c_client debugfs directory
      hwmon: (pmbus/core) Make debugfs code unconditional
      hwmon: (pmbus/core) Declare regulator notification function as void
      hwmon: (pmbus/core) Optimize debugfs block data attribute initialization
      hwmon: (pmbus/core) Optimize debugfs status attribute initialization
      hwmon: (pmbus/core) Report content of CAPABILITY register in debugfs

 drivers/hwmon/pmbus/pmbus_core.c | 374 ++++++++++++++++-----------------------
 1 file changed, 149 insertions(+), 225 deletions(-)
