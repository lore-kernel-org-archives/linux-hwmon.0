Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C469530C63B
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 18:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773771141; cv=pass; b=A+wzCCn8uziCNJDBDVeIDO79MVPM7CYBE7kj07jq1V9nXBaMqojYzRUU036vhPSSCVsegVPg4Lwlx2lGFNFoeGyWm3cdKlSs8jTiy89BihN0elAfUW8dJ7SlbvvoXV1JeepQwF2dF6khIYrX+lv+Am32sNdjaGxdSkd8Q2yVKeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773771141; c=relaxed/simple;
	bh=SizfVrTLF+4BhGpl5mKa85rCf8dMvgCsZk8oR0TZBFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRWZ2XrwRguOaga0t35I2HnYrCuXQsxZ7t5vnbRyt82THzH+m4o4AkbfAkdKgxweIapcwDsQhO7V++jsnETEFR9wz3RWPaHMvshlF1nyHPfiETkS+ChAsqa4XpfK9DQRnwY/k8nRnMrHwUiKX6GOQ56vJj+niOC1qEItXTfN1Uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlNC4MGl; arc=pass smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlNC4MGl"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4671cbce465so2757237b6e.3
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 11:12:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773771138; cv=none;
        d=google.com; s=arc-20240605;
        b=Y5ah+XKtss9VpNJVfdZgZpxqn0fPDMZt3ypiPz3FbanPFGbHo+gZOT8e5DWaQYVk+T
         G2Iwmyb4fTdyQosntwlY/ujDjxeQ0q9Y2ZKSGckBFmA8oJLAAvRBPGNVXlrqBvbvgQeN
         WQ0/ByXDQluJbnYWTB0B2HRQtr0a7kN8briH4WoS6ehEbq1zrnk38thpBdMI+YvF+6zx
         YhZnvEjjHe4rT0YLekoFzk+mbTEfKFVU5yoV2qtey0TV+RPp93pHiJylr+gSSkwwMEuc
         yYu4qlv7u/oCpgMq2yFFesUh6qkGvU1eYecGXIyHiYBkxWHalzyUk3PTEgVA9vCTpDSo
         YBuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G/DKADJVzefHw1EWKadc03A9lyIA9sSk/XWLsy36KEU=;
        fh=72eMi8jBYIj78mc6XkFTAd/1lrHgGZrayIQd3m87jb0=;
        b=k1zBZaxVh5dj5KuxXK1QG+nObFHWPTMoCMPmD5c8S0nm2mcMcGDfCNXIKZM+3O4KTY
         nWddlpxkQOT0A7L+7mmFOh2MU9AAEtw9wxacLKpzHrrpMhDTuMuXpFwWjq/hA+07TnCT
         pA+SV1DBvwlXGzg8xcOSHemNWi/DDSBRp1lpJ/NBWtlX+IvKVAVFW/Y0ptwC2Nm8IlLZ
         NBwiZp6iCwwewV08zfLFMKidgv4cb5jtrDCrjqdiU6yj+AbU3vHgoGW37gbGtIQwAzI8
         UBCUC+6rzMPfzJjk54fsB4FWiVenct/5VjjpnHDLo/jIqDa5H8j59Bw2kBwTfIvRwc2h
         tSNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773771138; x=1774375938; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G/DKADJVzefHw1EWKadc03A9lyIA9sSk/XWLsy36KEU=;
        b=XlNC4MGlQ9H02fW+towTg2pR2UJTlvtnzvvd+dduTCFmiHaV5EX/Wht77tDp+6jnel
         tKGBlj71bPIS2CghX/9kymhFMxs9wtNk+0Jtnn1UgpQ9jmW17JiMoNldEOQRToH904aL
         lRtPj1MfF3zSTt1p5tT9DnW3vpRoiMS6creh1DyOLwYyP1iCPo1EbdGYpbTp3jYaTmQY
         hMq4UcUR68G7mHDWQDyMTOVY1mmHvfxm+1GsyqX5fJr4SAJoMh5WhWGXOs7k9a24z3HB
         tcXCIvl8e+polN3jvsy/fRmv0ML43gq9ZgYEMk1xdLxJbcr2JzC6cSwRxInLwBI4+qsC
         qoog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773771138; x=1774375938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/DKADJVzefHw1EWKadc03A9lyIA9sSk/XWLsy36KEU=;
        b=AnYeBMuTIZfCraDNWf9MmZytVHk9aJQFyQLHR+IAe/SpFM8WYk3I7PP+c/GtTx1AQI
         02OP6YYfmTr2JF7LW4qX7oxxMfjPBJP2qcfWG4rYbBs42lX/0zSv0FeFIZA30CdVXPSt
         4knvDVXN3YvMz43ScLVReneG5VUdakMdp8EzRNhapKAjr2ByHB/wdK11/vOB7FCid1US
         O7lwhTuIOAYaIx+MbEHoImys1v2aFtEEozM8b46UZL7RFo61ZRthlxrJg8Y7Taco0bVa
         Wvco1wBTjWR4nkWJAicReYjR0I3aMpu2njAPJU/P1A8HqWryDP9TYMZ5bL1MjK0XVK9f
         Ghsg==
X-Forwarded-Encrypted: i=1; AJvYcCW9WM85dFyBglPIzgmzxUFXyGSB21PMspHV+71C/T4jTz5FyPiO/tKZq134ZE3VkS6Y56Laje4KU/fWtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJRwMxRwNiTiEgTx7+y/Zpg0xN8ximkUQZcN7Npp/si1pwKOhr
	Go3+7rfVES6IjazBtNngzfh6DnsNq0D5Y4edhFCEtLqvJsLVjOYoD1nfMhhn8WXNGEeY11al1wC
	nsUPD9FHzupCqiBD16rc/yknswkgK6f4=
X-Gm-Gg: ATEYQzx4VGQCOL5daFuzOR6mivprCX5OyyfhdV8ZGbCNNZ6M73Ko6ZDwxzt4GjHfbNc
	/+mtLgLZ8entCMK3ErWhoMiTL/DhsXibbvCvQB8fm4210k1WXNAap6eew2mOoAsAdmynK7Zp2HL
	w6aRyPn2GSsn/F2Wwc/Zn/7R5qCXHfMw83KyglnjASJNEwS7ZuG8Naa5o640XE8rwjdmjweqVtD
	Ht3E7v0Kb2mjVc9tW9LD/6VbbKK64cHQBBei0iE8IwXCECvZ4qCnt3e81VNnVaquS21nV+sFvZU
	ubJXfGdj9g==
X-Received: by 2002:a05:6808:4f2c:b0:45f:2788:b00a with SMTP id
 5614622812f47-467ba265039mr266683b6e.33.1773771137621; Tue, 17 Mar 2026
 11:12:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309004508.78609-1-sanman.p211993@gmail.com> <20260309004508.78609-3-sanman.p211993@gmail.com>
In-Reply-To: <20260309004508.78609-3-sanman.p211993@gmail.com>
From: Sanman Pradhan <sanman.p211993@gmail.com>
Date: Tue, 17 Mar 2026 11:11:39 -0700
X-Gm-Features: AaiRm51IDHtLMTOuxiX0Mn_hLd6UY5AnE-rCGftc6Q2n50CAiCT4SyBgTyhLg68
Message-ID: <CAG4C-OmrMncYoPyLQszkwFh+O5Z_eMuY2qCMtpB1UE3kHR9YCg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/max31785) use access_delay for
 PMBus-mediated accesses
To: Sanman Pradhan <sanman.p211993@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Sanman Pradhan <psanman@juniper.net>, linux-hwmon <linux-hwmon@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

Just a friendly ping on this v2 series when you have a moment.
Let me know if you need any further changes

Thank you.

Regards,
Sanman Pradhan


On Sun, 8 Mar 2026 at 17:46, Sanman Pradhan <sanman.p211993@gmail.com> wrote:
>
> From: Sanman Pradhan <psanman@juniper.net>
>
> The MAX31785 fan controller occasionally NACKs master transactions if
> accesses are too tightly spaced. To avoid this, the driver currently
> enforces a 250us inter-access delay with a private timestamp and wrapper
> functions around both raw SMBus accesses and PMBus helper paths.
>
> Simplify the driver by using pmbus_driver_info.access_delay for normal
> PMBus-mediated accesses instead, and remove the driver-local PMBus
> read/write wrappers.
>
> Keep local delay handling for raw SMBus accesses used before
> pmbus_do_probe(). For the raw i2c_transfer() long-read path, which
> bypasses PMBus core timing, leverage the newly exported pmbus_wait() and
> pmbus_update_ts() core functions. This replaces hardcoded usleep_range()
> calls and ensures the PMBus core tracks the raw transaction. Placing
> pmbus_update_ts() before the error check fixes a bug where a failed
> i2c_transfer() would skip the delay and impact subsequent PMBus commands.
>
> Additionally, update max31785_read_byte_data() so PMBUS_FAN_CONFIG_12
> accesses are only remapped for virtual pages, allowing physical-page
> accesses to fall back to the PMBus core. With that change, we can safely
> drop the custom max31785_update_fan() wrapper in favor of the core
> pmbus_update_fan() helper.
>
> Also use the delayed raw read helper for MFR_REVISION during probe, drop
> the unused to_max31785_data() macro, and rename the local variable
> "virtual" to "vpage".
>
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---
>  drivers/hwmon/pmbus/max31785.c | 187 +++++++++++----------------------
>  1 file changed, 59 insertions(+), 128 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
> index 50073fe0c5e8..098f43486c45 100644
> --- a/drivers/hwmon/pmbus/max31785.c
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -31,8 +31,6 @@ struct max31785_data {
>         struct pmbus_driver_info info;
>  };
>
> -#define to_max31785_data(x)  container_of(x, struct max31785_data, info)
> -
>  /*
>   * MAX31785 Driver Workaround
>   *
> @@ -40,9 +38,8 @@ struct max31785_data {
>   * These issues are not indicated by the device itself, except for occasional
>   * NACK responses during master transactions. No error bits are set in STATUS_BYTE.
>   *
> - * To address this, we introduce a delay of 250us between consecutive accesses
> - * to the fan controller. This delay helps mitigate communication problems by
> - * allowing sufficient time between accesses.
> + * Keep minimal local delay handling for raw pre-probe SMBus accesses.
> + * Normal PMBus-mediated accesses use pmbus_driver_info.access_delay instead.
>   */
>  static inline void max31785_wait(const struct max31785_data *data)
>  {
> @@ -54,89 +51,42 @@ static inline void max31785_wait(const struct max31785_data *data)
>  }
>
>  static int max31785_i2c_write_byte_data(struct i2c_client *client,
> -                                       struct max31785_data *driver_data,
> -                                       int command, u8 data)
> +                                       struct max31785_data *data,
> +                                       int command, u8 value)
>  {
>         int rc;
>
> -       max31785_wait(driver_data);
> -       rc = i2c_smbus_write_byte_data(client, command, data);
> -       driver_data->access = ktime_get();
> +       max31785_wait(data);
> +       rc = i2c_smbus_write_byte_data(client, command, value);
> +       data->access = ktime_get();
>         return rc;
>  }
>
>  static int max31785_i2c_read_word_data(struct i2c_client *client,
> -                                      struct max31785_data *driver_data,
> +                                      struct max31785_data *data,
>                                        int command)
>  {
>         int rc;
>
> -       max31785_wait(driver_data);
> +       max31785_wait(data);
>         rc = i2c_smbus_read_word_data(client, command);
> -       driver_data->access = ktime_get();
> -       return rc;
> -}
> -
> -static int _max31785_read_byte_data(struct i2c_client *client,
> -                                   struct max31785_data *driver_data,
> -                                   int page, int command)
> -{
> -       int rc;
> -
> -       max31785_wait(driver_data);
> -       rc = pmbus_read_byte_data(client, page, command);
> -       driver_data->access = ktime_get();
> -       return rc;
> -}
> -
> -static int _max31785_write_byte_data(struct i2c_client *client,
> -                                    struct max31785_data *driver_data,
> -                                    int page, int command, u16 data)
> -{
> -       int rc;
> -
> -       max31785_wait(driver_data);
> -       rc = pmbus_write_byte_data(client, page, command, data);
> -       driver_data->access = ktime_get();
> -       return rc;
> -}
> -
> -static int _max31785_read_word_data(struct i2c_client *client,
> -                                   struct max31785_data *driver_data,
> -                                   int page, int phase, int command)
> -{
> -       int rc;
> -
> -       max31785_wait(driver_data);
> -       rc = pmbus_read_word_data(client, page, phase, command);
> -       driver_data->access = ktime_get();
> -       return rc;
> -}
> -
> -static int _max31785_write_word_data(struct i2c_client *client,
> -                                    struct max31785_data *driver_data,
> -                                    int page, int command, u16 data)
> -{
> -       int rc;
> -
> -       max31785_wait(driver_data);
> -       rc = pmbus_write_word_data(client, page, command, data);
> -       driver_data->access = ktime_get();
> +       data->access = ktime_get();
>         return rc;
>  }
>
>  static int max31785_read_byte_data(struct i2c_client *client, int page, int reg)
>  {
> -       const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> -       struct max31785_data *driver_data = to_max31785_data(info);
>
>         switch (reg) {
>         case PMBUS_VOUT_MODE:
>                 return -ENOTSUPP;
>         case PMBUS_FAN_CONFIG_12:
> -               return _max31785_read_byte_data(client, driver_data,
> -                                               page - MAX31785_NR_PAGES,
> -                                               reg);
> +               if (page < MAX31785_NR_PAGES)
> +                       return -ENODATA;
> +
> +               return pmbus_read_byte_data(client,
> +                                           page - MAX31785_NR_PAGES,
> +                                           reg);
>         }
>
>         return -ENODATA;
> @@ -178,7 +128,20 @@ static int max31785_read_long_data(struct i2c_client *client, int page,
>         if (rc < 0)
>                 return rc;
>
> +       /* Ensure the raw transfer is properly spaced from the
> +        * preceding PMBus transaction.
> +        */
> +       pmbus_wait(client);
> +
>         rc = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
> +
> +       /*
> +        * Update PMBus core timing state for the raw transfer, even on error.
> +        * Pass 0 as the operation mask since this is a raw read, intentionally
> +        * neither PMBUS_OP_WRITE nor PMBUS_OP_PAGE_CHANGE.
> +        */
> +       pmbus_update_ts(client, 0);
> +
>         if (rc < 0)
>                 return rc;
>
> @@ -203,19 +166,18 @@ static int max31785_get_pwm(struct i2c_client *client, int page)
>         return rv;
>  }
>
> -static int max31785_get_pwm_mode(struct i2c_client *client,
> -                                struct max31785_data *driver_data, int page)
> +static int max31785_get_pwm_mode(struct i2c_client *client, int page)
>  {
>         int config;
>         int command;
>
> -       config = _max31785_read_byte_data(client, driver_data, page,
> -                                         PMBUS_FAN_CONFIG_12);
> +       config = pmbus_read_byte_data(client, page,
> +                                     PMBUS_FAN_CONFIG_12);
>         if (config < 0)
>                 return config;
>
> -       command = _max31785_read_word_data(client, driver_data, page, 0xff,
> -                                          PMBUS_FAN_COMMAND_1);
> +       command = pmbus_read_word_data(client, page, 0xff,
> +                                      PMBUS_FAN_COMMAND_1);
>         if (command < 0)
>                 return command;
>
> @@ -233,8 +195,6 @@ static int max31785_get_pwm_mode(struct i2c_client *client,
>  static int max31785_read_word_data(struct i2c_client *client, int page,
>                                    int phase, int reg)
>  {
> -       const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> -       struct max31785_data *driver_data = to_max31785_data(info);
>         u32 val;
>         int rv;
>
> @@ -263,7 +223,7 @@ static int max31785_read_word_data(struct i2c_client *client, int page,
>                 rv = max31785_get_pwm(client, page);
>                 break;
>         case PMBUS_VIRT_PWM_ENABLE_1:
> -               rv = max31785_get_pwm_mode(client, driver_data, page);
> +               rv = max31785_get_pwm_mode(client, page);
>                 break;
>         default:
>                 rv = -ENODATA;
> @@ -294,35 +254,7 @@ static inline u32 max31785_scale_pwm(u32 sensor_val)
>         return (sensor_val * 100) / 255;
>  }
>
> -static int max31785_update_fan(struct i2c_client *client,
> -                              struct max31785_data *driver_data, int page,
> -                              u8 config, u8 mask, u16 command)
> -{
> -       int from, rv;
> -       u8 to;
> -
> -       from = _max31785_read_byte_data(client, driver_data, page,
> -                                       PMBUS_FAN_CONFIG_12);
> -       if (from < 0)
> -               return from;
> -
> -       to = (from & ~mask) | (config & mask);
> -
> -       if (to != from) {
> -               rv = _max31785_write_byte_data(client, driver_data, page,
> -                                              PMBUS_FAN_CONFIG_12, to);
> -               if (rv < 0)
> -                       return rv;
> -       }
> -
> -       rv = _max31785_write_word_data(client, driver_data, page,
> -                                      PMBUS_FAN_COMMAND_1, command);
> -
> -       return rv;
> -}
> -
> -static int max31785_pwm_enable(struct i2c_client *client,
> -                              struct max31785_data *driver_data, int page,
> +static int max31785_pwm_enable(struct i2c_client *client, int page,
>                                u16 word)
>  {
>         int config = 0;
> @@ -351,23 +283,21 @@ static int max31785_pwm_enable(struct i2c_client *client,
>                 return -EINVAL;
>         }
>
> -       return max31785_update_fan(client, driver_data, page, config,
> +       return pmbus_update_fan(client, page, 0, config,
>                                    PB_FAN_1_RPM, rate);
>  }
>
>  static int max31785_write_word_data(struct i2c_client *client, int page,
>                                     int reg, u16 word)
>  {
> -       const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> -       struct max31785_data *driver_data = to_max31785_data(info);
>
>         switch (reg) {
>         case PMBUS_VIRT_PWM_1:
> -               return max31785_update_fan(client, driver_data, page, 0,
> -                                          PB_FAN_1_RPM,
> -                                          max31785_scale_pwm(word));
> +               return pmbus_update_fan(client, page, 0, 0,
> +                                       PB_FAN_1_RPM,
> +                                       max31785_scale_pwm(word));
>         case PMBUS_VIRT_PWM_ENABLE_1:
> -               return max31785_pwm_enable(client, driver_data, page, word);
> +               return max31785_pwm_enable(client, page, word);
>         default:
>                 break;
>         }
> @@ -391,6 +321,7 @@ static const struct pmbus_driver_info max31785_info = {
>         .read_byte_data = max31785_read_byte_data,
>         .read_word_data = max31785_read_word_data,
>         .write_byte = max31785_write_byte,
> +       .access_delay = MAX31785_WAIT_DELAY_US,
>
>         /* RPM */
>         .format[PSC_FAN] = direct,
> @@ -438,29 +369,29 @@ static const struct pmbus_driver_info max31785_info = {
>  };
>
>  static int max31785_configure_dual_tach(struct i2c_client *client,
> -                                       struct pmbus_driver_info *info)
> +                                       struct max31785_data *data)
>  {
> +       struct pmbus_driver_info *info = &data->info;
>         int ret;
>         int i;
> -       struct max31785_data *driver_data = to_max31785_data(info);
>
>         for (i = 0; i < MAX31785_NR_FAN_PAGES; i++) {
> -               ret = max31785_i2c_write_byte_data(client, driver_data,
> +               ret = max31785_i2c_write_byte_data(client, data,
>                                                    PMBUS_PAGE, i);
>                 if (ret < 0)
>                         return ret;
>
> -               ret = max31785_i2c_read_word_data(client, driver_data,
> +               ret = max31785_i2c_read_word_data(client, data,
>                                                   MFR_FAN_CONFIG);
>                 if (ret < 0)
>                         return ret;
>
>                 if (ret & MFR_FAN_CONFIG_DUAL_TACH) {
> -                       int virtual = MAX31785_NR_PAGES + i;
> +                       int vpage = MAX31785_NR_PAGES + i;
>
> -                       info->pages = virtual + 1;
> -                       info->func[virtual] |= PMBUS_HAVE_FAN12;
> -                       info->func[virtual] |= PMBUS_PAGE_VIRTUAL;
> +                       info->pages = vpage + 1;
> +                       info->func[vpage] |= PMBUS_HAVE_FAN12;
> +                       info->func[vpage] |= PMBUS_PAGE_VIRTUAL;
>                 }
>         }
>
> @@ -471,7 +402,7 @@ static int max31785_probe(struct i2c_client *client)
>  {
>         struct device *dev = &client->dev;
>         struct pmbus_driver_info *info;
> -       struct max31785_data *driver_data;
> +       struct max31785_data *data;
>         bool dual_tach = false;
>         int ret;
>
> @@ -480,20 +411,20 @@ static int max31785_probe(struct i2c_client *client)
>                                      I2C_FUNC_SMBUS_WORD_DATA))
>                 return -ENODEV;
>
> -       driver_data = devm_kzalloc(dev, sizeof(struct max31785_data), GFP_KERNEL);
> -       if (!driver_data)
> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
>                 return -ENOMEM;
>
> -       info = &driver_data->info;
> -       driver_data->access = ktime_get();
> +       data->access = ktime_get();
> +       info = &data->info;
>         *info = max31785_info;
>
> -       ret = max31785_i2c_write_byte_data(client, driver_data,
> -                                          PMBUS_PAGE, 255);
> +       ret = max31785_i2c_write_byte_data(client, data,
> +                                          PMBUS_PAGE, 0xff);
>         if (ret < 0)
>                 return ret;
>
> -       ret = i2c_smbus_read_word_data(client, MFR_REVISION);
> +       ret = max31785_i2c_read_word_data(client, data, MFR_REVISION);
>         if (ret < 0)
>                 return ret;
>
> @@ -509,7 +440,7 @@ static int max31785_probe(struct i2c_client *client)
>         }
>
>         if (dual_tach) {
> -               ret = max31785_configure_dual_tach(client, info);
> +               ret = max31785_configure_dual_tach(client, data);
>                 if (ret < 0)
>                         return ret;
>         }
> --
> 2.34.1
>
