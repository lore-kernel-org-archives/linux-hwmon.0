Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD10778F3A
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Dec 2025 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767106273; cv=none; b=jqcoOGaxjdYmDG34DA7tpG6lvquZs5xhJTRp47lpEUT6H1wC0pvgfe986yqErK+qBPbsUcC784og2T9wBo12bXgx2Q6rVmibAhhf5XxkbUK2RI6Y5m3/k4NUFJBCNf9aBG3qAIIg3iZIEgXqH7tqMjSr39Qe+h7O6Aj/5aULnJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767106273; c=relaxed/simple;
	bh=PvxTqqEoXv+d/kSX4ufUfFkylYNkMkzpIqw2yGEPR/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j22zqtYrmOEoEGb6da3U1P4ZCvKb5O/p6Jy28aMQAR5I5LZonO5bh1H/dnLJ0NGKNxHLXPQ+NAUSDb+swsAJGybNKxKvO/2JYYEAc94lLU1UV7BseYTj3KefZ2CXlBbNF1J3O7j+7Fxsf1UhH09I7JDEee9Rq/Ol5JT2tSu4e1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IL6MqpPN; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IL6MqpPN"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29efd139227so132313375ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Dec 2025 06:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767106269; x=1767711069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVaFtbEFvkJCU25owkDVi6L1RdYWXkAz67q4W+68ydU=;
        b=IL6MqpPNZvwaJAPLLGqJovwW9vOdUe5vtVnsryfQpOzEmLnfXnN7Zpp9OZYhBkykh8
         9IeBDr+5aRZlkZG/jYyNDNX/ZopW2VjnvKgqXMG0oQ92aKf9nkFWsLNGYkTM92IjUtJw
         9OTsfGMYG4Z50wavSr9cJ4kNjkXhbV+tFsGVpcPE5Czi+8DCC527vGv3MVjP1v4kyTyd
         BW/b+W73bQJ7oSJ8ksUXDVaPJbHKokEbrOr8/jWbX6wTlB4/EL+HCCmwVzt9dN1lbdv/
         tTSAeoFcUFGr3fk7HkDLGZ1JFRVI9775vZf4R47P8uRTLV0OPz0Hb9lib8O9iCwzqkte
         uIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767106269; x=1767711069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lVaFtbEFvkJCU25owkDVi6L1RdYWXkAz67q4W+68ydU=;
        b=hcQYQWDCeRrewAFfiXCyLLWbM9Uu7ynwVSmx1JY8tm8awiGr6EkIACLgABZQh2/vNh
         g3ym/hgRCbglavnn6kh+V+YK9xMYL4j/IH7mcC6iZJTdnlVSxZ9EpeIkzJQyX893/Nyc
         NSUZO0ZqxA/M+ixkfOMsvMomhEzgHMoD2N10sf42yTxl7GVdV7RyZ5yJV5+lWjO17ig/
         2Uz8tyvB/aJzJ52e/mHMs6uIMZfF7IheHOg+pTzL0aD58787gY9doRtJlLT6Dqqonid9
         vNjfwFu58ODlyTZc8AZoeRyZYIlFzUK0mQoZT/L8NLnB4/qfivobZgv9zIFtE/lMvigN
         vVVA==
X-Forwarded-Encrypted: i=1; AJvYcCX0GPbNRreCJJrZhj3rIBrXD7W3azgVzAhB1f2pOznbo3iPYox4RO0GyN9R6cwbf/k6S+XdJ8eXC3GNzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yypr+BOT1cyn41lppybMs+djZMXDSuJCgB67fgZssMqnkcUJKtX
	0C/bRF+rhqeb4uChWwZOc89ehe48GYuhywAfV193/SzgKOYBMOmglQwi
X-Gm-Gg: AY/fxX4raM3UB8EKIuTSYOObeN3Uo19fmAbNPMxzcnB0z1O793XOEcmZeC8kJpaWYT+
	KWKAxOAI/N2jZ/54vR9VUog8kKpeQ+Y0Csm+Maws1quLzQXRvebtXvM/SoN6lmx3rKf4rrDXD6t
	jXvau6PhFIjTzZZB+rxzzUwUA2SpQwXBIAgfVv3HdAUT8fpGGdjsNXcbBVfhcPgPUisSn0Gsz7b
	Wuh7IkunFgq3wOSOOoGB87dZpRGJS9MB2qr5SFS05WeS8B/Dxdb/+fwljT3TiILVD6Ng/g64pDm
	5IzLl56FCRIZ4SuiavKY+2pBWeCne9C4NseFOapXHvMnN+6Qc5nHyrIDdTh/RYcyUua+T2HKsNs
	kEizetHxKHUJVjAWusnhVSGVogV+07IywCSrSqlM/cBsZk+SKjm9q92QJXtJUW9MAVvzhStcZBY
	WnrrJiR1+IehTXRUWIKTU=
X-Google-Smtp-Source: AGHT+IFnm67AA4ZaltseoSs4gexDX5MWPhE8tpSgggs4BjB38b12EDMSkTDdbGskxrnIjjSPZQoPzw==
X-Received: by 2002:a17:902:d547:b0:2a2:acc5:7a42 with SMTP id d9443c01a7336-2a2f2833082mr333825845ad.48.1767106268623;
        Tue, 30 Dec 2025 06:51:08 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d86esm301257245ad.74.2025.12.30.06.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:51:08 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	linux@roeck-us.net
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH v2 0/2] platform/x86: hp-wmi: Add manual fan support for Victus S laptops
Date: Tue, 30 Dec 2025 20:20:51 +0530
Message-ID: <20251230145053.516196-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225142310.204831-1-krishna.chomal108@gmail.com>
References: <20251225142310.204831-1-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for manual fan speed control and PWM reporting
for HP Victus S-style laptops.

The first patch refactors the hwmon implementation to use a per-device
private context for state tracking. It implements RPM-to-PWM conversion
using linear interpolation based on the laptop's internal fan tables
retrieved via WMI. It also introduces PWM_MODE_MANUAL, allowing users
to set specific fan speeds.

The second patch addresses a firmware-specific behavior where the
system reverts to "Auto" fan mode after a 120-second timeout if no WMI
fan commands are received. A delayed workqueue is implemented to act
as a keep-alive heartbeat, refreshing the fan state every 90 seconds
to ensure user-selected profiles remain active indefinitely.

Changes in v2:
- Refactored hp_wmi_apply_fan_settings() to use a 'ret' variable and use
  a common path to set fan settings and prepare for keep-alive logic.
- Replaced raw buffer casting with proper fan table structs.
- Converted RPM/PWM macros to static inline functions.
- Renamed internal context variable from 'ctx' to 'priv' for consistency.
- Renamed delay macro to KEEP_ALIVE_DELAY_SECS.
- Added missing headers and removed redundant NULL checks.

Tested on: HP Omen 16-wf1xxx (board ID 8C78)

Krishna Chomal (2):
  platform/x86: hp-wmi: add manual fan control for Victus S models
  platform/x86: hp-wmi: implement fan keep-alive

 drivers/platform/x86/hp/hp-wmi.c | 303 ++++++++++++++++++++++++++-----
 1 file changed, 258 insertions(+), 45 deletions(-)

-- 
2.52.0

