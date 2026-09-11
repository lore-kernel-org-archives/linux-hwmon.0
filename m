Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11AD246BCD
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 00:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088238; cv=none; b=lHZhc65SAKFSNnkdwtcVmt8OlW+TZz81EVu4uJeWFxDN5KgwdS5Odg47qUkpUOqmUd0g12zFV+sPz0O5xN9qmWYXcHd3yirb8RbcpzeD7t+qbY3ULEnDc99pirGh7Wed790TkA83lQMMy+XWMwU2aQuJBOasPwsZvB3c/FceGqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088238; c=relaxed/simple;
	bh=JUap5E1DZl/YpLqiDruLb48iQ9UveYL5LspTg9y09LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9be0bU2H9EAkcAWtroZaPbbWq5JxU+YFMVXLPelbR+QfRi52oGaHGqZAGbg/F66ECd/gSBUVH3lEXe+LVZTSw5XuVptyzh5x4KYPKLsgNJ87iN9sXG8FjrHMRzsUXJKk68iQaaLrNvEvpJkWg5IGE9BhlI9iIx11nhN6mlXib0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSKf/ZXf; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSKf/ZXf"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso353824a91.3
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 17:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088237; x=1789693037; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cBCSAfSzWr7/938AC/KnuRa92ipR1b0xd/LyHiEtjPw=;
        b=FSKf/ZXfqheJSTCn1GFfRM5IrYuikHGr2lFr0V9bN636wS0mQeDfUsLT1akfiFMTww
         YTp+rmZLxAk5y2CfDsmYqxmAU9St/fZtwWvBfMLQE8JiO2EcwpKu8fAi1bJVa8KXvIxe
         5sEMLSh7u3AGtmmmoVEI8tvkd3l3ReYx7w1etPUrMy0XfcsQXkCscXRoLsGz6Q5PGeCu
         r6eAYvZZU8X4KpFXXt6qUOZNCiVFH/oxP9UC24Qy6xOcqJGyCysGfK1CzJ/KBPqKhmvv
         rFPoZcyEIfMyuEDlxqXa/b/Uhvu4QkRCmB05Jw18PvrMIxTG1F6SQVs3mRSBAr3O2/u7
         lFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088237; x=1789693037;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBCSAfSzWr7/938AC/KnuRa92ipR1b0xd/LyHiEtjPw=;
        b=snSe5fTOk+zRjkPph25eZP1euHV2ghdGt7CLVEbAybxVOff+EBTELZeyL7Q6BiJaMa
         FN6dsiOZKmLj8LOXPdKJqgsgzQc3bbaBhSghkdPi2hD/qnyWKW+wcmD+/xiXP2WvEnYp
         BwiH+PA5j5qwU2BnD1Yth+F53+BtyIlhT3mZ+sms1DyL4+xLPGO/mOEr0WJgCLANHExU
         fiXN8uHAaHtKO1tpmuOYwxKHKUkPduKAuK1wdxs7PET3qtOvSnbx/nSpy45AYG6glqfu
         zMNyS7wbB7ZWIqfYPgFxUjCzufvsEfZEvAr+XEWrDh9TlREIYBAymAEucBQhhQIIKD2z
         nrgQ==
X-Gm-Message-State: AFuF++mVVi6D7bftPJo/io7Yxmv/IW0OhOKr4qopCe5R3OzPROe7cBdA
	umnNakr9VLKV3RfLXbTiUgxkUCNzDrHA+gzHKDPOtm9ofMkoLAp2fIh2
X-Gm-Gg: AYBFou2D0qipVRSiOlkyyIQvVC4p5ym6oBingC6QeVe6n+yBmRtpKLqBVNViOKeN9k2
	Fy6V27T306Swh8r3bOEu1VjMO+dYmW0KSzFAFzahOEgns9pvBlGFaxAtukx+o4t75UVzzw4Z85Q
	Ehca5D3k697PtriWgJOO4/xCdzVtZLDmNK4m545aHfod1SuOiOQHvg9WGTLVia9+GCeZ6szPuAO
	9TgH9ZRzTTq09mri8PQ2lAdFNOq621kZGSqL8yrhg5+WjXe7Bzc4tBLBUvMT2SMTZ1vooHPQ+KJ
	3Xj6Z/5AbicXO2dxhKMUh0UvuVmixXyANUqOXRAPmV2F/OQZjLO15/B8WPFIGOX6OwdBDHsHsTL
	llsfmA98DfbkkKXYyquZyEnzkfS3bxlq2COGcmHfc9+Ko4KbUC/IhaF3064zjHWqMUE2SOAW0qe
	fcfUzLYM9jGOYOi+ZDzy7iF6pdFGpbXZtuTHC09i+uOfDAa+7jneog3agiLDgY06GW46vpKpp2l
	Vs/umfXPtu6
X-Received: by 2002:a17:90b:280e:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-39d9beb7248mr2122288a91.11.1789088236998;
        Thu, 10 Sep 2026 17:57:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e5193dsm1685575eec.10.2026.09.10.17.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:57:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 17:57:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>
Cc: linux-hwmon@vger.kernel.org, linux@weissschuh.net,
	arctic.it.hk@arctic.de, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: arctic_fan_controller: use shared maintainer
 address
Message-ID: <60123bbf-6611-407f-8f7d-89eb99f29a0e@roeck-us.net>
References: <20260910050401.279868-1-aureo.serrano@arctic.de>
 <20260910050401.279868-4-aureo.serrano@arctic.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910050401.279868-4-aureo.serrano@arctic.de>

On Thu, Sep 10, 2026 at 01:04:01PM +0800, Aureo Serrano de Souza wrote:
> Route driver maintenance mail to the shared ARCTIC (HK) alias instead
> of a personal mailbox.
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>

Applied.

Thanks,
Guenter
