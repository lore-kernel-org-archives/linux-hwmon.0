Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E57C2BFC7B;
	Tue,  3 Mar 2026 19:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772566227; cv=none; b=feCFuTzDW0o+ZKl1lMfLKzyL49BFBT1YulgVKKJ/B8WDmSuFwZvOwwTHCNlo9R5eCt3h7WGDffq8oMttsd5UUeJh/1mcU/VSq1hBxqmurOk1nOGQLx9VvIKK6T62YIfPcDZtKe83RVsUzzYu9g+p4I/SGgf68cObqtV+eg9SvlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772566227; c=relaxed/simple;
	bh=ZyDDN8IfV7javYUzEVMkbcj53mHDRFN3jws0u3RiBbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkREEi5HYx2P8FHKkPq7OEI9cm5F9lkKWAkwwIZ3+5tZUmHkUtRaq9HReLLO+O5w7XpRcTOgdPe6X5Sn6PcnyiF/pRo2ExajFWZV/BzcxRk6vCw7tafIgIseNj4iByO8pbtodlL5+3UEtR3+kfm0o3rbWExrIE9Bq4tjOcObYPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=H0QoC5uY; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="H0QoC5uY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772566223;
	bh=ZyDDN8IfV7javYUzEVMkbcj53mHDRFN3jws0u3RiBbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H0QoC5uYPhW7DjyBofiWUrg4m+kVgDlGtS/07eoog25ZEUZ12cIfhPe5c+17O0sFP
	 UYSuoAbl9xPpVPpKfDtrA7sOYq6cdazjKoV2SAn3qbTg5WnS65iIQeGy1pGd64Wbfi
	 Tx8M0fCWnS9VYwr7IyAMjpFTHhkv3erH5+YFqED8=
Date: Tue, 3 Mar 2026 20:30:23 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aureo Serrano <aureo.serrano@arctic.de>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: add driver for ARCTIC Fan Controller
Message-ID: <d1d27763-c49d-4d02-9157-ec798bd10604@t-8ch.de>
References: <FR6P281MB590006F97DAC7A5C224D957BEF7FA@FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM>
 <51d91216-8949-44a9-93d9-646d3f3563b1@t-8ch.de>
 <8dd3367b-4a7c-414b-a4f4-41dc54578e2b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8dd3367b-4a7c-414b-a4f4-41dc54578e2b@roeck-us.net>

On 2026-03-03 11:00:25-0800, Guenter Roeck wrote:
> On 3/3/26 10:10, Thomas Weißschuh wrote:
> > Hi!
> > 
> > On 2026-03-03 08:25:04+0000, Aureo Serrano wrote:
> > >  From 1cc962124ca4343e682219372b08dec5d611d1af Mon Sep 17 00:00:00 2001
> > > From: Aureo Serrano de Souza <aureo.serrano@arctic.de>
> > > Date: Tue, 3 Mar 2026 15:06:35 +0800
> > > Subject: [PATCH] hwmon: add driver for ARCTIC Fan Controller
> > > 
> > > Add hwmon driver for the ARCTIC Fan Controller (USB HID VID 0x3904,
> > > PID 0xF001) with 10 fan channels. Exposes fan RPM and PWM via sysfs.
> > > Device pushes IN reports ~1 Hz; PWM set via OUT reports.
> > > 
> > > Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>
> > > ---
> 
> checkpatch reports:
> 
> total: 11 errors, 53 warnings, 6 checks, 360 lines checked
> 
> primarily because the patch uses spaces instead of tabs.

It looks like it was pushed through some Microsoft mail product with
copious amounts of force.

(...)

> > > +     }
> > > +     for (i = 0; i < ARCTIC_NUM_FANS; i++) {
> > > +           priv->fan_rpm[i] = (u32)(buf[rpm_off + i * 2] |
> > > +                             (buf[rpm_off + i * 2 + 1] << 8));
> > 
> > get_unaligned_u32()
> > 
> 
> That doesn't seem to exist. get_unaligned_le16(), maybe, but the data
> is never unaligned. le16_to_cpup() might do.

Indeed, get_unaligned_le16() is the one.
Does the HID core guarantee that raw event buffers are always aligned
sufficiently to access them as *u32? Personally I don't know all the
alignment requirements of all the supported architectures.
get_unaligned_le16() will always do the right thing and avoids typecasts.

(...)

> > > +     } else {
> > > +           spin_unlock_irqrestore(&priv->lock, flags);
> > 
> > You can use the new guard() syntax from cleanup.h to avoid manual
> > unlocks on error paths.
> > 
> 
> Why would this code need interrupt disabled spinlocks in the first place ?

I *suspect* that it tries to be compatible with some semaphores in the
HID core.

> It reads individual entries from priv, but even if those are updated
> in parallel I don't see why that would warrant disabling interrupts,
> both here and in arctic_fan_parse_report().
> 
> The hwmon core already serializes read and write operations, so
> the locks (much less interrupt disabling spinlocks) are not needed
> for that either.

The HID callbacks can be fired at any time from the HID core,
concurrently to hwmon core logic. But I also dislike the spinlocks.
Maybe a mutex works, too?

(...)

> > > +static int arctic_fan_probe(struct hid_device *hdev,
> > > +                     const struct hid_device_id *id)
> > > +{
> > > +     struct arctic_fan_data *priv;
> > > +     struct device *hwmon_dev;
> > > +     int ret;
> > > +
> > > +     ret = hid_parse(hdev);
> > > +     if (ret)
> > > +           return ret;
> > > +
> > > +     priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
> > > +     if (!priv)
> > > +           return -ENOMEM;
> > > +
> > > +     priv->out_buf = devm_kmalloc(&hdev->dev, ARCTIC_REPORT_LEN, GFP_KERNEL);
> > > +     if (!priv->out_buf)
> > > +           return -ENOMEM;
> > 
> > The 32 byte buffer could be on the stack, saving this allocation and
> > avoiding a shared resource.
> 
> It might need to be cache aligned, but even then it could be part of
> struct arctic_fan_data.

What would be the advantage of that over an on-stack placement?

> > > +
> > > +     priv->hdev = hdev;
> > > +     spin_lock_init(&priv->lock);
> > > +     hid_set_drvdata(hdev, priv);
> > > +
> > > +     ret = hid_hw_start(hdev, HID_CONNECT_DRIVER);
> > > +     if (ret)
> > > +           return ret;
> > > +
> > > +     ret = hid_hw_open(hdev);
> > > +     if (ret)
> > > +           goto out_stop;
> > > +
> > > +     hid_device_io_start(hdev);
> > > +
> > > +     hwmon_dev = devm_hwmon_device_register_with_info(&hdev->dev, "arctic_fan",
> > > +                                          priv, &arctic_fan_chip_info,
> > > +                                          NULL);
> > 
> > You could assign directly to priv->hwmon_dev.
> 
> I don't immediately see where priv->hwmon_dev is used in the first place.

Indeed.


Thomas
