Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452783B3C1F
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Mar 2026 14:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721913; cv=none; b=t0vsQK+CVRja/4e1HfpBrLuWqf3vfJqLnjMVyWRRxySHLqpSmo90oP+AbgyL3PH4ZH25qf03+BW0REAzAHmoNHdsrMUArPEJMDBNDtrX9o6jVHNHDI+T8FqOWgjRzD2pjAOK9UJVxQBVqc4R2eOgr1XNNwg5Nl6s71wqLtXfmuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721913; c=relaxed/simple;
	bh=JxAXDy8Qg0kPE0csEH3JZwQ2zDkqgb1p9YwasOy2dlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QEbSDi4WdaUQrjTk8Kkc2Sdvn8556GwzqKfxELEVjuM/2TXuKCbh2PUQKwZZDIWTv+Xi62BYM8OGS2kJmatIEwzBYLm+PrN0TMxOxezd2jiieyIUrOg68sABpp8XsyIeWYmkn+WT4jD1Owzv9QKRlDbXgPiDcRmXOrhyRZ1K6U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZkeeuZe; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZkeeuZe"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2be1c918173so6660829eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Mar 2026 06:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772721910; x=1773326710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1/ypJ6rTR5qngL/oS2fXdtqhXdpRH9GGWDsGzbr/Gg=;
        b=LZkeeuZeRsVYLpGK4f5QTR8n83Lg1QJnAfYz9usZi6ZJ35erXz9hehWRrRRSvO0s3M
         OoAwKT0UkuVzRdfBEIOQcCjg/tpmjpksfOvqz0id2xYYtPvUWr7pBFSi7Up/mM6tj/8m
         PmuPDoNvQ3ky9glAl45LTbNyIp3A+b10YPgbU4mVtacm45C+1ibqyViVjW8FtI72YVv7
         Ub1HMvyMg+w6N0SauOT3LCdYzPGHCb/ub/7dF6PIryB24eh/AJ16fCmWay0yu3z42t6U
         UZjDfjHbAFUS7d89pJNz8+9TM4Ccy5Hcy2jGNrwlGIngzroDKSiVdsfkaCBbCr9fng5T
         dsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772721910; x=1773326710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l1/ypJ6rTR5qngL/oS2fXdtqhXdpRH9GGWDsGzbr/Gg=;
        b=WLSyjqTGVQ246JYlPnz4rTE7AMqsMFHn14PQSe2O6/ufV875e0bqu34pHY6wWTqFev
         xeNZK9h2BCVmmV3SKC10/AgKwBAifd9/tiID99B8G4bf/FwBLpP3BzFFZJEANaRYiR2e
         mDaoPbw+zwGsB2djP9bPONWASUssWnPL73AsMzqcAlQYicZzHxNTb/Uf0JXZZDHHBIyc
         QxAzpimQlqMJrZUkkgFNR8lzASFI5TzF96UyVR4Y1TsbW7aDttLh4A5TeNP9lqTR0BGP
         P+pGLsQ5YflKNjmaSMGSfNTE9gTRr3wJsjiidMgkAiI/Rf7dSNnBxwcyu54UU6X6Swmt
         aGTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUplqbsgNKnIVoo5bxroBNx92zfbhZl7szpXOEaR36jJE7gJo1KW525Feqlj+yYo5c2qUQhZNSNw/9FRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHBQC0ja1u5yAQcT/ADyP4xGGeTA48Q2p2q9WEwX1ivAQ4lBTM
	eOpOmpTM8h2nE56OoFSYofKaXrzGSSd4inbvaXF4vBuW7vQAAcI0NgBYlVL46KKd
X-Gm-Gg: ATEYQzyL/prvWyGKJEk4dY8oOG8iYi95+RDEdCuW/AKXy2TFMRG1LZus0meXgarQ6xA
	97/UNwjH8UaSunE7iBmk3oaFrqmKibe19K/MY+5nxXfhCVzZHzQGRWe/WE9z+/1iicMjianajgx
	yWfGGMmtBv0DOviWAIHPDjUc9lGcxk69DyDBpqYf22RJcfhkd1ZZLWlxVKNAW7Y2pZC/cwKG+Ft
	C0EUfVp4oND0BXHMhqf4r9MHprHE7aRmciYiZvdBcJ0pSN59YefPyBYn2qM9347P4iJl+DCAcFF
	y9P1te+OdhTECqYYacG7h4ohAPZaEvgIHsmAaEPRDDmtyo9UGMKYaczTlZNCQ0LI2vR0w0tECGE
	9giOvSk/RemgYSNiGKMhFsFG+8ytxQ3+v80Ter5gUqwokelVI82UVsqu6ENKzd/eANzBPkeEY2I
	GPp5YXwONBTDR3olyPAs2TjIYJLh70vs8C4fSQ
X-Received: by 2002:a05:7300:d717:b0:2ba:7b0b:e20a with SMTP id 5a478bee46e88-2be311df80bmr2191076eec.37.1772721910085;
        Thu, 05 Mar 2026 06:45:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be381d5ae9sm2343977eec.26.2026.03.05.06.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:45:09 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Mar 2026 06:45:08 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Sanman Pradhan <sanman.p211993@gmail.com>
Cc: psanman@juniper.net, andriy.shevchenko@intel.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (pmbus/q54sj108a2) fix stack overflow in
 debugfs read
Message-ID: <c64ac068-d657-4d68-8721-dde09978e4dd@roeck-us.net>
References: <e7191c1c-ecd4-40f8-9e47-9357bd82984f@roeck-us.net>
 <20260304235116.1045-1-sanman.p211993@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304235116.1045-1-sanman.p211993@gmail.com>

Hi,

On Wed, Mar 04, 2026 at 03:51:17PM -0800, Sanman Pradhan wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> The q54sj108a2_debugfs_read function suffers from a stack buffer overflow
> due to incorrect arguments passed to bin2hex(). The function currently
> passes 'data' as the destination and 'data_char' as the source.
> 
> Because bin2hex() converts each input byte into two hex characters, a
> 32-byte block read results in 64 bytes of output. Since 'data' is only
> 34 bytes (I2C_SMBUS_BLOCK_MAX + 2), this writes 30 bytes past the end
> of the buffer onto the stack.
> 
> Additionally, the arguments were swapped: it was reading from the
> zero-initialized 'data_char' and writing to 'data', resulting in
> all-zero output regardless of the actual I2C read.
> 
> Fix this by:
> 1. Expanding 'data_char' to 66 bytes to safely hold the hex output.
> 2. Correcting the bin2hex() argument order and using the actual read count.
> 3. Using a pointer to select the correct output buffer for the final
>    simple_read_from_buffer call.
> 
> Fixes: d014538aa385 ("hwmon: (pmbus) Driver for Delta power supplies Q54SJ108A2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

For future patches, please do _not_send new versions of a patch as reply to old
versions. The reason is explained in Documentation/process/submitting-patches.rst.

Thanks,
Guenter
