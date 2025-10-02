Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35AE2E403
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Oct 2025 21:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759441251; cv=none; b=GqhmlO01z5wd3ugXLPVz4YjxRXuFeJha73LaDZmbu4K9nXe70voprb7vYa0R5KrflcD/RPkp90SAaFRQn/uh9mn/hlVx9AiyCoIYxt5vNe49Jfb8zxUBdvStUt7P7DfuL7kr2cUrzIwTVf2GEXC+yNuGzEoZ+FSLqjmuJuxthFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759441251; c=relaxed/simple;
	bh=4br5TXp20Sa42/FcnLphmQ5GaWo3dSD/pk6MBmPScJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBehdO5dI4AEAg803scgBxsU8MfkjZH34bag4gqF+wJedBgOrvKkMZPQ6ELviOtsU/H2wrJ0ozXN52HZiR+dksYEzV6crkFXc9HkiSCNg8+0zY20Eon3e97rNFSovqivh9uIv8SRAmf+ZLvUIyl1UfMPrvr0rjtggcUEa89UkKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOujQqn6; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOujQqn6"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b551350adfaso1383194a12.3
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Oct 2025 14:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759441249; x=1760046049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+g7WCpxhGw/kfoUiPXF0Q0M8PAzBxjz/5AXzmRXGxrc=;
        b=MOujQqn6snK0uKJg3td6LBFlTxmHHa0gKfAcaPvkUnqvbPzCG2IqkZSDxPa597OLJi
         jbkqhQtaHw11z9q9CwF+T2FZq5l6w07lFgEjixEnzWCu+65BVw5aF4T74bnpz+mM9DSl
         ehgFAI8Iy3NB+DMgRVhlo27AE6XI9Y5lwnxScCCuBBDHxAUsWomNYjNZLoCdCuO/WdYG
         XaCzd1qtDIBZrGm08drqE97vIIvvPlNzgi2vF8QNR09CUgqfZeL0NxXGk44/nNjjRdpy
         rA4zWVBbULJuJt6kIuQifjDYhhalSyGCmno8TJfh8N3udC25dKWRf5KH7nGyK1MqxJ0d
         rjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759441249; x=1760046049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+g7WCpxhGw/kfoUiPXF0Q0M8PAzBxjz/5AXzmRXGxrc=;
        b=Dlf11N8PkBgS5ztOUds6Zx2Y0xfY7uRlSPuJzEGkj4sj2vVO1FbEzLc6Ph2jde159A
         Oq2F1XRZf5SQHboDFkHV/GSkb3b/1QoNdKgxU7PJULpmGSgGh8iu5FmCIhvSQgcB3bAm
         EVnI5uOFoENLJiGuJiLBuRK7gix+kxjL3sO1iKbcQX9vs5mqwwJHXvD8XLZAiv3e6H2b
         KOPcGkZeSaZxiWUQBbmCu4sFtXcI1w61Vjbn3QZUI1SznDNSIKRtJxl4twJWPinUKf6a
         BaiDtBSZ8CtVdu0caF7wyKw0G2oP4UZf5FgGScN1OAd72gnntQvrP+H4yDRDpcUfPuQv
         5yLg==
X-Forwarded-Encrypted: i=1; AJvYcCVHdlhEZU+V7MwbBwsiPZMYcH1J1uxckVqtFESIksXolwUQ9F2DUul/aSJt4QQYmOUVXz4CYXNafkR0Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV9ZZ7FYvBYv53ML7sBGSOb65A0C++79LjFI8o7yVtSrdDlehA
	9H4+kYqmEYORtmeRZr3pvdGiROqOF4SlSlIdbhduM4urDQEQ65D0W7Hhru4+ayro
X-Gm-Gg: ASbGnctMIecnvEaqIW4horVQed4UoVE8j4Yez6OArfcVJlXAa6Io4AYWzjRO/0Bn4n0
	nQTIP6ZKD4u/iBeDYHs9Taw2BY4tIvNgmZcswogtOigA/SSkb93YwcWzSDJApm8S7dZb0zttFHf
	rcIwZ1XW1KaXTHF5uAEy6FuYmpWjRC7HbqqOMJ8LowBv6iAvpiCdXVMScNc+CvG0dKnIm9G7QxW
	3U1QShfSXGJBK0rZ1cxYlYP8uoO4U3eQE6KLfJ4QGQsE4YOCrDmjnhh7e0bto4MVWrDHBpS4xck
	R7cnCb4eFt9fpF8OurVvcsv0ePXM0qTAK/dDwD8hCBcXxInbo4FimZDzjyfdsvso3nkCPnkXYIK
	o8xE/oDZrDLhkEfuETu/lUaAMYKa84d20YLcPR5+W6H3W8fdi47Yed1JEoUE=
X-Google-Smtp-Source: AGHT+IEZKtfG4lWFJ+VDJNIZB0rz102xqLGloS2pPVhFCwbbWN3EfpP8unSWU8sfUUl8oUSB1hU8Rg==
X-Received: by 2002:a17:902:ce0a:b0:28b:4ca5:d522 with SMTP id d9443c01a7336-28e9a65656bmr8167645ad.39.1759441249357;
        Thu, 02 Oct 2025 14:40:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d11191bsm30420125ad.11.2025.10.02.14.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 14:40:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Oct 2025 14:40:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (pmbus/max34440): Update adpm12160 coeff due
 to latest FW
Message-ID: <00cdf890-9f7a-4f98-b170-a50fa8d5ff37@roeck-us.net>
References: <20251001-hwmon-next-v1-0-f8ca6a648203@analog.com>
 <20251001-hwmon-next-v1-1-f8ca6a648203@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001-hwmon-next-v1-1-f8ca6a648203@analog.com>

On Wed, Oct 01, 2025 at 08:37:07AM +0800, Alexis Czezar Torreno wrote:
> adpm12160 is a dc-dc power module. The firmware was updated and the
> coeeficients in the pmbus_driver_info needs to be updated. Since the
> part has not yet released with older FW, this permanent change to
> reflect the latest should be ok.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter
