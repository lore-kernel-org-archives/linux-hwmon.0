Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8EE2F25FD
	for <linux-hwmon@vger.kernel.org>; Mon,  5 Jan 2026 10:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767607836; cv=none; b=Qj9ZNdyQ3DrdIqjjmvuscIDCZt4YJHL20T9kOO0DPGFFdNkKvzhcu/rayHwv04y7bCzXv5avypFtWEkcQ7kePXq8Zud9UHKBXbNwob0zDgwRPAuTyKN624Kf2r8WeTNJDZhEoWQCbCImRYq50RA0nB8zJSz64cZMjCaZCQ7qb1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767607836; c=relaxed/simple;
	bh=PbGYj0RLG7CPYad+Rq+AEDImBjNt5TLUDiyB5JHGqmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=nFAHQ+qqF+ewN3EKNUUaLc1/Cs1fcusuTxHf2xggozyw8jDY77CU77l0vI0gb1H9/fiOmURyO6lLC7kQvQ5YE55EXOTRNknnNeFBun2247PS0TI4tRzvXjzzK1ioxN6qOKkC5y9TaX2RsV1zT7Fyi+UcgYXDJfGd8yG5lIY1bYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vxUgh2fg; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vxUgh2fg"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-42fb5810d39so9180052f8f.2
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Jan 2026 02:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767607832; x=1768212632; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fxNaBeHAJ/4EZ7JTOdnqwOVDyNniPg0HIAmiaHm6nBM=;
        b=vxUgh2fgpu2bKWARM+DPnq0imMBwR8PLVb92gecUFh1pVO7UgXms8YzR8O3xKT5UxP
         paw5TJ4/Jn/tETSu3EHspIaBSRL2pMywKktCXL4LNjxRdGEs1V9QwGCa0ysaT3sKoM3W
         4JxoCCmGZ/TdTwpKAT9iISI7W+mbSk+d5KyzwanS/yuigPSgx9cSfLqMhXLqSXXivywf
         DsK5b49bto2h22dSpz3hac3sBTObyFEZtm3MddkZAwMKysM8TaeXTJEKQ2qvX4GvOihG
         NwXa3ug/IRzFY+odfyBTj4AZSckCRzQmOWDDLsIHPhvpVqv5JB7vSBp6iGx7MRT+soQB
         1auQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607832; x=1768212632;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxNaBeHAJ/4EZ7JTOdnqwOVDyNniPg0HIAmiaHm6nBM=;
        b=orGlIxTBAZijtFe9KkUMVmgr+lGRgkvInmQhDmBSuYvAeBdadkbEm43HkLOyHqeSQn
         e0DN2PmPyrBH+3Q/lDZ68vDAPTr8Dbxx/IdnqnPKdfwPloxBsn29W6mYkcoQe+O2Z30Y
         GRDtr4K79PVFZfYqg59bpCFVtFaoLsbZ5jVgB87RnzrfIQ/OjN9HdVXQB6sGDjKRo7al
         rh49OY/8hmsmssQVgaeRySV0mNVV/B8gK6xCIf3MvImM11F5KlBmUviqYAPzVDI9x7A5
         tQxLXF95wr9okKRQKuQB0/St9ZamYb0vQeobkcATSmtNW328ASoYw502eWG1hWK1e8aE
         4jMg==
X-Forwarded-Encrypted: i=1; AJvYcCW7z4zm+zdpO4+3LafGnP9hhmn6ETbdTFhMTjLhwCZESutqoIhHGkCiKo1gErnszZG1ewiVU8RpW2dqhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YymGJT7C+KaoW1XrN6MLk8iZOuUsujBWZRORir5KZ1j8YY5+STE
	Kwl3eXuvnPeECuP5Be2o71uWf29T78s7YtK2Uj5jDYganX7WaedVRpWMrQ7VFd6BhpA=
X-Gm-Gg: AY/fxX5t1cMfHNz8iZ7cCDaz/Pu98nghG/NZTPfpuDJxX/Y3bUVPHEGvHUjQPceJZQA
	Iv7pmxl2R/XoD7nM+6n6k4M1Jq3AlyV79yhGcz/sCDZbvs6wS8TOO4DlOHv//ylLVpE1hnrKTl9
	KLzsLjyL473xTrO04aeb3U3xpTmt6LC5fZONcCtSsQxTvfYHFj1XAE0RrSHeafEqFVjhoDZ92jM
	FgvQUhqv7Le9mfo13Rbj5zd4oUeZAKbQck37pOqr31KjM10fmrMUIJVaNuaSjjqw7cDzc49tyhn
	5In+mlR15VjC6YeaoEUWQvMYAB6LRQEiebKtx64Z8mbzxKpYEqUs0N3JA8D/mXefvF5LbDCEX0k
	/hG4RKQSe6gA3oMLpSUEFEbZFKemYTJGssbBtj4wDKm4oWKTnuMXD1LT4aBcofXFW6CQSCV/FhY
	47oT+mjgPtdt6HRxQw
X-Google-Smtp-Source: AGHT+IFizN6ugrpoj6l/xyTx2wr6ugxEAzpdZgwgMGXWzIHWqKUPqfS+umP15OiFV+l/yYQfDLUJ0w==
X-Received: by 2002:a5d:4a11:0:b0:431:67d:5390 with SMTP id ffacd0b85a97d-4324e50d055mr58872716f8f.54.1767607831963;
        Mon, 05 Jan 2026 02:10:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm100837339f8f.20.2026.01.05.02.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:10:31 -0800 (PST)
Date: Mon, 5 Jan 2026 13:10:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "benoit.masson" <yahoo@perenite.com>,
	jdelvare@suse.com, linux@roeck-us.net
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: Re: [PATCH] hwmon: it87: describe per-chip temperature resources
Message-ID: <202512300415.VRCQoZYs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226203021.27244-1-yahoo@perenite.com>

Hi benoit.masson,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/benoit-masson/hwmon-it87-describe-per-chip-temperature-resources/20251227-043108
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20251226203021.27244-1-yahoo%40perenite.com
patch subject: [PATCH] hwmon: it87: describe per-chip temperature resources
config: x86_64-randconfig-161-20251229 (https://download.01.org/0day-ci/archive/20251230/202512300415.VRCQoZYs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512300415.VRCQoZYs-lkp@intel.com/

smatch warnings:
drivers/hwmon/it87.c:1694 show_pwm_temp_map() warn: variable dereferenced before IS_ERR check 'data' (see line 1691)

vim +/data +1694 drivers/hwmon/it87.c

94ac7ee616809d Jean Delvare   2010-03-05  1685  static ssize_t show_pwm_temp_map(struct device *dev,
94ac7ee616809d Jean Delvare   2010-03-05  1686  				 struct device_attribute *attr, char *buf)
94ac7ee616809d Jean Delvare   2010-03-05  1687  {
94ac7ee616809d Jean Delvare   2010-03-05  1688  	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
94ac7ee616809d Jean Delvare   2010-03-05  1689  	struct it87_data *data = it87_update_device(dev);
c962024e306ed5 Guenter Roeck  2015-04-04  1690  	int nr = sensor_attr->index;
542f1e57c17849 benoit.masson  2025-12-26 @1691  	u8 num_map = data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
                                                                     ^^^^^^^^^^^^^^^^^^
Unchecked dereference

94ac7ee616809d Jean Delvare   2010-03-05  1692  	int map;
94ac7ee616809d Jean Delvare   2010-03-05  1693  
0282ba4a4fe6c8 Frank Crawford 2023-04-16 @1694  	if (IS_ERR(data))
                                                                   ^^^^
Checked too late.

0282ba4a4fe6c8 Frank Crawford 2023-04-16  1695  		return PTR_ERR(data);
0282ba4a4fe6c8 Frank Crawford 2023-04-16  1696  
0624d861983c2c Guenter Roeck  2015-04-06  1697  	map = data->pwm_temp_map[nr];

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

