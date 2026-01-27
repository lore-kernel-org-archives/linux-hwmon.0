Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F752DB785
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 15:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769527155; cv=none; b=obGGQzAPun98RioIN2EugreQEHyMDd4Yrh9OsfSjlPIlfdxu6Rda17uy5zZtv8YGwePDOS3khxGvwXJdnUwulpY13Z8DYx9p12F7E4fzA0GVzewSbNtLv63+8VfGNYOM56Leo4E9NUcu5XofixP7oe5IjA8Lnu06wi22sbq1Umg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769527155; c=relaxed/simple;
	bh=sqRtYnS4EMx1wud8eWzUNmsiL0QjlWJurfA7CBk479E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApVTYZ7E9wX2DdpWVY8IimrgByJMAve3FE9vmFNFnwJ/WNxhKiSUDYoHVyw+7jhI2LPS32oKhTlXgg/sBGpQcTb6dm2i8eiCWp1SKEVTs7kWDize5EZgGnlNeCk+AEkvX1nhFo0a4OutEwW0DZj7/jBDpKMezncxIcY6hGLYgSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpuPk5bm; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpuPk5bm"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1249acd6ad2so1373712c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 07:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769527153; x=1770131953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lo2+pTnr8aPKBBLG3pwCmtVAgLkRnA2s+o7HL4Gsrrg=;
        b=UpuPk5bmFtgcj0KTCj0P03FzBgBYahm+XT5wUdS4Fu+JiMvLESM8Yj/sOjPeJXQDyV
         oRFxfDiNmNOBMoq+CH+ON8XrpeSrK+4Kz6q3C9gRB8xovCrZ8MxqgGxb8YyrZA36OS32
         UnXNaK8nKVS1lrvs5Rgf/fU+mhE9OBLZ18Vses/GaLtzZ7hqs4idgU6Oqn1oTn2Ww5rz
         KnGmkylxF55hnE+WPBM99k+BzX26CnRH6Uls0VlETsmuQCXvoxvXP6/A7kTcsi2+QwLC
         uaVBKPz6YxZj1vbZU3T/iaVUzs6cACQAGlXcTRSgo1KDLjR8sAteMFB8+ZC5XeCi/avW
         hXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769527153; x=1770131953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lo2+pTnr8aPKBBLG3pwCmtVAgLkRnA2s+o7HL4Gsrrg=;
        b=I+zZBFUX/jSjlJQfcHgPQMWKwqLzEp9rZXUXCrsVx1XYnKubMVTsc0JByANHHz0K0K
         gUI4I54uUEJaAd9SeUx8t04uaAx8pl9ORZ0QKpdEmaleZMLxDRZKgVMSJrM9r0yTdfYS
         lEIIvz43rCu2IYoy5QQSASp9yN16tlL8aw4FETJKCfS7FDfYsEYU9MJe3rX5xpPLCujj
         CXsZT4d+Nvak1aWL55NiuoG225pTpb/Ied242AF0z+e8HdbQRkK74/OEQLf5faG+uBCB
         0wGkBYsAnm7olmlVGOuGmSojZ3/t1DCCEiZwKDoy+au+yS2OdHRd7ESvSDNo3GjQgMJB
         B1NA==
X-Forwarded-Encrypted: i=1; AJvYcCVjsPK8mdA3JS3aY6DgjMMEbgGh0Mlf4Y4pexqknS1orb7H4JueUe6dS0qFftj+pzAKIywNB2Udux5Myg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnWFej7Omo519MPUTiuuatorK6eUZSawhgbS1EthFNZxKn5KjH
	tfjcfxOlWxMyr82FpXfqv64Bgr3CxLiM/i2plwBkifmSCYofjf7E/oQu
X-Gm-Gg: AZuq6aJOhBOSwAV2tPmg/6qIZ9j7iIhF18gEOz0eBpHfgQWRIS07F4IbIJFppcg+bmB
	bvjKCzd0i9qBPqT+BGONdipziPds9Nfo6O7/jXRwEylQ49v/V5+3Z67VN9tvjBTjhu3PIWpYjpv
	Xp+Xy8EDHUHkL+kHvUa92x1chvJSeY8J1XKg1R4WBuQXDgm1ah8Z3OpzzLzFOF9r+7qT8Xrf6Vl
	VPENYzGG9A7hflW7hfgcnAUhnfZ7R+295AgI/MzDfOr0i7OoRaIYfvZVuyW1hubkEfrW13sIldL
	PYzIs49zgm4B8raG5ker/2fz0yiCVfwYdqi0EpzwGeDcnXIwVR8BiY4GBP5us9VIkB3QYUUZWO4
	EpyieuWprYMoDeyj/RDylx30UjSsHPA3ZR05Q0nU5DVhNa5ma6Bo7VF2Srmkbi5iu9JY78JdrMh
	+Mzu2IKEORQ5xMjCLzlx1PxRfP
X-Received: by 2002:a05:7301:1f01:b0:2b0:5b6b:6529 with SMTP id 5a478bee46e88-2b78da68e7cmr1147445eec.39.1769527152906;
        Tue, 27 Jan 2026 07:19:12 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa03fd0sm17872331eec.23.2026.01.27.07.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:19:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 27 Jan 2026 07:19:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Vasileios Amoiridis <vassilisamir@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
Subject: Re: [PATCH v2 2/2] hwmon: Add support for HiTRON HAC300S PSU
Message-ID: <19d5da08-5605-414a-a1f3-2849b9bff19b@roeck-us.net>
References: <20260119190806.35276-1-vassilisamir@gmail.com>
 <20260119190806.35276-3-vassilisamir@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119190806.35276-3-vassilisamir@gmail.com>

On Mon, Jan 19, 2026 at 08:08:06PM +0100, Vasileios Amoiridis wrote:
> From: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
> 
> Add Support for HiTRON HAC300S PSU. This is a AC/DC hot-swappable
> CompactPCI Serial Dual output active current sharing switching power
> supply with a 312W rating.
> 
> Signed-off-by: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>

checkpatch --strict returns various whitespace errors. Please run that
command in the future.

Also,

> +static int hac300s_read_byte_data(struct i2c_client *client, int page, int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct hac300s_data *data = to_hac300s_data(info);
> +
> +	if (reg == PMBUS_VOUT_MODE)
> +		return data->exponent;
> +
> +	return pmbus_read_byte_data(client, page, reg);

This should return -ENODATA.

No need to resend; I fixed it all up and applied the patch.

Thanks,
Guenter
