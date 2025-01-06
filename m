Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B93413DB9F;
	Mon,  6 Jan 2025 16:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736181655; cv=none; b=DaavURSyLJvr4MzOS76/YpU59Fng9jnCQG8AuBRKbU3DkjTdVKdpa11Y8IxYTLMXIpV2Dx3BFKd8moVMaaVF3qiDmHXL3MMYkoJR0eNZ34rrfGjHHTbyycJ1wB1ciO6gog7XRxl8ytVhD4FJKUyDpH1Wu01aPTsQXFnL/v7LsME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736181655; c=relaxed/simple;
	bh=FZGRyUrCKzrV4tSZYfubxCzEBJbaMIDpUpEBt5baq+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBR8Q6gAypjDCbdzATZ1cABxJfkYR+oWkOxCPaMxLFikCRRfFan0Xng+6jCs78zh9vX0gllbmo6CPV3pNooFvsqFNnVxFwjHAbKxvCDsx0YYed28RBHh+NSoFzSXfuecAEHLOx6o7dr7fjnYetoScqyEfsrMCaucyWKdA7Hfkw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCNcEmBM; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCNcEmBM"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2161eb94cceso148185425ad.2;
        Mon, 06 Jan 2025 08:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736181653; x=1736786453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uT+jad6OGvekRNmWKjl2+Pe+gJ2AlfflVU1F+ZziywU=;
        b=FCNcEmBMvrv99tFahkiYMLVLGqyOYaQfyux2w7wuvXzmYEDGW5IO1vqFMEbsJw4I+R
         DXMz/JLmQS4bdzoP+ZhK6yGSWWuMbT/7FPRyfI/v1uMIuzSsQchCv+gaavX6De8SOJIs
         Jo2vKW6Aw0XAMKVpOhC14u0p56g1EnmUD68V79aYeoUkd6687o9cqFmoqs7b407EZ/Df
         a8gKODTyB/b+QmYkQssAV4FQtaWUl4C4e/lTpqXzQfdVfzq18OyPXd6XcnHDBPYSqeI2
         nqSfLuu5nbQLJh5wi+1u3hCjKhBEm++4keT8cD5JKtg+w1/Sl2lGRl5JtXEpno7DFPVA
         CsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736181653; x=1736786453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uT+jad6OGvekRNmWKjl2+Pe+gJ2AlfflVU1F+ZziywU=;
        b=VGW9Tu+BSshr3xmwKBb1vmFhb6ebx6pRZhn5yV3uidz6yNUibnSl2Dcxu63vXKKCX/
         CV1Xrtm37uM9D38NPwL/d8yYQrc5Pyl0/LmAuHuDlEY2I/CAHp61WD3+7wkPQ22p0BVN
         wwSRcS4azr8KWxQ+PfDRgiL3yAn9QYQeMm406zaMbGneuKJZi0rAwM2rzuGW5OhoVDAo
         OqesR7tXyGbWLur4niAkDiIWphawlpy8BgsUgekbSiALfbYcKUePK1esijDSyUMTrbsh
         KnMeFFKkkdHU3W/NRYJBRZkmeowYgxTbzGGIRBBQi4XWnZDXMGMRHemqZ8iZTe1VtuTp
         iimA==
X-Forwarded-Encrypted: i=1; AJvYcCWt4slim7ib/+SKXhlR2bzZXs4U2ggxTVLJLcR+XjhO2CcFYc5uYsIos0Om3KHCNEKCnl3FGrzlJUF+qOVj@vger.kernel.org, AJvYcCXvNFikVtrZKGWOPFGJlp+vO/wvM+IHIhZnuhGyMBRlgzMeZlslEiuZrbFRJLfTQN57CHaSwzcAO0TeWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3nYc0VhaS8G00g9FGobxuQ9OkOvCdEmVZvdmMACkW7HjETuRo
	R81DCR5YjnEHt9EMQwTU38XaHg2pnMBIS0orc+WS6DfsXbLiCbjr6DQD/A==
X-Gm-Gg: ASbGncus3jMZeUkhV1DB5hItgxshI14fqYqI51Pa+hpL53SO4Eu1S3SsVqaYksRbb76
	cAFgPEgCAcn9/KJ+nLEBtAZfHmgjrEDfPosb2hELJ3mAR4EMuTNWaD3vUGhwX5IP8hcVMfk2L9C
	HpayWuglTd9fURtMd5LBAVZo8rBAfCWQ1phVI1mODXQfxFqcPrHfR44NFrREXCGOXJmBG4h9Ru5
	mCcst9yCGhU8FLyNnZFs2X+vfELgwwQwZGRajMqVdmkwj5O890xXwuJnZfv8ouDvFuVgg==
X-Google-Smtp-Source: AGHT+IGY3PgqZtJn+dCTUo6yjpa3xp/TcLIPoKSXPa0avgidOTQbuEizX8QrOId9DX6ePuCe2yxdsg==
X-Received: by 2002:a17:902:d2cc:b0:216:1cfa:2bbf with SMTP id d9443c01a7336-219e6f12dbemr796670515ad.35.1736181653428;
        Mon, 06 Jan 2025 08:40:53 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962c75sm294937265ad.24.2025.01.06.08.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 08:40:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 6 Jan 2025 08:40:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Denis Kirjanov <kirjanov@gmail.com>
Cc: robert.marko@sartura.hr, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: pmbus: dps920ab: Add ability to instantiate
 through i2c
Message-ID: <aff309e8-8b52-4e94-b5c5-f828410066c6@roeck-us.net>
References: <20241227105955.6660-1-kirjanov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227105955.6660-1-kirjanov@gmail.com>

On Fri, Dec 27, 2024 at 01:59:55PM +0300, Denis Kirjanov wrote:
> Currently I have an x86-based system with a Delta PSU
> attched to it thought the i2c bus and OF is disabled.
> That means that in the configuration above I can't instantiate
> an i2c driver since the driver doesn't have the i2c match table.
> 
> Let's add the ability to match the driver with i2c like the
> following command:
> 
> echo "dps920ab" 0x58 > /sys/bus/i2c/devices/i2c-0/new_device
> ...
> [616189.076211] i2c i2c-0: new_device: Instantiated device dps920ab at 0x58
> 
> v2: add more verbose changelog
> 
> Signed-off-by: Denis Kirjanov <kirjanov@gmail.com>

Documentation/process/submitting-patches.rst,
"The canonical patch format", describes in detail how a patch
description should look like. Anything from "The explanation body"
onwards is relevant here.

A useful patch description would be a simple "Add support for
instantiating the Delta DPS920AB PSU through I2C on systems without
devicetree support". Everything else is irrelevant for the patch
description and, if desired, should be after "---".

Thanks,
Guenter
