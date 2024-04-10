Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C41C1E878
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Apr 2024 15:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712762261; cv=none; b=O15IQOMw8Xavu4I4RJgkouJaZDwItnQOiPkVDYtl8JiEiilZBQ0W2AOXadR677M3e6mM1CFF34TwbGWaGAFmWtVqINUaDiVZs0Z8xIsobP3JHt+/hGwgaW0GwpBNC+3z8eDMXTmrxlQsAlSPOsrNwzg08d3nOgRboceR+j1SW6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712762261; c=relaxed/simple;
	bh=szyCn1R8feTb56BdY3JnMBAKk7urYF2Fah0x9uGZUhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IG8hqkX3bW1jGWnx0dmlbzIlIehQ+4+5fO1w7CeeYFz3pFug6mKTS3eyLdvD/kLlSyG9FGcto3mqAKbQSG3ocxN6gLHC7RUEn3emtcpw2dtu1hWtpybew0SjracJ2X8etk79yPPSnBNpcnXppdbVER2ooBmvH8wiXIfM4YPHyLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lgbk8EoI; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lgbk8EoI"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ecf1bb7f38so4677453b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Apr 2024 08:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712762259; x=1713367059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSiMlbZG0fMpmx71qYTXcLiV/9wr5mjT5DktD/IaIvM=;
        b=Lgbk8EoIcnxUVNO0S91r+75X0n3O37Oj8hZA5pYU/uMUHwqCI+6qRdsZNGLgURX7TS
         JCHgITHEVHgs2CE0IQAffJurlFhqV1l99e/OsnU8mns5CRgi9gg7laVeW41kYVSypZKq
         brDa7svidcmzdbMf9y/1fs8W0+vuPPABKha00I8w35JUy4BzpvC3fGb3cwTsw3V4SJsC
         0hPndweYu7f30AqW9F3SFQMtuSZlrrP9DrUswAAMaxHZljZzQY5MZghfTHDlChRbymd1
         fqwSxygC5f/IrjVnR+l4noMhjJwCQm83YLHzzQtseFYeLqlKCmpyrx7r65BMPAGRWrw5
         dOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712762259; x=1713367059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSiMlbZG0fMpmx71qYTXcLiV/9wr5mjT5DktD/IaIvM=;
        b=kooKs4Tw+Q8aroCtOnPwc+ox/n6U/Ip7xd6Oao9cSToNckj+sXfE5H3px1PU3EVbMb
         Dy4SZo+jACCXi6Xt55lNeFHZesRj49RoO13L0/NopEG5OJyCFnU9lHVlcGkcIkFqffwK
         yC8egbmdgb4xQ67zR5a1ShG6nohCpdAF41kaNqkSpubXcFUNy4pcSYrXif406CFycPfQ
         1VXSKQJ0kyAqGUeVQcoYCPBYeTM8d5hWFzhB06b0ptg+ogN6WC/bSa/6V4XoceKBjJZD
         Hwsm2NpLD06z6jrPC85E3LSHQIXBl9jNLPOrRCs3W1342BIR5VwPKdz4V2Tp7AW9LylP
         Cwwg==
X-Forwarded-Encrypted: i=1; AJvYcCUP10dy5Cs3x+2zVuoYlY3uuS5tPYWmeHBlmHwYxJ0iiDJSm8PINR4uo7dgGXExQobsvi68aPxGHv6MjfejePHGMArUigHbwXtlQFM=
X-Gm-Message-State: AOJu0Ywlo65z0E7a/zL55009cso8A/WVb0cSUs3tXL+macC5c+GhLmcP
	isjTlR51pqeR+EvYrrkqhSCNJtoCzA85fPr77kplmgP6CrCpkD/i
X-Google-Smtp-Source: AGHT+IGiOQW2yeieBNBKnkq1K61ep1Vp1guqxkEgvx8/+8BoC8m9Bz151+8wnvLRXMInQv6XGdRong==
X-Received: by 2002:a05:6a20:96c8:b0:1a9:2365:ea2a with SMTP id hq8-20020a056a2096c800b001a92365ea2amr3186777pzc.43.1712762259399;
        Wed, 10 Apr 2024 08:17:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id gu11-20020a056a004e4b00b006e6cc93381esm10197996pfb.125.2024.04.10.08.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 08:17:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Apr 2024 08:17:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Crawford <frank@crawford.emu.id.au>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 3/4] hwmon (it87): Test for chipset before entering
 configuration mode
Message-ID: <0773b784-e552-4b31-b8c7-d68e058a2290@roeck-us.net>
References: <20240401025620.205068-1-frank@crawford.emu.id.au>
 <20240401025620.205068-4-frank@crawford.emu.id.au>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240401025620.205068-4-frank@crawford.emu.id.au>

On Mon, Apr 01, 2024 at 01:56:05PM +1100, Frank Crawford wrote:
> Major part of the change for the new method to avoid chipset issues.
> 
> Perform an intial test if the chip ID can be read without entering
> configuration mode, if so, do not enter configuration mode and continue
> as is.
> 
> If chip ID cannot be read, enter configuration mode, and continue with
> previous code.
> 
> Also update exit code to take account of if we entered configuration
> mode or not.
> 

You describe the changes, but you don't describe the problem you are
trying to solve. Even if configuration mode was already entered, that
is not a reason to keep it active. We don't _know_ what is going on
outside the driver and can not make assumptions. For changes like this
you really need to explain the problem you are trying to solve, and the
reasoning behind the changes. Just assuming that a set of chips would
have its SIO mode enabled by the BIOS is just wrong. We don't know
what if anything the BIOS is doing.

Guenter
