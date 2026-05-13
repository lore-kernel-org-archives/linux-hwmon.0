Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DFC3A59A2
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 18:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696219; cv=none; b=ouVAL8Fk3/uC7dD8B/JwyIboayZs4lGwcJdD0Zsl/virLzVoIhaRHE0nRYMdAxzycNhZLhr7EZo7rABvRWZrFvT9QACiCTF9BEVO+mpCle8MUKijaJmQUQJGurFEaKlhQSb+cHBXTwLd6HQmnRsbnB9jatseioX+8lo1yU7OY88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696219; c=relaxed/simple;
	bh=iOltX60XHPNgqNIC2DpQT5Z7BO+j/K77i8PFIemPJSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2bReYlX7S0I1TDKHLyO6VLPJ2EMPqAkVeBK4vnxM7RAkuf7Q2FqNlRT8xYh9HnKHyyl66doKFH/vJpIqX4mKBjWUkutkQvfNipaHP/EBM5noXmr8D8ESnZH6y/yCKNi3lO/DdRVpgOnIfxcRxl1gY/qFBd8rTLu3JqWXDhhlBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4OJJW6V; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4OJJW6V"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c7ffe8eeaf2so3081261a12.0
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 11:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778696217; x=1779301017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s03Oh/BgVRz777SZgXCs5erRF14ygyMEU76E4HIIUlM=;
        b=a4OJJW6V3AsKe7WrE2jneBjmQFz0lhp83ZA77ymTVE4zgqV1UTY0pekS2n8mQFMyC3
         3G+VsPaJJg8867jqClkZDoQXwgCKRmcdFiVuvsMq5UDAAcGrNHy9vsKwy8528+fDNuYd
         XnErY/uPbAhfZD0gMHIR0COl1kkinYkzp3YDVl2M1zYyn96xGLccL49kqFMggVqDILrD
         HYzA7XoDZN+4UrL3jeB06JEFDAXzdxOgMT349Y160FIHp2Fz09ygugzIqvSklnXuv6En
         uEwrXWPb34rfdcMYBfi+sYX3LG1Y3D0qs+MJ3sZEVpmf3f/HkB4WuFK52FLyScqd3Z5H
         T+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696217; x=1779301017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s03Oh/BgVRz777SZgXCs5erRF14ygyMEU76E4HIIUlM=;
        b=oh2u0LmYcquQDdTrnrVV7MGm+Ld9CWAwzkMNyyfB4hD0OGgHX6xvhVvWoEMJNcbsnU
         Qw7cBGuQBTvIH2Wmn49vgr1Mxtgdmu37wNrHS0lilAAY/whHa3m+o2i8y9kgtrk+zdSb
         1TsnRLYq6mqPVE7xs0p8IpXlajzxb/PV5oXvuDA+9idFewg85dXCs0Trw11bP6IF3BWA
         mDLfQKucCLpX6noozUzCxVLlj9LBRIJDzjwUr/t+U/GbpOM1lcRQVrf/yD1BnjVjRdzX
         WdUJhwbfpqw7gFZsPtbzJQ74kpdha2h2JkveI3HSSUAl0G5yOLdfU266ZTY7axPIZTv7
         S/9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+KZ7n70/3W/ffh3FBi50bTfjqriLmsRkzi348zhV2mXKpaDLWuPCQ8t47NmMI0iKy7i20hWtviGX4/pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyE70EmLMwacXJqV/zztxA2qQX49/UxmRUnWeMLWZCY80EwwKn
	qkXcgK3QSa0bZSxRRcx4FR4VYhSJFVG1oIED1E6YGl2T9iE9rZLg8StG
X-Gm-Gg: Acq92OEiA1NvD/E/kmH0nm0hATR9JqFgk7piaVeEkcYzjBYgpEnVt8iZlE+Xu22QC8i
	JCS6EEVMGB+/S/cqa+H0VUXA84R+tuyRxQUEVoC7/g6Pt6bDmMJ4P9Dip5cEkwtjFnE2ajGQ+h1
	zrENVbIU9N/4uf18Z9kzAnv3+Qr0A1x06vhgEcnAyD80e03m+GVr0sQ84b8lLzxmX/HQOSd0I8M
	64q7+5td6Z3rv15QzSrr7WaDbQ2k4rN8vlM4RS9L1xz/nh4HJ38tfVBVj3wd0TWmW0eJjahkecn
	IpCVdSbfzbiLvVJfxhW4kl0KExDWekiUil6AxXe41Fod0J1LvIrsC8Br3NF+XLB0pxHsd+8IhT+
	SUfST6lq9lJYfrf1Hc8cmZID/Io+nHguHDScvAPqseHuPnF3DC1MvwOPION07pCd1lR50PT2L4I
	XhM/eW6mA/LMKRj57JabiUSFh0HwDppz6xpesctXeLEXt7d18=
X-Received: by 2002:a05:6a20:2454:b0:3a2:f05a:7952 with SMTP id adf61e73a8af0-3afb1a0a587mr4668221637.39.1778696216880;
        Wed, 13 May 2026 11:16:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826768acf3sm18893427a12.10.2026.05.13.11.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:16:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 13 May 2026 11:16:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: corsair-psu: fix and readd locking of command
 buffer
Message-ID: <1a11ddfb-8c3a-4f0d-afda-c4c82daa6d9e@roeck-us.net>
References: <agR9YW7hGTJ_l7ms@monster.localdomain>
 <5f0406fa-9692-49f0-bcfe-c013f5fc7b62@roeck-us.net>
 <bde0fa1e-93a5-4819-aa19-04554c24d31c@roeck-us.net>
 <20260513162135.2893e42d@posteo.net>
 <254b59a8-182f-4ad3-8469-4f9e9511d3a5@roeck-us.net>
 <20260513175350.07900558@posteo.net>
 <62e02950-e31b-4faa-8b36-98bbfe898367@roeck-us.net>
 <20260513195027.028b7b63@posteo.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513195027.028b7b63@posteo.net>

On Wed, May 13, 2026 at 05:50:30PM +0000, Wilken Gottwalt wrote:
> On Wed, 13 May 2026 09:42:08 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
> Now I am completely confused. What is that guard() and scoped_guard() patch?

Again, with subsystem locks instead of guard().

Guenter
---
From bafbb2e301621335381209e395fa281a395ffc53 Mon Sep 17 00:00:00 2001
From: Guenter Roeck <linux@roeck-us.net>
Date: Wed, 13 May 2026 09:25:46 -0700
Subject: [PATCH] hwmon: (corsair-psu) Protect debugfs accesses with subsystem
 lock

Debugfs accesses need to be mutext protected. Acquire hwmon subsystem
lock where needed to avoid race conditions against hwmon sysfs accesses.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/corsair-psu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index 76f3e1da68d0..866e798d553c 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -664,7 +664,9 @@ static void print_uptime(struct seq_file *seqf, u8 cmd)
 	long val;
 	int ret;
 
+	hwmon_lock(priv->hwmon_dev);
 	ret = corsairpsu_get_value(priv, cmd, 0, &val);
+	hwmon_unlock(priv->hwmon_dev);
 	if (ret < 0) {
 		seq_puts(seqf, "N/A\n");
 		return;
@@ -730,7 +732,9 @@ static int ocpmode_show(struct seq_file *seqf, void *unused)
 	 * getting of the value itself can also fail during this. Because of this every other value
 	 * than OCP_MULTI_RAIL can be considered as "single rail".
 	 */
+	hwmon_lock(priv->hwmon_dev);
 	ret = corsairpsu_get_value(priv, PSU_CMD_OCPMODE, 0, &val);
+	hwmon_unlock(priv->hwmon_dev);
 	if (ret < 0)
 		seq_puts(seqf, "N/A\n");
 	else
-- 
2.45.2

