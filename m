Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD593250E8
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Jan 2024 21:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705526334; cv=none; b=HV73/jxcsGgMw5ZHJpNaJ1o7kqq7hfklO/fSL5jgqT0J1GJ6+nFm3AtWmFYYuCC9pRgnkZi8ZUA5kpwNL3S1bDwDjkTPhKMp//0ZG5/Pa0Ew97Tc++yY84eFpGT4xB0FHuEnVQO6ysHGs4HTZK9Iy3AM5P4z33gpcQs/u7bgh/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705526334; c=relaxed/simple;
	bh=xanIe98lsUhZCnVyTs1ocpC+92TJR2DcJmA6WmVKquc=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Sender:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXeFV9TBNP2wGstG+Wuu8PVubFfvmV89RF3jYzqsg4FLirn6F/yhuYXy9N0IEwTIOK6Zy9hnf2Z1GvH9tYnsDDp1kBr6FPGV5XnpiVKfc1xVr6kDvF8AFmMK4gefwm2zU1rtrZn5JKMNF5gNqWW6YU9F6HhX2BJDCV1LBEW4SAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pn2vdEya; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pn2vdEya"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d6ff29293dso3640605ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 17 Jan 2024 13:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705526332; x=1706131132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vVeRuhAA3dRFtEalw4QakO/qJAqU+EImMKJEhGEtMj4=;
        b=Pn2vdEyakoOpsoLphHABFe4AK5fhSBcyDtR4V875QbLMz/8coESZxY9AyRZ0ZhjYEz
         y3m/lNnZZxdRMorTLa87yyR9DsUMPl1aoHSVMKh+7kNvkMnFsAbbvZYkY/nr2T0oMfb7
         CSev79PIMlhvzdSsSM1aPJKBYspOgrC6ZafyDJfU5E1I8TSpczYK5gZYK/KVJzsjEmUg
         mxVKTDouASvDF31u+AfwMn2NRFDRn0JMcvwKVhMVusKJGOhQuPCdK9JpKrLvkFkw9Crx
         RFdkzAx86TgfpUSEEl7JoqmIZ1/JB2MC6tT9JZ0FL6ODAboCTgJSQBTAvLkUYAsu78SG
         /opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705526332; x=1706131132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVeRuhAA3dRFtEalw4QakO/qJAqU+EImMKJEhGEtMj4=;
        b=uwJt+tVdmRV5xatBZbugyJkrPYRBQZbOgNFrP92f/kNFsVJJ+8V+TuwenVmyrsXlNv
         Xf4X7JaLG8/O+YHSLLz4DtvF+GvmgKwZeK4s5jBRtn7pMD9xw8WWe3FLSV7EL/FdusOF
         +Uv9Go/KOZj4yg00NQhj5CWCF8KygfYyg3Dp+2elpo2X9MG8Y2awjLAbBIf52cffUrET
         bLjTEP+w9D0lIlJzV3r0eBHObyMhmgJs1zwvK0qefgojSnAdgyZ5nLxtN0YHdw0pmRRw
         e0UKzinv0COJR8p+yHjNy7Cq0QxLqry3ZcbQ6rHa2I7RAiKklxMFkIMQBXyZvtfBbIu/
         9FeA==
X-Gm-Message-State: AOJu0YxWE3OvdziZhuDAGDR89vaP/0jnTHs+GaozQY0rXf7rlz1gtB/I
	whJe3nVMZhb24p835wLPHic=
X-Google-Smtp-Source: AGHT+IHwPjSI6hYApg3EVswOU0Qb0XB6CYagAwABy+hRIMfkVBsa7rbsXMy33jqFYARCeIzyLixcaA==
X-Received: by 2002:a17:902:cecf:b0:1d3:fa3f:6688 with SMTP id d15-20020a170902cecf00b001d3fa3f6688mr7568915plg.61.1705526332052;
        Wed, 17 Jan 2024 13:18:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v10-20020a170902d08a00b001d6e90d6b42sm102563plv.25.2024.01.17.13.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 13:18:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 17 Jan 2024 13:18:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: put HWMON_CHANNEL_INFO() initializers in rodata
Message-ID: <6095dda1-2458-41af-a2a4-4f33b82d835e@roeck-us.net>
References: <20240117114405.1506775-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240117114405.1506775-1-jani.nikula@intel.com>

On Wed, Jan 17, 2024 at 01:44:05PM +0200, Jani Nikula wrote:
> HWMON_CHANNEL_INFO() is supposed to be used as initializer for arrays of
> const struct hwmon_channel_info *. However, without explicit const,
> HWMON_CHANNEL_INFO() creates mutable compound literals, and the const
> pointers point at the mutable data. Add const to place the data in
> rodata.
> 
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Applied.

Thanks,
Guenter
