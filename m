Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5CA1B7F51
	for <linux-hwmon@vger.kernel.org>; Mon, 25 Mar 2024 11:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711364737; cv=none; b=TnWXaobRas3+eJ+8EctsY7ak/Y7TZ0gsPAvFMEJeBcGCK151IDhMid1PqCEK9eUUmHN0/gAhAOg62QP/lZt9nWoyx+MjZn/YI2U+tnmmE3iwp6LiMiKZlSNybxlv+eCzvmcQmj9GZP9jpurqYFpk+52bJK0PWgpKkbcx60Dz/qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711364737; c=relaxed/simple;
	bh=7iS7PHbquIUiCrCMtkBdkxuqi/jTqc2cY3j9OhS1Ij4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POL7ysm9c3sR0jzQybd0+ivrsMcBPYVTR6keZ6JrHdXz6zwbguw6XdGwzFBfOM8RC1Z5CKxyL8aMnh1V3ilJmK14LIPRY3DH7lDwWyrv/Nv/VhV3HfsK5t7RWp0wpzmQCX0G0leJ3GwWaezfJlK1/7+l3Yu+T+1VmnNnx/EAEP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yybf2YRz; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yybf2YRz"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56899d9bf52so5220256a12.2
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Mar 2024 04:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711364734; x=1711969534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FRILSzvwAIpvZwjiJmtXP3wS29AHppU0XGaszbPtEV8=;
        b=yybf2YRz6BdziJvnzuIzK0mlybWc0quywKx9lFEYwuMGpFGMwwuqd7rGVqTcWiCUW3
         u5Kf50ZmAXMWjZ+GVzGk7heO5znoRwDrB6jvIcukzzUm1eWgU/RVzCjnJRZpXBPLjo43
         CbKYaS4g1qIH+LPfFB38T6MPWDJbOo4WmrVcnpSb/pIB+LM7ftlKQxhZbjK6zezpxki1
         7QjLFn6ob9ipuRMF1uSgmuzp1bi2pqdlYVKXrfX+BqC3/qy0OfUiQfbvkVC2H6BEvZ7e
         v9aU1GJeto8AgaSTqYR1GBG2achbjMQBRMacmqkej2SVzjOfSuomr/GiDtspIxppE8gD
         f3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711364734; x=1711969534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRILSzvwAIpvZwjiJmtXP3wS29AHppU0XGaszbPtEV8=;
        b=ASpptgnkyuohZUYMkfBDw+r/a7YWbLDXGXQ5v896M+B95rQLN8Kzr6A2onH/Tvd8Gt
         D0sMS6fnQGaltcYGqb8X9EVsnJWLN9b3hwQR3c40lVC+dv7WMZhUbOsSzd+r6EN3dLZp
         9hZXqBpJC5l/jCVZLUN+Dkpk8DxIWE6paM+alow+DhG+R7/ER3tGKTZELzGJm0j7gxDz
         x8J9uJJ0CKtKDVvas1498/IxUzOtqMgO81P/uURRGnEmpUNlNWOC5MokbXCA5h+eOrAT
         WYa0RAMZ1XXiastm9bGBkh7jub2kr2vysWyuTu5fr+jrMDcojEu+xVk/g2ABFrXEAcEd
         TQFA==
X-Forwarded-Encrypted: i=1; AJvYcCXWCslFqvgwakz0c7aFQ+eh+3l41PKxwGAvB6JNZNA+Mle9XbH19IOQOECqCGmT+jHMVcbjoTX9F+ZAqRqWIa6p5GOGKlva8E6CWQ4=
X-Gm-Message-State: AOJu0YyFuaAr7bR/i5X/7wGPkHyKHdoApc59KERmRFlflB88NrzyFyjR
	JucEBw2JrRGoS++vtJGsXuY+IJexzu11xBRsf5Bi+ZQoGsQ4+GCd/dw8YDYVF+0=
X-Google-Smtp-Source: AGHT+IEhtdf7x6x6qjqq4K75Nxdbj/nJMl44w91CE9A41I8PB9hLaFhw4s15oV2TjS9l0ZLDyPjoIA==
X-Received: by 2002:a17:906:40ca:b0:a47:206b:5951 with SMTP id a10-20020a17090640ca00b00a47206b5951mr4770720ejk.59.1711364733579;
        Mon, 25 Mar 2024 04:05:33 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id m3-20020a1709061ec300b00a449026672esm2901792ejj.81.2024.03.25.04.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 04:05:33 -0700 (PDT)
Date: Mon, 25 Mar 2024 14:05:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Jonathan.Cameron@huawei.com, Laurent.pinchart@ideasonboard.com,
	airlied@gmail.com, andrzej.hajda@intel.com, arm@kernel.org,
	arnd@arndb.de, bamv2005@gmail.com, brgl@bgdev.pl, daniel@ffwll.ch,
	davem@davemloft.net, dianders@chromium.org,
	dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
	gaurav.jain@nxp.com, gregory.clement@bootlin.com,
	hdegoede@redhat.com, herbert@gondor.apana.org.au,
	horia.geanta@nxp.com, james.clark@arm.com, james@equiv.tech,
	jdelvare@suse.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
	linus.walleij@linaro.org, linux-crypto@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@roeck-us.net,
	maarten.lankhorst@linux.intel.com, mazziesaccount@gmail.com,
	mripard@kernel.org, naresh.solanki@9elements.com,
	neil.armstrong@linaro.org, pankaj.gupta@nxp.com,
	patrick.rudolph@9elements.com, rfoss@kernel.org, soc@kernel.org,
	tzimmermann@suse.de
Subject: Re: [PATCH v5 08/11] devm-helpers: Add resource managed version of
 debugfs directory create function
Message-ID: <486947a7-98fc-4884-a5fd-354677fa66ce@moroto.mountain>
References: <20240323164359.21642-1-kabel@kernel.org>
 <20240323164359.21642-9-kabel__6885.49310886941$1711212291$gmane$org@kernel.org>
 <f7c64a5a-2abc-4b7e-95db-7ca57b5427c0@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7c64a5a-2abc-4b7e-95db-7ca57b5427c0@wanadoo.fr>

On Sat, Mar 23, 2024 at 10:10:40PM +0100, Christophe JAILLET wrote:
> >   static int pvt_ts_dbgfs_create(struct pvt_device *pvt, struct device *dev)
> >   {
> > -	pvt->dbgfs_dir = debugfs_create_dir(dev_name(dev), NULL);
> > +	pvt->dbgfs_dir = devm_debugfs_create_dir(dev, dev_name(dev), NULL);
> > +	if (IS_ERR(pvt->dbgfs_dir))
> > +		return PTR_ERR(pvt->dbgfs_dir);
> 
> Not sure if the test and error handling should be added here.

Yep.  debugfs_create_dir() is not supposed to be checked here.  It
breaks the driver if CONFIG_DEBUGFS is disabled.  I have written a blog
about this:

https://staticthinking.wordpress.com/2023/07/24/debugfs-functions-are-not-supposed-to-be-checked/

regards,
dan carpenter

