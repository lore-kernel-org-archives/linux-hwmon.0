Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAADD2F32
	for <linux-hwmon@vger.kernel.org>; Thu,  1 Aug 2024 14:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722523766; cv=none; b=pGooujWp+jhzQXaBh38wk3eDoFp5xBCkoju8p/yWehzPg60QJd6X3qGKg1q1rMrQNGTfe0f4Tbc/b/2qPH6mu8RPt0TxDSR3hiv2kBN9cfqWye+hIRHojS78aERZKjV2krmoj1LWJmpP15hBpZWMMrm0R7aiJKOJzyFymyxvFAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722523766; c=relaxed/simple;
	bh=vrPQ/cXjcNNuj7GqvWQVm2XV3OqFCdz1xs82G/BYkLM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fOgRESNwXVnShx3NpWF/eOTbZCBkEXOiKJT3MlxwgRWpDqaB3rRTrwVWuuKA/n3am7eif7zt9qFoNP+mpntXcDlMOIR9oX0QYgKFEQSC7wIES00z1nLpqcbg/sI9okQum1JuwKtcA//BbOSogd51zBiFgJYNpCFxpo956zBK2Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJvlJfYm; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJvlJfYm"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2caff99b1c9so4692909a91.3
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Aug 2024 07:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722523762; x=1723128562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OyY52641o5EqsBobAxSLul8LYO5rhQ1hZtnfUxdXcIg=;
        b=NJvlJfYmGJ3h6KrsgzaWA7OLq3NdF7SQUAug4vvWvo6y/FM4CzPv1foSJMdjpS9dg0
         JhJAnVXmYIEPrwT8YHzXotkSHaZNbbc/iNT4W1L+wS67yDwiTNrJnQBxO/gz2nr+xKAs
         dHKIJkHlnxNB4aycOFnTSUrJcGwr2Wif1DE7jnXSRg7AR2nzkIHz4jILuc4SAVAdJhMk
         kj7vyeXeH7/JLMvcShqR41rbqIAQk5gDRDcBxS42IMltBxh5ymWTk2h/1BCgBQePotEX
         tMppveMVOA12mVeeAHDJm7+FJ6CeSwIeYhgY5JLYbUruUpSUgL0pmC4LFJM5nTxhFLRm
         4REg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722523762; x=1723128562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyY52641o5EqsBobAxSLul8LYO5rhQ1hZtnfUxdXcIg=;
        b=gEwOIfXIvfroa5yp2tQyawrT3L5oBm99GmxvJpSsXo73RLCxRwnTwKSQ4Qxc5o9lAp
         Q6c67XbTpBre5H7L0/3z9XjuaxVtnR0aJXhoDTkQOhbyvyYNigPv+1iWnzhiyEO+ZMod
         nyPUVUQHDlh4qrkFwUPVMp+w3L54eIKz2c4hAXQ/0Z3hR5fuQLBkJT8kgsuRiKfPJziT
         oFJ3tzUvnzB6DwYzTYqYQ8NwH0tnMdO9k1iQ/FsVUM4QyO0+R4m5/Cmyg7MBJdAPcEPW
         vhbLbCFdJvo8RG1djP3jhZ3aYRNXWBPwe9EHtDdDMnLlwIO3EI7DI4StnHHpc3RvpDpF
         aKoQ==
X-Gm-Message-State: AOJu0YyJ3ZPH4D/hbDffoLbTZHozg34fZyNAg4vuoRCBRoepAiufRJVt
	6R2ZRC6T+Txa4u3JB1w6+vsOVs702nE14LAFBIaZsLHRuxKmlP0rbWq1fA==
X-Google-Smtp-Source: AGHT+IHA4P6QmDIacTXMKlmOD82vGsKO+SATSJbFCRw5+YSa7gixaAhOj/4ZKh5MjOWspFdGXl3FtA==
X-Received: by 2002:a17:90a:6682:b0:2c9:b72:7a1f with SMTP id 98e67ed59e1d1-2cff9514876mr519405a91.28.1722523762479;
        Thu, 01 Aug 2024 07:49:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc426751sm3464417a91.12.2024.08.01.07.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 07:49:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/6] hwmon: (lm92) Cleanup and conversion to with_info API
Date: Thu,  1 Aug 2024 07:49:12 -0700
Message-Id: <20240801144918.6156-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up lm92 driver and convert it to use regmap and the with_info hwmon
API.

----------------------------------------------------------------
Guenter Roeck (6):
      hwmon: (lm92) Improve auto-detection accuracy
      hwmon: (lm92) Reorder include files to alphabetic order
      hwmon: (lm92) Replace chip IDs with limit register resolution
      hwmon: (lm92) Convert to use regmap
      hwmon: (lm92) Convert to with_info hwmon API
      hwmon: (lm92) Update documentation

 Documentation/hwmon/lm92.rst |  26 +--
 drivers/hwmon/Kconfig        |   3 +-
 drivers/hwmon/lm92.c         | 457 ++++++++++++++++++++++++++-----------------
 3 files changed, 291 insertions(+), 195 deletions(-)
