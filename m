Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC19332612
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 20:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782765354; cv=none; b=bv/lvrFhvzBpv6Zmhb6ctuUPUQxbGmoiCFR3j92ws6atQmFTc4pg6zmTxRiogM24maRH2Xv7Xt7kn+Vk+mFRCdr/Gzj/KmyDNoJc6uJa8SyMC2EZYRV2ZLsb+DuPjbf0lT2mB38/X70YqmYVnxVikSEVjT+FQHP0ku1H+ysLEts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782765354; c=relaxed/simple;
	bh=GCkRijoG9BNGbYpuyEvzcF76JMbdLKs8xL0i85od9YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdrUcVoMT2Iu0KkDcpCJO42GBSaLaqp66IAAuly9AH2WCLVpTj4EM//+E0isgc9DCXo/zU4gHeidHRdQiYhXqCntjV35Uf027WQBbx08+t/6Aiu17nMe+xLJ/wp/VXSbf4Mvs0tzXydcmE8f3Ou9+YScCyb7+MsaJ8yvneWhdkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwRLG+5y; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwRLG+5y"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-13b2b92b0bfso23439c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 13:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782765352; x=1783370152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUL654ezc/90NPCUZ/g4JqvtVBcPucQUCRqJ7rGnxFE=;
        b=UwRLG+5yVfhPcGqPRdBRIMmXk6kmT8shTMm5WKMlgW7ePZuWwelSGPLJ/h8puxuIjg
         zccnSsmrvmQOjW1ICcy4HkiD3MC4ZejVHxDFD9BhHmi4lr2VnDxudzgcZlypSNo8Py/X
         oFW/1kBDsNkWx0aZqsUPz6DOCRiK5gRZXbagNOjPOxq3W85vf3OFJEKEO5+PpjgIADkx
         zfppDnuiGIFmeHuh7UtlRiSgRkuLvmL9bmZrDI2/QCnujS9jSzdt2g5rUMS+4TrDdZ68
         +g2DQ4odz1AHKKAJIYIFAba7+3T8NC+wpdZ64ZqZTON2dgAbNmfBAujymn5dgjlxEYIW
         OiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782765352; x=1783370152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fUL654ezc/90NPCUZ/g4JqvtVBcPucQUCRqJ7rGnxFE=;
        b=rxdGgwu98GEj3EkyfE3Vyw2vV2JMM5fT94ZbuQbLpr7RewwhaHEzy3BwTEkdNCYB5g
         OLiuARKfDzcOZMQZY2Tjqd++dMiuvH4eGj572DPG3fwuWc7CBU1Qaqh+aO+8qSITazct
         Kqxqx57cJwpRyE/e/ONIHBhYcMgLxaynKKwesc4wiJ13v7qMpgzrsTFtBScP568M/2J0
         3ksPhTnq8ksqPktgztEviLxRcb6+bFch4aVHK/7U8eUatxv9jOxL1Lajn3LNxclJengU
         mSo51ihJXalbv9JC6pXy+gDcUdIWIeGEpE0CuVNZyxcY7bXSO399Xkf00gU5YwghYbK2
         h7uQ==
X-Forwarded-Encrypted: i=1; AFNElJ8XEyjJdRMWRcf/R4aG8AneOdqaZ1ZCLf4ZZi7mrJJ7pGXGRj1+r8Em7CBw5PszE8okkyWW2lHrEpK/IA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0BVTBfGQqzUOWPHw2h0mVXXov7VokaDkjZNAl05XObN34/Dtd
	kDx/0DSzoX7o7gC17dlK4F6S3QOp7WpcTLeFRGKKWhYz/lS8cW2NMVen
X-Gm-Gg: AfdE7cmlLT+LO9MdteAkJ3wYVlPOrheM1NeqFp9rjqrBunfnejVgpjiU3eDfkXihZG2
	B6/oA9LRN5Ffz7UCDW2FxlLTr5Mtaapi09duEv5y6BD3bPd6agPgl30XuT9YSP7bomjUJAQGj5Q
	W+PaxnjyFh/FszS3MJLAZA6nlcLrsGeD295NSQr5qyQZBfU7S50iI1zXQRN0rt0+ypdE+1xAgkp
	aOmqat2khOeBAQnuMKThKRES69qNjrdnYFDueGrvLtR1egC5t+VVaeCV6pS2LUNEnRZW4j/fT1T
	vFRGCOPYoquGu08Ka6ZGFF1OSoroW9MeqF41I75dnAkld3dd0Kqn+w/He0zg+p6fRqh4puTtPP5
	WCe05scOXWIJKNwSBw3MWXSb0k13YLIdOo9KHlmRWys6masmkICS/d1A1kzqdNh7dVWgk3QXzaV
	vZOreuiYKJsE4rP07RiPwSVniaDw==
X-Received: by 2002:a05:7022:2389:b0:139:78a4:f57a with SMTP id a92af1059eb24-13b2a1c4ecfmr571385c88.23.1782765352356;
        Mon, 29 Jun 2026 13:35:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab30047sm803621c88.8.2026.06.29.13.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:35:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 13:35:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Alexandru Tachici <alexandru.tachici@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: (max1619) add missing 'select REGMAP' to
 Kconfig
Message-ID: <f1738266-5d64-4e42-8f88-71a9126de021@roeck-us.net>
References: <20260629-add-kconfig-deps-v1-0-8104df929b1a@gmail.com>
 <20260629-add-kconfig-deps-v1-1-8104df929b1a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-add-kconfig-deps-v1-1-8104df929b1a@gmail.com>

On Mon, Jun 29, 2026 at 09:17:39PM +0200, Joshua Crofts wrote:
> The Kconfig entry for the MAX1619 sensor doesn't contain a
> `select REGMAP` parameter, causing build failures if regmap
> isn't selected previously during the build process.
> 
> Fixes: f8016132ce49 ("hwmon: (max1619) Convert to use regmap")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>

Applied.

Thanks,
Guenter
