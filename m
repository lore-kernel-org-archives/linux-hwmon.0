Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B63265CC2
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 15:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947069; cv=none; b=mjA8/y6UlloCbe/nLWve1LbUZGKeyVaOxPk957sNcO0a1CiKWaf5n0IrPOVK1RC5giPz3o663wXw3783rPQLOPgz/xJzy2amNLELZKwDW0Izokhu/kFQx4Jp+dbfLB4EBdBP/myhigZBeDmOGdxX1XSfb5NBfkWhrInFNqf1BRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947069; c=relaxed/simple;
	bh=+rqw8G0JRkjRgLWivrlsQHOfrEDcQ4xDysW99P467xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbNG/zgE4y5o4ULaBm4fK46hgkbQsEqj4Ae9cTu95BY5WfyK8/UVzqsqc2LieHo1kD4eKDFrTm/KPZ2Cqu3bO8SbBXZ2lqL1RnDJSjdsED0ZDC9sVWHQ8I7ijUigaLGDDo1MMODTU+gGh6NrjQK/QNoWJwNVP7Tj6phpD1h8HA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B72mLZB2; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B72mLZB2"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ba64b5a53aso5318872eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 07:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771947067; x=1772551867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAgeSgoWjI/QgLDU3lraoXM8JD1MUtFDqUPUAUIKoHE=;
        b=B72mLZB25hGPCaC5UhTR+r8R557CiM9urs6ZUMrrxraVz+Bjf9Alxwhoel5Utab1yj
         UvHDw67xYHGn+q299FpxKTV1VrRg8oIAMctsbdfuJ5MfjmloCSPG1wSF9Wu4AySGIl0+
         aPMr1s0RomKym8PXVX3Ktax0s6WX+mUnPWQsKpn8SqZtDbAJSgjAPXXqmTb8qqKaXp5G
         eKNzQXQsUw0oOZSG1+XPMXKZJTvTcMsA4eISYJ6+4zbvXmN0o7eX3/sz+TI4oYqNIGcC
         aRThkrVDmnHYG6dC4L5qpZhUgM0wtTnf+XzgGXgBSkeTMldtbElmclmPkJHPimRK/khR
         K7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771947067; x=1772551867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gAgeSgoWjI/QgLDU3lraoXM8JD1MUtFDqUPUAUIKoHE=;
        b=d6eH9VPYqBGyNchRubvJRzef0vPaFA6gqDuygCpoGzRXwFafV6ppWKRcESlP731CnC
         wz2JTgOTmKSqKlUuxWpaV1sXrAtaDtpEae+NBkTpMQd29gR18f88alKk63iOnH3T3n0p
         8sJcageD984lqC81Vz9+It+K/3l2OIUq1mfKLLytYaAsagYubURCgsXnMj2ncaBKOTRz
         Piu61GzDriPcjigYJMq6CV8s/C0g7PxaIDYFgdU9Vhgq38FkhC6RvGx8sRrVI4Rotnbs
         DhIsh2WAH4M6wi7tA8surWO6yAIE7UmyfR2gTJCIA+kB27zwBIEfqdJeyIL+JwpFiC03
         WHIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+nuya3Ay6BTqULRT/VHA9w4hFhKTnVX1BqJiRKp7PIM6prmonig8Vs4+YaGcVEG13MF2gT6U5j9Josw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGP9HoOMtZc/PR0MkF1Bdd2ngxHAlacYoMVDKgi0hmUU+v9BvA
	TnbXxRCWqrsjU6yBxtZmkg7EYx3pzE3CKBIY2IoGJP5HsjPgp3A7OK8M
X-Gm-Gg: ATEYQzx7C7hi4Su2Mobo/Hf29qjpwcVP3IEwVuyanmp0HNVVjxDbHADq/HELEvknIeL
	WO2AABavgX2vibsMQKO2GTujle1OX1l/603g/rt/X6abKwXh9UkhD1kg2arxkSOAQiY5+NtfMrC
	LJYcffp9EuotLairlROlT5VKpgxLCKiAm6BUDzB2TGRwFQkMRyyKWo5zVidpDqWi8zdVFGoMsQW
	q7EXMKEsFfAYvFR9VDwZpsxG6ndhW9p3DcKSvRcFX0XNIwYJ/GZ3y8gGmdeR+OU8wGCUDqEunWo
	9kAt7dpEciUpvj0nxmmIkCFJEH3/BXoIQNgneqpeoQIqcHTxjQ/wL9BzbdgnFCJUNzERqUrv36U
	ZGmT5B3xwZAP9aLQv9sVfPh17L4Ok3A9HhDl+HkUfDJoMDEd7cVi3DrktdleuS8qeUMVYnBvgL1
	ZphDSkMuiTQrcdp8CAO6tw/P05nBx8eEGolwcBTsWh7KhGpdA=
X-Received: by 2002:a05:693c:3108:b0:2ba:9835:112d with SMTP id 5a478bee46e88-2bd7bb4c590mr4318195eec.3.1771947067305;
        Tue, 24 Feb 2026 07:31:07 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dbe82d3sm7881314eec.21.2026.02.24.07.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 07:31:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 24 Feb 2026 07:31:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Bart Van Assche <bart.vanassche@linux.dev>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>, Christoph Hellwig <hch@lst.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>, Bart Van Assche <bvanassche@acm.org>,
	Frank Crawford <frank@crawford.emu.id.au>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 14/62] hwmon: (it87) Check the it87_lock() return value
Message-ID: <e0a9cb58-940e-4773-8a8a-6dced2cfb4e6@roeck-us.net>
References: <20260223220102.2158611-1-bart.vanassche@linux.dev>
 <20260223220102.2158611-15-bart.vanassche@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223220102.2158611-15-bart.vanassche@linux.dev>

On Mon, Feb 23, 2026 at 02:00:14PM -0800, Bart Van Assche wrote:
> From: Bart Van Assche <bvanassche@acm.org>
> 
> Return early in it87_resume() if it87_lock() fails instead of ignoring the
> return value of that function. This patch suppresses a Clang thread-safety
> warning.
> 
> Cc: Frank Crawford <frank@crawford.emu.id.au>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: linux-hwmon@vger.kernel.org
> Fixes: 376e1a937b30 ("hwmon: (it87) Add calls to smbus_enable/smbus_disable as required")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  drivers/hwmon/it87.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index e233aafa8856..8e3935089fca 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -3593,7 +3593,9 @@ static int it87_resume(struct device *dev)
>  
>  	it87_resume_sio(pdev);
>  
> -	it87_lock(data);
> +	int err = it87_lock(data);
> +	if (err)
> +		return err;

checkpatch: missing empty line after declarations.

Oh, never mind, I'll fix that up and declare ret at the beginning of the
function, to match the rest of the driver.

Applied.

Guenter
