Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4355E4AA1FF
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 16:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266374; cv=none; b=P8gou6wE1mRm7scg0N9iDNDEqpfIvRHq0KQkPgymFLsuW3OQYukVsv4X3l//QzNJEBpvt0ve8llskvLxQT0WDIPGBObhblGFQY2mZsDvnulp35DVg8LUPNprnOX/vR/RxvGVtFUix2M4qhiIyFzenNGJ2wn1sQogqjgGZBfE7X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266374; c=relaxed/simple;
	bh=kDYLFZJPxTJMzn8FmYfHN54E/Y+7dtsIoP5THCuRkNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yd0Q9hbL2abuKPeas/ZMKnOjH5ypYxU8HysNgpf/TdsioCh3MfpxVAPtXNCxOUQfRBh66eQIN22oFwndwEtsTdj/1imkL3pEyFIsDvUrE6xaomVrwcalLnGDOogvoLLy96k1VxvMtC0TQ8Em9IDxrPwq7VhGFfIMOVB2Ylg5e7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/uvwxpu; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/uvwxpu"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f204f6so30374b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 09:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790266368; x=1790871168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xGGTqz2aZKsHPcNK1Wt2KAGCnTv0BbXSbSraW+Q8OuY=;
        b=Z/uvwxpuIfJjm2CSjfE6ZbDS5iYLaIOXXTK6BV0B59uqXXxi5OChTUQKNFXx2Ccm/k
         yr+jw5NPY7pNmiQDlZPiO0j5K9LZvgRipmKiN4afra+XGc5TLVvsr528ODvtTtOujAmv
         EJ8Cz0e+tTunBVV0wi0fC4woUsGwN4luOATpKUVh+pzdObEuSEO3/nPr8E+X/UC/9Iwt
         uRPOfNFv/XxELWRzTpGZQTAwyftaZ+lWMTb0Em2KwWokatuKp1nUG7YXSjtyVOZKYEdY
         tKgmv5C6DDov2DNCxdnWTrR97dEsdUFkkQapX31XZTELSr01BrgpYzUbA7vpbJAkcdkN
         s3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266368; x=1790871168;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGGTqz2aZKsHPcNK1Wt2KAGCnTv0BbXSbSraW+Q8OuY=;
        b=Ds4FAHN3RbJes9XimrGWwYJdlbrcTnJ0SY7GNXdVpJptH6EuHOwnsToTEYVCCZzZs1
         AcCDV7B6AaLKmNwCeGipvXrAJF1ifz36e1/2QhsDRn6edC7peTTvA1w+rsmt8fAMmKRK
         WKF1z9sj6iMJEGdSNMzmefTeoIgO0G7rl9m3do9Z06SDdV2rbPvUUdsBI3odcfnWY5W6
         EWdfQIKx0sxlK6pP4LFIMqW0G9fL3d3VBcOANi5RLQyycj+9UzQRqJJQX0GQj9sqdfzP
         xacNRaecwrdptqLX2KoFnLYL9F/N3cF8l1B5UgEibb9qJuBh/f4W8kwwS1/9ncb0/10n
         UsZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZ2eDs+IG6PW6yzgjgr2QAjO9vUaApVFRCcLP3HkH2iJ2nLVPtBO5us6DR8cD8DFG9q/DA0ozwIxpa2A==@vger.kernel.org
X-Gm-Message-State: AFuF++kt3X0+cwU12odJSKlRpIle1f3FoG972MfexVRBxgipXAAE9A+x
	LTEk1eN604nifz1fbNM0mCkwhKtVn3wA7iuEGIUHDB+mSeylG2wOGd52TITuJOMD
X-Gm-Gg: AYBFou1Fkf4hctOc7zHfjDYbBAxzApeFCbr8kssQId3VBJBUdnKsoPyC03smR4i2Zwf
	HY+uUv7nAVC7elEf3FfULihFgocF3cE/amBfyjf7wE4DjQN0ywjxN0QlhMR1vXBThzPervPUYwW
	spZKVfOOxpSi09v1HqULHqtgbAMS8i6CTejnpKECut6d5bkX5Rocm0vtNrGK0+79MPnzlv4pBAr
	ullayvyeOA2/304V6+YyZkVMm7hSc5lW3ojv4R/s8BKVUTqsPJOxxjMyuFT4Eaj8XWuoxQWhRPj
	xSdLeEAVKNQgVOxNQcK/LYWwEaFR2hiWbG++fNOHmIZPBHKNknkabmX0/RGrxk/PMX3J3Zb4EPI
	4Tv5Osglj3TpJ5nUJ2RY0mnlZYWXLPHvDx2QjK7APmKRtWcqdkbFsljUlvo1avE36YETbLXf05b
	hyWqHMaYFNDtVYnObiqxUkfZGBt4ioFvVyTGWWqh++9UeIa0fIquuG10NkCSauvcpEZ6ZfizJHr
	rACFKAcBLR75XilRXvQNWc=
X-Received: by 2002:a05:6a00:4b4e:b0:879:30ac:c161 with SMTP id d2e1a72fcca58-87e9c63a4edmr2723587b3a.49.1790266367643;
        Thu, 24 Sep 2026 09:12:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e1f5db6sm3312081b3a.54.2026.09.24.09.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:12:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 09:12:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jiale Yao <yaojiale02@163.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (gigabyte_waterforce) reject short input reports
Message-ID: <5b8b6c95-693a-4472-93c4-c54d22280b79@roeck-us.net>
References: <20260924151133.1233860-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924151133.1233860-1-yaojiale02@163.com>

On Thu, Sep 24, 2026 at 11:11:32PM +0800, Jiale Yao wrote:
> The HID driver raw_event callback runs before HID core validates the
> received report length.  waterforce_raw_event() reads the command bytes
> and then accesses fixed offsets for firmware or status data without any
> length checks.  A truncated report can therefore cause out-of-bounds reads
> and update hwmon state with data beyond the received report.
> 
> Require both command bytes before identifying a report, then check the
> minimum length needed by the firmware and status paths before accessing
> their payloads.  Commit 47669bec44fe ("HID: asus: refactor the two
> workqueues and init sequence") added equivalent raw-event length
> validation to hid-asus.
> 
> Fixes: 42ac68e3d4ba ("hwmon: Add driver for Gigabyte AORUS Waterforce AIO coolers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/hwmon/gigabyte_waterforce.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/gigabyte_waterforce.c b/drivers/hwmon/gigabyte_waterforce.c
> index 4eea05f8b569..9499cb274cbd 100644
> --- a/drivers/hwmon/gigabyte_waterforce.c
> +++ b/drivers/hwmon/gigabyte_waterforce.c
> @@ -257,8 +257,14 @@ static int waterforce_raw_event(struct hid_device *hdev, struct hid_report *repo
>  {
>  	struct waterforce_data *priv = hid_get_drvdata(hdev);
>  
> +	if (size < sizeof(get_status_cmd))
> +		return 0;
> +

The return length must be > FIRMWARE_VER_START_OFFSET_2 in all situations,
so a single check against FIRMWARE_VER_START_OFFSET_2 would be sufficient here.

Guenter

>  	if (data[0] == get_firmware_ver_cmd[0] && data[1] == get_firmware_ver_cmd[1]) {
>  		/* Received a firmware version report */
> +		if (size <= FIRMWARE_VER_START_OFFSET_2)
> +			return 0;
> +
>  		priv->firmware_version =
>  		    data[FIRMWARE_VER_START_OFFSET_1] * 10 + data[FIRMWARE_VER_START_OFFSET_2];
>  
> @@ -269,6 +275,8 @@ static int waterforce_raw_event(struct hid_device *hdev, struct hid_report *repo
>  
>  	if (data[0] != get_status_cmd[0] || data[1] != get_status_cmd[1])
>  		return 0;
> +	if (size <= WATERFORCE_TEMP_SENSOR)
> +		return 0;
>  
>  	priv->temp_input[0] = data[WATERFORCE_TEMP_SENSOR] * 1000;
>  	priv->speed_input[0] = get_unaligned_le16(data + WATERFORCE_FAN_SPEED);
> -- 
> 2.34.1
> 
