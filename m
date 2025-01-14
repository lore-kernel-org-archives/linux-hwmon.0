Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8D521423A
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Jan 2025 23:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736898023; cv=none; b=B7WGu+5mYB4wDT6NjGU2N4w+NamAVh7rS3jLPa0vTKoFazX2CWzB1FEpJikmwbnAdP3LwU6BsKOEzBrFzW85mlzuqGSrUGpePUIw1n/qo2BgeXCVdhwxcNfsso6MOhC5LXY5S6F0SYC7o+iyooKthOFivzhC2ADjDnHmnl2NyHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736898023; c=relaxed/simple;
	bh=OyMcGK4u37TrTgoX/84vQ1l81PuQNMAAgdk+aMXy3rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NIxVwS5xJ83g/4/R5FbMQwtnxYOe6Hcap5uWXweWwXP4BOKAqM9J54okPUh7G0ICFOFNOJiIsatWUMEleJ1oC1848YbR7ZLXZq/MM7LbwBABe67S8UmyMznqX5oNFigga/e47Cmcq+3wFxdokR//G+FW1M4HlVO4OW0B+cxerLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvjF+mqT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvjF+mqT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21644aca3a0so134276625ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jan 2025 15:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736898020; x=1737502820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVzHLP1jCYhc2qt8hpY8BF3VPEGZ1fvoAqwRtOUySy8=;
        b=GvjF+mqT3pgd5kwYJPNyGKIkCeECP4v+k/UdwziXCAC+Ztu+kIzmWWn23yTrsWlFMS
         Mri+uGkXemJXAVcuRKnEk4hgUxBL2Q08GmmQFXY1OvDgQrJqb7lS92KhLOHBiOFSJL/C
         pk9y5ClSRyD52X7fVHBIw+BsKpxF0k/5lCEaV90zef7XrDUWZWKLRcYiQSg05j3bMmrS
         bnXNbwIoUt+Uarl5nK1FMv2nLvECcnRnIP2nYUq8QoeVJWkl/33GZj4zvk6pbzsRjg2m
         +I3/cDVRIp+QLEhAaKMeP2ruIfReDVLTWCPWS8Cop9tCsVLsrWPWvjshiJLzdEsMwplS
         O17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736898020; x=1737502820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVzHLP1jCYhc2qt8hpY8BF3VPEGZ1fvoAqwRtOUySy8=;
        b=hk1yKIGE7FZKZ541SOmlaVKa/B/cLsPZgxJp7RuWEwrEhBOSLspgm4HwWq8dvjN2Ut
         08LWGPFPa57B5/+JP7OeBVUwVMYC73iwJfXKaIb4kvmw1uBRonPxQig6L3QpiKldimPt
         /muJtEO3LQ7sH6lI4XhOYbjgMGXeuLWAQn0ota6OSaRMbQsrrTEgHWAiuFqDTFeig0Nh
         orMsymeNITsv46stVWzA516Ods80eh/UsLknAkd7HFwVCZyl2+rM3RNWo5OXYdbPe0Ic
         AizWvW1Mxrv8zTJXzvP21U7Zvcilw8g8uujqADoxmPljgcWad53vFOc7mnD/uB1VHlfA
         oybQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9At8+c9mEFhBIr9dnjVhUvwASVmYhhO0JCQGlf7Nci/yRQN9b3CCMxERxPrXt27UC1VXF7acFKHBSoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6v89DzFhNGs6gryTm7AX4NSOXr6L0Ajws60YhlS1RiVv1jFrb
	ppptCsnljlGYw/ajgGN/XkkDgOywplryzG6ElN8HT6CDucz83NCAp3VJsQ==
X-Gm-Gg: ASbGnct/Zwoh2Eog6USlvXPBmXVceNI9J+J+S2rDYQNskXJ0YXpG+j0y0+r5XTb7EPU
	5N6P/mXivhqP6BTmGbqDqvllMJk40vKX5a6P8q4OnROj5TmDCresGmL+xsAtq98F0gGZzGDW7Hc
	W8pKHPH/gM2IWT5Y2ADWGwysrMAKuBU/j1lSaBB5Nzavka90XCfmvK1f+tKJMAtDKyFBzbouCLY
	UgzXB/xVi6YWRGyUVAriYShLU2/VEbwnjf17o0SEK/Tc9YoYmQVLWZ8Fb0XqSZ66Th3GQ==
X-Google-Smtp-Source: AGHT+IHhGszZbJTTXi4jnWtp3zQw9+t2zahptlBfciiY7Tq5RzKACbgKkJ5JI5iYPZ1+Q0Qspmqtgg==
X-Received: by 2002:a05:6a21:2d07:b0:1e1:bdae:e054 with SMTP id adf61e73a8af0-1e88cfec9d2mr38769813637.25.1736898020120;
        Tue, 14 Jan 2025 15:40:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40681c05sm8140998b3a.141.2025.01.14.15.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 15:40:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 14 Jan 2025 15:40:17 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Russell Harmon <russ@har.mn>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] Increase drivetemp scsi command timeout to 10s.
Message-ID: <3205dece-2982-4602-bc72-a63d933f972e@roeck-us.net>
References: <20250114070704.2169064-1-russ@har.mn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114070704.2169064-1-russ@har.mn>

On Mon, Jan 13, 2025 at 11:07:04PM -0800, Russell Harmon wrote:
> There's at least one drive (MaxDigitalData OOS14000G) such that if it
> receives a large amount of I/O while entering an idle power state will
> first exit idle before responding, including causing SMART temperature
> requests to be delayed.
> 
> This causes the drivetemp request to exceed its timeout of 1 second.
> 
> Example:
> 
> Normal operation
> 
> $ time cat /sys/class/hwmon/hwmon9/temp1_input
> 28000
> cat temp1_input  0.00s user 0.00s system 7% cpu 0.023 total
> $ dd if=/dev/sdep of=/dev/null bs=1M iflag=direct  # Generate background load
> $ ./openSeaChest_PowerControl -d /dev/sdep --transitionPower idle_a
> $ time cat /sys/class/hwmon/hwmon9/temp1_input
> 0
> cat temp1_input  0.00s user 0.00s system 0% cpu 3.154 total
> $ dmesg -t
> sd 11:0:1:0: attempting task abort!scmd(0x00000000ef8da38c), outstanding for 2098 ms & timeout 1000 ms
> sd 11:0:1:0: [sdep] tag#4639 CDB: ATA command pass through(16) 85 08 0e 00 d5 00 01 00 e0 00 4f 00 c2 00 b0 00
> scsi target11:0:1: handle(0x0009), sas_address(0x4433221105000000), phy(5)
> scsi target11:0:1: enclosure logical id(0x500062b202d7ea80), slot(6)
> scsi target11:0:1: enclosure level(0x0000), connector name(     )
> sd 11:0:1:0: task abort: SUCCESS scmd(0x00000000ef8da38c)
> sd 11:0:1:0: Power-on or device reset occurred
> $ time cat /sys/class/hwmon/hwmon9/temp1_input
> 28000
> cat /sys/class/hwmon/hwmon9/temp1_input  0.00s user 0.00s system 48% cpu 0.005 total
> 

Please rebase on top of v6.13-rc7 and resend.
When doing so, please drop test results (or send after "---".
Also, he subject should start with "hwmon: (drivetemp) ..."

Thanks,
Guenter

> Signed-off-by: Russell Harmon <russ@har.mn>
> ---
>  drivers/hwmon/drivetemp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/drivetemp.c b/drivers/hwmon/drivetemp.c
> index 6bdd21aa005a..9e465636f591 100644
> --- a/drivers/hwmon/drivetemp.c
> +++ b/drivers/hwmon/drivetemp.c
> @@ -193,7 +193,7 @@ static int drivetemp_scsi_command(struct drivetemp_data *st,
>  	scsi_cmd[14] = ata_command;
>  
>  	return scsi_execute_cmd(st->sdev, scsi_cmd, op, st->smartdata,
> -				ATA_SECT_SIZE, HZ, 5, NULL);
> +				ATA_SECT_SIZE, 10 * HZ, 5, NULL);
>  }
>  
>  static int drivetemp_ata_command(struct drivetemp_data *st, u8 feature,
