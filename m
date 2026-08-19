Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED2D2C237E
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 21:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787174461; cv=none; b=GCIaM/yMrRmJFoZypevznf1QjLSztRBnuEGwn9a4AqkrffB9KjUlRoPcpVglQax1K7VgZbwRMHXAmyZ5ehG/NWOLg1ikZ02+QDpHEQ1cEDmKU4kLv3Dj9kFIPByZzKsrwkDfv1sy8AsUaoHk9Zf867S/k/BFBnQRbYwHBfUaFh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787174461; c=relaxed/simple;
	bh=Ddh9IgjMjq3cGS2HNFSQsJGjI77Bxv1Us66zVXCN2Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhgzNnDM7RxcmyAqVqvS2oagG7Xk1/VuYrl8Mp6HnUl1bCal8R+atR1j3effxWzl+n6pjWYNs16U5nne2X47OLo/4cW3ZlfbVwtGKA8aVPIg967uxEjuoV0Rpio/9J7COMI8kh/rezJnbqp5p01R5XVeMzCNlH8RnbWa9vUyVmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AnErrFCy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eLXVDdag; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AnErrFCy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eLXVDdag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CDM5tZFR6oDBBuGDX9cX1nR3t+twNZ0fmFRjBRaqkNA=;
	b=AnErrFCyQIpc4qhiz3aIy7WsQBBhApquNstP5HIwTm+wgO4loTT7+EO7exzUfozPq45gNj
	QdeT7F3Cp7BiRqCGEfN3QAWon4xiy1DSULwpG5d5jk2ezNU4o4oCvzQ6uR9b0ds41pGl3U
	x+/a5aDOfqF/RFhRsRCBIWaDzYsp2Rc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-H8WHuuDCPVyFFfeDxBGfEw-1; Wed, 19 Aug 2026 17:20:57 -0400
X-MC-Unique: H8WHuuDCPVyFFfeDxBGfEw-1
X-Mimecast-MFC-AGG-ID: H8WHuuDCPVyFFfeDxBGfEw_1787174457
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e934385db1so20136546d6.0
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 14:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787174457; x=1787779257; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDM5tZFR6oDBBuGDX9cX1nR3t+twNZ0fmFRjBRaqkNA=;
        b=eLXVDdagJF16ZpxUlJOFlEk4jK3o+cdQE8pa/3gGJeiD4SVbIGH/d+LCrxsRBvITu4
         2/YXegBpM/YtoZvVrrVl/8PqTWfwCAAF8hgD6pSyJY4l2RnglnnecFi0PIxtTJIVeT92
         eNStf/nJH5NHe27gf7W/r00iqUXvy6ZzsqTqfQNdVjYOMk+5ZBZWYnvuUx7p1vHWwBmi
         nxMDWxNU3SapV3Ii+cmKf1AKSuQTcqdIVk/VPyMt6gm9RrKRd5aAxUv33blzQRcoffGZ
         yrEGBW9u3Tv6uOjt1NBhVzVJLEiZukH8ORfTjtjF9R5sgw7mgYPnLg7nChDwc0wg1OHX
         aYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174457; x=1787779257;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CDM5tZFR6oDBBuGDX9cX1nR3t+twNZ0fmFRjBRaqkNA=;
        b=Un1cJa+aXjMJnXK3uAY/cnpYGV1fp1NNuME8GlXDS7v8u3IRjC6WdOMAmRX8Vo7jHp
         FxKOYl0iiD0ShTN68U7iQoBs5N0sGJnNcJodIlIbQNlSENYxEzDis7RKw0pkSHPxr2Xf
         PqXXCQvhNC1RhPjbZRh8P0TxBGa+uq0g1IwE5Ua2jAn1KCcjrs3NEraB5mbYwcNq4dFN
         AN280PiVo6YegdBEgpyvjS6xaCMOBfFZ23SWeORoT1LSDKNaFwrIl+pJvAqyrqQTtea0
         sxBbFGvdkF2s8S0CYgn6bkvoMccUAaGTh26DbRgq88KW7/rNDDmm0VIlehmSPBTcZ4Nw
         GjtQ==
X-Gm-Message-State: AFuF++lWoRYHIwH8V9honJdcRMkwTNydZQ8AoSXJ7qWDhg1UgCbaHQnW
	HBUs/31PloBtlZjhBxOL3QRZm6ZQcgtY8bPo5K3hOE2Rk4qenFY7nA0Z4xVOqigHKE7XH26mZCi
	Hh2i8AeBl+LvVtuavV7jxxSIKqw0n8RfXYmbbkkf/a9AqLbUFUUHXjt9FGabU/Bck
X-Gm-Gg: AR+sD11s3PCUWS7fMZAcilbluGpz4wEjk3NnD2MOU9NN8pNlgCnXw/AG0prBzCQs5PC
	jpxPgPnGcv1vi4kdtvUhpkkSKhSgHqRbqzfJ51QFVt8i8+tOp6A6NHZxfqWWlh1uhOsp5Vcbh4J
	mj7Weoi7szomcTjMw8naEIzy6tPpc+Nv0fjwCdGM6osGa5P+NhBxsv+S49rY45KcWFqDF7YSwH4
	0R/p+9lRAZ7peYutPSEU/GoCtkd94BkpktaTLQ9XIy5aYhiT/eLORiM06a0w5t8fKTTTbA9Zqdr
	oQC9Lw/agaJeg8CjDMHYEpiMSoOoyVQ+ui5aLEJ04Zm8RONs4qk9gx8k+x5JTCU5ydpq8JVlTOw
	3nD0Zf3mIcQ==
X-Received: by 2002:a05:6214:5091:b0:8df:10fd:93f with SMTP id 6a1803df08f44-90c5e72dfc5mr72345436d6.12.1787174457133;
        Wed, 19 Aug 2026 14:20:57 -0700 (PDT)
X-Received: by 2002:a05:6214:5091:b0:8df:10fd:93f with SMTP id 6a1803df08f44-90c5e72dfc5mr72344966d6.12.1787174456700;
        Wed, 19 Aug 2026 14:20:56 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2a366esm23549196d6.39.2026.08.19.14.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:20:56 -0700 (PDT)
Date: Wed, 19 Aug 2026 14:20:53 -0700
From: Jared Kangas <jkangas@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 4/4] hwmon: (ina2xx) Return 0 on inactive alarm/limit
 reads
Message-ID: <aoYeNed4r3yLVhJD@rh-jkangas-kernel>
References: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
 <20260729-upstream-ina2xx-in0-curr1-alarms-v1-4-349f7b2f1df8@redhat.com>
 <20260729162836.89BDF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729162836.89BDF1F00A3A@smtp.kernel.org>

On Wed, Jul 29, 2026 at 04:28:36PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> 
> [snip]
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but since we are fixing the
> read path for inactive alerts here, what happens on the write path?
> 
> If a user or monitoring daemon reads an inactive alert attribute (which
> now correctly returns 0) and subsequently writes 0 back to it, will
> ina226_alert_limit_write() unconditionally wipe the active alert?
> 
> Looking at ina226_alert_limit_write():
> 
> 	ret = regmap_update_bits(regmap, INA226_MASK_ENABLE,
> 				 INA226_ALERT_CONFIG_MASK, 0);
> 	...
> 	data->active_alert = val ? alert : INA2XX_ALERT_NONE;
> 
> Does this inadvertently destroy the configuration of the currently active
> alert of a different type without checking if the disable operation applies
> to it?

As with [1] and [2], this clearing is documented in
Documentation/hwmon/ina2xx.rst.

[1]: https://lore.kernel.org/all/aoYYxM63yFRgrxFD@rh-jkangas-kernel/
[2]: https://lore.kernel.org/all/aoYasBdVYNYa1OBB@rh-jkangas-kernel/

> 
> [ ... ]
> 
> [Severity: High]
> This is a pre-existing issue, but I noticed a potential overflow when
> calculating power values.
> 
> In ina2xx_get_value() for INA2XX_POWER:
> 
> 	case INA2XX_POWER:
> 		val = regval * data->power_lsb_uW;
> 		break;
> 
> [snip]
> 
> [Severity: High]
> This is a pre-existing issue, but could we run into an overflow on 32-bit
> architectures when setting shunt voltage limits?
> 
> In ina226_alert_to_reg():
> 
> 	case INA2XX_SHUNT_VOLTAGE:
> 		val = clamp_val(val, 0, SHRT_MAX * data->config->shunt_div);
> 		val *= data->config->shunt_div;
> 
> [snip]
> 
> [Severity: High]
> This is a pre-existing issue, but setting power limits on 32-bit systems
> seems to always evaluate to 0.
> 
> In ina226_alert_to_reg():
> 
> 	case INA2XX_POWER:
> 		val = clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);

These are addressed in e6c80061ca23 ("hwmon: (ina2xx) Fix various
overflow issues").

> [snip]
> 
> [Severity: Medium]
> This is a pre-existing issue, but there appears to be a locking violation
> when reading the shunt resistor.
> 
> The hwmon subsystem guidelines require drivers to use hwmon_lock() for
> attributes registered outside the core info parameter. 
> 
> Looking at shunt_resistor_show():
> 
> static ssize_t shunt_resistor_show(struct device *dev,
> 				   struct device_attribute *da, char *buf)
> {
> 	struct ina2xx_data *data = dev_get_drvdata(dev);
> 
> 	return sysfs_emit(buf, "%li\n", data->rshunt);
> }
> 
> Since shunt_resistor_store() modifies data->rshunt, does this show
> function need to acquire the hwmon_lock to prevent unprotected concurrent
> accesses?

This seems accurate. It's not very related to the series but an easy
fix, so I'll put it in v2 since it was reported here.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com?part=4

