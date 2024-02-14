Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E5A13B799
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Feb 2024 19:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707939829; cv=none; b=N0kDUXXleCPF7KUmBeMa1LJ7oppG8/U9K9/Zv/N3MMDQ+oSMIYNsupM2X9Qi20nTJVOzr5Cd9eZ2NPAg3viJAOCOsSd7w3iXcGXLnmYqiUmz22Pv2NWMyK0Bwumh+ZAvtCsKL0uXwnZc5Ugl0vIy/zw7Rbm1kqpYdAfqgYOUfvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707939829; c=relaxed/simple;
	bh=6RgzV2tTNP7rSEUFpFNnBLkv/p9qG4EdWhGGL/LuqAw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IM35tCpNX4nZ2SgayyYjyojJStvcN99sk/NobA21T8r21iRFYSRuQyunejM5r5T7AVHKc/nN4uMGfbYKHcx1noPABWmOi6EmcMQxsLOZIcZYs48XqpEVWP6JDAgDwhJsDqpDQQ1+we6duWChpCnFNUxOKGGQeJ2fiGemDxlTYqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSfQi4Aq; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSfQi4Aq"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1db559a5e1fso847965ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Feb 2024 11:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707939826; x=1708544626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdKWjFPZgvpzObE3aaIxs9YxQjW3bzEPO+zibXIP3H0=;
        b=nSfQi4AqCOefmGQwGvbpCUFB/DK7L5uiOB5dIbGNSPXjBNGr9x/ajffFjJ5fTn+nuW
         nu8C7KdSLtpsmfaUbegWXEEJ/Q7gZfutyfO1cXA+gHDZUsYDIwMczb1I0iRbS3uQbC5+
         3yK97UGlFT1sAKuM0Im3Ony6guEAvRmDnCbwrNXuAwYs1q5f/aUaJrWts/s05BIZ73zA
         qAtrwDIBudL7CKPEM2xuttdGH7wCQxPYNBR7cSH2HsCtfmx52rWW7BUkSQkzJSdzdnf7
         Mkwu2zQD3mD6e6UU1AJp4J02btfTRdbficSwgIUcpQ7bAWM/tXt51TcIlXDuChXlxOab
         yh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707939826; x=1708544626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AdKWjFPZgvpzObE3aaIxs9YxQjW3bzEPO+zibXIP3H0=;
        b=UpXxVy8pKl3xCza1xM8g9K0ZxBAu+yiU1V7Y04lP2CsitKltdd5xL+jLDPzdH6r8HB
         5BmQJ1tz+lDR0PAFL9Y94ryJ2Bv2o4WHaCvBEwJBrd9qT5bl1C9zl6bBI3VfnsmY+vYI
         CI1TUf6uKarJRNMF0PIj6EQAzbQRTq64wfRMn8oAA2pdV6GW6re6eRljVmebrl8LM3LZ
         YaaRml3cZultESYao55EttrSSWIIRjO7qSttMO8Wrf7ID4ArEJh2Zx61O+SBMc63FgHF
         1qzItjU8GTeuRXJRMaC3z4bJhosOgA+DrSH2iNUOfL2gb+1+tCQNKqruGC1sMm1aJ0rQ
         oEAA==
X-Gm-Message-State: AOJu0YzGzAjqtfRG9Ku/AYacGmqJXCFwKjPBnxqQL8WDnHP0kezE+Dsh
	YUn3m0fODo4aTDglt8B4oiSRKGyoseD8emwqHeX5AjuqTgrmsKimK+SmAvIY
X-Google-Smtp-Source: AGHT+IGb/skroWmIxprn4whwPXt/6Zxy5ulMm79ztYH66A6ZTKyi/Wealq9Imn32hlLKzPhlGxHA+w==
X-Received: by 2002:a17:902:7c90:b0:1d8:e4b8:95e5 with SMTP id y16-20020a1709027c9000b001d8e4b895e5mr3460094pll.32.1707939826554;
        Wed, 14 Feb 2024 11:43:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVTG4nrlRwC4ek4VcabWIPtEJQQKRX0UQEL8+MPX5SkhG5YnN8K4tayeUbgHiwo7duUFOQhbkTT1iOO/Ha0OOKJvJYy/9WBKMsuKbOmW8kqWh2gRRep+ua99DVpsm7tOzeZ+fUyYN+toUSE9UKwpXe3+HyHD569h0b3r2Q4FG4S
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l12-20020a170902d04c00b001db4f10d678sm2030925pll.157.2024.02.14.11.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 11:43:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: [PATCH 1/3] hwmon: (pmbus/tda38640) Use PMBUS_REGULATOR_ONE to declare regulator
Date: Wed, 14 Feb 2024 11:43:40 -0800
Message-Id: <20240214194342.3678254-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240214194342.3678254-1-linux@roeck-us.net>
References: <20240214194342.3678254-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a chip only provides a single regulator, it should be named 'vout'
and not 'vout0'. Declare regulator using PMBUS_REGULATOR_ONE() to make
that happen.

Cc: Conor Dooley <conor@kernel.org>
Cc: Naresh Solanki <naresh.solanki@9elements.com>
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/tda38640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/tda38640.c b/drivers/hwmon/pmbus/tda38640.c
index 09cd114b1736..c31889a036f0 100644
--- a/drivers/hwmon/pmbus/tda38640.c
+++ b/drivers/hwmon/pmbus/tda38640.c
@@ -15,7 +15,7 @@
 #include "pmbus.h"
 
 static const struct regulator_desc __maybe_unused tda38640_reg_desc[] = {
-	PMBUS_REGULATOR("vout", 0),
+	PMBUS_REGULATOR_ONE("vout"),
 };
 
 struct tda38640_data {
-- 
2.39.2

