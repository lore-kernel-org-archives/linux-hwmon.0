Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270AE17E900;
	Wed,  8 Jan 2025 16:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736355591; cv=none; b=ZKqwntJG7AZuGRORWbQFPw2SSljytixBxjPiHbEpGzg2GkyegLCIp2HYP/RGDyaMwRxt/l7UphabN8yIofGlOORr7BdfZLarbfFcsJnH59xqWDXD3ITO94Sn82HVE6lib86K2nR2PZr/s2EiMTgKvM8+btwqvIU4iTcEotYxl4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736355591; c=relaxed/simple;
	bh=JqPedtS4bBqDNnepHzyCUSb9YvSVk85EsIqDKP/NF1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdemjRVrwHZgMnuay3xAW3jOv2srpJ/T6c+guguGBcjPgB9X3SLH3WhFzX9cc1O+u30HvlDcbyy783dEhkHcQqhIRPVwmjrJl4xusxzfCCws0oicjoGxv6OPZShMqHlJY/XDlE7YWaBr6OXMcW+nM15GN3PM4k/1G/d8F8r1C00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oqbj/83m; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oqbj/83m"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21649a7bcdcso245665285ad.1;
        Wed, 08 Jan 2025 08:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736355589; x=1736960389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2tKK5msDTDbDFhmplvsaAyUPPVpNmbWjoxNu7wuVCY=;
        b=Oqbj/83msO+F9tTA+PzrYDJK2YIJsWLh2QMk2lwd15Sa6SRzlz9CENGtDwj4ieZSKv
         Cucc+fxvO6InlcgATd7tVD1dk1L4YCsK4W1BDWGRtRWZu3iNXHysYbzQA/wzkjNZ6t52
         P1a53ptRBxpcmM6nFkB8H4GC3M009ULblAd2Qzb5EW/YuPzCx7ViuOWKazl9Zta0VLOY
         ZjdQ8OeTWiqVtNtlh0yuH1tLNia04CfIQ+pI2EFSjPjpqtVyj5eQOuH+RrqCpnw6L1Nv
         SB2jPLHFOreDZe9zRg8W2VLalKTkB5OalyyltPd5ulZBHV1RM1BcG+lT9jGO6etLKTaA
         8F/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736355589; x=1736960389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2tKK5msDTDbDFhmplvsaAyUPPVpNmbWjoxNu7wuVCY=;
        b=AmENpAY9uE+Sj3L1hyis1XMxWbqZDPjBFX1tFQD/YPpwBG6eJW4avelD64UgbNbij3
         nftl0lx9kYxUuqws5UG9qUUieXCiBcco9FaJaBgPnKj1XC1iNdc5gjo3H83a73KuQMNd
         XBiqvSUEaBHxqfUKZu8DSxDY+T5VNeVmikn7neY+wAJLLdExAHtwUOpSOxykJd+DXggl
         QKh6/rv0kW/F2/IIYDsSkbvpqbBXFV5p7HfrVvWGp5hJn5ocs58y6+bGvmkDQA1fsjLS
         S+sKkuk8BSM9ReCqeSAVjpCCSE1hTL4DV4C/mmZtBhUiBpPRFTm6LO35veBapbIN+reg
         OFDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOt/AUn0cl2/z+5tM/ceW1QUAnQZ+ZODfKyUgILfVSN6qsdTiIkFtwzhZYJB8WocXDjXiWh5uGYDw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywt4NoxkzSLydIMx6r+yJXDnE65GsgtEyTsY0KC8fgrFpUYFt2
	DmiEsJfkDhovJHJwIQ2qGmDhPyH8wpK6P4ma6FE+uSmPXIaHAh7Z
X-Gm-Gg: ASbGnctiMvNvNnwdVAcdDRqTINzlD/CNKLdw90slUtG1LcD6WK7sgpRUpX5EnOBOkoK
	zbiYWn3apOay8r+jgT8AzZUXXXrZ4ArYQlgPcHPwmhVLQrcbaI7u5cSWGxCk1yu3C2giWXtARaZ
	NQo8QQklHasekVSnPIMuIUS7Cw+50ApgokpJRLhZLvJ2aV7DQuyTJmgwmXyfj+1dtl4nYpQwlQA
	7ZHAQzj3SVey2A2qCTbxFO3jtEqC/u+nJ0d4mhjSUmBRtzPXOtwvRmmHdSd5hOv8OtLDw==
X-Google-Smtp-Source: AGHT+IF4i+AfBGblXNIfRUhsZKQvagsXm/WFhBhCKp5lRjQv6mrXVhJyRiNVbYyPgFG/+B8RHvtgCA==
X-Received: by 2002:a17:902:d485:b0:216:32c4:f7f5 with SMTP id d9443c01a7336-21a83f54d55mr43629775ad.19.1736355589295;
        Wed, 08 Jan 2025 08:59:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca01919sm329405185ad.241.2025.01.08.08.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:59:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 8 Jan 2025 08:59:46 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Daniel Nilsson <daniel.nilsson@flex.com>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Robin Getz <rgetz503@gmail.com>,
	Erik Rosen <erik.rosen@metormote.com>
Subject: Re: [PATCH] hwmon: (pmbus/max15301): add support for MAX15303
Message-ID: <db8bd6c0-a9f8-4f9d-82ab-2dcb41e04eea@roeck-us.net>
References: <20250108-dev-max15303-v1-1-9154eb2c9d9e@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-dev-max15303-v1-1-9154eb2c9d9e@analog.com>

On Wed, Jan 08, 2025 at 04:44:23PM +0000, Nuno Sa via B4 Relay wrote:
> From: Nuno Sa <nuno.sa@analog.com>
> 
> The MAX15303 is a full-featured, flexible, efficient, 6A digital
> point-of-load (PoL) controller with integrated switching MOSFETs. It
> contains advanced power management and telemetry features.
> 
> Tested-by: Robin Getz <rgetz503@gmail.com>
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
