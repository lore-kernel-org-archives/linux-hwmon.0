Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014B0233148
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Jul 2025 14:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752677157; cv=none; b=Jw/bRtDrJ58gReHBsbKpwg2qRrXscVJ6DGEYKIaZ3a4/EtuoagDM338qemJHkWrXQcBCg+2pjW7V82++ldKP3IQdpwT88xk6t8e1UJ7Z20muR/kqvHga/xinDQVlPj3Hra02h53exgK0/+reD2udHIPnCt8oQu0roDGEGmo7+A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752677157; c=relaxed/simple;
	bh=upko07SOK/40JgIZdN1G3fPGjXzHlqhBZ2zetBhT0g0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqTyQmFOaZOwOipJQ5JtZS2YHC89QtmQ6d2Ggf5eS9NIWHr9dX4BX5t7oK3BCKBmaWlF1Yvi8jL373O+DHdhN4zc2V5Gmw9c8+VNm4pbxC/1oLwx+ZXm7pJXz6atyFOrjE8egJOuFb5O8IlzZmHHvMm5eZYPs5j7wui02EyIjyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvduHArL; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvduHArL"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742c3d06de3so27808b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Jul 2025 07:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752677154; x=1753281954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EFY5eKf7MgVE/3rH+7vRT4mwBW1CFS7NkwoCr6ajFY4=;
        b=BvduHArLBygtuQ2eUhzxxPlJfbsl88XB3OwUWkZXFnYb9QkLzFZP0db0oh3dFQJ5eW
         lj0OFBZLGtlx9DKC4RTV3I1dDZNtGMza4Fkfv9gwZpi4yNnAAHCYUsE7SM/TaajncaIc
         gbjqJ41HCZlOiDO0V4cKUfyOJAs9mjOlwlmkZmDct0QXaIUW1+TA2By2kFfYE/SGF5Ig
         VqC80slxtN75MUeVhpLll1GWdZkhlT08S4iGYwf5yfbT6GI87DOVLMVKk5hBTx/nC/oM
         xwWu/ZfBy9aisxQf8ByOiE7vHEqVQ3HRVOvf0uSHMxmcX5IWq9RQTPVdGURxmirPO8jP
         rdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752677154; x=1753281954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFY5eKf7MgVE/3rH+7vRT4mwBW1CFS7NkwoCr6ajFY4=;
        b=OP/ao9KoGsbOGc53QUgigRL0fyuS+aat67Gp2rJ1oB9OxPZdrzKOasgVMD3x1SeXii
         QGVr7fSz7XLVIQspSW6F/rIH4/PUQRGOHWLi4jFZrkB0fC3HppEzLo7lkJ1Wp9BOSeL0
         g67QslC95VXoWUr6RA5tHQu3QtcRaHZdiTsOdmGC5KJQHqf67F66RVXJ4CS643OZcX+k
         PxJXlhyBaZI2TStavENS7yaeRtEh7nYLTkkQiHTR3Y5ipZedDEqp2ZCO1ORaULuzwYr2
         SGAdz9N2CkAUWtqfe88KKOgL+y6wfs55TuXfwXWeYoTulxaD5Qg97CPg7yCRyahSzT+/
         N4mA==
X-Forwarded-Encrypted: i=1; AJvYcCVg/Fo3KWvak056q1VQMRtVa+Roa4cLOx1J+LcmeulH+EV2NkPd+sYA9c70vaz4QD+t/GCUyjRGhnoIKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywgQO00PwEjoYiANzgT6cl4/01cRqslDXABmEVNaMzvGe2gsIn
	fGCdh7soNLUO7C/86C7zhBziUirVKFfWbAeAGgoDmxI7O0o2UNX4DAMK
X-Gm-Gg: ASbGncuadxPo7vYZC9fRDSTaVh6uUxHCVFggbEr5SqEqx0xybu3LlMa3cMqFb8PN5Vv
	jjXCeLIkr05RRVsvIt26YEEmi1b47KizUcnceFAbiW9CSGYSTaz8dHjzwKGVkkzYmpc6E83Gv5p
	QCjIcR2DtxVac2y5BLvZC14g7cfWav3NyMqTu5qhVkHBTAETwYJJ0oPvcMWvDQkmomXyJdd0hqh
	WqWGAQiknA2mXsqxRz7lVNcc5FCARik4PaGt+c7YUys+M+Tqf1WQTYFGlTi3xfPwgmFh3jA+oLz
	YRXpjlkMK39DTWBhF/mVZiD2im41o6GhXbgBcxh/ELc82gL7bzLw5sr2kH5PqpH1JB6ukILm4FN
	4y0VdvXWe5CxgJwJ0umAcJQIeyL6o3lGbGxk=
X-Google-Smtp-Source: AGHT+IEdR8C3TISVQxOxfgRp4bRphqtWsYGVmpZmEdp8mTH7Xtu7j/cS+ytJUMHupqjH4/5EZYuUPw==
X-Received: by 2002:a05:6a21:6da3:b0:231:acae:1983 with SMTP id adf61e73a8af0-23810a590a0mr5567620637.3.1752677154298;
        Wed, 16 Jul 2025 07:45:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6c5660sm13828608a12.48.2025.07.16.07.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 07:45:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Jul 2025 07:45:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shantanu Tushar <shantanu@kde.org>
Cc: wilken.gottwalt@posteo.net, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) add support for HX1200i Series 2025
Message-ID: <91f5de58-31ed-4ead-aae5-d022b592fd5e@roeck-us.net>
References: <20250630201444.210420-1-shantanu@kde.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630201444.210420-1-shantanu@kde.org>

On Mon, Jun 30, 2025 at 10:14:44PM +0200, Shantanu Tushar wrote:
> Add the USB ID of the Corsair HXi Series 2025 HX1200i PSU (CP-9020307).
> Update the documentation to mention this.
> 
> Signed-off-by: Shantanu Tushar <shantanu@kde.org>
> Reviewed-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>

Applied.

Thanks,
Guenter
