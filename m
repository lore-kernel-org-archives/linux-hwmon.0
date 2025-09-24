Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F01821D3D2
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 14:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725251; cv=none; b=nJ66fg3AXq7/QU82pyqlXNyOS5zOODO5guy81slKevw8bfcZjSlufWvihinpkwR6VjtOC1el1owUzBkYPx6TVtSAs6wqGlHsZxelE4bN0xua4B/HzgkmJX8eOduWyvM2jByyvJNhb2g2cEuiMNtCno4heYuT0QJJzBc9BNBk2Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725251; c=relaxed/simple;
	bh=AgDrnMXXXJYoDpwAwUvpBn1pSggFOiq/LNM+/BWg5jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=II4mhQM2xd+8Hh+ugdIDxILZcs+wI6fNGUC4oIk4UJLIwETXUUs0vrjxNu9jAxetHLc3qJHhf4zD62IDf3LJx8nYt7MO/VEnh49Q5V9mpX+Mg5z3ES3BIFf+HPSby9f5FfJi8Gs2qDoc6+pMihQkjczBWLGGmFGEdTa4x6KRuNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvkujbXU; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvkujbXU"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7761b83fd01so6614773b3a.3
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 07:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758725250; x=1759330050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuKXuzOjDOxictCX/voBvqBpBAsKrQMGlOEziz1SDD8=;
        b=LvkujbXUSLTMAgY9TUy7P7PDXfgPB0X4TiO6u2qxgoKhnQrbz1VygPkM61Oz9olJkw
         uFfbTd0s8j7Cd69nI+TXslCoZBsFnaWbrHfIOqE3K5XU5JSHcpU1HmrLImPy0Bl+6yzj
         GyTkUo+Lb8OCO3EsRl8uz+kVwfvCOxFuMw5s1xI/W1hm3IfbEbrvPcZysxHU/aCcOnEc
         21aTFs2Rm19+ndOaR+qEl0FJ3FzkZ7pfNDA8REnbWElRxVS7hECaxfrabEQGAT57YAvz
         xDwuufCyZCX7zmHrKLKN6H17AjeqX5jtF82MzJvqy2EF800HODRfRXdkuoV+axOAhJuv
         Z/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725250; x=1759330050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuKXuzOjDOxictCX/voBvqBpBAsKrQMGlOEziz1SDD8=;
        b=I1ONQo1Nr7xQFS61Syq0C1gvw8NdCIbypovqsHbVMTU9S7gPbmrDGcx4RHhZsc7BHk
         45g5RYIYU/Mk1jzxw0gwz94vsk/06VtkKxlxTI9oYqrA8300Xy3KmpLLItx336T3zEEg
         ZzofK77BMwovCh2Hay7EGlC0++GuRgo2DggwskaKzDhwcGOTvzGweQh911EQAcIMdi96
         g6WiGdLXDws4KodnQ9ZySuxAuVzTuW/owIqz52mdjRLuXlzEzm268/mG35IVVYDerGGd
         GsLMVoXRlxyMUfZHe2gBiQ4RENgE9Ik/3PTVzdKo2yvPGAcVo0fanwqmAWmweW85jIOT
         v4pA==
X-Forwarded-Encrypted: i=1; AJvYcCWyaTdDKTTqyHlmelFsg9wi3wWANdFicKgF/uJMOfgWTTSlLDr0kDR+oZOhMetBPN538nOLfTGAH27BSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxek+27zAJwBhVaDp5pQD8/qN8RSOA4H2ODp6edHCqoYBexQYmT
	s/0yfV8VsaEHcvYPGzLsPZOu1lEloEa3kbfByT2JWmd5wmDyFq+Cb9JU
X-Gm-Gg: ASbGncus/5pktqyISEWqo8ZJ9KrbIsw9nZ/jtt7O6c8JD2ICBXdsxXMLWY3FASEioH9
	L92Ej0RejpqfEgBXvrbgoH4rKJjKhizXuYF4h7FFS/kROmtZXAyhR/Mxh1lLGGycCuEwD5QpTeL
	YN4pnZiSlOBW53Hb+Mes51NMNjWdX+5FJuW6BAq/RnfEQzb2rt37G9Bkw6waHpOKyzntgqMSORs
	PLU5ou/vWeC/VsBQei1UC4Iq7Ub/puqjZfYyCt+MJZGR1jVa5KYFSRxKNbD7wL0CEkp5qSXgGi3
	/de5BeD7kY9d4tX7mTLnRfiBE9DEtIGFdIedcXUXYjFuDbweF1I0JCaPu9OdNoUdAvjZlwV+D9L
	XsV5il0OpJjFiQrY3q0xWLUf6YklRlSXUf0s=
X-Google-Smtp-Source: AGHT+IFFBGlyzzgM0DUwXPrRh1qzXutsF069Qhxcx79xZS73ltfaw+2FZsIv8SJjT1C/iB/wc44oeA==
X-Received: by 2002:a05:6a00:9a5:b0:780:f6db:b1af with SMTP id d2e1a72fcca58-780fcea2fb2mr222078b3a.16.1758725249706;
        Wed, 24 Sep 2025 07:47:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f52c4e905sm5563011b3a.18.2025.09.24.07.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:47:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:47:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pali@kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] hwmon: (dell-smm) Move clamping of fan speed out of
 i8k_set_fan()
Message-ID: <964da8dd-449f-42bb-90df-5ecf4b2d1e32@roeck-us.net>
References: <20250917181036.10972-1-W_Armin@gmx.de>
 <20250917181036.10972-3-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917181036.10972-3-W_Armin@gmx.de>

On Wed, Sep 17, 2025 at 08:10:34PM +0200, Armin Wolf wrote:
> Currently i8k_set_fan() clamps the fan speed before performing the
> SMM call to ensure that the speed is not negative and not greater than
> i8k_fan_max. This however is mostly unnecessary as the hwmon and
> thermal interfaces alread ensure this. Only the legacy ioctl interface
> does not ensure that the fan speed passed to i8k_set_fan() does meet
> the above criteria.
> 
> Move the clamping out of i8k_set_fan() and into the legacy ioctl
> handler to prepare for future changes.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Guenter
