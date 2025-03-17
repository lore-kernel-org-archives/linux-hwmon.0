Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2841494A6
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Mar 2025 03:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742183485; cv=none; b=F7jGyjskkWly7n6zgNk803ByTqfIqF9tGB7Y4IRyGza3uoKIWeWVB8AtoSogcd3bgaMKT+4mlOzOQsiA+/1S0uAGfRiQL5Um6DSZj85seRbs7VXhqKrVpAlVwzThpQgdihB7WOwjt1xjvLjnGx5RLgrx7FhKoY9fJiuAWVBBWZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742183485; c=relaxed/simple;
	bh=Bn92wbaIQwnR7LDXhf2VNfpNMnGgk1DVNZHihOSS96s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXoXmlgatQU33DmgMckOk28Z2idPqbeGVS4AH+ryxu4hfXtEb8hyTUxjeStPxZq1pFycLrE73Q/d5HsAVnl8VGG7IDBfg7VkeSyrKcsQ2KxlKZKEAq9JOsPnrDFznCighp9DUn5F8QlyFkSNXybKod8ONKUj9Uc/Tj8dNJAju4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NcgJYp7Q; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NcgJYp7Q"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-225fbdfc17dso15408975ad.3
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Mar 2025 20:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742183483; x=1742788283; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mNZBfMvSNnXJiaeX6hMwSsN7OOb+ypIwewtzoH1j+pU=;
        b=NcgJYp7QLt5BT5it5hAiS8wVdJvfLOMJKz68mw9wuLS8qlIfRZHAJzYxPTQF0Yd9vl
         +6V5OxQlPXFw7OhpKkaVzzXKvfil7AchCUBPJoQhhPQsXEtlKluu70O41wO1ksXSy+oi
         2z8RsqUFzLvDlGSi+3wOICWTaIAt/l4H9xkwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742183483; x=1742788283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mNZBfMvSNnXJiaeX6hMwSsN7OOb+ypIwewtzoH1j+pU=;
        b=AMmjXzlb2DoB1GsZ1LQWw08NfNiYh8v6IHJWSIG34KItzeY7CDWFDThv+cOJpMDXr6
         BMEiGw/nXV11VnemufiCTZkIHqUEgDAyqRf4kqTV7cODdjy+1WyXWwK5fxDYoPvZshMJ
         DnajSqwz1hogSo1gniKmkfrVKkNhZkXJXjueaL7TfOV0CJ8XDBzCszWQXcVNpChlDgo/
         KDTvn828Po4zVJFVw4IeXhqQlDcfbFHuTSeYA4njaCjX+u1x5aDh3hkgMXrGZzL+Lp/0
         zWhp+a7DXmW1eIjn/BMNsZT/90B6KoH87S0U+EFeAd5HWT1sL76SmCcjP8VljGhT456b
         K34g==
X-Forwarded-Encrypted: i=1; AJvYcCUPhqaSjgcsFBrn8S2/p5J8yifQNnRjME3YGbL2sebCjzb0UUotsu4BRYwiAorPJf3zJMwT3i0Q5sG9NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJuIlVA/MlQBaD+nPAmd1MRy1Sw1m2xkQNiH3qHDiwlUD+/nC5
	nuJ2n6R0fkcOtxg+eTpjoWuQ/P5QAQ4f8ytQU8OU4CbcxL3aeXSWLdNz1NR2jQ==
X-Gm-Gg: ASbGncuAjw7X/ntkwM4/KtoziNDnZw13leMHd49fgbGc0vJT/Y7rv/g+bAURqjqJGB8
	JMXmvDve3huT5+epBKh8gQ7qCZYMbjfmlu6Gg/cKMcwCHaS2p8axMRc67/KBHwstzsy1kyvRKJv
	PwDt0UFvm8lutsgdsTPfH1YGFfdHhRyt26BnWf0bQ8WkufmUFI8QJmLxvQghogWw/RDLPkkd+hA
	s6HSgqGdFQfysKUECO8R7+1Dfhr/lxEwxTd2EzBGa1fKVBDqKYoZk9Dbpi7s4/eF03d0a8piiEK
	7+TYMtqy0YX3wHexFlTQx2dxOM7iBXLlaqO+cQ4=
X-Google-Smtp-Source: AGHT+IEPQ1bRD4grN06N92KNZWUf4hENnVZkATK1o9ytsZfQcCKJcjED3P0YY6Zn6G9M/+mPJ8xpdA==
X-Received: by 2002:a05:6a00:9a7:b0:730:927c:d451 with SMTP id d2e1a72fcca58-7372246dacbmr14550119b3a.20.1742183483104;
        Sun, 16 Mar 2025 20:51:23 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:77b5:e0b8:95d2:83db])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9ddf44sm6193099a12.18.2025.03.16.20.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 20:51:22 -0700 (PDT)
Date: Mon, 17 Mar 2025 11:51:19 +0800
From: "Sung-Chi, Li" <lschyi@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: (cros_ec) Add reading target fan RPM function
Message-ID: <Z9ecN4ZWx1P5csrK@google.com>
References: <20250313-extend_ec_hwmon_fan-v1-0-5c566776f2c4@chromium.org>
 <20250313-extend_ec_hwmon_fan-v1-2-5c566776f2c4@chromium.org>
 <782e6319-2082-4f05-9987-fa68439701ef@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <782e6319-2082-4f05-9987-fa68439701ef@t-8ch.de>

On Thu, Mar 13, 2025 at 05:24:28PM +0100, Thomas Weißschuh wrote:
> On 2025-03-13 12:47:43+0800, Sung-Chi Li wrote:
> > Implement the functionality of reading the target fan RPM setting from
> > ChromeOS embedded controller under framework.
> > 
> > Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> > ---
> >  drivers/hwmon/cros_ec_hwmon.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> > index b2fec0768301f116f49c57b8dbfb042b98a573e1..73bfcbbaf9531be6b753cfef8045fd5dab5b2ab3 100644
> > --- a/drivers/hwmon/cros_ec_hwmon.c
> > +++ b/drivers/hwmon/cros_ec_hwmon.c
> > @@ -36,6 +36,19 @@ static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index
> >  	return 0;
> >  }
> >  
> > +static int cros_ec_hwmon_read_fan_target(struct cros_ec_device *cros_ec, u8 index, int32_t *speed)
> 
> int32_t is a userspace type. In the kernel use i32, or even better u32.
> 
Sorry for missing this important detail, I will not use userspace type
for following changes.

> > +{
> > +	int ret;
> > +	struct ec_response_pwm_get_fan_rpm r;
> 
> Switch the variable declarations around.
> Also call the request "req".
> 
> > +
> > +	ret = cros_ec_cmd(cros_ec, 0, EC_CMD_PWM_GET_FAN_TARGET_RPM, NULL, 0, &r, sizeof(r));
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	*speed = le32_to_cpu(r.rpm);
> 
> r.rpm is not marked as __le32, I'm not sure if sparse will complain
> about the usage of le32_to_cpu().
> 
It did. Currently, all devices are running little endians on both AP and EC, so
I think it is ok not to explicitly call the le32_to_cpu?

> > +	return 0;
> > +}
> > +
> >  static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8 *temp)
> >  {
> >  	unsigned int offset;
> > @@ -95,6 +108,7 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> >  {
> >  	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> >  	int ret = -EOPNOTSUPP;
> > +	int32_t target_rpm;
> 
> Also u32.
> 
Same for the kernel type changes.

> >  	u16 speed;
> >  	u8 temp;
> >  
> > @@ -111,6 +125,10 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> >  			ret = cros_ec_hwmon_read_fan_speed(priv->cros_ec, channel, &speed);
> >  			if (ret == 0)
> >  				*val = cros_ec_hwmon_is_error_fan(speed);
> > +		} else if (attr == hwmon_fan_target) {
> > +			ret = cros_ec_hwmon_read_fan_target(priv->cros_ec, channel, &target_rpm);
> > +			if (ret == 0)
> > +				*val = target_rpm;
> >  		}
> >  	} else if (type == hwmon_temp) {
> >  		if (attr == hwmon_temp_input) {
> > 
> > -- 
> > 2.49.0.rc0.332.g42c0ae87b1-goog
> > 
