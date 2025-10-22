Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B602EC098
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Oct 2025 19:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761159619; cv=none; b=J9HR8Ru2pBbPj656LJ3QbtubF2HRKfg3I0alsOD5eIcq8UMYhykGCXYiQxpjPb5apHMDEa+D/t2WnWU5dBlxdhzzJB/l6QzVf4VyBZ0057dBPPiiySmREL+E448/fAcq9BAzj1lg4D6vg/Tq3QKuxVC+PongCU08nQHXzcUrWwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761159619; c=relaxed/simple;
	bh=LpUaV8z0D3O4lOyXJTHjgC5xGrpDllWIXYVOgbSku4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVuX+NaNpJge7xL7yPZW/akxjV1q841H9LAazOwZ74L9435PM6i5X0kuKWCguE4IjjKotX+okfiZDexg1nAApIFth3vFEwfr8QnFBK3qOwNduglSKsUBVWORjlhG/qiSyJUyn6k+qiyIVHYMFUB6Pt2MwRcEzAaTl4S22A/uULc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JelAEa7Z; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JelAEa7Z"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so90981145ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Oct 2025 12:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761159617; x=1761764417; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dFzdfoqya5Ggmh6WNFeMHz2ogjyeullW1tSjweAvnu0=;
        b=JelAEa7ZJ5bE2zZfPYjMB9z9BDYdy5ONSsuvv2FbRfNAEtHcCenLGZh+o4fCqiYuHL
         vlwYtPjQKlQi99bUb9LuWoYOdTS/d4Nx1WXLtHN4C0+4zUzW1ZrNn4iS4ZDP8PHoGQFH
         BYQmDBV86OFu2GIm6IlruAtMQg1xS4Oa96GtPfKGv+xFj32a+yBtQt3UF7VlcFTiDBPN
         81ua4fr8AyW+zAy++F5BH4VjCYo+AX3naiVuZ3Ny1HvdI+6adF3DtGbtDFNVHTGHotI0
         5NEI40xhd5XE0UXSyEBtwLlv6WllkC+GZHRepNMlCkgzYFE6ZDzROOkbkxhUMhcDvkig
         JhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761159617; x=1761764417;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dFzdfoqya5Ggmh6WNFeMHz2ogjyeullW1tSjweAvnu0=;
        b=IhE62DUofC8jUZFf3igrlFvbpGTtlSnVjuFefHmGEnNCoBWg+EZYH6/Za6lMI1OPLS
         oOE+XjWglM8uvKVABos91cOaYkJxtoIMhbaxlw9ss+euN6ICimUteh77SNbFpkXgDlsW
         /HYuXi4VRQllbADUfTpzKUG+CuqvpoCuMfgYOr08E5eptPUVXsnLVcS8uVb552VSJaGw
         J8LxmMRSGw4SKVVwJvxrzs4u7iIf5LEnj4GZMmNQ20IwUUq3wT/Ks7PDIHJ3K4lhVRSh
         FDgrwb0+6McmHvrjiiIJzO+XlA1a+44/AUY2KPPKcMF8tcVIZwragmQUFcAG3UokChT1
         xRMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr72HJVnqklRAxvXVp/cPLciO/Z1JDa/C9MpvWDFj6jDm/5SvfKW3nyavjB9BUrP1/0vxocuGLki8OlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw17rxphz5J4hLTeD6j1fdGAed9QyMn0zXoxsTD+yY5SnoSImq9
	w51OIlVQgwWL135xBBT8ylAPlndIYV5ZKYFfCs5JfORVzwVGAe0a+n6UCCrGTw==
X-Gm-Gg: ASbGncuOs37zK5UQzAFw4Sqqpp3d+QUdtjUHBeC7fY+NrQDOvYFU9F4Z7xszsB8/Hmw
	yz8VRmospeyqjxtS4Z/oyuSTCYjBeGBJW5QorUuncvn/PGe0RyQ6EQCDrlKubnnjCqUh/TzBNNQ
	iLU6jxDdy4eYAOVIQt6Bzzhf+VfUnm2KM9eWe2/+8N+aznU6xSBrhDi9wTFWlQGZNmB2ExHtJH4
	NTxhqdWY2GGxy/Nv73GQTfsL2l4h3WoZ2VAdmhjHcSykxl/IsFQygO9uyHTpPONqBQfP4F8Pgh4
	nO6N1tPkYLxfQLIwc5/cu1KDDokw+kog+++/D25mZR59g6yZf8AG2JjE4eLLFn8OQsdV07WMHuC
	So61AM3GBfLyilFmawFqgghQCvMN9Q7mkv/tVlvrl2+/Edal3wEzOWGIt+2t6GV/Pq+XSkr4m/y
	YXVGjrOtIrK1Fc
X-Google-Smtp-Source: AGHT+IHcqzpOH5zo5LUcgVV0/Ftev63QOy6p43ZgLKbB4SPMBtDcXqiSUsTvlWWnn+nn/U8BdHObJQ==
X-Received: by 2002:a17:903:1a70:b0:267:9c2f:4655 with SMTP id d9443c01a7336-290cbb49970mr303808925ad.41.1761159616399;
        Wed, 22 Oct 2025 12:00:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d5874sm145915295ad.54.2025.10.22.12.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 12:00:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 22 Oct 2025 12:00:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: Biancaa Ramesh <biancaa2210329@ssn.edu.in>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] hwmon: migrate i8k procfs interface to sysfs
Message-ID: <c4605534-e715-4d39-9361-6e95bc03ba30@roeck-us.net>
References: <20251022183746.66481-1-biancaa2210329@ssn.edu.in>
 <20251022184518.53tqi33jgustwvf5@pali>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251022184518.53tqi33jgustwvf5@pali>

On Wed, Oct 22, 2025 at 08:45:18PM +0200, Pali Rohár wrote:
> Sorry, but I do not understand this patch. dell-smm-hwmon driver is
> already using the sysfs interface provided by hwmon subsystem.
> 
It is also weirdly incomplete, and it claims to be "confidential and
intended for the named recipient(s) only". Git says it is corrupted,
and it doesn't look like a real patch.

> > --- a/drivers/hwmon/dell-smm-hwmon.c
> > +++ b/drivers/hwmon/dell-smm-hwmon.c
> > @@ -XXX,40 +XXX,80 @@
> > -// Remove procfs interface

I'll take the patch author by their word:

" If you have received this email in error please delete it and
  notify the sender immediately.
"

To the author: Please consider yourself notified, and I will delete the
patch as directed.

Guenter

> On Thursday 23 October 2025 00:07:46 Biancaa Ramesh wrote:
> > The i8k driver currently exposes Dell laptop hardware monitoring
> > information via a deprecated /proc/i8k interface.
> > 
> > This patch removes the procfs file creation and replaces it with
> > standard sysfs attributes under the hwmon subsystem.
> > 
> > - Removes i8k procfs registration and operations.
> > - Creates sysfs attributes for temperature, fan speeds, and power status.
> > - Registers these attributes via devm_hwmon_device_register_with_groups().
> > - Cleans up legacy procfs code for a cleaner, modern, and supported interface.
> > 
> > This migration aligns with Linux kernel best practices to phase out
> > deprecated and legacy procfs files in favor of a structured sysfs approach.
> > 
> > Signed-off-by: Biancaa Ramesh <biancaa2210329@ssn.edu.in>
> > ---
> >  drivers/hwmon/dell-smm-hwmon.c | 100 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 100 insertions(+), 40 deletions(-)
> > 
> > diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> > index oldhash..newhash 100644
> > --- a/drivers/hwmon/dell-smm-hwmon.c
> > +++ b/drivers/hwmon/dell-smm-hwmon.c
> > @@ -XXX,40 +XXX,80 @@
> > -// Remove procfs interface
> > -static int i8k_proc_show(struct seq_file *seq, void *offset)
> > -{
> > -    struct dell_smm_data *data = seq->private;
> > -    // ...
> > -}
> > -
> > -static const struct proc_ops i8k_proc_ops = {
> > -    .proc_open = i8k_open_fs,
> > -    .proc_read = seq_read,
> > -    .proc_lseek = seq_lseek,
> > -    .proc_release = single_release,
> > -    .proc_ioctl = i8k_ioctl,
> > -};
> > -
> > -static void i8k_exit_procfs(void *param)
> > -{
> > -    remove_proc_entry("i8k", NULL);
> > -}
> > -
> > -static void __init i8k_init_procfs(struct device *dev)
> > -{
> > -    struct dell_smm_data *data = dev_get_drvdata(dev);
> > -    // ...
> > -    if (proc_create_data("i8k", 0, NULL, &i8k_proc_ops, data))
> > -        devm_add_action_or_reset(dev, i8k_exit_procfs, NULL);
> > -}
> > +// Define sysfs attributes for temps and fans
> > +static ssize_t temp1_input_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +    struct dell_smm_data *data = dev_get_drvdata(dev);
> > +    int temp = i8k_get_temp(data, 0);
> > +    if (temp < 0)
> > +        return temp;
> > +    return sprintf(buf, "%d\n", temp * 1000);
> > +}
> > +
> > +static DEVICE_ATTR_RO(temp1_input);
> > +
> > +static ssize_t fan1_input_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +    struct dell_smm_data *data = dev_get_drvdata(dev);
> > +    int speed = i8k_get_fan_speed(data, 0);
> > +    if (speed < 0)
> > +        return speed;
> > +    return sprintf(buf, "%d\n", speed);
> > +}
> > +
> > +static DEVICE_ATTR_RO(fan1_input);
> > +
> > +static struct attribute *dell_smm_attrs[] = {
> > +    &dev_attr_temp1_input.attr,
> > +    &dev_attr_fan1_input.attr,
> > +    NULL,
> > +};
> > +
> > +static const struct attribute_group dell_smm_group = {
> > +    .attrs = dell_smm_attrs,
> > +};
> > +
> > +static const struct attribute_group *dell_smm_groups[] = {
> > +    &dell_smm_group,
> > +    NULL,
> > +};
> > +
> > +static int dell_smm_init_cdev(struct device *dev)
> > +{
> > +    struct dell_smm_data *data = dev_get_drvdata(dev);
> > +    struct device *hwmon_dev;
> > +
> > +    hwmon_dev = devm_hwmon_device_register_with_groups(dev, "dell_smm", data, dell_smm_groups);
> > +    return PTR_ERR_OR_ZERO(hwmon_dev);
> > +}
> > +
> > +static int __init dell_smm_probe(struct platform_device *pdev)
> > +{
> > +    int ret;
> > +
> > +    ret = dell_smm_init_data(&pdev->dev, &i8k_smm_ops);
> > +    if (ret < 0)
> > +        return ret;
> > +
> > +    ret = dell_smm_init_hwmon(&pdev->dev);
> > +    if (ret)
> > +        return ret;
> > +
> > +    ret = dell_smm_init_cdev(&pdev->dev);
> > +    if (ret)
> > +        return ret;
> > +
> > +    return 0;
> > +}
> > 
> > -- 
> > ::DISCLAIMER::
> > 
> > ---------------------------------------------------------------------
> > The 
> > contents of this e-mail and any attachment(s) are confidential and
> > intended 
> > for the named recipient(s) only. Views or opinions, if any,
> > presented in 
> > this email are solely those of the author and may not
> > necessarily reflect 
> > the views or opinions of SSN Institutions (SSN) or its
> > affiliates. Any form 
> > of reproduction, dissemination, copying, disclosure,
> > modification, 
> > distribution and / or publication of this message without the
> > prior written 
> > consent of authorized representative of SSN is strictly
> > prohibited. If you 
> > have received this email in error please delete it and
> > notify the sender 
> > immediately.
> > ---------------------------------------------------------------------
> > Header of this mail should have a valid DKIM signature for the domain 
> > ssn.edu.in <http://www.ssn.edu.in/>
