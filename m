Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1gQpW/n"
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8547FCA;
	Tue,  5 Dec 2023 06:45:21 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d04c097e34so32497955ad.0;
        Tue, 05 Dec 2023 06:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701787521; x=1702392321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jL35IHN53r+yIpqXLtr4T8Q6V/zjPn7x24AFOh/NSio=;
        b=k1gQpW/nHX4iMMsMMKZi8sh9WD9Fv5us17y6GqrTJE7kLaEnGxwS88itX6ETW93oaU
         aeXW+uU+ZzOYqiwbf51L2mmewTXCiLj8UUpa44qlgZbi5aWcNmbdHVVueS3me4AUHcNR
         rIkbB3Q2rkXe2kCkUYoaOm/BlW2IZaFn0EXUhMnz9fXF1lwru47/mywQpbj/IAZITXEk
         LhDY6PwoNedauDgXyft6VW7ngj4JFZA7/mOWQZb3SgBiT8LbKBmWu7L5+eXSWj3Bgn/S
         Yg/QyXAR0Gz02xaaLJ+SmP7lttWPiPJMiYfXBmNZ56wReIOGbg690uxiZ2AUbyWzEWwV
         w2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701787521; x=1702392321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jL35IHN53r+yIpqXLtr4T8Q6V/zjPn7x24AFOh/NSio=;
        b=Hh0aeEO04oVFkEGvDtbatcDR63f8wRL2befdgjEh/IJ9t/TpPvDmLxN2NS8rFMQPQZ
         +gz6K4ikgpzRUBgzkp4eJ3LG64kYIuAhEFrxKgiWQrKrZdZYMlvFPaBQpdlnwMqlRSTg
         agEkmDAcbZC8gQzQuSLMqJDEGA/AOPsFjSgsvMgr4y6uNGcd2VP2bYo91FyUMuPQj619
         Hh/ZtyCE7ODrGKQE9JJWpXbtx32TeHQTVzHuK1H6JiP43MoDh75dpOHagAvOtADCwcvz
         CZstBKZ10dyp9sQco3kqlt9k7TBLlGSXQ3ge7SUAP3ADhtQ9j8yCqurtCTiZhxZs5rRq
         FOQQ==
X-Gm-Message-State: AOJu0YyD2w5AUuMao3UuKSlDGhxvwz18pLkishDfK2WItEq778LVGAUD
	L5tuM9+c2kqkH5BnIzapm8U=
X-Google-Smtp-Source: AGHT+IHi73NcFPEehZyVYhe4vLmBqNqcGqTBJqX4RGqVyorXx9NoZtlNxFyM6o1tF/FI64lhMduWyg==
X-Received: by 2002:a17:903:41cf:b0:1cf:59ad:9637 with SMTP id u15-20020a17090341cf00b001cf59ad9637mr2125975ple.22.1701787520951;
        Tue, 05 Dec 2023 06:45:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id jm1-20020a17090304c100b001c5fc11c085sm5797913plb.264.2023.12.05.06.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:45:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 5 Dec 2023 06:45:19 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: jdelvare@suse.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	corbet@lwn.net, heiko@sntech.de, jernej.skrabec@gmail.com,
	macromorgan@hotmail.com, linus.walleij@linaro.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	cosmo.chou@quantatw.com
Subject: Re: [PATCH 0/3] hwmon: Add driver for Astera Labs PT516XX retimer
Message-ID: <2a6beed6-c530-473c-8c4d-c29f7a4f5822@roeck-us.net>
References: <20231205074723.3546295-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205074723.3546295-1-chou.cosmo@gmail.com>

On Tue, Dec 05, 2023 at 03:47:20PM +0800, Cosmo Chou wrote:
> This driver implements support for temperature monitoring of Astera Labs
> PT5161L series PCIe retimer chips.
> 
> Cosmo Chou (3):
>   dt-bindings: vendor-prefixes: add asteralabs
>   dt-bindings: hwmon: pt516xx: add bindings
>   hwmon: Add driver for Astera Labs PT516XX retimer

Please refrain from using wildcards in file, variable, or
function names.

Guenter
