Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170CC2571C6
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Apr 2025 18:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744912843; cv=none; b=tLY6HJFibxDGgwwma6vZuDsyjLhrdTPUZEaMIhTcjWEaPyH51gmeiNmeHe/PYF5a8oXzkF120GTutwI+Zx4tvUhjgLRQBwaCLIoDMqdbXfI6J7iHgYJisQ5asr6I5JAE1o6AJjCgHy+V7AxELKfdmNAxGLBz8q8/+b98pke8wVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744912843; c=relaxed/simple;
	bh=EFSER6hLvCsuIMrRUcFnfYwlVm5VXQHzeg6YzoSdsdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQAzKOfLYuMd1hAxSrfuWUNe2rh98KVrjF/JBlt5Sy9fmKVBqOGrCBGUK6k50Nfqh3iWD84DkTTjrNYPkI/9Ez1s+Gq5pVVV+Pha88rWNbu4J0vve3EkQ8qkc25mdMNfwIX8BZH7hVf+U14zn5SHcbeeXpi6glJKd2RjuozpzUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyssPno7; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyssPno7"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so1035959a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Apr 2025 11:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744912841; x=1745517641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=erZ0ksL6VZNJSJvmLAAbHn7SDH2o9kkHwVT2dtCoItQ=;
        b=CyssPno7RWpVTaTum0hKssT1h+KdHKCLIAxaFNdYIKFmWc8WRjSnNJmxDcqVLQMn06
         RNjwIuP8+2FlSrT3R2jg+8PEhUMaJWsq24kzoUdgr8IWg30pOdZDQlTNVOUgyKzsUo9c
         LHA5RclH49ms4RINahNq6M2QHgtFVOE66JhZrWvBiiB9y4oBkx6Z5Endvg2PuweIL52O
         9OFAkQc9cvYW/IkWKbR7eFGwuEYVOeZO++6ZNUeIK/iGPY0O2O+NhM/M9VDmx7sFLTJm
         WudCz8IFKxXkWYl9MVeZzuJW/RjcWqDlosA3h4WszzpdduuMz4IsdoQlh1aYZuZ6rjL/
         TWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744912841; x=1745517641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erZ0ksL6VZNJSJvmLAAbHn7SDH2o9kkHwVT2dtCoItQ=;
        b=nR7O5v82fT9V22uFphLt/QhhlmgV/4v5rDml/aBi7NokdlY7QB4lEjSFMdMPu6mDpb
         fWt3wtngC2JicJiwNp6i2hyiZHlyTet9Y12kmLNKidUCWlP1hOGRdEPhext1od9cRvNH
         CqG9jBGMoqGtiZK0Qp/hQUdLH1VgBcv2vUfmvxMABhYxVweGV8HPjdPqsz602w5oP+Mw
         ZeTWQzRoIBHRafmtSYCHA3CnI9Q2p047u3fK/e1DhtTPj5gOj9BmD8uAH8XqUVRriER4
         v2EaagPo0iEpHAWkAGydEkVG71Vn0NW/pHzFwcdmgIEXEP0I+TsxMZ1AO0ggd3H2MMhY
         cHYQ==
X-Gm-Message-State: AOJu0YwuT7odkGyIETvZLTRFLuKGQ9FAwWRgTciUXn6rtSMrkWLko393
	LiGTxx4Og9DD7J6d4bDtnV+mW3JLaq/5eejnpWsgo3e+6h7lfS3NdNJQxg==
X-Gm-Gg: ASbGncvIQHH1bA4dhhdwfsAinmOC6W3cumLd88HSthEIQOFwpPKi7SuCWjO83VvajZZ
	UDoW9yUBOL8bdZ3gjTNixZb/VgEGPo8CnDrsmil9f3MI2JpjF2v5+OogTRPY47r4Ctw+Hp/XYOO
	cft6UO69M5b5XWVGi59bDQAtQRGl8LvFGOtqvUkOj55jgvY+31jD5WBqXnDXfEylAzrWmeRtYhH
	2JE+UyId27yGFlDrq4WkRoIztm6JyZxk/dAMiOYjdb6tlnBtTZxcaJHpCIdgWmEGOQTSdDI95wc
	D9y1c2/8mNIGLy08jA0twDp/Zw9UIg2CpX+QlmJcpFMoK0nQUXWdgA==
X-Google-Smtp-Source: AGHT+IGC2ZNa9m7W6vUTTts3w1ajWRCjMFXnfB9NfCJ5JdRlHvd77prQZaaxChRf4Cnj7bYiCse8sg==
X-Received: by 2002:a17:90b:384b:b0:2ef:67c2:4030 with SMTP id 98e67ed59e1d1-3086415e1b4mr7991507a91.27.1744912841074;
        Thu, 17 Apr 2025 11:00:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613b2f21sm4009370a91.31.2025.04.17.11.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 11:00:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 17 Apr 2025 11:00:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matt Corallo <yalbrymrb@mattcorallo.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: PMBus memory overflow
Message-ID: <9e01e3ec-3ac5-4d83-a065-d00d568b9cc7@roeck-us.net>
References: <985cd95f-155b-4b8a-9fe7-59938d0c2b8f@mattcorallo.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <985cd95f-155b-4b8a-9fe7-59938d0c2b8f@mattcorallo.com>

On Thu, Apr 17, 2025 at 11:39:14AM -0400, Matt Corallo wrote:
> When adding the PMBus entry for a FSP520-20RAB (actually FSP Twins Pro but
> it appears to be identical hardware with a provided SMBus -> USB adapter and
> it self-reports as an FSP520-20RAB when queried over PMBus using the old
> pmbus_peek.c script) with `echo pmbus 0x59 >
> /sys/bus/i2c/devices/i2c-3/new_device` I got the following BUG_ON (on
> Proxmox's 6.8.12-8-pve kernel). Its redundant and reports back fine on 0x60
> and 0x59 for both of its modules (using pmbus_peek.c) and I'd already added
> 0x60 and it BUG'd adding the second module at 0x59.
> 
...
> Apr 17 15:31:19 rackchill-refresh kernel:  i2c_smbus_read_block_data+0x116/0x120
> Apr 17 15:31:19 rackchill-refresh kernel:
> pmbus_check_block_register.constprop.0+0x77/0x100 [pmbus_core]

Interesting. That function reads into a buffer which is larger than the
largest valid PMBus transaction. I can only imagine that the controller
returns invalid data in that transaction, where the first returned byte
is not the length of the transfer but something else.
i2c_smbus_read_block_data() does an unconditional
	memcpy(values, &data.block[1], data.block[0]);
which of course will go haywire if data.block[0] (or in other words the
first data byte returned from the device) exceeds the size of the
data buffer. Do you happen to have a datasheet ?

Guenter
