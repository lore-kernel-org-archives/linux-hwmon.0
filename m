Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD0549550A
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 16:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690535; cv=none; b=dlfbqdrqvk+zbb7wgRl19lCU7vSQGKb51qpp9oyQPOA24p6CrfCG5uFfwtThTItpGKCM4pEgznYR1l/EqYF1SGcafy2NiBq9S5flmKA2ASeY1SOQA+sgXDhVmY27fH3ZfM5G00AoKI6QZj3BPBUlZqMWS2LDcajz4rU3xb2/QXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690535; c=relaxed/simple;
	bh=vvtdaRHyEuZeha02kd+2URKxUEiaCXnvqXP6cyFr+V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uug2OiLpNK168XMBEmTgTxmIeLDzvGGr+CqwkVGOn8KEKYiqPLxw1e/XIRaVLWXc56zuFbUbGBninEM7o2qqLiiy9DOncA6i5uvU1X8I2PpfT8cGuQgLDgRJ8y4f5XFMRuNxnCbwHwsfwgAUtcYmSkk3tJ6qvvA65XiswwFjHGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxEA31Ui; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxEA31Ui"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso241380eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 09:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778690531; x=1779295331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLsKUFfU9a+f/1xvI6FPcRccHieAeA3lWoK8bAq9lao=;
        b=lxEA31UicdTlCMq57daua40CjgizQ9K5L69Z77foYy9gEkCuZthkDG+7iRtG1Z9Aij
         I/2jGWiToj5yYcErtWb8HW7nONvUlTlbtNO9mu2AwvIenAwqri/Mrn8nIhqy9nKtkKkb
         DOBgskh3XgntIDRxhXRkU048y6V48GqWzeaSUy4JmWeQJEpKD06qFhyqYJfgEhDas844
         KQ9qBrTdwofq4YSLRZcJpyiRCTpx8gEX34sQJkrUEix7Gi2GxL1GHbIBzW+Q7xSq9IFV
         tz6mcinCQ6r9ro75vrjWVUTEJ10jdKCP0kXL945TWRL61n6mXeQBM+Z0bx0DE1raKlxr
         7rKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690531; x=1779295331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yLsKUFfU9a+f/1xvI6FPcRccHieAeA3lWoK8bAq9lao=;
        b=OiLIH17BvhKy9tZZdPmH+pTD3L57YRrdW09/jHNB/x1BBO+DmnObcLQaMkfA3X3+Oo
         W/GKPC0pUkRN5rDe3uyrAdtaUxwknO5q0TJnL4ARRlpxmoyTLw5XgtUelQtrUSfanSPE
         WBlPcOqUl+X/6Epn1TUEc7Nku7fo84IrSMUqQUrVjhoM1/2yGY805YzWoUnVwlSSGxos
         Q4ig3kBWxI0nlZoIn0zDNmVCjGPIYT/ho/oY587L+Zo30x8VcVKuGx64dxHWgpufHGOy
         VF33SBFq2ITj4BeqY/DPNtS8TtU5popl87M/xvu0D8ki5MhSn0xb+9emPkF2bK8YTRlG
         roMw==
X-Forwarded-Encrypted: i=1; AFNElJ924EzfAYNmskrGRxeMjk1pYCBLhuiD6koTAfwa8e4Lkzr2qlzUO3f5dmHtWefYRO1q2GoGA0sjqZUihA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzncu5obBzAa+QDQ958AXnz/KBJX4DDUXz00i08YNZOsQOxCoEI
	WQD/HyOfm7KTnhg7Jp+aBHrBIqGJF9sSyE09A+A1FQqA2CbMzQEOpBjA
X-Gm-Gg: Acq92OGXhswxj1/ntz6YUEtK4KsIDbnDCKRfXMxXHgloPsd+fnbmX4AuuIt7ealVL2B
	9LMQR1X5LyMWUgtLl0FzQDZDh6fdNn127SiVOX7HyDxX1laxiVKzr4t5O4MApYkVIYAH9o0ChAS
	hGfPNoRWeA0zPcj5bZMROtQIS9fQRh0f2DzRvJw3VBXPps9v3zG/JQpt1Gfvf8UrM+DCXjLQQxc
	YXUj1QzUzobXLM0PMvt1R3+OuParjgoE6LH9JnJrNjn5rurBoUGzlLWMemlwaef4WeTerpqlvQK
	XmSeQDaXWZLhf7mETKVnG6qQovVqb7+iLzmI8ZHnVzAnIgIoJXaIlq8oA6+xd07hNm2dZupTThi
	wVroCriaw2qs5ev8zsvJNvmo/ePklhnp7wdU3kWV0NHaOFQ2vDBM+6JZE4AqDJS/cBqUJogMxGu
	2xrf7uv/XIh1Y8RlcaQT0s5xmY41q0IBJLZpJO
X-Received: by 2002:a05:7301:400a:b0:2df:5715:82be with SMTP id 5a478bee46e88-30117faa7c2mr2579316eec.2.1778690530910;
        Wed, 13 May 2026 09:42:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eafcdsm28743312eec.6.2026.05.13.09.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:42:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 13 May 2026 09:42:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: corsair-psu: fix and readd locking of command
 buffer
Message-ID: <62e02950-e31b-4faa-8b36-98bbfe898367@roeck-us.net>
References: <agR9YW7hGTJ_l7ms@monster.localdomain>
 <5f0406fa-9692-49f0-bcfe-c013f5fc7b62@roeck-us.net>
 <bde0fa1e-93a5-4819-aa19-04554c24d31c@roeck-us.net>
 <20260513162135.2893e42d@posteo.net>
 <254b59a8-182f-4ad3-8469-4f9e9511d3a5@roeck-us.net>
 <20260513175350.07900558@posteo.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513175350.07900558@posteo.net>

On Wed, May 13, 2026 at 03:53:51PM +0000, Wilken Gottwalt wrote:
> On Wed, 13 May 2026 07:58:14 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
...
> Okay, that will get a bit complex now, because I added my hack and I see
> exactly what I assumed is happening.
> 
...
> 
> If this does not explain the obvious issue, I have not idea how explain
> it further. My English is limited. This is a HID driver with data gathering
> functions running in the context of the USB-HID context. Callbacks from the
> hwmon and the debugfs subsystem call these data gathering functions, and the
> first function in that context, corsairpsu_request(), which can run several
> instances in paralellel, needs the mutex.
> 

You don't explain why the patches below are insufficient.

I used guard() to keep the changes simple, but hwmon_lock() / hwmon_unlock()
would be similar. Please provide evidence that this does not work.

Thanks,
Guenter
--
From aa3ec1484bdd619e8fa2ce569ec653d35fbf3615 Mon Sep 17 00:00:00 2001
From: Guenter Roeck <linux@roeck-us.net>
Date: Wed, 13 May 2026 07:14:33 -0700
Subject: [PATCH 1/4] hwmon: Support guard() and scoped_guard for subsystem
 locks

Add support for guard() and scoped_guard() for the hwmon subsystem lock
to simplify its use.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/hwmon-kernel-api.rst | 7 ++++---
 include/linux/hwmon.h                    | 2 ++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/hwmon-kernel-api.rst b/Documentation/hwmon/hwmon-kernel-api.rst
index 1d7f1397a827..9fcde32a140d 100644
--- a/Documentation/hwmon/hwmon-kernel-api.rst
+++ b/Documentation/hwmon/hwmon-kernel-api.rst
@@ -85,9 +85,10 @@ removal.
 When using ``[devm_]hwmon_device_register_with_info()`` to register the
 hardware monitoring device, accesses using the associated access functions
 are serialised by the hardware monitoring core. If a driver needs locking
-for other functions such as interrupt handlers or for attributes which are
-fully implemented in the driver, hwmon_lock() and hwmon_unlock() can be used
-to ensure that calls to those functions are serialized.
+for other functions such as interrupt handlers, attributes which are fully
+implemented in the driver, or debugfs functions, hwmon_lock() and hwmon_unlock()
+can be used to ensure that calls to those functions are serialized. Those
+functions also support guard() and scoped_guard() variants.
 
 Using devm_hwmon_device_register_with_info()
 --------------------------------------------
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 301a83afbd66..04959e044fd0 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -495,6 +495,8 @@ char *devm_hwmon_sanitize_name(struct device *dev, const char *name);
 void hwmon_lock(struct device *dev);
 void hwmon_unlock(struct device *dev);
 
+DEFINE_GUARD(hwmon_lock, struct device *, hwmon_lock(_T), hwmon_unlock(_T))
+
 /**
  * hwmon_is_bad_char - Is the char invalid in a hwmon name
  * @ch: the char to be considered
-- 
2.45.2

---
From bf0a3d1a69d123eee3126f6a360f0ee3e54f7b17 Mon Sep 17 00:00:00 2001
From: Guenter Roeck <linux@roeck-us.net>
Date: Wed, 13 May 2026 09:25:46 -0700
Subject: [PATCH] hwmon: (corsair-psu) Protect debugfs accesses with subsystem
 lock

Debugfs accesses need to be mutext protected. Acquire hwmon
subsystem lock to avoid race conditions against hwmon sysfs
accesses.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/corsair-psu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index 76f3e1da68d0..4a456ba44a9b 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -664,6 +664,8 @@ static void print_uptime(struct seq_file *seqf, u8 cmd)
 	long val;
 	int ret;
 
+	guard(hwmon_lock)(priv->hwmon_dev);
+
 	ret = corsairpsu_get_value(priv, cmd, 0, &val);
 	if (ret < 0) {
 		seq_puts(seqf, "N/A\n");
@@ -723,6 +725,8 @@ static int ocpmode_show(struct seq_file *seqf, void *unused)
 	long val;
 	int ret;
 
+	guard(hwmon_lock)(priv->hwmon_dev);
+
 	/*
 	 * The rail mode is switchable on the fly. The RAW interface can be used for this. But it
 	 * will not be included here, because I consider it somewhat dangerous for the health of the
-- 
2.45.2

