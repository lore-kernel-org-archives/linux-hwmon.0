Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90D121B1BC
	for <linux-hwmon@vger.kernel.org>; Wed, 15 Oct 2025 18:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760551500; cv=none; b=hHiD4H7J1EoufRQFpasrEyCYw9AaB3ea6WFHmDySr/MZU9YtBeM5u3kyMU5xjIkv+PljgCo5bgoWCzigfH9YTiKiCnBprK1fbcA7Sgf8WqVsKdoWPCgQ6CcNykQWljiZRHkwierPeFe06Ms3aZEUhDfymjAtufia5ceHOHNnIIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760551500; c=relaxed/simple;
	bh=bn2XbLIQg3pcl9DaDKEaIxRHVm5mvtIlEs1dUHpsv1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sIG3w3fu4R4eqqA6KvrBDBFdE23B9UVHNTwr2zoYzO+T+vtLMVAGoeEeWmibrRh7M609KksDqAbZx+CrCHsqpVegmUrgV9fMLc6e5waJ99jFqfn/dvjrq6dqjv3Eo2fT85aFyolOyELiP7gH5wEos49bFaxXIx7RbsZjwIxhre8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPlcBqgq; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPlcBqgq"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7810289cd4bso6581045b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Oct 2025 11:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760551498; x=1761156298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEscpRiAZP09a2JQp/IONW4mb8MPlVCjQKLrshEfpIA=;
        b=EPlcBqgq6CokSWIea5aFWta5ZBb0ee7NkpmsdOzeLAJm/eXI8mXpbOEX1ykWUdFHGn
         /u1OCkhwS49gwlyRNhvsUP3igfjeeIQcDPKhyqZKwrIwXbWctm4pN0emNcV3/3ac2iQ3
         5/vyffgZYulR74TKwUGOfjPAUYGSMjRsXAlLUvxInhCgKu2v6nm0OpzH4X9W2uNa2iX4
         z0+2XHx3a4zsSu0aMIlzQq14mdATg4AHL66oucGTOutQ72d1w11FKWeZJNg3HAlJTWzi
         uESJD6/Ux83z3j3wTUsZ72J7OyKOArGv9pjl7JXTnGAkX6N1mRZrz8Qhk0Qy2H344dE7
         BqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760551498; x=1761156298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YEscpRiAZP09a2JQp/IONW4mb8MPlVCjQKLrshEfpIA=;
        b=FvXw+tGUFHJdlQzAlSn7BIq68h/1nF+jHBG2N6SHtTHPTJBfIf7ZnLXKH3sWHFOJrp
         kA2m7hT+0GlPA9+qXkCkzGRbSSFJ4BKP0eerswISdxhvk+tsmOkpUdJ1hS9ePvO5Sopk
         Vz2AmfE/Cr8OAhwmi5c9NCeR8cQrSWZMD5EYhBmTKASBeOrSzWGXNiBr+AM5vu4ojsVW
         kQf+Py/Cx1HAqFeJ4rSTJ4Qz+zE7Aw4ka4BB2bjj1ofmxRwHtHrTKyQ1DDFedL9jcbXA
         oGmYAMplHQBrhV/e/clWSELG+tiIllhhdsNj2NYyd+crtVZWNkFFoUaqcmn+2786VP/a
         oaxA==
X-Forwarded-Encrypted: i=1; AJvYcCXc3Qqw/LZy6080z476NRDeNBUs5VZhcvPQ3gQujp3noAZaFD6+l3NwivLNvo/jlgdb+Uvrju/LOU+vkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCl6Y/RGTD4BeN4Xnd59Vs/6vG5D+6UwstNrlkJWoV+QkHEaQd
	6H8Q1KDRkDJOcRbO7dvjLVM+yO0BYR21TKwJri4aVWqTj0B8xS4XZz/F
X-Gm-Gg: ASbGncvss7QhLLOH6HhHLOBIWYLDgDBaP3p1K0Ws5LHU3fEN9PQ3xGjHcYljGs2KH27
	cMjIWT8HF6ICpGMx8Gxc6baOaZ7MSiz5ZP1FHhqT8wzVRsDVIMxsEzglUOLL40jvM5qQrH6JZv+
	tJdZhV2a1rPPsj8BA84zaZ533ZyMeKuo6DezZAmxC88dDkpSbgnG27XxcLsvG8u1KpElAAqPUUp
	sh0anEhV42a9z9xpQqnfIRKi5V6XXS2E1+Z2A7ld40uhFpHkpDjYkFrMzZTZ0D4mkuOXGXIqlCY
	XZ43I4Wjyc5cKqF2iuzynlwg3ZFdNEwZ1opwLKBpUExfumRNQLr5esmgNVzIkc5OSk9mznnqnF2
	NEurrEYmo83Ey90bTk4oC83Gse8w1FRlmI/d9UyNaDAzQ5LPaXdOPZsj1Qbn148Fn
X-Google-Smtp-Source: AGHT+IE3JywhTW/hBqgapIqK/3OTonypN3JXftjp40udV4Uca3H7ZxC7Dvrc/BK+cWjLzKDvb/Bqww==
X-Received: by 2002:a05:6a20:729c:b0:2f3:f59b:3ae6 with SMTP id adf61e73a8af0-32da80c2d32mr37829511637.11.1760551497771;
        Wed, 15 Oct 2025 11:04:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a22b7bbc7sm252011a12.22.2025.10.15.11.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:04:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 15 Oct 2025 11:04:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (scmi) Enable sensors to assure they can be read
Message-ID: <9191914e-9bd3-4760-a6d7-74c858ea1984@roeck-us.net>
References: <20251015114953.148706-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015114953.148706-1-marek.vasut@mailbox.org>

On Wed, Oct 15, 2025 at 01:49:28PM +0200, Marek Vasut wrote:
> The SCMI specification states that SENSOR_CONFIG_SET is used to
> enable/disable the sensors. The sensors can be disabled by default,
> which is the case at least on NXP i.MX95. Explicitly trigger the
> SENSOR_CONFIG_SET to enable the sensors, otherwise sensor read may
> fail and won't return valid data.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Applied.

Thanks,
Guenter
