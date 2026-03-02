Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3427E391848
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 20:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772484740; cv=none; b=L0sDz2FYulSeX3jq72MIx1O1oqaEYdzZ9MeLvaIjCFDosI5CTJiiE+sJmo8N0Ovqe1uKhNnNTCp2H85dbxqblDvs9HEgZbj7swYhNAKCUcPOLfbzOt/f2jLaNPSV4G4EkcVnDx5zoTVgWeU3dYXiJc/rbnjj+mkZnAo13G/cq+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772484740; c=relaxed/simple;
	bh=iMGyWgYg9oOZJSI6G2z+SG/ohQV++5Diy+o3sh2J75M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igRVy7WGeeCUjjkfarYtmme8H7liaK07nnsqDkg+lCo44lW6i/bJMKPj8rpuplZ2OymDN+IVXJJmsTZKd8wgCPC/uBx72GvJlYQwzxFCvfhNgZsY5hmDilrhgxU3q2rNszjv1bvy6v/PDB5zR6F/ddddb5klNVsqbfzxkMUoy+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VetYNgVb; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VetYNgVb"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82746ed8cdcso2983402b3a.3
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 12:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772484739; x=1773089539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ES08Kmd7dPWJqZXsMRCPDxywoI98h86r6+Ir7Hu8bZk=;
        b=VetYNgVb0KeJvikHhkfZ1hS+RVGYIb1lsFrBJLzqxom96qSS3m+Eog12d1xD9lb+R+
         zHkCRNuEpiqApcTFPgnKa3oFMTIprIhlkVuaX30LJKlz8fDYjYn7jbJ4k/QGULctVudC
         LWcZrbMkGqbELUXxliF0A/Tj4NTeRE2qqKyu4kF93JvCjH3wgEW9E4qxKKpj+YoOm12y
         gGTAAbbbo9xa6yQaIDRtyCbRloUddhho0kBNqP4dHC9seZZzeM63lm9szOqcHmURyI/Y
         dfLelMYR/O/P2hGThK7B8JQpjRLY3ZpkpxpxW0ac61TReYolhiXYbvHdf6SroS/lliLx
         HVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772484739; x=1773089539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ES08Kmd7dPWJqZXsMRCPDxywoI98h86r6+Ir7Hu8bZk=;
        b=jqIdMnuDQczKVeX50+aCvTDnsTFCJyVQcNx2B0ak5QMX/zYY1Yb3rfnv+O6uSQBtdc
         AjXUMPk9ADr5LOsestZJFpC99rSJAo5aZw7LpyMXgSkHYI18QcSH6WdfWtkSIJy+ckqr
         2lbQcganWkHs1AyRdwzlQ7yWM35+B8bWvjokAtRZE/1L0YEsqQyyR0h9GVYI2b1Y41ap
         VebRt67opHEHdSZJMU5m7Fcq2FFM6Yw9OtbAmshp9NY/WWHqL8II+ggHFH+72u+Grv53
         PlyamkLN3e0g3SoHhXC360BfWvQ918jrVHjkhbRd/ihlQPmrp0KFqELizHd9oPo73ioR
         5SSg==
X-Gm-Message-State: AOJu0YzcojW65/g4ik4hGakZqOZFcts9HpRIfY/ddiDODsb6A3HphJ4Q
	7iXxBkp4ChVzugpxpK8rR5XI5wa7lk9jOytan0LmUJWRh8ChfRN5XHbM
X-Gm-Gg: ATEYQzys3bTuKBc92oH7tyZjJusQ78Y1ZRh9Z0OtOnQ3cJu9Smw3usbe8H8wPXfujWx
	rDjQtskb898eoe9tZyKxbJBT688b+NOmrTuz5hoEzZE1MeMLgIfK5N+YRY5pL/RiuPDiqg048DH
	SOm1RndgLEWqum0VV8O002wykc7yB6XlZcLRRmeJblhEkhG48wGxzRhrnJhvMsGu1f4C9puWVpQ
	796rRB+Tf44lGB07UM3K7QflUQ6vez9DxiOn50iuufc4NpisKywkdzwZuwVd1wk6M7WL6wUkkTT
	F6LF/u8F9nNVf7r/QwDnsWjWEDEp3GDFBGHa3pfwifCbKF9D/KA5t1xKMI6P7fY/QSam/0zbKMK
	YR4pPaxlwB3y1Ln7+43NN9GgMT2BbDHloW85cG8rW7/bn7ZcpMlO6Ln3pq2eCD9kuaQ0B6yXVUv
	6SkyACf+51mtNlCkllSdupbr5anWkDdholktRY
X-Received: by 2002:a05:6a00:4f92:b0:823:12cb:f5d1 with SMTP id d2e1a72fcca58-8274d973599mr11947966b3a.6.1772484738583;
        Mon, 02 Mar 2026 12:52:18 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a088517sm14031115b3a.65.2026.03.02.12.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 12:52:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 2 Mar 2026 12:52:17 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Amay Agarwal <tt@turingtested.xyz>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] hwmon: tc74: use sysfs_emit() instead of sprintf()
Message-ID: <352aa25c-9095-441a-aa70-42ee1a7db3da@roeck-us.net>
References: <20260302192813.10625-3-tt@turingtested.xyz>
 <20260302192813.10625-5-tt@turingtested.xyz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302192813.10625-5-tt@turingtested.xyz>

On Tue, Mar 03, 2026 at 12:58:12AM +0530, Amay Agarwal wrote:
> Replacing sprintf() with sysfs_emit() for drivers/hwmon/tc74.c since it

That is not "imperative mood" as asked for in
Documentation/process/submitting-patches.rst.

While minor, I think it is especially important in patches like this one
which do not make functional changes.

On top of that, mentioning the driver name in the commit description
is pointless, and the subject fir hwmon patches should start with
"hwmon: (driver) ..."

Guenter

> is the preferred helper for formatting sysfs outputs and preventing
> buffer overflows.
> 
> Signed-off-by: Amay Agarwal <tt@turingtested.xyz>
> ---
>  drivers/hwmon/tc74.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/tc74.c b/drivers/hwmon/tc74.c
> index 9984373a25fb..7fb7b50ad1ad 100644
> --- a/drivers/hwmon/tc74.c
> +++ b/drivers/hwmon/tc74.c
> @@ -92,7 +92,7 @@ static ssize_t temp_input_show(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	return sprintf(buf, "%d\n", data->temp_input * 1000);
> +	return sysfs_emit(buf, "%d\n", data->temp_input * 1000);
>  }
>  static SENSOR_DEVICE_ATTR_RO(temp1_input, temp_input, 0);
>  
