Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA7C40F74D
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763596; cv=none; b=tIcyA83jNC+c+84KYExPsKyb3LW4vFtrnjcQ+arz9JrXC17UqKfEbHEvArcfcTDxeE/y2lEQFCqz2Xy+27E2DPzDnoAdFV+NQNr3jHLaXdBDOdZxs1x821Mr7YU+ljbRGy7ijwmc0+Exog1SaFweUJikVKq8uckuI29Ic1bzvvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763596; c=relaxed/simple;
	bh=VEfV5i7+rjLPz91IjmWTpZNZKQKHmYmJnE5AmzTRjaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aUppVm5NDfq4FKp93zHrnpB5wE7XunEgcKUSBYNtt4sJHLsbGwTYsaMMvm4TmUPcn61FArR4FY2D/jLEqIlQVZK9bN+rvXP6/ThzwX4Ct32qkXlCwXYM37Iz4wHHzRjcDN3Rxdknbpv21sTbji5mB5kIlznXonXrnqJ4njezfVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lffa/BIo; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lffa/BIo"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso1702850f8f.0
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 06:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785763588; x=1786368388; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3uh4QWJ+dMB3SyoQaPH7hwvsQwkONdTGohgRyY0mt0c=;
        b=Lffa/BIo0K+rgvzxrDvn3BfUZPDK4yX6pCueOdvgxS+ySTZ10eMTlTsSm6boTvIzA2
         T6VoOFsTDmmmkMThJoKq+PtDnuMk7IpR5i39TlaNkNTdU68hQXy1tky9vCslkV+3VJ3s
         IhaupFoHWGfk8Jp4KmWswctJB5zTxGlSanRvVa2u2Z6MEwN6c7MaD6ulkcEt0hQ2imPi
         DDVy8EqgGj5UCrfxPgDlPrQwPC9NtD6nC2fasTsdhKMn4DyvbaKPIgobtC0Zv8anqHN+
         dAQiY9s+YwaEv9ZZm+YSrnKkn+6SMYsB4rhHxEqcYqF37q8+81S7SyanozctLvY9ni8p
         vknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785763588; x=1786368388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3uh4QWJ+dMB3SyoQaPH7hwvsQwkONdTGohgRyY0mt0c=;
        b=IkysFgLms9Na7RILHCL0abD2/jq7QVCvu8nb/O2wcOm9XaQkPQ0+ThVKovJSVFmvSu
         8xAy4Zsq3DPoNUa8a5alsMU69Ve/j4C7hvj6gmOWhehOS9mpq2sw1YFCLZU4A51PS7lJ
         Dt5DTDGREVKpysNVQeye4RaD98UIk9xJJVsYsaDpKBjiRZEZLAtgsG7DgUMVkKo4hl3l
         lSA/jxmsudztJemMvSDzGPy97vbRI1UmAUfNY4rO6Gn9JGIyb1iiBG/zxWWmNHQmx/JN
         YyHMaPnrXNQtubXclFYi3C2p9MBjMpIjuyyjzaTGZ7TsEIYWHQkHeewMo093udOE6DRd
         x6wg==
X-Gm-Message-State: AOJu0YyOn181qLmSEUkjJnF9s7bOROtTkTXsvm+cQm2aqa5F7L5TA/Hf
	FVIj33/a/QPveay1KV1jCpr1Zlu4WC1mj+FDaWdLfxa2w3XZEe9jSbL7
X-Gm-Gg: AR+sD10RNJb2tOY9BrHLaLhO5UdFUDmhw7Uu/iKOPSvBG6pFbx+4Pv90c8vm1ddjsEL
	DHWo5vXqytSpH1aNnSdcYspwjsWA61vXowXerfLXmkzsv3EijROw8WHTGrew22WgVLsSxu4bsOL
	keefFRGmZ2m1EftJopShSo31bSzJMgrySbIRePAyK+poLCLm0fKosVpETBU7u8zK9/1eBu9RTtD
	rO3mujdy4sp59sSXncudUX9at74u02+0gQX+itIH74tGifgX3SGNRJ+0ejoPBE1kD1M7lkUlMLn
	JPG2SidKa8s+RXBP4RLb5Qsqp6QIulCasfYdPkATmSXlxhA9NPR1zcbLCUSkwFbhccLQ1mBbA//
	Kwgat0oBc3cIvOIEgSjLfKGxljBZxD1knOH1EhRMcYTgJWC72BygZ3ED/tHeHm4z6F7NDamuCec
	SednSRkRFP537Vvjb6jFAfljaO1meygkKwyrbx7XRXE30vvd3JJMpi
X-Received: by 2002:a05:6000:24c7:b0:47f:8fc9:6eaa with SMTP id ffacd0b85a97d-47fd72ba6fcmr26152582f8f.8.1785763588049;
        Mon, 03 Aug 2026 06:26:28 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45895b6sm33784651f8f.26.2026.08.03.06.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:26:27 -0700 (PDT)
Date: Mon, 3 Aug 2026 14:27:37 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: Re: [PATCH] hwmon: (pmbus) Let PMBus drivers report the supported
 PMBus revision
Message-ID: <anCWlguPT2qPALCg@nsa>
References: <20260729011914.4018703-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729011914.4018703-1-linux@roeck-us.net>

On Tue, Jul 28, 2026 at 06:19:14PM -0700, Guenter Roeck wrote:
> Some PMBus chips do not support the PMBUS_REVISION command. Knowing
> the PMBUs revision supported by a chip is relevant for PMBUs core
> functionality, so add support for letting chip drivers report the PMBUs
> revision.
> 
> Use the new capability to report the PMBus revision supported by MAX20830.
> 
> While at it, add definitions for PMBUs revisons 1.3.1 and 1.4.
> 
> Cc: Nuno Sá <nuno.sa@analog.com>
> Cc: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

LGTM,

Reviewed-by: Nuno Sá <nuno.sa@analog.com>

>  drivers/hwmon/pmbus/max20830.c   |  2 ++
>  drivers/hwmon/pmbus/pmbus.h      | 20 +++++++++++++----
>  drivers/hwmon/pmbus/pmbus_core.c | 38 ++++++++++++++++++++++----------
>  3 files changed, 44 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
> index e3470118fd36..d43ee6438b26 100644
> --- a/drivers/hwmon/pmbus/max20830.c
> +++ b/drivers/hwmon/pmbus/max20830.c
> @@ -23,6 +23,8 @@ static struct pmbus_driver_info max20830_info = {
>  		PMBUS_HAVE_TEMP |
>  		PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
>  		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
> +	.have_pmbus_revision = true,
> +	.pmbus_revision = PMBUS_REV_13,
>  };
>  
>  static int max20830_probe(struct i2c_client *client)
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index 23e3eda58870..1af247de9075 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -420,10 +420,12 @@ enum pmbus_data_format { linear = 0, ieee754, direct, vid };
>  enum vrm_version { vr11 = 0, vr12, vr13, imvp9, amd625mv, nvidia195mv };
>  
>  /* PMBus revision identifiers */
> -#define PMBUS_REV_10 0x00	/* PMBus revision 1.0 */
> -#define PMBUS_REV_11 0x11	/* PMBus revision 1.1 */
> -#define PMBUS_REV_12 0x22	/* PMBus revision 1.2 */
> -#define PMBUS_REV_13 0x33	/* PMBus revision 1.3 */
> +#define PMBUS_REV_10	0x00	/* PMBus revision 1.0 */
> +#define PMBUS_REV_11	0x11	/* PMBus revision 1.1 */
> +#define PMBUS_REV_12	0x22	/* PMBus revision 1.2 */
> +#define PMBUS_REV_13	0x33	/* PMBus revision 1.3 */
> +#define PMBUS_REV_131	0x44	/* PMBus revision 1.3.1 */
> +#define PMBUS_REV_14	0x55	/* PMBus revision 1.4 */
>  
>  /* Operation type flags for pmbus_update_ts */
>  #define PMBUS_OP_WRITE		BIT(0)
> @@ -488,6 +490,16 @@ struct pmbus_driver_info {
>  	int access_delay;		/* in microseconds */
>  	int write_delay;		/* in microseconds */
>  	int page_change_delay;		/* in microseconds */
> +
> +	/*
> +	 * Some chips do not support the PMBUS_REVISION command.
> +	 * Drivers for such chips can report the supported PMBus revision here.
> +	 *
> +	 * Drivers must set have_pmbus_revision to true and provide the
> +	 * supported PMBus version in pmbus_revision.
> +	 */
> +	bool have_pmbus_revision;	/* true if pmbus_revision is valid */
> +	u8 pmbus_revision;		/* PMBus revision */
>  };
>  
>  /* Regulator ops */
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 53501fa1a28e..3e13d09e2c1c 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -96,7 +96,8 @@ struct pmbus_data {
>  
>  	u32 flags;		/* from platform data */
>  
> -	u8 revision;	/* The PMBus revision the device is compliant with */
> +	bool have_pmbus_revision;
> +	u8 revision;		/* The PMBus revision the device is compliant with */
>  
>  	int exponent[PMBUS_PAGES];
>  				/* linear mode: exponent for output voltages */
> @@ -2847,9 +2848,16 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
>  	if (!(data->flags & PMBUS_NO_WRITE_PROTECT))
>  		pmbus_init_wp(client, data);
>  
> -	ret = i2c_smbus_read_byte_data(client, PMBUS_REVISION);
> -	if (ret >= 0)
> -		data->revision = ret;
> +	if (info->have_pmbus_revision) {
> +		data->have_pmbus_revision = true;
> +		data->revision = info->pmbus_revision;
> +	} else {
> +		ret = i2c_smbus_read_byte_data(client, PMBUS_REVISION);
> +		if (ret >= 0) {
> +			data->have_pmbus_revision = true;
> +			data->revision = ret;
> +		}
> +	}
>  
>  	if (data->info->pages)
>  		pmbus_clear_faults(client);
> @@ -3537,6 +3545,17 @@ static int pmbus_debugfs_get(void *data, u64 *val)
>  DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops, pmbus_debugfs_get, NULL,
>  			 "0x%02llx\n");
>  
> +static int pmbus_debugfs_get_revision(void *data, u64 *val)
> +{
> +	struct pmbus_data *pdata = data;
> +
> +	*val = pdata->revision;
> +
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_revision_ops, pmbus_debugfs_get_revision, NULL,
> +			 "0x%02llx\n");
> +
>  static int pmbus_debugfs_get_status(void *data, u64 *val)
>  {
>  	struct pmbus_debugfs_entry *entry = data;
> @@ -3690,14 +3709,9 @@ static void pmbus_init_debugfs(struct i2c_client *client,
>  				    &entries[idx++],
>  				    &pmbus_debugfs_ops);
>  	}
> -	if (pmbus_check_byte_register(client, 0, PMBUS_REVISION)) {
> -		entries[idx].client = client;
> -		entries[idx].page = 0;
> -		entries[idx].reg = PMBUS_REVISION;
> -		debugfs_create_file("pmbus_revision", 0444, debugfs,
> -				    &entries[idx++],
> -				    &pmbus_debugfs_ops);
> -	}
> +	if (data->have_pmbus_revision)
> +		debugfs_create_file("pmbus_revision", 0444, debugfs, data,
> +				    &pmbus_debugfs_revision_ops);
>  
>  	for (i = 0; i < ARRAY_SIZE(pmbus_debugfs_block_data); i++) {
>  		const struct pmbus_debugfs_data *d = &pmbus_debugfs_block_data[i];
> -- 
> 2.45.2
> 
