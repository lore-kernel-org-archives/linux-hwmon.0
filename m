Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A1E15A85E
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Apr 2025 20:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744229472; cv=none; b=LmV8QsuiJmBb8vtb09HQRbhlHvk6eTXfQhyIgu35Z63MuJ2iU2nM1PIjXWkxpaBSWp0YxCz5wHBsr4UFJ9LsRQV4OBegKH+uR3mkuHvG8erRBSritMK4e2Sk7YBHNtsuTTXIL78P63dP+2DpoEhrYRJni07Vt6sSuPZ/LVUJs84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744229472; c=relaxed/simple;
	bh=19FW/mXTxeOYg0dm7c6qYWlld/SaRDFVOgT9O13KSiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuDPPJu2hjImLwU6usnOFUkd7HfRgmN/k+OtzREQzVzHylWqrd+naSO3PmeVUsLXquMH9oQ+e7V4NhQf10r472Llu1fwhARNype1Icq07+uCuKj03R4gS575T/eqLsv7sPLk4hUMUJ1SJ62ai0+KSlJENJ9f8Ds46hqXTXT24Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8wFwIzS; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8wFwIzS"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af548cb1f83so105773a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Apr 2025 13:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744229470; x=1744834270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcWBecpf0gVlUF1VuSck1St8KdmlrbKdx1INxqm5cQ4=;
        b=U8wFwIzSGjRNmM6y0Z2rieqWqLee7vzpQVmFTD275XjPH+jBrHonXJ8AdWyGL4RFsm
         EbdJl/OxKvwLewHm9bffdRoVyPE4QTy+gX2Q4Wk7HFsEufQz44SQoDGsGX7HfyeZkOGD
         Rf01kU3s6qaOT/2WzQ/o9R4Rj9HBsS43lYrup7AaQrHBdHVLjjiirfFKKCFyuCn1TYqu
         y4FDHDGw9LORYLv3s06egN8TEH+SWGZtgnY04+2zLcloUrJKfxO1qurtzXcHod3+uL8m
         JC74hm73ZDYZlQAMeiUT1VYc/T7T8uHNzWDaQFTBwRZoDUDX2Kx2xj4Di65ZIs6wQ86y
         BrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744229470; x=1744834270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcWBecpf0gVlUF1VuSck1St8KdmlrbKdx1INxqm5cQ4=;
        b=E24sXhcEKSJ/oqliVkQI94Y2wJJxSMtx5WVUlybERonnpPpxBgicjJ1Wi2i6hwMj82
         tcKXQuI8lPsqfoY+rDzP8nBYRq288sFoARsodoPZrN0qELc3Zc9PFq9M0t3ruz2+VcdJ
         tCfk0t5w6Ft3FeZLBaQGXCFSPiKPHaxtYqtGpfAfCTlk728KIfXEjxJdiVeqzrr2T3v6
         k3TLkJqEp5Cat6Ofim1PZLX2/39TIpjSWGpIsQj0xykGV+xIdO4A/KsrD7J5XmPN3QnA
         1Mrxq+QX370NNGdFqDXgXtmhVqUf5XsZuGh5f7X/pbSt8+eFK/VbphQqC43kL1YLQvx2
         CiIQ==
X-Gm-Message-State: AOJu0YwihAwLzM2Q6R1xS0z6ATRLxVgzzkN9vdzSOw1A6UFiGvdxyqmg
	iX7GBRs4l7SQ0eEGgjaALyGg4e+fsuhQbC4yYJ8zBFFYRvwpN2ae
X-Gm-Gg: ASbGncs13P7b8EFGyBuzQ12pRX35CwAM9L2vnzLB6QLj328dRbIDrqyG/TeJGbTzGn+
	m92yei9P0woQaBltTz50T2nTsz7+D+UdjKQSlJvnfAlDQ9uP84VM3Yht+N3Y/8kPtWguv7kLa8i
	QZN+GKW8SvucNwfPaDHCYDL/LqDZquOnrwy5F/PgJg5DHCnBtGH/QnZbZGgmUc188xq17XEawd8
	KSwVftlexl/yLRqjhuOEI4CWA0VVTF7KdLai3/MIvQoXbqASWMEfXk7vxqQu5Xi0jdMrt7KWfBV
	jY6HFGMGmZhJgw64HtIe0J3Jxa4PrUzBdtMkacaQIX4xfykBgeOchQ==
X-Google-Smtp-Source: AGHT+IFn+CFOVpISCsz9lWDDmtyK4HPXLkvByc0gI/1iCfiGogBaDSKR1pcZA598E09tk0dUjZdnsA==
X-Received: by 2002:a05:6a21:3a8a:b0:1f5:9d5d:bcdd with SMTP id adf61e73a8af0-2016944c59fmr617419637.1.1744229470193;
        Wed, 09 Apr 2025 13:11:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e51ed7sm1769899b3a.155.2025.04.09.13.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:11:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Apr 2025 13:11:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Gerhard Engleder <gerhard@engleder-embedded.com>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, linux@weissschuh.net,
	Gerhard Engleder <eg@keba.com>
Subject: Re: [PATCH v2] hwmon: Add KEBA battery monitoring controller support
Message-ID: <651ce8b5-4257-4d38-aa18-285698ab7856@roeck-us.net>
References: <20250409190830.60489-1-gerhard@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409190830.60489-1-gerhard@engleder-embedded.com>

On Wed, Apr 09, 2025 at 09:08:30PM +0200, Gerhard Engleder wrote:
> From: Gerhard Engleder <eg@keba.com>
> 
> The KEBA battery monitoring controller is found in the system FPGA of
> KEBA PLC devices. It puts a load on the coin cell battery to check the
> state of the battery. If the coin cell battery is nearly empty, then
> the user space is signaled with a hwmon alarm.
> 
> The auxiliary device for this driver is instantiated by the cp500 misc
> driver.
> 
> Signed-off-by: Gerhard Engleder <eg@keba.com>
> ---
...
> diff --git a/drivers/hwmon/kbatt.c b/drivers/hwmon/kbatt.c
> new file mode 100644
> index 000000000000..501b8f4ded33
> --- /dev/null
> +++ b/drivers/hwmon/kbatt.c
> +
> +		/* check battery state */
> +		if (ioread8(kbatt->base + KBATT_STATUS_REG) &
> +		    KBATT_STATUS_BAT_OK)
> +			kbatt->alarm = false;
> +		else
> +			kbatt->alarm = true;
> +

		kbatt->alarm = !(ioread8(kbatt->base + KBATT_STATUS_REG) & KBATT_STATUS_BAT_OK);

> +		/* switch load off */
> +		iowrite8(0, kbatt->base + KBATT_CONTROL_REG);
> +
> +		kbatt->next_update = jiffies + KBATT_MAX_UPD_INTERVAL;
> +	}
> +
> +	mutex_unlock(&kbatt->lock);
> +
> +	return kbatt->alarm;
> +}
> +
> +static int kbatt_read(struct device *dev, enum hwmon_sensor_types type,
> +		      u32 attr, int channel, long *val)
> +{
> +	struct kbatt *kbatt = dev_get_drvdata(dev);
> +
> +	*val = kbatt_alarm(kbatt) ? 1 : 0;

and

	*val = kbatt_alarm(kbatt);

would have been equivalent and a bit simpler. Also, kbatt_is_visible()
could have just returned 0444 without any checks since there is only one
attribute and it is always present. However, I am tired of arguing today,
so applied.

Guenter
