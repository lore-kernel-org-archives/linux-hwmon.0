Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3443ED5BC
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Mar 2026 16:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813801; cv=none; b=i+afmHykPCLr/A/hc6mlYP9a+o8cPVo1hQx9yKqlwMGwYOtqEL6IH1/1AMbWeytCxltU+RWNAqKwtVTo3Xn8Pg483UWkrDyuVoWeULTrbCU0fS0v02zSujdPUvEh9W87JLp20zmgbbT2xPiczASzcrW4cMwJ8hiHRAHBwwp8miU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813801; c=relaxed/simple;
	bh=Q03wZP+jr95hI+NvHot1Du0zkm1UPz2DNNkQXx9mhXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhKW/HzRBIt9naJwKh7hykN+YztJWXp4U7TE8HbDigvboktSSjCPnmGcE2CRs3JU5qLengHeygBrSzhkVk2xabg3j2mbxdEytGWTIJUCezx4PvXLqbePFtTI9D1cSB4MJhPpe0AouHqjnGaXQQ19+fiSNOVqyYOaOUy0wY4ZUuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5I3SB28; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5I3SB28"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1273349c56bso11591173c88.0
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Mar 2026 08:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772813799; x=1773418599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SnvWTL3iEv/kL4tiEZKqQzSZXrgIInwKEy4wywpIFZk=;
        b=j5I3SB28qbl+1DiCPa6MKyA5QeufhImaZw/hyWbtmxd3kNMd2JpeZdM1ya2oPexZSJ
         eB/rGpXefxET2RAtO4MdJhN1N4MJoi96s92hQybxdSiF5DVOp7UicRExGZATk3lHYVtL
         GVtFW0Wmv8fUgMV1cMGrmqm3iPfRgSaB07zagWo1hMi4HIkuGwRgExRabPejx3S1TAkC
         Son7KnNFLY3VHb+X8M+rj+mGqvqCYQLCT6Y0tRzvQUxCi2KTJPP6kb4ZeoY7uI5BAV5F
         SGihLEgJM+AJ54sNWqVV+X4wg+0C3rHMA/Eb+8RvmqbYWHpHUvqziFk/9WH6uwZO9juA
         ggtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772813799; x=1773418599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SnvWTL3iEv/kL4tiEZKqQzSZXrgIInwKEy4wywpIFZk=;
        b=ilJ8USNJbqynzrS6kNae8Cx/2zOYZElGjKPTVAhDLRwFUE4hi9qSMcPvIWxeNg7y3M
         RFkcV8+ERVlq6jpB7DtztUhlbxEU3NuMIbT8R6JeNL6J4lLnrbJBb/mPlyN5GZZf2xmk
         wjGyXuDNBteMQMeKFs32113+60n/y7x3ZheojRivj7JxDXVkcxsMHY/f9duTGAMUOerH
         ia2Am59zwGFYPGvAkx9Xw7ocyZqS0vTe/f/NQ0+DPYPpfw/gdLyWpkY/z+DLVtEC9zch
         eizzfAmMWHLoVtjAcQa5O+x9VhoTdWzQ5rFpkPOzFkTEvKLkTQCRc4ivV1OEfdC4bsnB
         i4+w==
X-Forwarded-Encrypted: i=1; AJvYcCU/T2hGIOwtCBEpSmYY5hUEZTs6VekBvUfY5nVVcgEXcIUltpeRLJnwJGIBAvfekx4yN0dKkHrXrLlxLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq4jyYwcC87mDtrLvoL+5KBo8ogg6+qIJwfjoJU1nlC5a3S3Mn
	Cgy5tCt/+9VbYAH/LjtYUGPUlEpoo5iBAyfSqUMBCpK5J3oxWiSDr4ba0BVENr+s
X-Gm-Gg: ATEYQzzxu4AfU2zusYArGttIggKqEV+A+oI095NH9a0bPLjRZ8iQ2kXMgDdsKmM6KO5
	ATR+u5zv8g51DzfGnKiEe/fxaWZ+eAdZXHgn4FIUmWN7PPQEF/rfUF3wj212a0LXhFjF9Z517NF
	8gWW1RE4o8fIZt1ClGGBKhY/gpTmGknRPLQxLHctBqpN+CX9JaVSQySRrlYGDESs+RUPlGduPVs
	HPF1un7qtCYgr5rPNxnEQ9UnO8TIZtuERus8an1juiSdksIfElez9sjROsQ9CNyxl3A4SynvX4M
	AkV1xnVUF1q/IXIEgV0DpKmjoyFsnb3iJm1NysbmSOsN6DmBNL1xG1klNOHjqHCD8I0hVT6IwRS
	PbnIXHMwerU+C4ft/IYNTgMx0BDAopGnbOhe8eBtBSxRB3waUY3/ebl1MtgQDpOU8pvqLQHpWeC
	NbdaYPhWMnzRRlQRcQqWZ4KtcX8GU9sJ2ZDyCCdcy+pMHL0LA=
X-Received: by 2002:a05:7022:1e03:b0:11b:9386:8264 with SMTP id a92af1059eb24-128c2ec8795mr901108c88.41.1772813798951;
        Fri, 06 Mar 2026 08:16:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3f5a102sm1569468c88.13.2026.03.06.08.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:16:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 6 Mar 2026 08:16:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Davis <afd@ti.com>
Cc: Chiang Brian <chiang.brian@inventec.com>,
	Erick Karanja <karanja99erick@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] hwmon: (pmbus/bel-pfe) Remove use of i2c_match_id()
Message-ID: <a39c4e55-ca0f-48cf-a3f5-fe678e23467e@roeck-us.net>
References: <20260305195642.830695-1-afd@ti.com>
 <20260305195642.830695-2-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305195642.830695-2-afd@ti.com>

On Thu, Mar 05, 2026 at 01:56:32PM -0600, Andrew Davis wrote:
> The function i2c_match_id() is used to fetch the matching ID from
> the i2c_device_id table. This is often used to then retrieve the
> matching driver_data. This can be done in one step with the helper
> i2c_get_match_data().
> 
> This helper has a couple other benefits:
>  * It doesn't need the i2c_device_id passed in so we do not need
>    to have that forward declared, allowing us to remove those or
>    move the i2c_device_id table down to its more natural spot
>    with the other module info.
>  * It also checks for device match data, which allows for OF and
>    ACPI based probing. That means we do not have to manually check
>    those first and can remove those checks.

The above seem to be boilerplates, not matching the actual patches.

AI review says:

  This isn't a bug, but this description is inaccurate for this specific driver.
  Looking at the code before this commit, there were no manual checks for OF or
  ACPI match data (like of_match_device or acpi_match_device) in
  pfe_pmbus_probe(). The driver only ever relied on i2c_match_id().
  Could the commit message be updated to avoid claiming it removes manual
  OF/ACPI checks from this specific driver?

Similar feedback applies to most of the patches in this series. Please resend
the series and drop inaccurate information from the commit descriptions.

Thanks,
Guenter

> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/hwmon/pmbus/bel-pfe.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/bel-pfe.c b/drivers/hwmon/pmbus/bel-pfe.c
> index ddf9d9a2958c4..6499556f735b4 100644
> --- a/drivers/hwmon/pmbus/bel-pfe.c
> +++ b/drivers/hwmon/pmbus/bel-pfe.c
> @@ -88,13 +88,10 @@ static struct pmbus_driver_info pfe_driver_info[] = {
>  	},
>  };
>  
> -static const struct i2c_device_id pfe_device_id[];
> -
>  static int pfe_pmbus_probe(struct i2c_client *client)
>  {
> -	int model;
> +	int model = (uintptr_t)i2c_get_match_data(client);
>  
> -	model = (int)i2c_match_id(pfe_device_id, client)->driver_data;
>  	client->dev.platform_data = &pfe_plat_data;
>  
>  	/*
> -- 
> 2.39.2
> 
