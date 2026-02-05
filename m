Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15621F63CD
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 17:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770313568; cv=none; b=uDJmJPCOUczNlEabhZds34TCMxuNh1Y2QFL5powjzR3ZcAyL56FrozPStckI+SAHn4l2IHKzaahq+ZR3pFFJ3roDq1LQCcQSOPev0BIHOk5nfhwvBX/qJQDoXYrz7MzkWt828UE1gYGzedM4sr/dfyTlZ2rwGvLYmQM1tgEKG5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770313568; c=relaxed/simple;
	bh=8bA0K2JE30GwCjZfSDIdESF6T3OsxthzOTJnnShe+zA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFSP/r52jNm+HgbKbz8Ls4a+RPSIrCOqRRI/FWpI7P/+KuK2kbbhSbdpjXE44XyGE9Atk5r4dmwtFU60E/t1l8a7GGgVXE8hmy9VZPV0Jim9x6ec/ecialGyHOvVlOsquz3XOXD+UAr3ClJuRVfEeJKiUBp7dHkx0sv3lJBb5Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgoX2Ekf; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgoX2Ekf"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12460a7caa2so1687138c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 09:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770313568; x=1770918368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7PArFQyuoOZkp3FztSFckZnoOjt7B5U6/YBSIp97TY=;
        b=hgoX2EkfbrD/Ul75OBkVP5N3e5du6KI3zb+rW/DMuAicg8c7cr99hkVL1Nnl4T8vPk
         KpOvMMMjCSasHYq/WwebAzx2jlZ2r3183OgL+vLzW+8cKDAGvByPwH1okyO9rmpZ5L8s
         xEcMobX1qYkwoZRNenESn6vGDgDqddhzAd29irWcSS4wHBqVQ3fADB3o99g61wDoq9HG
         fWCdkh1KiQS3Wn6fj97jYX/CEobRw1EhXq2sswd4odBXON8cmlhu99w+3WRRPng8r/1J
         +AB/F/8ePOBYpGQ7To7UnIbbq6vv9UKJHWGxcr1i2UBSmd92Z4JXBmQAZdgPKSZFLGh9
         g5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770313568; x=1770918368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v7PArFQyuoOZkp3FztSFckZnoOjt7B5U6/YBSIp97TY=;
        b=EWe+pSKla7GJ3SNbU5McSWu0Yg6GNPDCab1VJUzADSPGctZ9GwGRkNu9kjod534bqa
         9qY0olzW6v/73f9mV3spM4Thfdo4tGBSrQD5g4nD202OLINZorPrHmOolEUrwYVYugkF
         OFuVTIyfswSFWmDV5lhgZC1ssiuijhooyw86b0ltFV4h+D65qtBLHWTJX8FEcftfHcqv
         Bf2yyStQjEAdNEngKSu3IDU4jkAH667fyMe3YBX6CUsNFvr+YoLX5nJ5KzfrNB8TbIOY
         M97/QN9MPcm5YmkkqR5vGMddedm3YxXsNuNYZzJN5s03QFQWSGRO9tRsSa7TrU/6vqFJ
         nQgA==
X-Forwarded-Encrypted: i=1; AJvYcCX/nnQw3s7hecJrvO/w6fvah6FjvCDucATew0+VH0pfCv4HM0ts1bfhPvuMWTJKJQAYiAgI0+TUKVNgjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YysOS19NaV2jSwECSfClohhACx+IpZdru8Z/iuqDJY6YUT/i4sD
	rnfhTbRfc9EGlR8AABl2J7VoB7CBUCDstEfOLXvKW6H06UWoMbTrt3s6
X-Gm-Gg: AZuq6aLA86unlfkEGHNXCMr1m3QnV4EgEMy1DJeaV5UxJnYar8GqCfHRf6tEnn3MhDb
	43i5qluDFquf0WC7O66Aq/zffMA4A6SNQof1QZ89krQbZc5YHaeK1FmFv/c7w2I5USMbOpKC37g
	M9TLxw/7YBeoJlZG+aNvX6uMX/6SMbGyNPhLLvG9NseIezv5bREjrOc4WgmOUs2WYSUGN6E8yzw
	ymQs0J5j0ZQBsc5PB93mQ7EY510RrXieA45CHKdEqglcFVg0LEg9XMVZJHEFHF5W8xX07CSiDmV
	VIBcSTtDpsmFmw8w82oFAcZUf+MbXdqh96BN0xZ+G68DwfxCPVimaTm6+LUIF+2XI+NnlD6hQMN
	9UqkVHYuY1ljcrQkF9uo9nEwiGwpdAB7xpXYpYBBugBwzLqeLfwozzTqF4Gdvl7g7VozzDMXAMG
	u38aPvWENcw3303v72s4l0uXwD
X-Received: by 2002:a05:7300:4348:b0:2b8:21d7:b7c3 with SMTP id 5a478bee46e88-2b832876eacmr3256197eec.3.1770313567497;
        Thu, 05 Feb 2026 09:46:07 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f4e05ce7sm4769702c88.1.2026.02.05.09.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:46:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Feb 2026 09:46:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: carl.lee@amd.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	peter.shen@amd.com, colin.huang2@amd.com
Subject: Re: [PATCH v2 3/3] hwmon: pmbus: mpq8785: force direct mode for VID
 VOUT on MPQ8785/MPQ8786
Message-ID: <fa07bf22-d56f-46fc-8e39-a50dae2efc46@roeck-us.net>
References: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-0-3744cd9b2850@amd.com>
 <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-3-3744cd9b2850@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-3-3744cd9b2850@amd.com>

On Thu, Feb 05, 2026 at 06:01:39PM +0800, Carl Lee via B4 Relay wrote:
> From: Carl Lee <carl.lee@amd.com>
> 
> According to MPQ8785/MPQ8786 datasheet, VID mode configuration is
> the same as direct mode configuration. Therefore, when VOUT is
> reported in VID mode, it must be forced to use direct format.
> 
> Signed-off-by: Carl Lee <carl.lee@amd.com>
> ---
>  drivers/hwmon/pmbus/mpq8785.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
> index f35534836cb8..d6624af076c3 100644
> --- a/drivers/hwmon/pmbus/mpq8785.c
> +++ b/drivers/hwmon/pmbus/mpq8785.c
> @@ -48,6 +48,25 @@ static int mpq8785_identify(struct i2c_client *client,
>  	return 0;
>  };
>  
> +static int mpq8785_read_byte_data(struct i2c_client *client, int page, int reg)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VOUT_MODE:
> +		ret = pmbus_read_byte_data(client, page, reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		if ((ret >> 5) == 1)
> +			return PB_VOUT_MODE_DIRECT;
> +	default:
> +		return -ENODATA;
> +	}
> +
> +	return ret;
> +}

In addition to my earlier reply, here is AI code review feedback:

This switch statement appears to fall through to the default case when the
mode is not VID (when (ret >> 5) != 1). If it falls through, it returns
-ENODATA.  The core function _pmbus_read_byte_data() will then see -ENODATA
and call pmbus_read_byte_data() again, resulting in a second I2C transaction
for the same register.

Also, the `return ret;` at the end of the function is unreachable because
the default case returns.

Should the PMBUS_VOUT_MODE case return `ret` instead of falling through?

Guenter
