Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB51347C7
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 14:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758724700; cv=none; b=GZOjANq5y3Zalr+TyP2aO5F23u4TKh5YTOqJ+/2sndSA3/yPWUOepzFZhV+sbLQUUIiK8YebXwezDCMPeWNXk0FzqpqhYRVUGTyjWf9xmV0auPXDWseJgd9A6I8K/9D8C5ZCxYAkjaAijLAKZIHnBNGNn4Mw+QmZwv2tZnz6p+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758724700; c=relaxed/simple;
	bh=z4kOzNKrt1YHasVRJGOjxknq262Dt5Qz+bhd7P3hKW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ga2ZR2PVGQHESE+9haq3w1TN5T+L9jhD76z06VwlPMj7rC39IC3SJ//Xun6LNK2wo/qfN++2UWgLZ1rYiTUGWA/SmSqMoOLeGQoyFGoOrtxixLpuUxTiMbCNVqqmmlO/b2FUbssccofViPP1I8nSzLM0AGYefxEegUvhQbFVYgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUBiMUp8; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUBiMUp8"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b551350adfaso5669989a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758724697; x=1759329497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7FKs+A770otT1hMK/+muE0W9EUNGUj8tGucYnsoqh3w=;
        b=OUBiMUp8eU8cP4tTldTSDz8HaBnzEjFkVN5VM6444aVpCHpyGZ8K0NEsDoRY3vW41R
         HnqXg4OMxuhYwta0IvDhMvA6cBXPoiFp75dEbby26G/m4ipXoBytvbs7WtyxkP0bPQDG
         l+CSmjNQ+co03g1SPLU5moDmqgdNVXiRuSbRxMOxlMosgvBgkJ6Yo24TQnE1C4EClAdY
         CLanv925t+TqJdyfMMQqoe7YHcAX2ZpaDx/aekzRgSMyY3OH01d+MmfhEzpzGpiWosCN
         i+lSzciJF1iESeY9shTKM+7CuDkT0w0ZiNwJmqu7aYv47AXiwUA9skGh6zVgE5jEqyu3
         PVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758724697; x=1759329497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7FKs+A770otT1hMK/+muE0W9EUNGUj8tGucYnsoqh3w=;
        b=X1AB0jy8y9lehqXFb2YEBkKFE7FuuqE6fEqi5NyrJX+TiULkyxgi0BBgEzOCRsDB00
         EoinKpBPIvKTd97k7dZx2IaBDP3tAwEf+EGJ78aWkQUNTVX1XLnAQDD1uJ2hWKMlSanG
         dit3DDQu1ZSEzIL4Ii3Rgdx8/nsCgDA4hbbXu+dctp2fPg5/cv5GTnu88lCbYYi7YrNr
         vwvrYKBjFPU5xTnoSvGwwqjX/0Due11FJWa0mHiYw4tcdUNwuPb+lLhDHaitrDyRgoo9
         gE+nc64dyExQKhBlZ86ZmECXUcl06QuRunLBOPESbyf7M7UrJ9jlObCo6PUPDo59xZ2g
         9pog==
X-Forwarded-Encrypted: i=1; AJvYcCU3SwYkRuH0iJ2+6SGnlr9uV+3yCQu3L8FrBsfr9YhEnVD6YnloXMAuZoAa1nCEcKqG7/i55og4Wa/OzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzs7hvjv8A+up0zf+dxMKK7alGdc2eylTc8s8nXhzG3BkySODD
	NEl3KMseT0wBXn14t/fhlCxAyqzEvnVorQVd3MOZp+1pD9KAecGgzyu0
X-Gm-Gg: ASbGncuN6y9y7FeUlZQYl8Mies5PILSRXR+aIQJmqapoqPnJ/EtZ++VCplLtrR5Daar
	bCq8zwHmmyngrHcmKfLFbjby0Ss39pl92ckdQe/dWKZaLLZtoltgQj0W9zqtfFNlpMux7heMH4G
	pYBibbVSJTkaThAkNUnma4ZPpIgsMKtEDtvUZ6aSuYkp74BWfCdRLaMtmVlx41U/bsATdF5TLEe
	K4+G/tuLYooCJmiFwozoDW7c2t0h88hq+8epDycqsfmz1MSwrQcUMigN9aav/KsF7DUFBqGRtDB
	UPpKD2rptcc1jT3bGIDTGrYpqfFEMPPKfvxa5NbboGo2gPLR6twqvlkDdnaACO4SxLjmtINwOCM
	A6zw8Zok6lrN54d/TR53m2XksHS2nP676GVc=
X-Google-Smtp-Source: AGHT+IFnWLOdHL6EKD5bcnYki0oGZdxMqsJkwwvFoAddBVqOFVNBl9Ak/lLPOlpJgM6fEJ+dHVv4Pg==
X-Received: by 2002:a17:902:f549:b0:24b:62ef:9d38 with SMTP id d9443c01a7336-27cc34502b6mr74638195ad.19.1758724697443;
        Wed, 24 Sep 2025 07:38:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800531a0sm194313035ad.16.2025.09.24.07.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:38:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:38:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, cosmo.chou@quantatw.com
Subject: Re: [PATCH 2/2] hwmon: (pmbus/mp5990) add support for MP5998
Message-ID: <a3658e9c-6039-4591-9ccf-c429bd900803@roeck-us.net>
References: <20250916095026.800164-1-chou.cosmo@gmail.com>
 <20250916095026.800164-2-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916095026.800164-2-chou.cosmo@gmail.com>

On Tue, Sep 16, 2025 at 05:50:26PM +0800, Cosmo Chou wrote:
> Add support for the MPS MP5998 hot-swap controller. Like MP5990, MP5998
> uses EFUSE_CFG (0xC4) bit 9 to indicate linear/direct data format.
> 
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>

Applied.

Guenter
