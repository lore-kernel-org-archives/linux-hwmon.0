Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E30918859B
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Mar 2026 01:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772932621; cv=none; b=gZA8SBv5RRdR1/tyJuxHSyQIfFWTeYxc1YXU6DvT10PRRX830mevyDLErP2UdlpAyF1qTc8hldZMoLBm13OP7xh3KknJcupinrh+wJxnbgkUSQk3MibDfeifIGiefo204Vmu+XkhYYDz7FStXd+KM9lRvbGZV+qNhZtekolJ7gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772932621; c=relaxed/simple;
	bh=NHE2vfa0V52HcbnnaIxMpnbUSCvsF4+qrFyniGcVe8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIvt99CAf22fB50uRr0ve6CZOybOq79IHccjkJTK+KPVeV+wJeK9GZlPfY7K+rk9hABpKomIT8Eq48MFmbP33TyyXyXh886egS5YdlDoXAtRwMQvKLqAgAHmO4hQsGuZ1IjmLj3f7rWG2uMvm+kPQ+oPecx8Iamn37j6xzLBX/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPM6GHnW; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPM6GHnW"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-128b9b7e3edso1086381c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Mar 2026 17:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772932619; x=1773537419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/m38TOPeTSpZBeCFcCDG+z70XXvWtRR7+uRRNfUauk=;
        b=PPM6GHnWyHq+1F/MowSqNd4D7RLVH52EgMScIwzRdsy1HPr6lT1EfT2sQxl0rkhGB4
         g2BaB05OV9jgsc8iBIIZ7/q2TpoKw9/2D4M2biqwO0KzhtcBvpovh1POyxNCmOjZbv+R
         dTAAHv4KVAjXlM/q2AP85g3d4Y3WqHheMCBLR/GQPoKISMvtL8HUnPkx0WT+PJ5pBZzK
         DJsigUBo6ngrd8XN3XRF8DJ8d8DkwPKl/Xyvn2bOMUrZXSg1OffRFZlVObClT5CHpM0j
         JteXPmJb3Csk3Ii/aNLcg3eoDwhSI72pyKQbUiGtXZzP9hYg24oC6E/DZkSML+fK2r4x
         Eoog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772932619; x=1773537419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u/m38TOPeTSpZBeCFcCDG+z70XXvWtRR7+uRRNfUauk=;
        b=ooZieHtpnm3U5mN+Kr5/wvV7S01gKdJq/qfQV6HSfFtqTqmVhfMivi2Rg6MzFcW8bf
         zl6E6HzcYCbjiyAYZSgD3hmgQXn68E37ndNjmDo3hweY21kr8Bz2ekys4eanTlg1160l
         I1rltL4knaBmceHG9eFlaGrYYNALChQ2eU6TOa/TkaaOD4qzDCNU5ISoo+MHdRU4jEy+
         oBbmbMg1+fPj0/fC0HhOwNpac87LSB5RylpmyxqI/alzAPVs1F4OEQ8Mb82cdTu3P+1A
         8xnfSYCbB38n+6LxL91gDYRaLPbxWDTJQLtgxOmk2SLTVSRX+q3Dmh9ZFvGNFaQv9iWZ
         ZBrg==
X-Gm-Message-State: AOJu0Yzr9u0LeNwkW38dYXtgZZGXGFnuf7HWLLBECyDCzkX5ddrP2kFk
	2rnctvRsvWrCqbeYxvpjk4OGijT+k/5Xz4jlftiafUDztK6rLgnHxb+3
X-Gm-Gg: ATEYQzx/nVBVa7rd15mz2lIi3jVwQgNSdfYdqNJge3KKoJdjOypYWpxllnDjRyAZZlM
	xQXd/ho5uAETFICjuz78bbVj7XETqOosNRo/+HNS+J7NMZ3qGsaF2lq0IOwbUtDfqZr18OqSXoH
	WVOpPO2hl1TlTuyxARQdqmXx7GMiGdjBm3ICeERWOdK4fjXoLwGlSvlG640Vhs3DR7HU2AUK8ZS
	OEeYp5flW6OWAsQYWtmd3QQ868Xsxcfg4Y713egA7+W6wkczc4T+t5cKGlL2CjRp66ZLhIYKTVg
	UPru7LrkyD+UW4Ucjfq0vLE7ZS0lCbMl4si/RsxXv0I8HZCwgCEfpZOrj3oBrH+XK/iQ76534DQ
	jtxl0eXUsFV3nuhyk3rNLN8cuSpY10guDQ3IJtX0wcRNjnJgort8opQCPgzrEWz9Dd32/luovny
	/wN69jmSXNVyLWfFOpCgAFY8XaeTVKs/+L/9Gos/b/lnfM+A8=
X-Received: by 2002:a05:693c:805c:b0:2be:64d7:8c6a with SMTP id 5a478bee46e88-2be64d794d7mr212153eec.38.1772932619412;
        Sat, 07 Mar 2026 17:16:59 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f98365fsm4203272eec.30.2026.03.07.17.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 17:16:58 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 7 Mar 2026 17:16:56 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Sanman Pradhan <sanman.p211993@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 2/2] hwmon: (pmbus/max31785) use access_delay for
 PMBus-mediated accesses
Message-ID: <f0744e0e-d376-492c-b750-53235dafe45b@roeck-us.net>
References: <20260307224517.38316-1-sanman.p211993@gmail.com>
 <20260307224517.38316-3-sanman.p211993@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307224517.38316-3-sanman.p211993@gmail.com>

On Sat, Mar 07, 2026 at 02:45:20PM -0800, Sanman Pradhan wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> The MAX31785 fan controller occasionally NACKs master transactions if
> accesses are too tightly spaced. To avoid this, the driver currently
> enforces a 250us inter-access delay with a private timestamp and wrapper
> functions around both raw SMBus accesses and PMBus helper paths.
> 
> Use pmbus_driver_info.access_delay for normal PMBus-mediated accesses
> instead, and remove the driver-local PMBus read/write wrappers.
> 
> Keep local delay handling for raw SMBus accesses used before
> pmbus_do_probe(). Also add explicit delays around the raw i2c_transfer()
> long-read path, since it bypasses PMBus core timing and still needs to
> be spaced from surrounding transactions.
> 
> Update max31785_read_byte_data() so PMBUS_FAN_CONFIG_12 accesses are
> only remapped for virtual pages, allowing physical-page accesses to fall
> back to the PMBus core. With that change, use pmbus_update_fan() for fan
> configuration updates.
> 
> Also use the delayed raw read helper for MFR_REVISION during probe, drop
> the unused to_max31785_data() macro, and rename the local variable
> "virtual" to "vpage".
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---
>  drivers/hwmon/pmbus/max31785.c | 186 +++++++++++----------------------
>  1 file changed, 59 insertions(+), 127 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
> index 50073fe0c5e8..e9c3c36c8663 100644
> --- a/drivers/hwmon/pmbus/max31785.c
> +++ b/drivers/hwmon/pmbus/max31785.c
...
> @@ -178,9 +129,22 @@ static int max31785_read_long_data(struct i2c_client *client, int page,
>  	if (rc < 0)
>  		return rc;
>  
> +	/*
> +	 * The following raw i2c_transfer() bypasses PMBus core access timing.
> +	 * Add an explicit delay before the transfer so it is properly spaced
> +	 * from the preceding PMBus transaction.
> +	 */
> +	usleep_range(MAX31785_WAIT_DELAY_US, MAX31785_WAIT_DELAY_US + 50);
> +
>  	rc = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
>  	if (rc < 0)
>  		return rc;
> +	/*
> +	 * The preceding raw i2c_transfer() bypasses PMBus core access timing.
> +	 * Add an explicit delay after the transfer so the next PMBus access
> +	 * preserves the required inter-transaction spacing.
> +	 */
> +	usleep_range(MAX31785_WAIT_DELAY_US, MAX31785_WAIT_DELAY_US + 50);

AI feedback:

  If `i2c_transfer()` fails, the function returns early without executing the
  trailing `usleep_range()`. Since this raw transfer bypasses the PMBus core
  timing management (`pmbus_update_ts()`), the PMBus core is unaware of the
  exact time this I2C transfer occurred.
  By returning early on error, the required 250us inter-transaction delay is
  skipped. The next PMBus transaction issued by the core might be executed
  immediately, potentially leading to a cascade of communication failures.
  Would it be better to move the trailing `usleep_range()` before the error
  check so it executes unconditionally?

Seems to me it has a point.

Also, would it make sense to export and use pmbus_wait() and pmbus_update_ts()
instead ?

Thanks,
Guenter
