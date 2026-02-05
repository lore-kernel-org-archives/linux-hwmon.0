Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577691E1A17
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 15:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770303703; cv=none; b=eks4OAoVuU9smoDpPIuYVuV0oFhJO7FI30MXS9Ex0/LBVn+fRyXQ6JkHKwqxv8twoerw4OpEPJkKjBUg49t7vXwgJyOA7S4hpIQ1wEooyso8SGXp1uQR2w1hKggUgBJGYCr1AAqYzwgq7vGMGLNZFGsqYHbPcpuAfmBSkJ2gk4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770303703; c=relaxed/simple;
	bh=Cm2aEyQZvda4+HYwyRqk+YYubcQA9JycWksf8VhfyNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oF/FEOXUawkqEOMLY/5a57Hmc3BcI9ijZZ3v3V6/QuE53yXrQcFd77GTMVOQ2MUw300mAdmlLT28u1qntXDlqJIOx4Q+D8YeM257nXDtn2NZmqXzWlu57gshqEpetRMXUzVbkfTpslima77saYl7v3XXrJu3dkzONAod6QIhiM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4tMzgJo; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4tMzgJo"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-823081bb15fso620951b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 07:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770303703; x=1770908503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRi/5/Z2all2bs6QSSelNZ9jylVa1ACLnqIjRlhsrKk=;
        b=b4tMzgJo98WxfrPVHxTZkb9aF64YDLOLTd3PdJ9LlfPw4sKmhobC9dSj03nDWizsjj
         Swvl/ZTXYQ3i6UnyV5zEMvmvfY9TrnYyYxA8AwO22U0FO8EwgJZHEM0ru4JE3rx6YiW8
         VWY8mMGch5jxrIxxnnjRdqZ/wWe/7BXVnjQyd8lXnug5R56LtL6I5YUvN31QUu0mSdwt
         tWGmgDt5ZWNNaDCNuyg1IXMUloDP/y6Ha77KCDtrr589Pnc9oROEoRef22jA4HJSsnTI
         Vw8MvFrbG6VessfY2eP0VGmukZL8Ke9VDcnc9PGyqNtH9sqPXy9RtHcNj2wy51JG+2T9
         N7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770303703; x=1770908503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sRi/5/Z2all2bs6QSSelNZ9jylVa1ACLnqIjRlhsrKk=;
        b=c0kYPbkPNOGT4rYOevAchM0K/l4NMna8FECJRPepelTBpru1NLOV3ihb7PWI5FyOWs
         gD4cwlKabL8xnpaAtnApwh00MU9SMIeBf/yxGwp73I0zPcDogA0enVqmdfdEtnr6jLct
         9p3u2meFjU4BNbU7CIHZ9ctn4hNP6clZzYdVVUs4XJhkNRZjYze8YTDOAc9CVRI+hPRx
         dilaBEA74zl6sel9xz0llNzZVZ5Dugj3AUa2RqXBDmUn1I+uCg4sVrfJ8S+Af3sWpsYn
         5NaazV2ouXLrz4qXxvcW1jHo/W+ZhZ+Buz7lS0/WaOQhOPJky2VwfPpzMG2ZkYbTtCEV
         KIKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb9RWkRZusDRXr2e7VHF3jGnjsO7PK9VYF8ANh8zTgosA0GUbz2liMD6WrXHcLNHs3d5as4iQ5Xja5lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6T0HuBkJaSN8CUvf2vorF6y5jZv+u8pbG4WPZbkOavogLOmDV
	AEwqUZxnKwlJ5gHKuLgu2JZ03mP6kTfs5jDZhLAXxbwhpUkfTRoN3NAF
X-Gm-Gg: AZuq6aIS/qYnogjIG4ZnvTscTaaXul8vMohtPbDllENwgI2F6IEuzWullZkumNLU5QW
	i7mEP6zSSRMCCJ6BxeCpuM9YYlA1BDH54I8/2Nux7Ct6aPh/ADYchGGVMbR+yDStDWoQ1W4o+YI
	/7nSPOhPR11H7keUXg8aowlv5fj+e+kdyAHM322mKaAApggqD6/9Z6rfpeP7gv1a8jgbUvD5whL
	nksE1hf5wXxR4YHghngE5+w9PsDbr0bxiQng8UQjoZxgj85rmlM85tRQDiWGv6r5IMmK+fPwRY0
	fcfFrU4MHENLZ/OU1dZEIO9aOzYpXiRgclST0OSYO1+4b2Dfd0uJtHw4InAkh+L+dMuWw3KZHV0
	tD4CWaLgMOO7sakOvro4sq4+R0lvdpr6Opa54ga9EOG82hReLRvJtzM2pUwve87JcvAtcudmT/g
	If+CGSBoI1KbjO/pEWxvPIPm9C
X-Received: by 2002:a05:6a00:12e2:b0:7e8:4471:ae74 with SMTP id d2e1a72fcca58-8241c7194a6mr6390068b3a.64.1770303702547;
        Thu, 05 Feb 2026 07:01:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1c8c55sm6665929b3a.24.2026.02.05.07.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 07:01:41 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Feb 2026 07:01:40 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Colin.Huang2@amd.com, Carl.Lee@amd.com,
	Peter.Shen@amd.com
Subject: Re: [PATCH 1/3] hwmon: (pmbus) Add Delta Q54SN120A1 Q54SW120A7 driver
Message-ID: <fa95034e-2de9-46e6-bc4b-2f117df7b240@roeck-us.net>
References: <20260205-add-q54sn120a1-q54q54sw120a7-v1-0-09061ecacfc7@gmail.com>
 <20260205-add-q54sn120a1-q54q54sw120a7-v1-1-09061ecacfc7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-add-q54sn120a1-q54q54sw120a7-v1-1-09061ecacfc7@gmail.com>

On Thu, Feb 05, 2026 at 09:34:35PM +0800, Colin Huang wrote:
> Add the pmbus driver for DELTA Q54SN120A1, Q54SW120A7,
> 1/4 Brick DC/DC Regulated Power Module with PMBus support
> 

This isn't adding the driver, it is adding support for the chips
to the q54sj108a2 driver.

> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
>  drivers/hwmon/pmbus/q54sj108a2.c | 47 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 43 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
> index 4d7086d83aa3..dca084c98fba 100644
> --- a/drivers/hwmon/pmbus/q54sj108a2.c
> +++ b/drivers/hwmon/pmbus/q54sj108a2.c
> @@ -21,7 +21,9 @@
>  #define PMBUS_FLASH_KEY_WRITE		0xEC
>  
>  enum chips {
> -	q54sj108a2
> +	q54sj108a2,
> +	q54sn120a1,
> +	q54sw120a7
>  };
>  
>  enum {
> @@ -62,6 +64,34 @@ static struct pmbus_driver_info q54sj108a2_info[] = {
>  		.format[PSC_VOLTAGE_IN] = linear,
>  		.format[PSC_CURRENT_OUT] = linear,
>  
> +		.func[0] = PMBUS_HAVE_VIN |
> +		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +		PMBUS_HAVE_STATUS_INPUT,
> +	},
> +	[q54sn120a1] = {
> +		.pages = 1,
> +
> +		/* Source : Delta Q54SN120A1 */
> +		.format[PSC_TEMPERATURE] = linear,
> +		.format[PSC_VOLTAGE_IN] = linear,
> +		.format[PSC_CURRENT_OUT] = linear,
> +
> +		.func[0] = PMBUS_HAVE_VIN |
> +		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +		PMBUS_HAVE_STATUS_INPUT,
> +	},
> +	[q54sw120a7] = {
> +		.pages = 1,
> +
> +		/* Source : Delta Q54SW120A7 */
> +		.format[PSC_TEMPERATURE] = linear,
> +		.format[PSC_VOLTAGE_IN] = linear,
> +		.format[PSC_CURRENT_OUT] = linear,
> +

Unless I am missing something, those are all the same. That means there is
no need for separate entries.

>  		.func[0] = PMBUS_HAVE_VIN |
>  		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>  		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> @@ -269,6 +299,8 @@ static const struct file_operations q54sj108a2_fops = {
>  
>  static const struct i2c_device_id q54sj108a2_id[] = {
>  	{ "q54sj108a2", q54sj108a2 },
> +	{ "q54sn120a1", q54sn120a1 },
> +	{ "q54sw120a7", q54sw120a7 },

Delta sells a variety of power bricks, but a Google search for q54sn120a1 or
q54sw120a7 comes up empty. Worse, searching for the entire series (q54sn or
q54sw) comes up empty as well.

Please provide information confirming that the referenced chips do exist.

>  	{ },
>  };
>  
> @@ -278,6 +310,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
> +	const struct i2c_device_id *mid;
>  	enum chips chip_id;
>  	int ret, i;
>  	struct dentry *debugfs;
> @@ -314,8 +347,12 @@ static int q54sj108a2_probe(struct i2c_client *client)
>  		dev_err(dev, "Failed to read Manufacturer Model\n");
>  		return ret;
>  	}
> -	if (ret != 14 || strncmp(buf, "Q54SJ108A2", 10)) {
> -		buf[ret] = '\0';
> +	buf[ret] = '\0';
> +	for (mid = q54sj108a2_id; mid->name[0]; mid++) {
> +		if (!strncasecmp(mid->name, buf, strlen(mid->name)))
> +			break;
> +	}
> +	if (!mid->name[0]) {
>  		dev_err(dev, "Unsupported Manufacturer Model '%s'\n", buf);
>  		return -ENODEV;
>  	}
> @@ -325,7 +362,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
>  		dev_err(dev, "Failed to read Manufacturer Revision\n");
>  		return ret;
>  	}
> -	if (ret != 4 || buf[0] != 'S') {
> +	if (buf[0] != 'S') {

This relaxes the revision number checks significantly. Please provide evidence
explaining why this is needed.

>  		buf[ret] = '\0';
>  		dev_err(dev, "Unsupported Manufacturer Revision '%s'\n", buf);
>  		return -ENODEV;
> @@ -402,6 +439,8 @@ static int q54sj108a2_probe(struct i2c_client *client)
>  
>  static const struct of_device_id q54sj108a2_of_match[] = {
>  	{ .compatible = "delta,q54sj108a2", .data = (void *)q54sj108a2 },
> +	{ .compatible = "delta,q54sn120a1", .data = (void *)q54sn120a1 },
> +	{ .compatible = "delta,q54sw120a7", .data = (void *)q54sw120a7 },
>  	{ },
>  };
>  
> 
> -- 
> 2.34.1
> 
