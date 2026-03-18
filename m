Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1790363085
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 20:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773866993; cv=none; b=on0msG+XVCj6vPqdhe82ljsWre18cRqwh+irngq7KUDwn0DH/uGoobdqQD4+b9OmoCgm1xI4wxFcJGJ0+TOwIxTC2uoQ9lZVBYK/sScEpMJhP6atz8idGay7pz/7oXryoZmCnLrKhLnkjt3uinJXeKH9PCI7YfnBnl+p7gaL32Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773866993; c=relaxed/simple;
	bh=qIij743JOOAlWCMkhbT06WzZYLRaW8/EoRxl4vjWSu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CX5LsgbmhHa2s/a41D+T4jRE5unmfj2Odv/mVAsNRZee+Y0db/otCXgalm5S/V0aZo5VTmngFuZCTIApSwxyNbSbgBua1bHsVc9kc+tpE1exB3ZQHVpg5WRSx8J0w9rRLISJfX5Sk6prhUeH+Rr1FQAOrYLKCWj6DCspJ9QyW3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WaceIBbT; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WaceIBbT"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35bb7afdc38so296064a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 13:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773866991; x=1774471791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OvseNQCzsWO5HOWZSkYBS0HNucc1uFxIq2s2Mz+O2xY=;
        b=WaceIBbTAC0FAoCbtXAdXjH5O/BtZ0tgYUOvS/z+DDYwV89uClc1IrPiB1X45J31ni
         SNH+MSVXDsdd/QAN3a5+1bcrREJKWc277+K0UHhZByOty2MZl0zHwd9rUIt8DtP+gdG8
         HnU8je2G7+tGyxs+kILlNdMEaKROXaoqfpTsFv9XGqKqdb+/GdUPxcTr2xjc8s0VzHfi
         ucrhe+Cd/XWFMZLPL93R54JHjpEesqPAgByccZz+iCVa7CpLJ3e3Zlw6IlxLTCIs+wr7
         sMkYgbYnnXkHuLFcdHwmgzLy0sgMqPX8G6UVb7kcQtrfcvEljX/mQvBDYa46GTfBFPdN
         gFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773866991; x=1774471791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OvseNQCzsWO5HOWZSkYBS0HNucc1uFxIq2s2Mz+O2xY=;
        b=ZrtMgLp8M4jZx657YGbR0BV78dGH+mljkiix1hBeCgIXO0Ch8hrzu/IQvNpDkodBVs
         7iu3LWRUoAyzTPsVI0vzUVU5jiSHkfW+x9HeItg9opKxBrcUn9U04B4/oD3qfnP8322X
         lOsY2JYnRVAhUwzrpKwymWGrTUGR/T0mE3QqCVtaW1qwak5bqw1otRz2JRXvpjL040C5
         V25URqchi/2tAPrUWl/tcC1+QGjc14g4ges6muUzNOu1C38coJ8YdUJpl8ilmWVdR7ZJ
         d3YYfUjCVXBOlK0GfUA2b2rJQrXZMjcE6FwdMCDrOo8fP4Y7bRdQlVMEWsstS0u+XDVe
         HtIg==
X-Gm-Message-State: AOJu0YydcaP9oLTi+Ca7iXlF5/oB/rdEc3DYLrQiX0n074JW+rKOMcXd
	i921YXA5yYAcC5hHtOw48LdOhX79+FMkzyT8nyS+fj5L3CkV+cQEOmH9
X-Gm-Gg: ATEYQzyK6Y2XVteEUVXj5+RPRTEedkdjl54G2MEQS3Xqsph5ocWtCJLEfHrN6H0iNX+
	k2E3vg8Plq8brekepJhA83h86XGFoLG7Ryf7lqxQhq7othvHiNWLodhoS7VgaNV3iOhExItqk7d
	MDAE3nrvpEzJ7j4COflgAvC5nOvUCawrdohAnx6Ts0TJdAIc+TvySqr+miHExG3iPSli+AjV7mD
	sxyJ5qn+U3cGZFHZFoN6QudbpnGI2FO3zVwSBB+RA6GpcycFYv9mLFmYo10hV6prziWaf5SEeOW
	PMT92+RTIb1H7YNzB4REoS1xIaDARPg+bwqgANx+D0oqaoJNRbwe2NiRthUfwzVBQLvfahwUn5k
	HkLqadiYhXrL/woXstSnhRquULdv9nSWmS/BD66JCKuDZxR/9TZRryWZIIRQ5EdxmWU8YjJjtXo
	lVIQG5L39OCDoc0mOhk878oelyes2pY9xsiH7k
X-Received: by 2002:a17:90b:1c11:b0:35b:94db:fd97 with SMTP id 98e67ed59e1d1-35bb9ef310emr4195544a91.21.1773866991034;
        Wed, 18 Mar 2026 13:49:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc60174e7sm567459a91.6.2026.03.18.13.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 13:49:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 18 Mar 2026 13:49:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sanman Pradhan <sanman.p211993@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v3 1/2] hwmon: (pmbus) export pmbus_wait and
 pmbus_update_ts
Message-ID: <37272e78-4e9d-423d-9c6c-e9d481c2837e@roeck-us.net>
References: <20260318190643.54372-1-psanman@juniper.net>
 <20260318190643.54372-2-psanman@juniper.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318190643.54372-2-psanman@juniper.net>

On Wed, Mar 18, 2026 at 12:06:42PM -0700, Sanman Pradhan wrote:
> Some PMBus devices require strict inter-transaction delays to avoid
> NACKs or communication faults. The PMBus core manages this automatically
> for standard PMBus accesses via pmbus_wait() and pmbus_update_ts().
> 
> However, when a device driver performs raw I2C/SMBus transfers (e.g.,
> for long reads or custom commands) that bypass the PMBus core, the core's
> timing state machine is unaware of the transaction. This can cause the
> next core-mediated PMBus access to violate the device's required delay.
> 
> Export pmbus_wait() and pmbus_update_ts() to the PMBUS namespace so
> device-specific drivers can explicitly synchronize their raw transfers
> with the core's delay management.
> 
> Additionally, move the PMBUS_OP_WRITE and PMBUS_OP_PAGE_CHANGE bitmasks
> into the drivers/hwmon/pmbus/pmbus.h header so callers can accurately
> report the nature of their raw transactions.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

I get:

WARNING: From:/Signed-off-by: email address mismatch: 'From: Sanman Pradhan <sanman.p211993@gmail.com>' != 'Signed-off-by: Sanman Pradhan <psanman@juniper.net>'

when trying to apply this patch. Please resend both patches
with matching addresses.

Please have a look at the AI review results at
https://sashiko.dev/#/patchset/20260318190643.54372-1-psanman%40juniper.net

This is unrelated to this patch, but we'll have to find a solution
for the torn reads on 32-bit platforms (I never thought about that
possibility).

Thanks,
Guenter

> ---
> v3:
> - No changes to this patch in this version.
> 
> v2:
> - New patch in the series.
> - Export pmbus_wait() and pmbus_update_ts() to the PMBUS namespace.
> - Relocate PMBUS_OP_* bitmasks to the subsystem header.
> ---
>  drivers/hwmon/pmbus/pmbus.h      |  9 +++++++++
>  drivers/hwmon/pmbus/pmbus_core.c | 13 ++++---------
>  2 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index 3ddcb742d289..56620ed4ac9c 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -424,6 +424,13 @@ enum vrm_version { vr11 = 0, vr12, vr13, imvp9, amd625mv, nvidia195mv };
>  #define PMBUS_REV_12 0x22	/* PMBus revision 1.2 */
>  #define PMBUS_REV_13 0x33	/* PMBus revision 1.3 */
>  
> +/*
> + * The type of operation used for picking the delay between
> + * successive pmbus operations.
> + */
> +#define PMBUS_OP_WRITE		BIT(0)
> +#define PMBUS_OP_PAGE_CHANGE	BIT(1)
> +
>  struct pmbus_driver_info {
>  	int pages;		/* Total number of pages */
>  	u8 phases[PMBUS_PAGES];	/* Number of phases per page */
> @@ -555,6 +562,8 @@ int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
>  void pmbus_clear_faults(struct i2c_client *client);
>  bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
>  bool pmbus_check_word_register(struct i2c_client *client, int page, int reg);
> +void pmbus_wait(struct i2c_client *client);
> +void pmbus_update_ts(struct i2c_client *client, int op);
>  int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info);
>  const struct pmbus_driver_info *pmbus_get_driver_info(struct i2c_client
>  						      *client);
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 4d7634ee6148..b150c2ee670a 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -32,13 +32,6 @@
>  #define PMBUS_ATTR_ALLOC_SIZE	32
>  #define PMBUS_NAME_SIZE		24
>  
> -/*
> - * The type of operation used for picking the delay between
> - * successive pmbus operations.
> - */
> -#define PMBUS_OP_WRITE		BIT(0)
> -#define PMBUS_OP_PAGE_CHANGE	BIT(1)
> -
>  static int wp = -1;
>  module_param(wp, int, 0444);
>  
> @@ -173,7 +166,7 @@ void pmbus_set_update(struct i2c_client *client, u8 reg, bool update)
>  EXPORT_SYMBOL_NS_GPL(pmbus_set_update, "PMBUS");
>  
>  /* Some chips need a delay between accesses. */
> -static void pmbus_wait(struct i2c_client *client)
> +void pmbus_wait(struct i2c_client *client)
>  {
>  	struct pmbus_data *data = i2c_get_clientdata(client);
>  	s64 delay = ktime_us_delta(data->next_access_backoff, ktime_get());
> @@ -181,9 +174,10 @@ static void pmbus_wait(struct i2c_client *client)
>  	if (delay > 0)
>  		fsleep(delay);
>  }
> +EXPORT_SYMBOL_NS_GPL(pmbus_wait, "PMBUS");
>  
>  /* Sets the last operation timestamp for pmbus_wait */
> -static void pmbus_update_ts(struct i2c_client *client, int op)
> +void pmbus_update_ts(struct i2c_client *client, int op)
>  {
>  	struct pmbus_data *data = i2c_get_clientdata(client);
>  	const struct pmbus_driver_info *info = data->info;
> @@ -197,6 +191,7 @@ static void pmbus_update_ts(struct i2c_client *client, int op)
>  	if (delay > 0)
>  		data->next_access_backoff = ktime_add_us(ktime_get(), delay);
>  }
> +EXPORT_SYMBOL_NS_GPL(pmbus_update_ts, "PMBUS");
>  
>  int pmbus_set_page(struct i2c_client *client, int page, int phase)
>  {
