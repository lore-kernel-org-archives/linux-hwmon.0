Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF3F1C862F
	for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 19:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774811616; cv=none; b=HSlYvYj/7XotRPzz1he0Beo7OB/iEyI/LznkWyc6u4aN8Q+YnQInppavxZW8QexgdwyttRk+yTfCzf2khNQIoHNXVPJJwLELhDQd/KcEIG5oNhAVOt6w7orBUaFhPeNQlrITSsxYhJxg7oZLwp1KMbXCcwXLhOj4hJMeLq4nf48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774811616; c=relaxed/simple;
	bh=YT+1ybmklAO2A4Kj70Cc3omlLk072dRtONh9R6rV94s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHVSx+KPhw/cmWENN0OH/Ye71bV5qHgcyS+fVZnFMBLWrxhwaVOrSH04usAcrlwayiYP8C3NFtGUUj9xQ49vYRAKecM6ZFCScNIIsplI1R7Zu3lAOL8aecjTR2GlGk7k8bsjZx6LVmVFi+ctywXb9uqQR03CxwL+dOuO1l+ljeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2dn1K7x; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2dn1K7x"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35d90833cacso910441a91.2
        for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 12:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774811614; x=1775416414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYm4X2OO6y8kbhJtV2+Fj2czBy4bsXdnwq2L/kHERAM=;
        b=A2dn1K7x/5L0EJ+vf0ZimeEb9O/ys02aIr7/37xarOG44T6klvtPaTqpHnq+TFi9Gn
         OjR6k5y0Z28og9Bm2pCAcaH1fhPNYjCv+IdKFzC790AY43mUGn5nll2QSgik17kWl2KY
         3SxP6Ld8l3ycci+8eszNtzo7Pf/AnJKe9+j/xYMY4aoVKVkQLVZECUhzc2ud6dnfytWH
         uKgzaDGVi9RTfpvQ1sWEWfaOlEDB6uMhmc3+6wVoMos92JWYlL4yF/o8lhdi4mL5Nbid
         27rd+FSoHr2tSEzkZCLN/soHh2yCvAInweqKaQxiMcfs09YibGgGntiuv2BUK+3/NgjF
         pDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774811614; x=1775416414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YYm4X2OO6y8kbhJtV2+Fj2czBy4bsXdnwq2L/kHERAM=;
        b=U+1mpLjqwu35ODQxC+Xd8kFgO4mbpmXdJKUwYWEc46xSLIiHJABkf8vO4acHcRG6ZZ
         6UowWP+3rR2kJEozQZOLTHEGncALebNGUMfBSekiuwE0y2WNzK33tsJ7KTQRMIwjlWIk
         Zh4Ke0IVfbt5FE//5XPvvPGdi6yomkPlsq1RCko78yCvDM5Ot6ZwBFxVcr1aaUAYxAxi
         L3skpeSbpptlEs4o3vgn2agJM0BTeyjfbGLAgSWuX07cjZJDFxWYPZD/tyNQGEAX+/Wb
         D46DNN78vEGSZIzHurIXkr4qSBlZ5rlBI4fYw4tBvWEIfkZsdX6sUksGLd6q0tq074rd
         0ZAQ==
X-Gm-Message-State: AOJu0Yy+WFlaGfsvfsbXQQavxs0moeDLnvVdoui7kYIKdBxbAhesPJkW
	lj6n+S4qH/+bSvCD+AXoBK/RLzpepqK3CV3p9AY9H4/R929sv4jKwHFu
X-Gm-Gg: ATEYQzxTvUnBVviXsR1qm4aV4c/MyswFDRnteE6iav8/k8GyTkBDU4UBrXR9MVOPeoT
	d75xjxuTPEyuqlcTWPJEFKAImqjw5qGjhPmwAVrD+Xcs85/Y7HIbP9JR6/7p0fj1K2UxI4WYR0m
	tmiv19kWN4vXCg9FyZ7NqI/RCJQW3h4GpMAdrUEwiMWXipthcukNAu+XVjsPbAUdpMslybkoH03
	ZcS6ud2gyYx72LkWAXO26ghHAOQzWU/N8CEZoJ25BiumugYEYMUDOR+sryuasWpccJRk62umd36
	lezI6YzN562unoAxOKS3WeH6C5PYsAQSeWJf1KcfVlMw/4Psofovb8M1rXRYzAgwhaivQma4OLX
	mIVJg8guoiGN1IUapdpcCFi1gtGFEG5NWV+MtAGB9KtGREvGzpOYvvnzw7SzbbZ2snS6Ufajc6B
	X+fph7JOWMmwVFoiYBEvrUjQwF0u0lYtwgi5Mm
X-Received: by 2002:a17:90b:3d4d:b0:35d:a380:6d1a with SMTP id 98e67ed59e1d1-35da3806f9dmr1992894a91.2.1774811614254;
        Sun, 29 Mar 2026 12:13:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35da312de9bsm1876495a91.14.2026.03.29.12.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 12:13:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 29 Mar 2026 12:13:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"Delphine_CC_Chiu@Wiwynn.com" <Delphine_CC_Chiu@wiwynn.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 4/4] hwmon: (ltc4286) Add missing
 MODULE_IMPORT_NS("PMBUS")
Message-ID: <80e975d7-bb19-43b3-ba7d-f2fa013bac06@roeck-us.net>
References: <20260329170925.34581-1-sanman.pradhan@hpe.com>
 <20260329170925.34581-5-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329170925.34581-5-sanman.pradhan@hpe.com>

On Sun, Mar 29, 2026 at 05:09:53PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> ltc4286.c uses PMBus core symbols exported in the PMBUS namespace,
> such as pmbus_do_probe(), but does not declare MODULE_IMPORT_NS("PMBUS").
> 
> Add the missing namespace import to avoid modpost warnings.
> 
> Fixes: 0c459759ca97 ("hwmon: (pmbus) Add ltc4286 driver")
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
