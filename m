Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F9E1CF7B8
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Oct 2024 20:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728592465; cv=none; b=gmD578TOGnEbcKKMtM7XwRS/294H+GfVYkbt67AfjQySINVN7PlGtcjB6yMsTRYZ87rPiGyv+cM8d2yRJdsHiid/ETYvg38lJA68ZBtUxjcbMTuEiJ+HlEUG8RhKXAD89xRp7AslnhmrPsnQGh6hjrHjwwuCdXO3FuCrwL52ojk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728592465; c=relaxed/simple;
	bh=CtYOoJhFJBN60Utfk0jhb4hKYJOJXQLhtKIlZf7Gh8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWrHCbA51JfUwpB0juUWAHhSiTFATouRjFbk3K4+xBzIa/qQ05O5yxvkig6NpsN0L4dcsU+pfipjKfztpIIpuivaTbcyJh5ynJTFcX655TpxmadKWmpu74nhi39HFgEI4P5Au1j5ojK3FPBzERO/OsD6sJ7yar2JKi++KSPAmfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ak/nMQiB; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ak/nMQiB"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71de9e1f374so1047785b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Oct 2024 13:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728592463; x=1729197263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gA4uVW7tjx9e3AKXci5t+TbG4CkH1fVfsyVdLCAy3JY=;
        b=ak/nMQiB1fxPEnpq/Z0LlT0Y0vn+M55tjV0cV5tQUhLZ3OuMTUFU5rKhpYnbFMhJme
         Ab1s7rx1SEaLfsvUQggThp2kbdGhV0R1cihZNXDUOW0nfd4CrcmGXevmgOH1LUc0ftDP
         /YK2SwnT55sT4sF7WueFyhgww5YubTdZdsXCJWIrP978lzaCjsHZynCHQSmjMsZyhu2H
         iLLgpELk1i5OvyednQKMd7FgYLCv+N6332F0vZiUqkVMPL+Bq0IXgzO21wpBzhjmj/5/
         yMva8BcfUtxMGc9l+HofniOLICJLS7zTiXO6qGLzlTWfpQnAYpl+YNrPeU96yly+6hNg
         vcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728592463; x=1729197263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gA4uVW7tjx9e3AKXci5t+TbG4CkH1fVfsyVdLCAy3JY=;
        b=qExlaBRo7kosBIuJLgtmTjXeapEKzZuATAYA2c6icmgUis5RepfXGTUR7NqIslgDcV
         qVwEIcDhGkDgTKnsFVrvWwVXFU7tiknnOrpYebGnSV8kNMOtw63PkH3iDldWMKjv42+1
         wo/CQ5qWy8dF+TsV5v38zQ3Bl0MXoxFUwo7/QkTHGNPA3qZr31Dm5BPcqsU68uJLw6Ro
         IVmtePoF+RqPkXKUgBucAsBjTEsYvMJB0d7KenU5Yfm0SaYu5DFAaaW86P/HH1AZztIF
         2xiDNLE+mBiysLrf0+XGWikriXQczGCOHh9X1mB4WC2lv9/dF/cBF2YY77CEfNRUDCDb
         YG+A==
X-Forwarded-Encrypted: i=1; AJvYcCX+BOdhiy78cdo9/g8eJqGtDX2Yr6840JxVVhgKI2cPG53RWVY5suyB3ZMie1bIGADtPGMHpUwJOwV7Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz/dvfsVB1M0XLyATFI67UlhFVq8OoywfFsKETPdFFzlzi+Hm5
	gqbHJ2MJ3tTPqQ6PLl9CDBEjljxuO+qQn1UEbHhB0OpuL+6ip8W4
X-Google-Smtp-Source: AGHT+IFhjEgoVfowDMBhsmOq9hglzjneAyF30mBZZRqrcM11cWnH4WJ0phQ6TA1wH85CWxdenaYlNg==
X-Received: by 2002:a05:6a21:a4c2:b0:1d8:a4f7:67ae with SMTP id adf61e73a8af0-1d8bcf2326bmr339616637.17.1728592462350;
        Thu, 10 Oct 2024 13:34:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2a9f542fsm1429688b3a.64.2024.10.10.13.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 13:34:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Oct 2024 13:34:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2] hwmon: Add static visibility member to struct
 hwmon_ops
Message-ID: <9459c3cf-7f8f-4de0-b7a0-46e531547964@roeck-us.net>
References: <89690b81-2c73-47ae-9ae9-45c77b45ca0c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89690b81-2c73-47ae-9ae9-45c77b45ca0c@gmail.com>

On Thu, Oct 10, 2024 at 09:35:42PM +0200, Heiner Kallweit wrote:
> Several drivers return the same static value in their is_visible
> callback, what results in code duplication. Therefore add an option
> for drivers to specify a static visibility directly.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---

Applied, with a minor twist: I renamed hwmon_ops_is_visible to
hwmon_is_visible since the _ops in the function name does not
really add any value.

Thanks,
Guenter
