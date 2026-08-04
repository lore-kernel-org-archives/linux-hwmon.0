Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD1E429CF2
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833391; cv=none; b=a8r8BfAqN4bJqawxfeIWtDWjsVgHOPGBqG/Pd8GQ5jlolh9B4sBFUmcZvWM7xHvbzYGMqhoYuDhs9s22OEzGQQvqF59PrDf+lSz9yELFPFlNSgq0usml6ZexzJu+gkAzrUyWGPfVuotGCfTj06erYrIkhDbv9VV4TyyYDARJMQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833391; c=relaxed/simple;
	bh=5pV9ec8+7jYflTmDQ94//lqz2QrdNne3uvEtdHJ5cMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJerqzNxUro/cG8fDPp1h3LgcQfRj0da9pyLzcqefTyuG3l7uqBQZTgepjOSRlzmEFzvKlgx6ffEh9iEB9dSokJsTwxlcgFyP589RLY7NS4buY2TLlYsHbrbBoCMQheDVy1NwIkA2uFJ8jFqix5vz4y0IrtYJlRwnwk+Fcrk+v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2BSKMd/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2BSKMd/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954dff6536so20315015e9.0
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Aug 2026 01:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785833387; x=1786438187; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bOOMEU6Ilc2nHPpMxJ0tEMsPCf56ApZJlQhZbJ/2Y+g=;
        b=c2BSKMd/kC0S2XgMVkbV4sX462D2DQVtXNs0CTotYXf3HT93hzUCAe89OKZWErRDOG
         05tzRKA35twrHILG42b2KQB6jdZLLi21CgEpE57r8hjE19qbRbozxfqIojgjYc8dsiro
         U0cGWOMrOihLmwOlk/aNfw6gzD+oZmeFW7cIKWL9h0ulDki8Jg1ysnN2l8f0wXJv7h10
         Jpg9YuapROWui7Mykt81IqTuhbptHRjdGog640Z9vqqcxDaiKP/kVsOIebL4aty1zk8K
         Qu3zF6ruzwfHMIuCfsc8ezW0fjmlb01y33UQMWADNakvUrbKRkZ2+ijcXtnhaMWXqKhl
         eC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785833387; x=1786438187;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bOOMEU6Ilc2nHPpMxJ0tEMsPCf56ApZJlQhZbJ/2Y+g=;
        b=rVRmKuMS1Ulnjvzxu5eOS9CzpLTWImFURX3ikrMZ1g/a1rqudqEQjV3YHaQLAlszko
         j6tJZbCtK+oB6AX1Wiwi5yCz2Uj387U6oKWm6437rQQLfXwWeO9DN3SSniy8qc4Jb5VO
         VodLcxOxpbdMURxW3j6N57akl+Aez44mKQn0+WmAxvgMtNGb4qeZ4ywhcBLFOK6xKIHk
         XhdktrOctGwwDJNeTqFzDFr9nLWlRlHdvEuD52o69/pu9VtNOqEuy3cYKHf6263YN41T
         WBWo6VLPNo0Ev5yRP/hosNrkbE02/x63/gbMN3mm+4LTU/p0R90Asu4p2zad1Fc+i3Xt
         Y3Qg==
X-Gm-Message-State: AOJu0YxanFsTAqLYy2R0hC+K+An0EY+Lmq9R880x+JJ6C1wUzbLIaEnx
	mU9JTGU80yFa7MbW4Hi+W0AHOzki/LPQpBGt2fbQB9OQZa6sjO8FABMxl9Fu0Aoj
X-Gm-Gg: AR+sD13NeifXeGhdL7YPN+ybj3qy7rti8RJZ1bnNBY1eAD6Y4d+tAKeeJim7qwaeFa/
	GUOuNp84dbJwnC3vk+PBTrh/c0rGz9rv1F82SziJKWN+PD8uMxAzaXWN/Pf99RB2/U3pCEVidlm
	o/mp3vhnwSBMtYsJTynQts/jK+wj7eE0y5qcXhINMQxUS0ui0m4a+o5N8kqelYhdNB99IGW5wYI
	MgKl8J91m4BR8dpyWq57LdHScRynUvZ8wO1Q3ytU0+AHjQrkjtcQI2qyaoS/+JKzjodzldCK6wf
	Aiu5v7yMX2qKu1JEcgb2xfnROODi8xLyp+Ny2KynPZrPkEJLrbGYXbj0ZqXOw57iejIxFK/YkvJ
	JkPx9coprYazSS6nwxEiAkwQInnL2SzxFIF6prb5A0RLG/sETJlj+KXbVRbTi5SX/r9RVQzOPa6
	KmWpa8W7HT7xJ5l/MR1HAoMjrTrWaOFv554QGtNNSqZ3JHrYCRw+Hy
X-Received: by 2002:a05:600c:e48a:b0:496:ca1f:a428 with SMTP id 5b1f17b1804b1-4980c695d6emr202655295e9.19.1785833387458;
        Tue, 04 Aug 2026 01:49:47 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a0fca55sm73405435e9.13.2026.08.04.01.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 01:49:47 -0700 (PDT)
Date: Tue, 4 Aug 2026 09:50:58 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, 
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
Subject: Re: [PATCH 0/5] hwmon: (pmbus/core) Introduce and use
 pmbus_read_smbus_i2c_block_data()
Message-ID: <anGnwfBn7Hi87p1J@nsa>
References: <20260803193535.2286578-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260803193535.2286578-1-linux@roeck-us.net>

On Mon, Aug 03, 2026 at 12:35:30PM -0700, Guenter Roeck wrote:
> PMBus drivers need support for reading SMBus block data. Unfortunately,
> not all i2C controllers support this command.
> 
> Implement pmbus_read_smbus_i2c_block_data() which first tries to use
> i2c_smbus_read_block_data(). If not supported, try to emulate it by calling
> i2c_smbus_read_i2c_block_data(). Export the new function for use in PMBus
> drivers, and use it in affected drivers.
> 
> ----------------------------------------------------------------
> Guenter Roeck (5):
>       hwmon: (pmbus/core) Introduce pmbus_read_smbus_i2c_block_data()
>       hwmon: (pmbus/adm1275) Use pmbus_read_smbus_i2c_block_data for block commands
>       hwmon: (pmbus/ltc2978) Use pmbus_read_smbus_i2c_block_data for block commands
>       hwmon: (pmbus/max20830) Use pmbus_read_smbus_i2c_block_data for block commands
>       hwmon: (pmbus/ir36021) Use pmbus_read_smbus_i2c_block_data for block commands
> 
>  drivers/hwmon/pmbus/adm1275.c    |   9 +---
>  drivers/hwmon/pmbus/ir36021.c    |  22 +++------
>  drivers/hwmon/pmbus/ltc2978.c    |  21 ++++----
>  drivers/hwmon/pmbus/max20830.c   |  34 ++-----------
>  drivers/hwmon/pmbus/pmbus.h      |   1 +
>  drivers/hwmon/pmbus/pmbus_core.c | 102 ++++++++++++++++++++++++++++++++++++---
>  6 files changed, 117 insertions(+), 72 deletions(-)

Just one minor comment from me. With it:

Reviewed-by: Nuno Sá <nuno.sa@analog.com>

