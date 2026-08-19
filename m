Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25D033B6C4
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 20:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787171665; cv=none; b=Mlow/IBxBoXx7CGIUqiJvgzWYFj20E40Y4wVQ6HJ8ZYfgEyi5kzp9ROvS6oJ3QrDQk1X28hT5T986VnJGAOk0gWEcMawyqKF1waxwTOZ3Rnvu4hWhKFQ2S61Jam634wFB6X0VKI1Kaki1Z2PVzkYAnN5Z+aJ4xNKehwMP34WmiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787171665; c=relaxed/simple;
	bh=bPPmj7IAEeXB4+/N34//wX5Dw0GoivH8wnvlsvhcjg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a3RQqFkYQohJ4pa1rIZRNIwKR/KO+Su52016GU2QMzxOJbNTIVJRLdcsfqNIcGTaiNgL8wBEvmzMR4ML6uizqs+iLgJ2MMBMlhHP9tKCeha8dU8MkweJAyOCq5IquRJKMtPkvVu+7IZxXxSHj7wK78UiwWkNyXVRQk7fQx0FM0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1CaImUj; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1CaImUj"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf52d15d88so11688065ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 13:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787171663; x=1787776463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VddZzfr+EDxn8i09Wi0RYs1qt50kBhv+6fLJFotPHPI=;
        b=R1CaImUjaid8NvYV3Oer+v5amDgjPdXtDdNZMTVGYJJS5Xn6YLM8ayOWvc9gi5bI5/
         sMR85/ZamHb1suPJ3I+ku2a7xRy6NyizCpNUB49fABuCYvx1RSsH9YG7xJWUAMNycvLj
         no7K8wSAtpOaewCbT+fqA3BF+bPHQ+DnL4dhRQLm12LltcmaqecqsqbQ5s8sCYxLCTG/
         Z01IagchtLJWzJEvzK9n6+HY71+xqNvlKPBXoag8ktJTdLY+q8aeDegyHKw4YbSLZxLQ
         9/k8K88KnatM824jJFzxFMW73+UzJUt8UiRFHMhgAp7tqdGblAC1tBahzWW2Xn9IWBxv
         lJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787171663; x=1787776463;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VddZzfr+EDxn8i09Wi0RYs1qt50kBhv+6fLJFotPHPI=;
        b=qBA9BJtqHNnUyZcnuswbJ5OIo6dV0nh5xyNmXlCrBKclCta6VRlfKTkyN1K2dxumnE
         ymth1BPU3rEcEqEG54s/Ob+Q1T49NPWwpSMNqDKBa4Jd5XnU/zxHxcx+A/5aHckwxg5C
         ynX7thG8GtzbCexBuzv1T16+rsRmSO92DjfIspNGUGP8zAT7mL3s4y8DMZaHj7zlXuKC
         +44lz1nOczmgT1rT4qKZ9y6Qqsr0LpYFXdXwphIIWd/43+uASoXEW8CCS5+1zO/bfLsl
         FqKG5wO3k9UUBaWuTT+GTBMP4PGDoqPTHzcg5TdcO+rnJwntWNiZoBGuXUubprO+XOkq
         5ECQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFs8UPUYRk3I9bWwuQyUdY5qa0kfgMuG4ZAqvacWBet4TaTAn4ebr+7EFI+pUX/7pCcEU3b6Jr43TzNg==@vger.kernel.org
X-Gm-Message-State: AFuF++mOMZond0fIsh/CIl43wi/mVUF3OrrnHB0KkqDn098CnPf3Dj3H
	nDhBip4L49qJZ12j7/FFCxV9/1Hy0jGj2eEpbwFejRN9eFAhBSHo9zOhGAEvCw==
X-Gm-Gg: AR+sD11WAkJCGUomgi9QzGVLiLW1MdEE6varOMHPIH6du7f59H+Pmvle+OLzBzfTTNv
	qpgXwSiTFJu4oE9H4hbG6ageeJ/PiSUpw1fUk2Vn4nr1UbYRaRNiZrJMRSStGBE1TGQkFrdA3XV
	hTImFYWXC5LgIHR9Ui89Ljm2w4rmQW5yjP9oodh/eHDHyJTVf3UXab+LpLdy22hKaan+rf/aPTb
	f8gZgvT955AxxR1PAkDgiyI9iy9K4yRaUXqFFQGNVTq2mGPQZS4cC63iEIfSyzRH8SZ7oLtJ0PO
	i9XpDDb8jQBN6M/b8Z0IrufTpfUtAnDWj3mWAeBIpUyDLc+xzu9merkKCTu+GSvU4IlWMtFnClt
	iXUrZSLMfDIcIu0fwDgBSSUq9qnHyeiQjnhzl70r3xHyApr3i7lHMJ0W7+WV076ZYM9dngGsxzY
	i410dOQ63kQ+G34+9mr/m/o14tG1Hwl29/VsnRMKRIp93bmJAdz5/yC8Pacix+TorOVRvhPKKhI
	A==
X-Received: by 2002:a17:90b:5385:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-395812a872dmr13724530a91.5.1787171663050;
        Wed, 19 Aug 2026 13:34:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad69638sm8782001c88.7.2026.08.19.13.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 13:34:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 19 Aug 2026 13:34:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
Cc: Victor Duicu <victor.duicu@microchip.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (mcp9982) Propagate one-shot polling errors
Message-ID: <c8dc60e2-f0b2-4146-97ff-7c9a9a9e4ab6@roeck-us.net>
References: <20260819180701.34797-1-nikhilgurudasani314@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819180701.34797-1-nikhilgurudasani314@gmail.com>

On Wed, Aug 19, 2026 at 11:37:01PM +0530, Nikhil Gurudasani wrote:
> When a device is in standby, the driver starts a one-shot conversion and
> polls the BUSY flag before reading temperature, alarm, or fault data.
> The poll result is currently ignored. Therefore, a timeout or a
> status-register read failure can be hidden by a later successful read,
> causing stale data to be returned as valid.
> 
> Return the polling error before reading the requested attribute.
> 
> Fixes: e2fe950f34e5 ("hwmon: add support for MCP998X")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>

Applied.

Thanks,
Guenter
