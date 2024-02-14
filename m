Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31BA13B785
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Feb 2024 19:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707939828; cv=none; b=QNJmq/VLbQH0/8T2KmJuoqOnSURcGSFqWx5A7AeStwozZ8s/iuBaSF5qiWZpoyv+L3jTyywoeSYurq5NNgJG4KsBjAAc0DtaHyWMZeXlhjWY7tCdhhBk3QnPzP+5895Z7uF1qwFYojCsZ+WOF6d74m1sVVXl4ZlbChDUqsWf3x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707939828; c=relaxed/simple;
	bh=7CI7re7sQnSLWMdnZ1XynDjr8c0O3KbeaCXZzt5sDkU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bbHalHs9pYbtx9NJ7mczOJgBlH/oyhRC4n6N67FZLfbjoN4sycTblW+t8vMwUHLuTwgGIFPMUUCKl+wPe8tlNTKt/3jGGLC6/QTXPRRkJ8ZsJvW91LTqo/b0XhNuINiGBBeWda++rAzq4bmRo63BhD2ySc72pjL+hP21uR6qKb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOHq1qsa; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOHq1qsa"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-296cca9169bso134522a91.3
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Feb 2024 11:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707939825; x=1708544625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vsu5CnRTo06J8y8uHWtmMmA4MTV9/OSB6gnDBzRPEZE=;
        b=EOHq1qsa9I4D/Kj1ppwCODY7fnT6q73Acuintfoeb8oaWcn3t0PtaeOEtK3MEpMeJt
         ULP+LP1Ofn9oy7r/Hhgz21HPdhJJBbf5VT5xaQGli3DbpBpeoQiiDH8MAH8hycHYR2zV
         hGkMJVhHXoqVPiLao/C2vnzF4Li4elvSwVKSoZpm//miPC4vsMr2Q/TuUqJhLEE+/T9s
         DRcYpkw2zyUOYDRsTTxIqmVms1xFOtGRaWOtkXCu0SMbK552SRNJkHGwxDRpQUucb3GL
         drSN3XGr3SdwDAVZEekOiVX4JBHKxY6ODJXBk+uy5mrvK7mWuYhkkBVDIyeV7iWaXxOp
         rm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707939825; x=1708544625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsu5CnRTo06J8y8uHWtmMmA4MTV9/OSB6gnDBzRPEZE=;
        b=VfGugpHT36fMtgCsiIf5OEc1PWFXG5g0Z6iw0s1p7/F4oFxBjmtOLJrDrQ4tulYnn/
         mZ2qnKOTIOzIeyNzNNvgNNgp54AHj7ieFvNLP7Z4zl1Up7KVhjqDLdIT4NF51kicsOMw
         O0a5DNnQex+/vZCu6peyLggLB7XjBi6EuDK95gZe5zhBJo3IveAMREcbzdOtFU1Q9pCy
         hM/cY6FhtU3+rPTMHozUwC9UnN4iMWtPONIrkZryrIMqZuGbO5lbZr9bunLZ62YKg5Wo
         8sd+ZrE92hU/auFt6bHxAbLZ3ZwKTwwOnv6mJvIiyJ+U7M+ilU9GjZpzr8AEQnCA+yRK
         lmcQ==
X-Gm-Message-State: AOJu0Yy5lhhLm5IiD30Rw3voYsvtL+YIjLa39+H1mLBnQtebRZ8U3MrH
	GnartE7JalThaWo+zH0rmTv4VWh87L2DQCRjMcNL4ZMBHxAVvBhHAlS6YSOF
X-Google-Smtp-Source: AGHT+IFOunvXkJNmCZO7QbWpANRH65R1CKOWFblwjzCQ/bGplucFnDxbR03VD3A0YFykyXS4ICpmEg==
X-Received: by 2002:a17:90a:94c2:b0:296:3a80:eb79 with SMTP id j2-20020a17090a94c200b002963a80eb79mr3260562pjw.5.1707939825208;
        Wed, 14 Feb 2024 11:43:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWF8eKv/iNU0TriRo1W/4LGij4TX0EoVt6q4tGZ+NEEsXRGWHpUQyrhEG4+NB8Emncu3/DK5U/2+iBKF8RXJGxqEGBr0pC0lSmZsxkXMJP8kTnFkRqqN1b/KkrMC5lCR+4=
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id mn7-20020a17090b188700b002926be9cebcsm1862912pjb.51.2024.02.14.11.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 11:43:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/3] hwmon: (pmbus) Use PMBUS_REGULATOR_ONE to declare regulators with single output
Date: Wed, 14 Feb 2024 11:43:39 -0800
Message-Id: <20240214194342.3678254-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a chip only provides a single regulator, it should be named 'vout'
and not 'vout0'. Declare regulators for chips with a single ouput using
PMBUS_REGULATOR_ONE() to make that happen.

----------------------------------------------------------------
Guenter Roeck (3):
      hwmon: (pmbus/tda38640) Use PMBUS_REGULATOR_ONE to declare regulator
      hwmon: (pmbus/lm25066) Use PMBUS_REGULATOR_ONE to declare regulator
      hwmon: (pmbus/ir38064) Use PMBUS_REGULATOR_ONE to declare regulator

 drivers/hwmon/pmbus/ir38064.c  | 2 +-
 drivers/hwmon/pmbus/lm25066.c  | 2 +-
 drivers/hwmon/pmbus/tda38640.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
