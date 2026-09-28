Received: from mail-dy2-f33.google.com (mail-dy2-f33.google.com [74.125.229.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4935E3CCFCC
	for <linux-hwmon@vger.kernel.org>; Mon, 28 Sep 2026 11:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594112; cv=none; b=nWS2DfR5zJ6W5H/ZuxKOs8X3DUxYA09VYlQhGMM67paaSfNoE2KqCyFFyCToFNVpXMqa16txBiUno1Zewc8nbatqRbqFRi42jmz6psyJRpETcMxGNnYabHr8D/PuMy85tmVQaVUUpxzWld0+B8BYuKXUoOnuUArs8j/kqRu2MDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594112; c=relaxed/simple;
	bh=88OSeq6DLWu4I3oiu44D78I/Lu8IhTrzQi6Vrwi7Ww0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+pNMvlF0/w+Ozq+Own2iorm9l8cpolRhKpqxcgIrXkRTr5b7KxIRJnTbXl/0sjeeLd3T8w2ulP1ifoylxqH22O0B0Y4MD01PuRFfdoi8CwuChgGLq873lxRKd6SffDp3w5obLMyOKqSGJJ7b/0pEGCPH+LUwmfK3KfdNpCsAH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDTzUMff; arc=none smtp.client-ip=74.125.229.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDTzUMff"
Received: by mail-dy2-f33.google.com with SMTP id 5a478bee46e88-347866278b6so325527eec.2
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Sep 2026 04:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790594109; x=1791198909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R7a8XVHygSEnKk+FBH3uMQZiAQBtPp/2vxA0emOJFlY=;
        b=SDTzUMffdIZ3Zl0BPYiNQkZYMuQZhhIXuo0UfRgqb85v0nHWnwZQaLWOjJJxJ4laJJ
         LI2Vug0og3D1XQboIyNs+Zv5VKtthEhK9slc9PimkN4K1Xzfv2coFwI10x2WwkstL8sE
         AMr/g2F5HvSW7mTjf5rMQx3sZ2GUwZ5YID59GYLVitqheG4yrx/10pU2QF+ngEjS4BGo
         /XwTIhYcmlcM87dA5+tkOJEbW75dFqrC7WIN3eq8lI3lyMlcoh82FdpNCs/fcuhdZrXu
         pX81mcYX6ssHoWUJMcZVi76gDSsRXvGQSa+wjza2pWdxE3alqs02rGBuzdQxslUbYZV+
         1s2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790594109; x=1791198909;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R7a8XVHygSEnKk+FBH3uMQZiAQBtPp/2vxA0emOJFlY=;
        b=xx9T6h3M2pRIxMXeeNi3ovTvMlzJ1Z5+hMicMYIOof2WiIlr+/odJL+D1o+wjDJCsN
         xagt1Gjl1GkeDmF3VZ680OsQxehGlR8AgOFRqTuB5tBsjZM5PEItgZ+rPstF0R+CI3T+
         kHhsz+fwywHLncYraLZQL/TSBvBCs9sUQUoYZk+cqGSUXlKs16HKSEsxgRQ6ob8xX1FO
         ctv5nhgtXwgG/hjFddf2OKe3+9S2NBvlxm4NGjVNHFj+EL4rgrXtQB4n5ppxcdITZxtr
         TtR8+QHR/Ty/1A9fEUhH032Kjh1L2tk3gTtxCpd6LMk6KwRqpg3BFAwqK5UwUX5e50H3
         +FAA==
X-Forwarded-Encrypted: i=1; AKwUvBxD9i/wLwe9mbtmcka/vFwhAowkzkRSZzH3TP4rnOWUqDP3a2rpgk0Orsrb09mbi/p92Hd8lV+8fNuLyQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJHV4qAtNrPvGafUsXiyRZYOvLtdvcj7fBLu0ZA5eJDuJtXU/Hw
	jmcKfzJCuPV8wwjRreKRrY+KM+Pb4TqFOyCJP6jvVhneGnlbyyQiCr/7
X-Gm-Gg: AYBFou0ZGcPw2fzkHqsBveYap6kh8TUMAMGB6//2HMVsv1DEneahuCnxt1LwjmZDH4L
	VQFX2pcxY4qAa9uaKupdfI2VsXyQXfPUgPD/HUbW7Ys3BlmiGTc59N4OwU6IENHFjC6DZ0xWT7g
	o9eKdNL/OGEhve/Wv9C819DRnjDyo1CIKVjC5h2sLKxZmhS9al7FBexF7tWJ5ibFC0AzE/NG6Bf
	lwAsj2s68nL14apzBpvzH6fbHLwuR+XJoWRjyoR7l6Cd7Pr/ionWMtIKwvr117fI687FpgO7s/c
	hikxXkPkDIFEIZUubC3LWvy5TYGRPTNmCMGOvHqw3OpJNY5DQD4XICyS1GRZP5y2meHNNN1j8MG
	5cG1hMYRF0l8N91VN+4YvSxE9UnqIqG04ZPZMQwnhxE+5IKqHNMI+EXFH/QxKebkIBhtRxlpDQt
	LMZAzyZl7uLcyh+3xPNW+hYWTDq1JCkxPZhuREXWi2VBPzbeCIvJSzY/fkDH9kBTYSE0RDW4nZ8
	dOORwUWbsKd
X-Received: by 2002:a05:7301:a2d:b0:342:9a9:1f68 with SMTP id 5a478bee46e88-34272179374mr8715824eec.23.1790594109191;
        Mon, 28 Sep 2026 04:15:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34a1f82e33asm4154309eec.20.2026.09.28.04.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:15:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 28 Sep 2026 04:15:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: jiale yao <19888972804@163.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: Re: [PATCH] hwmon: (aquacomputer_d5next) reject short status
 reports
Message-ID: <b596a484-caa1-48be-a9f8-56c0e081ee17@roeck-us.net>
References: <20260924151121.1233666-1-yaojiale02@163.com>
 <7b40ae2e-57d8-44f7-9791-ac65a3e97290@roeck-us.net>
 <7bdec27c.1969.1a0e21dcb7f.Coremail.19888972804@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bdec27c.1969.1a0e21dcb7f.Coremail.19888972804@163.com>

On Sun, Sep 27, 2026 at 05:06:38PM +0800, jiale yao wrote:
> At 2026-09-25 00:05:19, "Guenter Roeck" <linux@roeck-us.net> wrote:
> >On Thu, Sep 24, 2026 at 11:11:21PM +0800, Jiale Yao wrote:
> >> The HID driver raw_event callback runs before HID core validates the
> >> received report length.  aqc_raw_event() reads device-specific status
> >> fields at fixed offsets, including multi-byte values, without checking
> >> that the received buffer contains the complete report.  A truncated status
> >> report can therefore cause out-of-bounds reads and update hwmon state with
> >> data beyond the received report.
> >> 
> >> Reject status reports shorter than the length derived from their report
> >> descriptor before accessing any fields.  Commit 47669bec44fe ("HID: asus:
> >> refactor the two workqueues and init sequence") added equivalent raw-event
> >> length validation to hid-asus.
> >> 
> >> Fixes: 0e35f63f7f4e ("hwmon: add driver for Aquacomputer D5 Next")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> >> ---
> >>  drivers/hwmon/aquacomputer_d5next.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >> 
> >> diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
> >> index 1ca70e726298..1ebc8bc4c090 100644
> >> --- a/drivers/hwmon/aquacomputer_d5next.c
> >> +++ b/drivers/hwmon/aquacomputer_d5next.c
> >> @@ -1331,6 +1331,8 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
> >>  
> >>  	if (report->id != STATUS_REPORT_ID)
> >>  		return 0;
> >> +	if (size < hid_report_len(report))
> >> +		return 0;
> >
> >That doesn't ensure that the report is not at least as long as accessed
> >later in the function, and thus does not fix anything. The same applies
> >to the other patch.
> >
> >A proper fix would be to ensure that size is at least as long as accessed
> >in the function. hid_report_len() does not and can not know that value.
> >It is purely driver specific.
> 
> I tried to find a cleaner way to derive the actual required length, but it seems
> this is entirely driver-specific. I'll replace this with an explicit minimum-length
> table for the supported layouts, just like:
> ---
> +/* Minimum size required for all fields read by aqc_raw_event(). */
> +static const u16 aqc_min_status_report_size[] = {
> +	[d5next] = D5NEXT_PUMP_OFFSET + AQC_FAN_SPEED_OFFSET + sizeof(u16),
> +	[farbwerk] = FARBWERK_SENSOR_START + FARBWERK_NUM_SENSORS * AQC_SENSOR_SIZE,
> +	[farbwerk360] = FARBWERK360_VIRTUAL_SENSORS_START +
> +			FARBWERK360_NUM_VIRTUAL_SENSORS * AQC_SENSOR_SIZE,
> +	[octo] = 0xd8 + AQC_FAN_SPEED_OFFSET + sizeof(u16),
> +	[quadro] = 0x97 + AQC_FAN_SPEED_OFFSET + sizeof(u16),
> +	[highflownext] = HIGHFLOWNEXT_5V_VOLTAGE_USB + sizeof(u16),
> +	[aquaero] = 0x18b + AQUAERO_FAN_POWER_OFFSET + sizeof(u16),
> +	[aquastreamult] = AQUASTREAMULT_PRESSURE_OFFSET + sizeof(u16),
> +	[leakshield] = LEAKSHIELD_RESERVOIR_VOLUME + sizeof(u16),
> +	[highflow] = 0,
> +};
> +
> ---
> But it's so ulgy, that's ok? or any other suggestion.

apc_probe already has a switch statement for each supported cooler. The
per-cooler size can be assigned to struct aqc_data as, say, min_report_size
variable which can then easily be checked at runtime. The minimum
report size can be a simple per-cooler define just like all other per-cooler
defines. That isn't more ugly than the current code. Is made necessary
by the vendor of the supported coolers, so it can't be helped.

Guenter
