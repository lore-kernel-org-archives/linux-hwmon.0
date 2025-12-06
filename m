Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB66825BEE8
	for <linux-hwmon@vger.kernel.org>; Sat,  6 Dec 2025 15:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765033439; cv=none; b=uKV2Jcegd9UhcJoIrBhQFGgi34SUPNWLlG6y2Ghxi074sjIpuW1oM5nKKJvzm/vn//mB5GUF1I59rbLiBC2XKtwNywHZK69l65vDbgt2kAkd1/EFLD6Ks+QmftxhmEMKeDol2rYE7wAWX8qksaV8q7v4DyI9f7gNsqpx6Vos17c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765033439; c=relaxed/simple;
	bh=fN2Xexoi/B9ctLaAFFwv+iZ85CtawTyBDeizMK5ec0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMuxwbjybmRxlKUdfBZ+rP8DgGTvan36AT2++65JulShGnbhlVp4XutlnUi66HvJagvOBEe7LP31YkokBJgaJHcoxI35mrVjyDMRY7iZo1JaYqgb2iN5M8Ott75zDfjFbuzDt6D/Fb3KbueEZzk6fCyl/vjs5WcNWx2WtxE63uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkDo3C2B; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkDo3C2B"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2a45877bd5eso5266264eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 06 Dec 2025 07:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765033436; x=1765638236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+tR6RUcnOhStP3t3KnBwgUkXc4dKjHlIZuatPHOKmc=;
        b=TkDo3C2BlByiQMydnq8cPWPlaZPem9R/6d2mM1DE/IMsJ+C8QwQTIVVZfWc+97XtQb
         Zp46JEKP+WiP9p6hZjeEhNU3t0LJksfLRBSVeLJBPydf3Ciflee7eqoVmc8nkuxl7oy7
         X7Rmz19CO4rBMEQwHk9gTszK/PFaQCjL/iGoCajg1L657alimqp3zhF4xF6KwaCmozMj
         imqoq6U4YzlFCxj4h5zqBy9EjZDaiRS9JudtNRLH00aKrq49i+xgeH/zBRDLO5OineR/
         4fqJEm3CqO2lklumWqnSYq5f6VUv9ZMPNcLcKLb4IYVjJOOzJWfISOFSafoJeHvn2Nyk
         KbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765033436; x=1765638236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m+tR6RUcnOhStP3t3KnBwgUkXc4dKjHlIZuatPHOKmc=;
        b=E8+86c9lEq0mYVBd/f/D3cQBmN8gWzzOt0HUWvhEwwcycjAMKa08qXtqyF/BZr6D92
         +9l+f2Y6KTEj3IS7E2MQOdwEln2ldkIZtzKOzg0Hzz47gQ6nhxVPBYPFogLPuD6sH6Ox
         8lSGbww62WIdkV6i5EAD1tig46+6D1WAizgNd6UBa87T9nheRSEjt0ioKj+sop3601jC
         PhhZu/iH0XoWZYvLyB23OXJlYbFZqRUJwlcygqMsrzBXBPmhag8O27Sjx0JL3Y3vcVjv
         Bagme27UM35w0391XlDFmMU1Kuj95ejg9XlisewHViSfHNcsz4yCqbEahv7AbGpMm5OG
         OBgw==
X-Forwarded-Encrypted: i=1; AJvYcCW+vHaPnlS5IqZLuwbakup3kPm3MD2fQz9DSqCGUIdTI8r2SgE3xCYGPXd5UqPpAQQu4sbaTbWkLjKHFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBI3slnp9mxpKIOgGnk11/co6QPRVBRk8nteD6WYl0ajWqxuEy
	OuBgbABnJodO/abxkaNuHvxc7Sanc5Gl9Gb5DuAVcC435teqAWjHccb2
X-Gm-Gg: ASbGnctheZS/pUKPBy7onZ+J6Y4VkKCgTkd9AlX6cn2iEVMzYCgQJUm3FWetCNOCLbZ
	gslYoXB7f2HciH8d6c201Oc+gS7CU2Q38crTJWeyRW9vIaoreml0M+s5HWML2KsFhGpujEgFcIx
	CZMvKDG6wwI2iWBqq+2NGzs3OuzNvsvbE4GBt8jiU9IcaiX9CCYbXpLjwIUcZsuJxVsJ/7FbvAm
	9siSPCSY/eZiFZ+GubSX7tq6m9Q9RAtqKUX8vA2Gr2zyhVLnYVS3szyDKyxTULmq5p9yG3Fi6WD
	ei6csiEmExhqzXcfGdrGZkzU4lPKXRlLZOisGCmL6Frl0hw58zh/QXXn72mdZTlEN5okZ96B0aG
	k3wbvMg4vNzzZtE2acySenxJEPUiDX1M9ojWkQ3xiomakmuJwzlf92FRhOUQIDGR6GjWm4Im7h4
	9NB7vUORCflScaWetxA7V2q5Q=
X-Google-Smtp-Source: AGHT+IFzojphrHRVtMjAYXF3z/dTrYB/zZKE8NoGiyXHbs+9+cXXnLG2F0IpmuMealC4iJgXnHs01w==
X-Received: by 2002:a05:7300:e7ac:b0:2a4:3593:ccc8 with SMTP id 5a478bee46e88-2abc6f0ff38mr1683190eec.15.1765033435525;
        Sat, 06 Dec 2025 07:03:55 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba88433fesm21958618eec.6.2025.12.06.07.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 07:03:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 6 Dec 2025 07:03:53 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Soham Metha <sohammetha01@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, shuah@kernel.org,
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: hwmon: g762: fix dead link to G762
 binding
Message-ID: <0b01dafa-9d77-4ea6-a10e-05bc67ee2eaf@roeck-us.net>
References: <20251203181213.51618-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203181213.51618-1-sohammetha01@gmail.com>

On Wed, Dec 03, 2025 at 11:42:13PM +0530, Soham Metha wrote:
> The old text binding 'g762.txt' was replaced by a DT schema in
> commit 3d8e253724170ae9c8948c36801204fc2aa53682
> ("dt-bindings: hwmon: Convert g762 to YAML schema").
> 
> Update the reference to point to the new YAML binding:
>     Documentation/devicetree/bindings/hwmon/gmt,g762.yaml
> 
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>
> ---
> Changelog:
> - Use proper commit SHA reference syntax

Really ?

ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 3d8e25372417 ("dt-bindings: hwmon: g762: Convert to yaml schema")'
#106:
commit 3d8e253724170ae9c8948c36801204fc2aa53682
("dt-bindings: hwmon: Convert g762 to YAML schema").

I am going to apply
https://patchwork.kernel.org/project/linux-hwmon/patch/20251205215835.783273-1-katharasasikumar007@gmail.com/mbox/
instead.

Guenter

> 
>  Documentation/hwmon/g762.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/g762.rst b/Documentation/hwmon/g762.rst
> index 0371b3365c48..f224552a2d3c 100644
> --- a/Documentation/hwmon/g762.rst
> +++ b/Documentation/hwmon/g762.rst
> @@ -17,7 +17,7 @@ done via a userland daemon like fancontrol.
>  Note that those entries do not provide ways to setup the specific
>  hardware characteristics of the system (reference clock, pulses per
>  fan revolution, ...); Those can be modified via devicetree bindings
> -documented in Documentation/devicetree/bindings/hwmon/g762.txt or
> +documented in Documentation/devicetree/bindings/hwmon/gmt,g762.yaml or
>  using a specific platform_data structure in board initialization
>  file (see include/linux/platform_data/g762.h).
>  
