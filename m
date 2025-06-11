Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CDC192B8C
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Jun 2025 16:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749660363; cv=none; b=hHwM5FPUmi0ydKVxDS1CFOmwWpGLvLJ+ptLVhn4OQdI7RY4ePluuHByr/wzIo7lfasD2ghNVOyb7LkteHQXVpV6yAYwelgxJuhw8MZx7so+zvS+S84m2qDYS6ephOLJmisdxj2DAO7nOAzTUXNgN/oWi2Jn8E1mH5QHrcXlkaXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749660363; c=relaxed/simple;
	bh=8KBptTwsDhaXfo8/AGrkIdmJm5hTPP0DyYVr9LxgMf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yu+KIZPfhDJbpIPpn+HK21iN7VtTtFI9VulsQ5hLfNjkexVo+wb0DuPe2xIGZf50REDkILPPT2b7DxAyyfU8t4fGIA04F+Nb1EErnItQ4VcFn+JGG8o7EsVAdFgVds2cXIkky1kRfGqONdMZRt1ywplSVA/KFg1IOpnEebKRCfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SeysNkQn; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeysNkQn"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235f9ea8d08so118025ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Jun 2025 09:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749660361; x=1750265161; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jUHgQF8lhZQOf9RIASPGPpXroMGca2auBnMZnJWTY/I=;
        b=SeysNkQnrfuBowc28kGZNXHFnHMkQkWTX8Gicz0+CjNdw9nsW54sAZa3sv8W7frx57
         2ln34GfaiklcMiBXn7BlisvHJkMqQc/rfdrK3HquBD+nxSl1rFyQFOPF7AhkkEFp0S9z
         QRA2a9a1Pzl7b4oLx2b2VxmoxUE73lUOS3y/T7/M2gWSJsc2zxGyHHDI6NVQDTENM/kn
         IhST73Nvc0cw7Tu6OLVH85Xz/LIjkKq62utk4C9IJU27dxWwl0/Yp+jLGE8pSMCcNeEh
         vhB65h7m0UJdJwGLzwporjJAfmE5wAZZxMHWwv4MGnPyow5C6V4I+sPidil+U+0nlPBX
         zqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749660361; x=1750265161;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUHgQF8lhZQOf9RIASPGPpXroMGca2auBnMZnJWTY/I=;
        b=sVD5mF3GpUuWhdS6qCN21jF9+1ccSiWI5jykJEoTk1yp/R+PyMFUp7OFcAsdpMkT/B
         32g+qB18UDaCbhYtFT+8iwW0Z8Tr5VJv98EK/0HgJ06B9XuqoZZmM6V0ItB9F5UKOZmS
         BVPsnr8wXgwPcaS9lCorNQ6vdJkngsozTLL7nU5SoRs9OZBcVvik4Qh/92Rfu2V5ezmd
         9k4H4Zt4voGRISZDtBCDSViwLI+Iwz0NHw1qpAxW9Citf4gVIYEmiuuI2UnW8er5O5t/
         qPbWO4U4M3fY8es7iXHgThRNDXwU7p1FcPkxoPHd5rYebnw07KkAGzCPFpvq2O92KXPG
         2LnA==
X-Gm-Message-State: AOJu0YwMEF+bosZO9MguYQGVsaeneXpKOpyYuwYlpVsfclNnMk+3cAYq
	/Yr9+0uXbrAtLSJSICKC3XtjAk/RHmkpjlK59NYS8D0Bo49RLqmFLuaV
X-Gm-Gg: ASbGncvJ24fcxovxYG8aJcvFYr5Iza+W+r9Czh2Ka69jBlZHMJebAgDzHD+pZrhlKWO
	F1gbSqHg870Z8zis1BmW4jninzsfh3lCoDNLzqaycfAxxxRyEP/As6UO0zPWuvtJCespR5MrZdU
	ZsGr4CQXPWDxBjb4YHknykOUPiPF3a80RuTytTLqyKqeIHSZFOBdB0iR1BCIO/yoRbow/+ZPduA
	eA3VnD+BcIdAeP8PGM1gPL77QnlR6OyHx80HDsIUFbBXEfqwh5MWUpKcallodcfESwdbLJ1MkeN
	MP2S3pAYOeRkLcO8VJ5qYELZw4oXL1Gi1Xu/d1gqYy9JQ+8saA/p7qGqhhMRQ1vb/zFUTdPCMO9
	tj7+6rSEFTQ==
X-Google-Smtp-Source: AGHT+IG7MkM6eguPMW+yOT85TxC9eWhgteUYR3QVDXa2sJiet7pYi6Q4YOewR3/ZgbO3pbyTCXkfDg==
X-Received: by 2002:a17:903:1ae7:b0:234:9374:cfae with SMTP id d9443c01a7336-23641abe519mr60879695ad.19.1749660360557;
        Wed, 11 Jun 2025 09:46:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603405161sm90273955ad.147.2025.06.11.09.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:46:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 11 Jun 2025 09:45:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 2/2] hwmon: ltc4282: fix copy past on variable name
Message-ID: <b7f262cb-deff-4da6-a12f-0df7f5427391@roeck-us.net>
References: <20250611-fix-ltc4282-repetead-write-v1-0-fe46edd08cf1@analog.com>
 <20250611-fix-ltc4282-repetead-write-v1-2-fe46edd08cf1@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611-fix-ltc4282-repetead-write-v1-2-fe46edd08cf1@analog.com>

On Wed, Jun 11, 2025 at 05:26:13PM +0100, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> The struct hwmon_chip_info was named ltc2947_chip_info which is
> obviously a copy paste leftover. Name it accordingly.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
