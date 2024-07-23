Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF2D53376
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 00:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721695931; cv=none; b=ozOpj48g84olFi+bCiJJSD9v7bbchKX5Sl67H0ioW6nbOU2Ydm6q44yyTKEg2CwTRfCHYlsKR+Z8MbVAFk1e1qYI7xGgWTYQJg7Fd5VpwJNKm2L9lZs0pScvLaBN9mOP9XbuuvjBNaRa8w9qx6gbFxrM64wxe72W8XIqt+DIPY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721695931; c=relaxed/simple;
	bh=RRTSMzJd3a/qT9qdZe6W7GimgyV5+z2r6LqmpL3iAYA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kc8HiTVXNWrwWf+YWbT8XcFdJ4Lib4HSQwp+xMRxZlUazj1x2BjelBEszbb80iIE8cSKbpBUIuy4FV2g6IQbVg5A8vwbyOFtTrBHpf+jy9IsY8zcg1NoMZFnftwVAQ0wJQ7xhvL4hSAbrIvG62zV+98ptM3q/K9OMKp6nAVsZ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdkKa6PZ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdkKa6PZ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70d1d818c42so1056695b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2024 17:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721695928; x=1722300728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Dl5wYwDlk+gF3JlICsjV+45lCz80OP2XI9iUy8727ho=;
        b=CdkKa6PZ5Nd7B4jco7cwBgYR3BtaTaANP4W8OX/yZ66TOW2Nf/W1KVQtRyynamSmSt
         OUt+SDBGj60NEEme9PkhT3sN0cYTdJjJk/bcJKPGYMgtrnm8jnoeuXDG1qLDsJoGpdL9
         JHkIoIXlXMgCoeHtFXS2aGLHd5MEdFrCfQVo6wH7SiLqfU+9cdQYOdHEspDCaOfQfKpz
         DSzJ1ita9UGI+bs1rMyEVTo7xV1Eknx5HInANhropLiFXK/d2DEGajb2L/SfVpnOKH0J
         ttGJeZJZF82opTYNLdN2MC5PJ4+NiHRzEIMiCQwUYhpuxJPQwj+MakroGc16+Qo1iwF3
         lBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721695928; x=1722300728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dl5wYwDlk+gF3JlICsjV+45lCz80OP2XI9iUy8727ho=;
        b=QAJTr3UG6pFKQo2VqeRN4rPfioqqwSyc8eGVTv0oeVZjkq3jqnY4HHApl7WeizqB7q
         ClKo/ysNsnhLTDlEdKQTrtF+wap/E0DVnRu4iEA3K4Ko0eCVpRIvM6/+IUAIgTDaG7Xf
         +lF7F0uCz8wnJ77rTq6O62fDvv7iKEDnpWfv6cR5QdJKCgOFJhxhcUis/LLkXTHeiCYD
         JX1+Gcrg2GpVpdEJbm1rcGS0+Bcl1Th/C6SfC8rVII4oxmJgP8FNjAG2VHecs2LHwPsU
         Bs+WdJU31eQD/IXjfCfINx3GGiVl0tb5i6vJqPD7+RASGmt9kqsoVFBWhxDOAz6wlCHu
         5h0g==
X-Gm-Message-State: AOJu0YwY4GBqQRjl/xl8nieGr27l9cnD+EVdD6Hwla4cVLG8m0kjxOXy
	5KmbwM7k4v32WJ1atkFdULNkX7PTI0nwe5lQhVIeKJP4K9iusiG+Tyrq1w==
X-Google-Smtp-Source: AGHT+IHoApPbCwXM/yutZsrMg/PRCDtMEaIEa8Zk+WifIcz7uQU7GMHU7+PeiF7wVXa0smtIU3Y3EA==
X-Received: by 2002:a05:6a00:4b4f:b0:70d:311b:8582 with SMTP id d2e1a72fcca58-70d3a8918e6mr1932549b3a.9.1721695928350;
        Mon, 22 Jul 2024 17:52:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d28544ee8sm2341233b3a.201.2024.07.22.17.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 17:52:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/6] hwmon: (max6697) Cleanup, use regmap and with_info API
Date: Mon, 22 Jul 2024 17:51:58 -0700
Message-Id: <20240723005204.1356501-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up driver, use regmap, convert to with_info hwmon API,
and add support for additional standard attributes.

The patch series reduces object file size by more than 30%.

----------------------------------------------------------------
Guenter Roeck (6):
      hwmon: (max6697) Reorder include files
      hwmon: (max6697) Drop platform data support
      hwmon: (max6697) Use bit operations where possible
      hwmon: (max6697) Convert to use regmap
      hwmon: (max6697) Convert to with_info hwmon API
      hwmon: (max6697) Add support for tempX_min and tempX_min_alarm

 drivers/hwmon/max6697.c               | 892 ++++++++++++++--------------------
 include/linux/platform_data/max6697.h |  33 --
 2 files changed, 366 insertions(+), 559 deletions(-)
 delete mode 100644 include/linux/platform_data/max6697.h
