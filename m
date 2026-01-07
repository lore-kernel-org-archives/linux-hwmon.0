Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012A03446B9
	for <linux-hwmon@vger.kernel.org>; Wed,  7 Jan 2026 19:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767815031; cv=none; b=mvP9LLRzjuK/WKP3Ie/H5zouUGIgKFU8A8iwxcZLgMrzzrVGNocOKoKz+ynYIWh+o9coRI4zlY0dwm6pQRySgQZXcBv6NzMVG+1gtOYEUm3oFWRmTA7jAEZgSlYMu3CvC+nvDHYixxQVKOpcvcL/LXDWY+8XjcUJ861+9Qy5Kgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767815031; c=relaxed/simple;
	bh=H4kQ2ImpfCXfEiF09CqkE7nLS72g/BDW/WAuAGSer90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqBq0KUPoiDkt0jd9TWFCBCXR6Jo5vaDehN9pL9eGdA1L3Xm/pRhhy/Y3641T18hPUmL697xY2izerqsrRJ2yZz9dlWfdHJxvmhFABiogub1dNvx7pZzk3QtGgCRxREbTa0eFPrZWSmyyBbNgtVVmltKVoKMVZN7k1OHCJa5Oow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=imzq0eim; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="imzq0eim"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47774d3536dso11415185e9.0
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Jan 2026 11:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767815022; x=1768419822; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hfhdkkmV7GAX86e2yZLGIC3icQWfc8GaVLQ0woZU3MY=;
        b=imzq0eim7+5A9yC21FSKWQgvJm23Cq6SQs7yxpV+y3mOGVXOmwFdRSrcP1kHajpcNu
         RiWmLhIUXoCnOL8syLivgD1+xWaTIpMgAAy5U87ZB5bSNU32OE2/il9jv1XTvbFRqaQy
         wJ9tipl3RM2sInkLYfyrc4d3/dfh8M7AnxduCwjU0PIYskKisSrXUVVBi8RWcl6sdbT6
         brwwvUFGyJAxiQPSsomAvagZ2L2K31IEGt6CdMc0Ibns4YvzM6OaYtboenbxJpMaecv1
         9FSVmScW9nXVEBiIOZkAo/LKm+PQ+Wvw6b2a2ue+PqVOIe2dkWD8QhiDdIIAUue/ouvP
         obcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767815022; x=1768419822;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hfhdkkmV7GAX86e2yZLGIC3icQWfc8GaVLQ0woZU3MY=;
        b=XJfYwzJVeeV7p+KEHOuffZmPVxSftm0kXgS11W70v+jRgrjw9Mx0NdUNbXrse++sRu
         NdsR7LwWOV4pIdvpn0TP5zJBvAo3M650RGoIbVtqYv68nB+aDREA2o44efKY65n6VDo3
         BC0zCJ/m9firpKcGGy0bqyjYSXLs+AGoqymk2jM0uA1nOWuBW+XEZKmcMMnV3j33zax9
         UsIzgbhnKgQenWZfYnJLulGDPXOlakt+DyerCZWC1QW3NrPT9zdcyGU/9cXy6NcgAd/H
         nPh9tvpOCYvuoYD/Ex8rqNJH/B7D67j6STbyIqKiWG6l4w3I1scICuGLOHQnqA1HvZJC
         sx1w==
X-Forwarded-Encrypted: i=1; AJvYcCVGfDJRA+agXF6IE3prDl7r+ZBvBx0fqPGgiSrqTm7maiZtDEx1hphhc/BSg/4UkHW/xdw5msWHQm56+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcEk3g/Bh30TxYBgi429DxiqNjAaVO7ZKlD4/xOoeSzLRUAs4v
	gRTDAEDxUGFEWrVW3uZYf4cF2LeL4gU0X/fTW7Jzrgn366vUdjccOuU6FRVU3e0D94c=
X-Gm-Gg: AY/fxX63hL9SM47CB0wJjgfcZLuskrMu/4dkIyDFISXTqg3MggTEucWy1+qwnkJJ7rD
	i5MfoSWaZqXkpSDLSj3gqGCk7KjZyxhk+yYcs3b5ESSDpD4o1/BYbHZNuZCPKflcDUN+A5WpmQF
	p3eWfm5EyJOnjfPE5RoFdDAt4JRtlTyulwoqL9y0LhMqa8CSGz2ZaSROcamS90panSR7zAfOTPw
	D6lm8ezTEsGVILx416T9X9SWLLFNj1RZhvll+Swx3M2Vu+Ib1KQadT2TZ83eO+j0pEQInEJ4Y+P
	N4JALVHIy/6VHp5yG39xjqtM0q7i6MEKR+2/xPEvZroVWl/zURWGknqErSXiIjv9Jlwgx8HcgJf
	xK/FxgBwq95BmsH1Wuu5mUCg+8NvbuggSTng311ESItyaMuerIqa03K7cktQSJZIUVhA5QFPJD3
	fpDSqEfFScoxLKF5aV
X-Google-Smtp-Source: AGHT+IF+nx5zCtfYVsKIp8PB8gUjhPK5j02V7HcCtFysVmUTplF5yysifhIl1OB40IVLi4DTO94Aqw==
X-Received: by 2002:a05:600c:1f8f:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-47d8487f5cfmr44268665e9.17.1767815022126;
        Wed, 07 Jan 2026 11:43:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f84besm22141875e9.1.2026.01.07.11.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 11:43:41 -0800 (PST)
Date: Wed, 7 Jan 2026 22:43:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Benoit Masson <yahoo@perenite.com>
Cc: oe-kbuild@lists.linux.dev, jdelvare@suse.com,
	Guenter Roeck <linux@roeck-us.net>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: it87: describe per-chip temperature resources
Message-ID: <aV63aitdddpwja7g@stanley.mountain>
References: <20251226203021.27244-1-yahoo@perenite.com>
 <202512300415.VRCQoZYs-lkp@intel.com>
 <CAGHj7OJ=XoSSksz5DbpnP-eB3dQor0zqoXezbYRocFrqj+RTuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGHj7OJ=XoSSksz5DbpnP-eB3dQor0zqoXezbYRocFrqj+RTuQ@mail.gmail.com>

On Wed, Jan 07, 2026 at 08:18:53PM +0100, Benoit Masson wrote:
> On Mon, Jan 5, 2026 at 11:10 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Hi benoit.masson,
> >
> > kernel test robot noticed the following build warnings:
> >
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/benoit-masson/hwmon-it87-describe-per-chip-temperature-resources/20251227-043108
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> > patch link:    https://lore.kernel.org/r/20251226203021.27244-1-yahoo%40perenite.com
> > patch subject: [PATCH] hwmon: it87: describe per-chip temperature resources
> > config: x86_64-randconfig-161-20251229 (https://download.01.org/0day-ci/archive/20251230/202512300415.VRCQoZYs-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202512300415.VRCQoZYs-lkp@intel.com/
> >
> > smatch warnings:
> > drivers/hwmon/it87.c:1694 show_pwm_temp_map() warn: variable dereferenced before IS_ERR check 'data' (see line 1691)
> >
> > vim +/data +1694 drivers/hwmon/it87.c
> >
> > 94ac7ee616809d Jean Delvare   2010-03-05  1685  static ssize_t show_pwm_temp_map(struct device *dev,
> > 94ac7ee616809d Jean Delvare   2010-03-05  1686                                   struct device_attribute *attr, char *buf)
> > 94ac7ee616809d Jean Delvare   2010-03-05  1687  {
> > 94ac7ee616809d Jean Delvare   2010-03-05  1688          struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
> > 94ac7ee616809d Jean Delvare   2010-03-05  1689          struct it87_data *data = it87_update_device(dev);
> > c962024e306ed5 Guenter Roeck  2015-04-04  1690          int nr = sensor_attr->index;
> > 542f1e57c17849 benoit.masson  2025-12-26 @1691          u8 num_map = data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
> >                                                                      ^^^^^^^^^^^^^^^^^^
> > Unchecked dereference
> >
> > 94ac7ee616809d Jean Delvare   2010-03-05  1692          int map;
> > 94ac7ee616809d Jean Delvare   2010-03-05  1693
> > 0282ba4a4fe6c8 Frank Crawford 2023-04-16 @1694          if (IS_ERR(data))
> >                                                                    ^^^^
> > Checked too late.
> >
> > 0282ba4a4fe6c8 Frank Crawford 2023-04-16  1695                  return PTR_ERR(data);
> > 0282ba4a4fe6c8 Frank Crawford 2023-04-16  1696
> > 0624d861983c2c Guenter Roeck  2015-04-06  1697          map = data->pwm_temp_map[nr];
> >
> 
> Hi Dan,
> 
> Indeed I’d move the num_map assignment below the IS_ERR(data)
> 
> Is proposing a new patch V2 below the right appraoch ?

This doesn't seem to have hit linux-next yet, so sending a v2 sounds
good.

regards,
dan carpenter

