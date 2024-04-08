Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F95524DE
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Apr 2024 10:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712570484; cv=none; b=bYmX9tE3y8yMXdsGdim8+e9Mps7uNWliQWjWNntBpNPEx1Isg/bxIA0Vg1cbKssdPqt6cJxng3XAsqiA1JotWa1EHdyUypcNEZ4e2cOF7tx8UlS/U0g6+iNcvmXI/8HKOq+Rkb2u0mKCS0gHsxm/kn+mkAwCIWTUqikeJCFhqls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712570484; c=relaxed/simple;
	bh=97BBqua945E7I7h9dPaSB+3yDevWYdgThmAUaHtvckM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ek5PuPy77QpX+FaYdzAAK2ggVyUqrY0xFuBQ3TXt2OID/HdeWIwOgRF1ddh4tXNFeUq1O3mCqv7Cui2bTFm1ERKpvhd2h8CILUN/Xj9rHJw1T9rDRfmWpxUZZ9FanZsdB/l32gbewKPLnjgJZMkGyH9fSF/f0xpAHDFKpN3XPpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SKSLOm/H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SKSLOm/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712570481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e1tArHT8gYtPjVKK3ePWLbDj56SEHA/79gDe5Lr/X4E=;
	b=SKSLOm/HeTmZIf++gUP3sgi/X9IqbLqzLFZuLuYclp/8qtgvoAntP+2+v1vF81xBfGu7eA
	xttsGZa3EtgBxGYVwDKbuzGEZfDjH5cLFPU4yOQAZHe85/tsA9DbgoV7ZUBL437+vZzbi5
	w86BaWY0knI78dNGsemtiD+TC7I9kkg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-v4S567BuM7SPrt60fXh3Dg-1; Mon, 08 Apr 2024 06:01:19 -0400
X-MC-Unique: v4S567BuM7SPrt60fXh3Dg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a45acc7f191so274503466b.0
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Apr 2024 03:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712570478; x=1713175278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e1tArHT8gYtPjVKK3ePWLbDj56SEHA/79gDe5Lr/X4E=;
        b=BZ3cBkGQRGxbG1nsta2zCG24/PBinkT9CfMvQI00fYVLyU4si5bT/V6J546mHJrDrq
         H1hF4yaOX0f4mRfLYlV+Vb2m3uM/VhDJwCaWLZdLQ7ghG4V/pl3fJUcjZXdEp4nFxPh/
         7XCxeObFszSO0obiWe9yOEEC7RjCS8LNU9zl09K6iP+gZ9nMuap0VgI2UgO4GDsbvt8c
         jRbmZLTx2/87bpz66grgPaR+IylwP5YsCVfNtlrnW7+4LckB4tRtNVK9Zol0Te7SqV0M
         WKfdiqbhrWaxij8WEBXf9kJeTdEFOHPXjxkJrw0Ad57dWs3tDQZkVgaBGFfyQyQMrJKG
         ACoA==
X-Forwarded-Encrypted: i=1; AJvYcCXVyAoJxeuHQEomaR4hBPKNj4YC52o+E5dH4/XAjXO+I3mL0OW+a43S1hWcjl8yA+e+wwBoo/dnqK5vDeeZnvkl+9dR21+PkagMSuQ=
X-Gm-Message-State: AOJu0YyXz3kVUv7aEYOJkH6EO9LZq9R6bUz810SvGnZEOWz0JXdwa5k2
	DMKtktXCnLRZ8+nlDLUJcS8QHi6uSMukH3JDNSLlLBfLFYgZb0hOiDR19O/40UFXY3OFsiDL/7i
	XF3z+queghWRPDsUboWaCepspnm4j1G55cXMM9P53dJO8q8sjB55d95Zb2d+T
X-Received: by 2002:a17:907:6d06:b0:a50:7cdd:348f with SMTP id sa6-20020a1709076d0600b00a507cdd348fmr8252481ejc.46.1712570478598;
        Mon, 08 Apr 2024 03:01:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTaN8Hrybbalkqub+RKPj1AmESZNp2DM0qv8jo5jnREEZ8ZG9J8Wh6+ltK3/J2nMwAbaLuiA==
X-Received: by 2002:a17:907:6d06:b0:a50:7cdd:348f with SMTP id sa6-20020a1709076d0600b00a507cdd348fmr8252214ejc.46.1712570473452;
        Mon, 08 Apr 2024 03:01:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id qt28-20020a170906ecfc00b00a4e8991cfbfsm4195312ejb.127.2024.04.08.03.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 03:01:13 -0700 (PDT)
Message-ID: <0a5ea42f-cc57-492a-b0a9-18fe5045b5ee@redhat.com>
Date: Mon, 8 Apr 2024 12:01:12 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/1] platform/x86: Add wmi driver for Casper Excalibur
 laptops
To: mustafa <mustafa.eskieksi@gmail.com>, ilpo.jarvinen@linux.intel.com,
 jdelvare@suse.com, linux@roeck-us.net, pavel@ucw.cz, lee@kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-leds@vger.kernel.org,
 Werner Sembach <wse@tuxedocomputers.com>
References: <20240324181201.87882-1-mustafa.eskieksi@gmail.com>
 <20240324181201.87882-2-mustafa.eskieksi@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240324181201.87882-2-mustafa.eskieksi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mustafa,

On 3/24/24 7:12 PM, mustafa wrote:
> From: Mustafa Ekşi <mustafa.eskieksi@gmail.com>
> 
> This wmi driver supports Casper Excalibur laptops' changing keyboard
> backlight, reading fan speeds and changing power profiles. Multicolor
> led device is used for backlight, platform_profile for power management
> and hwmon for fan speeds. It supports both old (10th gen or older) and
> new (11th gen or newer) laptops. It uses x86_match_cpu to check if the
> laptop is old or new.
> This driver's Multicolor keyboard backlight API is very similar to Rishit
> Bansal's proposed API.
> 
> Signed-off-by: Mustafa Ekşi <mustafa.eskieksi@gmail.com>

Thank you for your patch.

Overall this looks pretty good I have one important remark
about the LED names and some small remarks inline.

After those are addressed I believe this is ready for merging.

<snip>

> +#define CASPER_LED_COUNT 4
> +
> +static const char * const zone_names[CASPER_LED_COUNT] = {
> +	"casper::kbd_zoned_backlight-right",
> +	"casper::kbd_zoned_backlight-middle",
> +	"casper::kbd_zoned_backlight-left",
> +	"casper::kbd_zoned_backlight-corners",
> +};

So these names should be:

static const char * const zone_names[CASPER_LED_COUNT] = {
	"casper:rgb:kbd_zoned_backlight-right",
	"casper:rgb:kbd_zoned_backlight-middle",
	"casper:rgb:kbd_zoned_backlight-left",
	"casper:rgb:kbd_zoned_backlight-corners",
};

with that change I think this is fine, but we really need
to get an ack for this from the LED subsys maintainers.

Please add a second patch to this patch-serieas adding some
documentation about the use of these names for zoned RGB backlit
kbds in a new paragraph / subsection of the "LED Device Naming"
section of:

Documentation/leds/leds-class.rst 

It seems there are 2 possible sets which we should
probably document in one go:

The set of 4 zones from this patch:

:rgb:kbd_zoned_backlight-right
:rgb:kbd_zoned_backlight-middle
:rgb:kbd_zoned_backlight-left
:rgb:kbd_zoned_backlight-corners

As well as:

:rgb:kbd_zoned_backlight-main
:rgb:kbd_zoned_backlight-wasd
:rgb:kbd_zoned_backlight-cursor
:rgb:kbd_zoned_backlight-numpad

Maybe with a comment that in the future different
zone names are possible if keyboards with
a different zoning scheme show up.

> +static int casper_set(struct casper_drv *drv, u16 a1, u8 led_id, u32 data)
> +{
> +	acpi_status ret = 0;
> +	struct casper_wmi_args wmi_args;
> +	struct acpi_buffer input;

Please use a separate acpi_status and ret variables here
with the correct types:

	struct casper_wmi_args wmi_args;
	struct acpi_buffer input;
	acpi_status status;
	int ret = 0;


> +
> +	wmi_args = (struct casper_wmi_args) {
> +		.a0 = CASPER_WRITE,
> +		.a1 = a1,
> +		.a2 = led_id,
> +		.a3 = data
> +	};
> +
> +	input = (struct acpi_buffer) {
> +		(acpi_size) sizeof(struct casper_wmi_args),
> +		&wmi_args
> +	};
> +
> +	mutex_lock(&drv->casper_mutex);
> +

And then here:

	status = wmidev_block_set(drv->wdev, 0, &input);
	if (ACPI_FAILURE(status))
		ret = -EIO;

> +
> +	mutex_unlock(&drv->casper_mutex);
> +	return ret;
> +}
> +
> +static int casper_query(struct casper_drv *drv, u16 a1,
> +			struct casper_wmi_args *out)
> +{

Same here, also please sort variable declarations
in reverse christmas tree order, so longest lines first:


	struct casper_wmi_args wmi_args;
	struct acpi_buffer input;
	union acpi_object *obj;
	acpi_status status;
	int ret = 0;


> +	wmi_args = (struct casper_wmi_args) {
> +		.a0 = CASPER_READ,
> +		.a1 = a1
> +	};
> +	input = (struct acpi_buffer) {
> +		(acpi_size) sizeof(struct casper_wmi_args),
> +		&wmi_args
> +	};
> +
> +	mutex_lock(&drv->casper_mutex);
> +

And use status here to store the acpi_status type
returned by wmidev_block_set().

> +	ret = wmidev_block_set(drv->wdev, 0, &input);
> +	if (ACPI_FAILURE(ret)) {
> +		ret = -EIO;
> +		goto unlock;
> +	}
> +
> +	obj = wmidev_block_query(drv->wdev, 0);
> +	if (!obj) {
> +		ret = -EIO;
> +		goto unlock;
> +	}
> +
> +	if (obj->type != ACPI_TYPE_BUFFER) { // obj will be 0x10 on failure
> +		ret = -EINVAL;
> +		goto freeobj;
> +	}
> +	if (obj->buffer.length != sizeof(struct casper_wmi_args)) {
> +		ret = -EIO;
> +		goto freeobj;
> +	}
> +
> +	memcpy(out, obj->buffer.pointer, sizeof(struct casper_wmi_args));
> +
> +freeobj:
> +	kfree(obj);
> +unlock:
> +	mutex_unlock(&drv->casper_mutex);
> +	return ret;
> +}

<snip>

The MODULE_DEVICE_TABLE() line should be directly below the declaration of
the table like this:


static const struct wmi_device_id casper_wmi_id_table[] = {
	{ CASPER_WMI_GUID, NULL },
	{ }
};
MODULE_DEVICE_TABLE(wmi, casper_wmi_id_table);

Regards,

Hans



