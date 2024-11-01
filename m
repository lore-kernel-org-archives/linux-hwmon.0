Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074E71BF24;
	Fri,  1 Nov 2024 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730471305; cv=none; b=ZeLqPxsBc4K6LTf1oJd5f/mvWTHlznUd2UTRo8+Nf/S7NdlunXAWMZl+GlgJL4PmVLGffdmU5lx5EsdVX3tRDOpei4IBSMedyqvGHk/OI5V8o291ZNFpZuB0TE12TashYjNsPLHr6+Um94AUf0D1pXQT+con6DZU7CkwBzp4y4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730471305; c=relaxed/simple;
	bh=JJOTGDsJTC0/vFf6QQmSD03I7QVCGkcddc1fNIPBBH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrdMSRWqAAOmZf/9hnPmtra4cGIqGJ1xx96nrFBrVp5sKxQZ6xEQt9i15La7YOd5JxgSM8ilHFe14SuhdqVtsB7EluHXKNzqu8J2xObUw5UoVJtDf4w53lMpAId9VyTBbbs+F8u46PSJtK+VzzgU1NyLIE82sh97w2vVK4uOxb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPk/nBfp; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPk/nBfp"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-72061bfec2dso1727601b3a.2;
        Fri, 01 Nov 2024 07:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730471303; x=1731076103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFmWdX7p8UW/OnDmfSeyrMc2Et7zZ5YN9L5u0UlMjL4=;
        b=bPk/nBfpLMykXFWTgMERGo95Atv5Qj+dXHY/grWNqlNQz0smNsCp2dceVmrx3BZPcc
         qo1YcuPSU+LG4OrlGSJqeHShgE6aSu+MNuzzq8BX2Zu1yC2nqQtP9OM0bzmJnpbHa8rq
         wz5+lm309GgkwnbhSVEjBI4v8RNcQGQe3efTjoWhBbT/fQq2QIMzQI+ZQZjUP3nXkCFL
         cobmTVKrt5zxMuFpanxnoA9p9x05gt6I5cX8GJZENYAlOTpmA5wqZVhJeis7jijhP6+p
         zk21xRMu80s91V9aLzFgGaBOJ1i6DnEnLIbh5eDXlLcFrK6j7UDXz8Dsx9GDy9gpA0ph
         4X5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730471303; x=1731076103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFmWdX7p8UW/OnDmfSeyrMc2Et7zZ5YN9L5u0UlMjL4=;
        b=S46sJPDRs+OVfv1hRrM1XwFsJ2u6IUQdvXhEuP2UagkUE2T+JBXMHYURO/oKFWUjFh
         hqHR+9jJhpMn7SJhH1EJCAtJofOKm2P5HZCV1sIcp38woTL+NDbJduPkU+eNjvDBqfse
         ONjmMOQJUkg3BSCWxkjR35YXoef/GDPmhGiRcyRbgOrAgY6UY50AaVlW0bt3TR+k0FlY
         7T1Y+2jG1OChVCvqzjSh0TRm2JR0Ye+oUV7K51+Os0kaxZjM3A80Kl+mhefoTVSggkGV
         bSg/s955kY9F7P/lsz5RZyqWwu0OYi4hbB+84OQh3gAn9X64lTbK2ZOkyuGbozlXxxOt
         oz2w==
X-Forwarded-Encrypted: i=1; AJvYcCUCFAyVTNEVgIzfbkArW+Xez53fp6cXIGxn+IKOZjqAgrsMAcl3m7KuJy3NlWB01OibCkKl8reOuypA@vger.kernel.org, AJvYcCUSSSSDHvz0dJf16IXOS2w/Uns7tr1w47SzF43Dd1oPx8rDvY6sRnzdVSftn3TCCpZ+iOMYZBNjdN2V@vger.kernel.org, AJvYcCUh08XUZKQ3rWBzD/EIXx9vjovZ0A/7utOp/iJe7qmSpcs8b4vh2erOHVcdVUvUMD6LMA1yWo8EEPSiAwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUf808w7z25yy6Qk+x9TLry22HcMRbL1Jmp4Qu08iIenqDoYjG
	L48KM9WwFYqkD/vnG0flkNJ7pJ9z85YlGLcm9UrK1sZ9q+cqC3pUFqQ4+w==
X-Google-Smtp-Source: AGHT+IGRzSa7VeVFuEmHm5dbtnCna16zr18z8jeBGaFurcodmaam2po6f5ay80Mki0j25xDwKrhtng==
X-Received: by 2002:a05:6a00:2e15:b0:71d:eb7d:20e4 with SMTP id d2e1a72fcca58-720c98d0527mr5231224b3a.8.1730471302963;
        Fri, 01 Nov 2024 07:28:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc20f64asm2784783b3a.96.2024.11.01.07.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 07:28:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 1 Nov 2024 07:28:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Grant Peltier <grantpeltier93@gmail.com>
Cc: robh@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 2/2] dt-bindings: hwmon: isl68137: add bindings to
 support voltage dividers
Message-ID: <8feb1581-4c0b-40fa-8aa4-8c2691921125@roeck-us.net>
References: <cover.1730326915.git.grantpeltier93@gmail.com>
 <1dff1f63a2e122788e2c17f192472705491aa5b8.1730326916.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dff1f63a2e122788e2c17f192472705491aa5b8.1730326916.git.grantpeltier93@gmail.com>

On Wed, Oct 30, 2024 at 05:41:39PM -0500, Grant Peltier wrote:
> Add devicetree bindings to support declaring optional voltage dividers to
> the rail outputs of supported digital multiphase regulators. Some
> applications require Vout to exceed the voltage range that the Vsense pin
> can detect. This binding definition allows users to define the
> characteristics of a voltage divider placed between Vout and the Vsense
> pin for any rail powered by the device.
> 
> These bindings copy the vout-voltage-divider property defined in the
> maxim,max20730 bindings schema since it is the best fit for the use case
> of scaling hwmon PMBus telemetry. The generic voltage-divider property
> used by many iio drivers was determined to be a poor fit because that
> schema is tied directly to iio for the purpose of scaling io-channel
> voltages and the isl68137 driver is not an iio driver.
> 
> Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
