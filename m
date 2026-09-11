Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C584457D5
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 19:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154290; cv=none; b=t5IVkeTg9A36AdC6E3HkC+64H3gxTVNK3eEwwQF1/xLs7BzXl1NoN+Pb5+Uolv/GFJhdIxr71datRKgkpPWgIE89RskjF5u3cvUQ5BQcX7sEYbysxSD9VYxzC/bIdpGpyIbYrku8w+5xPLJAktjVkFPNjxBvhXA48T/ppTSWplU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154290; c=relaxed/simple;
	bh=GavbH/nr5dcl+tzw53fPPEhoAOTJmDbERpgNBFQTspA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAbpFkuJiH2zKqQa0/dSUArK0yMAMh/Pl6flfLPmB7dCgInJvx9aIkK6UGBwXCNv1M47IlpKnLlNZXFwkFBK601GyfzeCfCwWvLZDl+K0D8kACmjPxBv8sv0TlviS9jLYxpxPLIpQcxTioY+TvIK6mQTeePNIOMHR8MAm+u7sGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgjVbOvO; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgjVbOvO"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d28035so108064b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 12:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789154283; x=1789759083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4cXYdYuE+SXr6nDr813a3S+QySsKwkl7f+bdQgb7a1o=;
        b=CgjVbOvOfqLCyl/azVTmVXEcLMwN2Tnk0WtYm6aRDEIFeG3nQfxaQh3Z1nsN8fzAs0
         81hG1NdN2p1s0k9L4OKbQGACktOebG/79ppEKjWKgZBF5pyjxZxG4EvaTMIkfIBhcJ6p
         sbvF9Oj49NXaqp2dHntboPhtvJN8ehrHlOelClQSqpHSzKutg9QXOGfhutyr+XYUNu+B
         dVRtbxjPYxK0smL1ETIvZNkX+Mj/tlJo+hVJ3u6yRHGUrTwMoARhNglZRlJ89/pFD5g5
         unPzLkFY5zCgzC7o1vALgBde18Hh7ygsh/cbZ0buMT1yXlZR3OuuR5ofryJ9NmrlUCje
         kWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154283; x=1789759083;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4cXYdYuE+SXr6nDr813a3S+QySsKwkl7f+bdQgb7a1o=;
        b=Q0vGd7lEne3i4BrP+y3Dr+iUHcOz+/r+3drRh5yTqAzj4tXo/HJ4VjSgE1kcVMw3YZ
         kCgxpTL8hS8mY21GOPYBY5ZHoBxj6yrpVvhxF5x8CGENvESk91wFMKPonAnmEs5RHIOV
         ebW2GihcmduPPtpNKTdOJ/ffy8bJ9s5crn8uvwBGR7zIxFqgLrstBxsantQdqkdFFkIx
         Am2h7Y5GMET0iCLFLqnj7GdlaDag+ot+YUhImqNLf/j1mw6y8ho0sfO1DvfuuP+hmq8G
         eNU3/3Z2/aX0lA1KS77YtZrMcDUI2S67a9U5eDwlxQp3aAhUUKvp1sUgz9GSx/HDoB7F
         VGgQ==
X-Forwarded-Encrypted: i=1; AKwUvByPjKvk09LrnaFY8krB/4Ro/TiyFJSlvjQNFR64SvMKa1On+n2lcsEdJPl4l7Vsf2+xnZ8cfIR91INAIA==@vger.kernel.org
X-Gm-Message-State: AFuF++lKfuPT6zfqAKXyYeRDiXtU2TV5c+KFThJaFjB5b2/uazv/Uplz
	/sdZPGJEu4AyfBDoI67wkeXl2umAVZTlUxiet3RoKLmmDkdr0RgXnKSY
X-Gm-Gg: AYBFou2LTLwPF5qbS6ebTLBgsCC6yTZZslDRgBFmYa4q9MaD88IiYna+n+wsKnmeGiF
	hm+tAof1VMdqqIEb7Dwuy6kEJEM/YYjGMsgyhWwN89W78k0M4URQ+F9Nr91NkfPCcgjlm6860MY
	0CwabuPb8kNRy1+T4oI6ClEqc7ePnl2MPWO9X8DGfQHdU4X11lFoyZj2dXXhFsEyOm0RfmTwQnj
	WYrLARxiyrT4tzAYn+CL+L7Y6753v4w3AG3rkWTV1dzrCfSUHDfFfTdiNXP5d4/9e70Vsjlad66
	CWrsjKiPDHHhL6VZtNONZb9sypG+peuBcP9bMu2JVVatjyTSo/N44c9RVIpm+CkyAXtwjAQfCUS
	OOdcmvG6oFdssWP16tthPwWHb3y9i3tUl9wOjdkL4mAR49+DRIXKC+s6wdRvdXtKkupUplgYI7K
	PetQrjDnGGgTgE2+q1AlIUvOdZiLRFSA36RrlX9uZNCaO8vmWn1gC6KPmZaXGCru6obwRr3LsGf
	qFjTwlhXoNu
X-Received: by 2002:a05:6a00:ae19:b0:86b:4366:b5ab with SMTP id d2e1a72fcca58-86b4366b78emr4472376b3a.9.1789154282668;
        Fri, 11 Sep 2026 12:18:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b291c1601sm1616392b3a.31.2026.09.11.12.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:18:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 11 Sep 2026 12:18:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Werner Gartner <Werner.Gartner@congatec.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (cgbc-hwmon): Add some sensors
Message-ID: <1fea779c-454d-4afc-bf9e-10e5236f1d21@roeck-us.net>
References: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-0-0c6bf078d173@bootlin.com>
 <20260911-cgbc-hwmon-fix-and-new-sensors-v2-2-0c6bf078d173@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-2-0c6bf078d173@bootlin.com>

On Fri, Sep 11, 2026 at 07:31:59PM +0200, Thomas Richard (congatec GmbH) wrote:
> Add the following sensors:
> - Alternate Board Temperature (temp11_input)
> - Top DIMM 1-7 Temperature (temp12_input to temp18_input)
> - Bottom DIMM 1 Temperature (temp19_input)
> - 12V Standby Voltage (in14_input)
> 
> This fixes the following warning on conga-SA7:
> 
>   Board Controller returned an unknown sensor (bc_type=1, bc_id=11), ignore it
> 
> Also update existing labels to match Congatec documentation.
> 
> Cc: stable@kernel.org
> Fixes: 08ebc9def79f ("hwmon: Add Congatec Board Controller monitoring driver")
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Applied.

Thanks,
Guenter
